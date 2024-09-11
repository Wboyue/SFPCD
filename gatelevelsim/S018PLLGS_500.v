//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//	Verilog HDL model of S018PLLGS_500 
//		Version : 2.1
//		Date    : Sep 23 , 2002
//		Purpose : Verilog Simulation model
//		Created by HyungGyoo Lee (SMIC DesignService Dept.)
//			E-mail : Hyunggyoo_Lee@smics.com 	
//        
//	1. CLK_OUT  : f(Vout) =  (PLL_M/PLL_N) * XIN
//		Bypass  mode 1 => clk_out = F(Vout) 
//		        mode 2 => clk_out = 1/2 * F(Vout)
//
//		If PLL_K set to "0" then CLK_OUT is been Bypass Mode 1.
//						 (200 Mhz ~ 500 Mhz)
//		If PLL_K set to "1" then CLK_OUT is been Bypass Mode 2.
//						 (100 Mhz ~ 250 Mhz)
//		
//
//	2. TST_OUT (for testing)
//		If PLL_TST[1:0] set to 'b00, TST_OUT is 1/N * F(Xin).
//		If PLL_TST[1:0] set to 'b11, TST_OUT is 1/M * F(Vout).
//
//		PLL_TST[1] is reserved.
//
//	* PLL Lock time is less than 0.1 ms
//	* MaxWidth time for illegal state for M/N : 2 ns
//
//		M or N
//
//		---------- ------------ -----------------------
//		  Valid	  X  invalid   X       valid
//		---------- ------------ -----------------------
//		          |<---------->|
//			     MaxWidth
//			     (  2ns  )
//
//	    (1) MaxWidth > 2 ns
//
//		M or N
//		---------- ------------ -----------------------
//		  Valid	  X  invalid   X       valid
//		---------- ------------ -----------------------
//		          |<---------->|
//			     MaxWidth ( > 2ns )
//			     
//		CLK_OUT	  |            |
//		---|   |--|<---------->|--|   |
//		   |___|  | clk output |  |___|
//			  | unknown    |
//
//	    (2) MaxWidth =< 2 ns
//
//		M or N
//		---------- ------------ -----------------------
//		  Valid	  X  invalid   X       valid
//		---------- ------------ -----------------------
//		          |<---------->|
//			     MaxWidth ( =< 2ns )
//			     
//		CLK_OUT	  
//		---|   |---|   |---|   |---|   |---|
//		   |___|   |___|   |___|   |___|   | 
//			  
//
//
//	
//	3. Verified tools : Cadence LDV34(Verilog-XL, NC-SIM)
//			    Model Tech Corp. (ModelSim SE Plus 5.5c)
//	
//	History:
//              Sep  23, 2003 : Insert AVDD and AVSS
//		Aug  6 , 2003 : maximum width violation of illegal states for M/N is appended
//				Also lock time is being added after Power-Down mode
//		Mar  3 , 2003 : Bug fixed, reset and st_r for zero-delay
//		Sep 10 , 2002 : changed lock time to 0.1 ms	
//				Adding illegal state of N,M = 1
//		Sep 19 , 2002 : changed TST_OUT(1/M * F(Vout)) to TST_OUT(1/M * F(Xin))
//
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------

`timescale 1ns/10ps
`celldefine
module S018PLLGS_500 ( AVDD, AVSS, PLL_K, PLL_M, PLL_N, PLL_PD, PLL_TST, RESET, XIN, CLK_OUT, TST_OUT );

	inout		AVDD;
	inout		AVSS;

	input		XIN;
	input		RESET;		// reset for PLL, active high

	input	[7:0]	PLL_M;
	input	[6:0]	PLL_N;
	input	[1:0]	PLL_TST;	// PLL teset mode selection
	input		PLL_PD;		// PLL Power down mode, active high
	input		PLL_K;		// PLL bypass mode selection

	output		CLK_OUT;	// PLL, clock out
	output		TST_OUT;	// PLL, test clock output

	parameter	LT = 50000; 	// lock time => 0.05ms
	parameter	DE = 1;
	parameter	PD = 3;
	parameter	MD = 2.1;
	parameter	MF = 0.001;

	real		m, mb;
	real		n, nb;
	wire		sleep,bypass;
	wire	[1:0]	test_md;
	wire		clk_out, tst_clk;
	wire		xin, reset;

	real		f_vout_d;
	real		f_rck_d;
	real		pre_r_time;
	real		r_delay;
	real		f_delay;
	real		x_width;
	real		f_mck_d;

	reg		f_rck, f_vout, f_mck;
	reg	[8*64:1] ptrmsg;
	reg		er, er2;
	wire		er_w, er2_w, er_c;
	reg		st_r;
	event		err,chk, chk2, chk3;
	reg		act;
	reg		king, act2, st_r2, act3, st_r3;
	real		dvd, temp, temp2;
	wire	[7:0]	m_;
	wire	[6:0]	n_;
	reg		old_bp, prt;

	specify
		specparam
			tr = 0.08:0.1:0.12,   // delay for rising (best, typ, worst)
			tf = 0.08:0.1:0.12,   // delay for falling (best, typ, worst)
			tb = 0.1,   	      // delay for bypass mode
			td = 0.02;   	      // delay for divided mode
	endspecify

	buf	(test_md[1], PLL_TST[1]);
	buf	(test_md[0], PLL_TST[0]);

        buf     (m_[7], PLL_M[7]);
        buf     (m_[6], PLL_M[6]);
        buf     (m_[5], PLL_M[5]);
        buf     (m_[4], PLL_M[4]);
        buf     (m_[3], PLL_M[3]);
        buf     (m_[2], PLL_M[2]);
        buf     (m_[1], PLL_M[1]);
        buf     (m_[0], PLL_M[0]);

        buf     (n_[6], PLL_N[6]);
        buf     (n_[5], PLL_N[5]);
        buf     (n_[4], PLL_N[4]);
        buf     (n_[3], PLL_N[3]);
        buf     (n_[2], PLL_N[2]);
        buf     (n_[1], PLL_N[1]);
        buf     (n_[0], PLL_N[0]);

	buf	(xin , XIN);
	buf	(reset , RESET);
	buf	(sleep , PLL_PD);
	buf	(bypass , PLL_K);

	initial begin
		pre_r_time = $realtime;
		f_rck = 1'b0;
		f_mck = 1'b0;
		f_vout = 1'b0;
		m = 1;
		n = 1;
		mb = 1;
		nb = 1;
		x_width = 1;
		f_vout_d = 1;
		f_rck_d = 1;
                f_mck_d = 1;
		st_r = 1'b0;
		r_delay = 1;
		f_delay = 1;
	end

	always @ (xin or sleep or bypass) begin
		if ((xin ^ 1'b1) === 1'bx) begin
			er2 <= 1'b1;
			ptrmsg <= "WARNING : XIN is unkown ...";
		end else if ((sleep ^ 1'b1) === 1'bx) begin
			er2 <= 1'b1;
			ptrmsg <= "WARNING : PLL_PD is unkown ...";
		end else if ((bypass ^ 1'b1) === 1'bx) begin
			er2 <= 1'b1;
			ptrmsg <= "WARNING : PLL_K is unkown ...";
		end else
			er2 <= 1'b0;
	end

	always @ (m_ or negedge reset) begin
		if (~(|m_)) begin
			er <= 1'b1;
			ptrmsg <= "WARNING :  PLL_M is '0'";
		end else if (|m_ === 1'bx) begin
			er <= 1'b1;
			ptrmsg <= "WARNING :  PLL_M is unknownX";
		end else if (m_ === 8'h1) begin
			er <= 1'b1;
			ptrmsg <= "WARNING :  PLL_M is illegal number => 1";
		end else begin
			er <= 1'b0;
			m <= #PD m_;
		end

	end

	always @ (n_ or negedge reset) begin		
		if (~(|n_)) begin
			er <= 1'b1;
			ptrmsg <= "WARNING :  PLL_N is '0'";
		end else if (|n_ === 1'bx) begin
                        er <= 1'b1;
                        ptrmsg <= "WARNING :  PLL_N is unknown";
		end else if (n_ === 8'h1) begin
			er <= 1'b1;
			ptrmsg <= "WARNING :  PLL_N is illegal number => 1";
                end else begin
			er <= 1'b0;
			n <= #PD n_;
		end
	end

	assign	#MD er_w = er;
	assign	#MD er2_w = er2;
	assign	#DE er_c = er2_w;

	always @ (posedge er_w or posedge er2_w)
		-> err;

	always @ (posedge xin) begin
		r_delay    <= $realtime - pre_r_time;
		pre_r_time <= $realtime;
	end

	always @ (r_delay)
                x_width <= r_delay/2.0;

	always @ (n or m or negedge reset or posedge act or negedge sleep or negedge er_c) begin
		if (er_w | er2_w)
			st_r <= 1'b0;
		else if (act) begin
			st_r <= 1'b0;
		end else begin
			st_r <= 1'b1;
			temp <= $realtime;
		end
	end

	always @ (n or m or negedge reset or posedge act2 or negedge sleep or negedge er_c) begin
		if (er_w | er2_w)
			st_r2 <= 1'b0;
		else if (act2)
			st_r2 <= 1'b0;
		else if (act & ~er_w & ~st_r2) begin
			st_r2 <= 1'b1;
			temp  <= $realtime - temp;
			temp2 <= $realtime;
		end
	end

	always @ (n or m or negedge reset or posedge act3 or negedge sleep or negedge er_c) begin
		if (er_w | er2_w)
			st_r3 <= 1'b0;
		else if (act3)
			st_r3 <= 1'b0;
		else if (st_r2 & ~er_w & ~st_r3) begin
			st_r3 <= 1'b1;
			temp2 <= $realtime - temp2;
		end
	end

	always @ (king or bypass) begin
		if (bypass === 1'b1)
			dvd <= 2.0;
		else
			dvd <= 1.0;
		#MF;
		if ($test$plusargs("check")) begin
			if (old_bp !== bypass) begin
				if (bypass)
					-> chk2;
				else
					-> chk3;
				prt <= 1'b1;
			end
		end
		#MF;
		old_bp <= bypass;
	end


	always begin
		act <= 1'b0;
		act2 <= 1'b0;
		act3 <= 1'b0;
		if (er_w | er2_w)
			#DE f_vout <= f_vout;
		else if (st_r) begin
			act <= 1'b1;
			king <= 1'b1;
			mb <= m;
			nb <= n;
			if ($test$plusargs("no_lock_time")) begin
				f_vout_d <= ((n*x_width)/m)*dvd;
				#f_vout_d f_vout <= ~f_vout;
			end else
				#LT f_vout <= f_vout;
		end else if (st_r2) begin
			act2 <= 1'b1;
			act  <= 1'b0;
			mb <= m;
			nb <= n;
			if ($test$plusargs("no_lock_time")) begin
				f_vout_d <= ((n*x_width)/m)*dvd;
				#f_vout_d f_vout <= ~f_vout;
			end else
				#(temp) f_vout <= f_vout;
		end else if (st_r3) begin
                        act3 <= 1'b1;
			act2 <= 1'b0;
			mb <= m;
			nb <= n;
                        if ($test$plusargs("no_lock_time")) begin
                                f_vout_d <= ((n*x_width)/m)*dvd;
                                #f_vout_d f_vout <= ~f_vout;
                        end else
                                #(temp2) f_vout <= f_vout;
		end else if (sleep) begin
			#DE f_vout <= f_vout;
		end else begin
			f_vout_d <= ((nb*x_width)/mb)*dvd;
			if (king === 1'b1) begin
				f_rck_d  <= x_width*nb;
				f_mck_d  <= x_width*mb;
				king <= 1'b0;
				temp <= 0.0;
				temp2 <= 0.0;
				if ($test$plusargs("check"))
					-> chk;
			end
			if (f_vout_d < MF)
				#DE f_vout <= ~f_vout;
			else
				#f_vout_d f_vout <= ~f_vout;

			if (prt === 1'b1) begin
				-> chk;
				prt <= 1'b0;
			end
		end
	end

	always begin
		if (er_w | er2_w)
			#DE  f_rck  <= f_rck;
		else if (f_rck_d < MF)
			#DE f_rck <= ~f_rck;
		else
			#f_rck_d  f_rck  <= ~f_rck;
	end

	always begin
		if (er_w | er2_w)
			#DE  f_mck  <= f_mck;
		else if (f_mck_d < MF)
			#DE f_mck <= ~f_mck;
		else
			#f_mck_d  f_mck  <= ~f_mck;
	end

	assign #(tr,tf,0) clk_out = (er_w | er2_w) ? 1'bx : ((sleep | reset) ? 1'b1 : f_vout);
	assign #(tr,tf,0) tst_clk = (er_w | er2_w) ? 1'bx : ((test_md === 2'b11) ? f_mck : f_rck);
		
	always @err 
		$display("[%0d] %0s",$time,ptrmsg);

	always @chk begin
		#DE;
		$display("[%0d] XIN is %.3f Mhz, CLK_OUT is %.3f MHz",$time, (1/r_delay)*1e3,(1/(f_vout_d*2))*1e3);
	end

	always @chk2 begin
		#DE;
		$display("[%0d] changed bypass to mode 2, clk_out = 1/2 * F(Vout)",$time);
	end

	always @chk3 begin
		#DE;
		$display("[%0d] changed bypass to mode 1, clk_out = F(Vout)",$time);
	end

	always @ (sleep) begin
		if ($test$plusargs("check")) begin
			if (sleep)
				$display("[%0d] power down mode On",$time);
			else
				$display("[%0d] power down mode Off",$time);
		end
	end

	buf #tb (CLK_OUT,clk_out);
	buf #tb (TST_OUT,tst_clk);

	initial  begin
		$display("\n");
		if ($test$plusargs("check") && $test$plusargs("no_lock_time"))
			$display(" SMIC PLL verilog model Version 2.0, Running No-LockTime mode now");
		else if ($test$plusargs("check")) begin
			$display(" SMIC PLL verilog model Version 2.0, Lock time is less than 0.1 ms");
			$display(" If you want no lock time for simulation, please add option \"+no_lock_time\"");
		end else if ($test$plusargs("no_lock_time")) begin
			$display(" SMIC PLL verilog model Version 2.0, Running No-LockTime mode now");
			$display(" If you want check output Frequency,      please add option \"+check\"");
		end else begin
			$display(" SMIC PLL verilog model Version 2.0, Lock time is less than 0.1 ms");
			$display(" If you want check output Frequency,      please add option \"+check\"");
			$display(" If you want no lock time for simulation, please add option \"+no_lock_time\"");
		end
		$display("\n");
	end

endmodule
`endcelldefine
