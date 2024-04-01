# 神经网络加速器设计



[TOC]

<div style="page-break-after:always"></div>





## 网络架构选择与修改



### VGG16

### YOLO



## 图像与权重数据的转换

## IP设计与验证


### 整体架构

在FPGA中部署神经网络，搭建一个完整的推理架构主要有两种设计范式：<strong>全流式</strong>和<strong>脉动整列</strong><sup>[1]</sup>。

具有本地存储能力的ALU通常也被称为计算单元PE。空域计算架构的加速器采用数据流控制，PE之间的数据可以流动传输。形成了一种处理链关系。在卷积神经网络加速中，空域计算架构显然更能胜任矩阵、张量的计算。因为空域计算架构提供了数据高度复用的可能，同时还能够充分利用内存带宽，从而缓解了带宽压力与访存量，因此加速器可以减少数据的传输次数，以更低的功耗、更高的能效运行，性能瓶颈也得以释放。

### 数据流介绍
深度神经网络加速器架构所采用的数据流中，主流的有输出固定（Output Stationary，OS）数据流、权重固定（Weight Stationary，WS）数据流、输入固定（Input Stationary，IS）数据流。
+ 输出固定数据流
![屏幕截图 2024-03-21 130800](C:\Users\sirius\Desktop\notebook\img\屏幕截图 2024-03-21 130800.png)
其特点是：权重数据被广播到所有PE，输入特征数据再PE间流动，最终从PE 内读取结果。
问题是：需要多次将数据搬运至片上缓存或外存





可重构架构（reconfigurable architecture）

### PE与PE阵列
****
> TY  - CONF
> AU  - Hongli Pan
> AU  - Mingjiang Wang
> AU  - Jingqun Li
> PY  - 2018/05
> DA  - 2018/05
> TI  - Design of the key Structure of Convolutional Neural Network Reconfigurable Accelerator Based on ASIC
> BT  - Proceedings of the 2018 International Conference on Network, Communication, Computer Engineering (NCCE 2018)
> PB  - Atlantis Press
> SP  - 301
> EP  - 304
> SN  - 1951-6851
> UR  - https://doi.org/10.2991/ncce-18.2018.47
> DO  - 10.2991/ncce-18.2018.47
> ID  - Pan2018/05
> ER  -

单个多模PE结构框图

<center>
<img src="./img/屏幕截图 2024-03-20 151947.png" width="1500"/>
</center>
<center>
<font size=2 >
Figure 1. Crystal orientations in a hexagonal SiC polytype.(Reference:Synopsys.TCAD Sentaurus™ Tutorial.Sentaurus Device)
</font>
</center>



+ 36 (4 x 9) Booth coding units.
+ 16 Wallace tree_XXs units.
+ 4 Wallace trees_0_X units
+ 2 Wallace tree_1_X units
+ 1 Wallace tree_2



<center>
<img src="./img/屏幕截图 2024-03-21 130800.png" width="500"/>
</center>
<center>
<font size=2 >
Figure 1. Crystal orientations in a hexagonal SiC polytype.(Reference:Synopsys.TCAD Sentaurus™ Tutorial.Sentaurus Device)
</font>
</center>


## 脉动阵列（Systolic Array）在卷积运算中的应用



> [1] " An in-depth look at Google’s firstTensor Processing Unit (TPU) "
>
> https://cloud.google.com/blog/big-data/2017/05/an-in-depth-look-at-googles-first-tensor-processing-unit-tpu
>
> [2] "脉动阵列 - 因Google TPU获得新生" https://zhuanlan.zhihu.com/p/26522315
>
> [3] " Should We All Embrace SystolicArrays?"
>
> https://www.linkedin.com/pulse/should-we-all-embrace-systolic-arrays-chien-ping-lu
>
> [4] Norman P. Jouppi, etal."In-Datacenter Performance Analysis of a Tensor Processing Unit"，accepted byISCA 2017
>
> [5] Wei, Xuechao, et al. "AutomatedSystolic Array Architecture Synthesis for High Throughput CNN Inference onFPGAs." Proceedings of the 54th Annual Design Automation Conference 2017.ACM, 2017.
>
> [6] https://blog.csdn.net/wordwarwordwar/article/details/103537996?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_utm_term~default-0-103537996-blog-124088326.235^v43^pc_blog_bottom_relevance_base1&spm=1001.2101.3001.4242.1&utm_relevant_index=3

将卷积计算转化成二维矩阵乘法。

一般来说，神经网络处理器分别将activation inputs和weight inputs放到矩阵的行和列中。activation和weight在脉动阵列中右传、下传，直到到达指定的cell中的指定寄存器。一旦input放好了，通过控制信号，处理器就开始用存在cell中的inputs计算得到output。处理器在把activation矩阵送进systolic array之前会先把矩阵“压扁”。如下图，矩阵在深度上有三个通道602, 604, 606。不同通道上的二维矩阵式送到脉动阵列中的不同行。在那张脉动阵列的图中，可以看到，第一行的输入是左边矩阵602这一层，第二行的输入是右边矩阵604这一层。weight那边，也有好多kernel，比方说下面这个例子中有Kernel A-D，不同kernel送到不同列。当把一个矩阵数据送到一个阵列中，矩阵的第一个元素在一个clock cycle中被送到cell中，在下一个的clock cycle，下一个元素被送到cell中，第一个元素被传递到相邻的cell中。（？？？？）

<center>
<img src="./img/屏幕截图 2024-04-01 081026.png" width="500"/>
</center>
<center>
<font size=2 >
Figure 
</font>
</center>

<center>
<img src="./img/屏幕截图 2024-04-01 081135.png" width="500"/>
</center>
<center>
<font size=2 >
Figure 
</font>
</center>



TPU中，如果采用rotatingdata的话，就会需要额外的资源完成这项任务，具体这个的代价在论文和专利中都没有细说



<div style="page-break-after:always"></div>

## Adders

通常认为加法器耗费的主要时间是进位传播时间。如何从时间、效率、相对成本进行优化？



### CPA - carry propagate adder

> https://www.vdfalliance.org/news/open-vdf-carry-propagate-adders

CPA(Carry Propagate Adder)是一种常用的加法器电路,它按位进行两个二进制数的加法运算。

CPA的基本原理是:

1. 将两个二进制数对应位相加,得到一个总和位sum和一个进位carry。
2. 将前一位的进位carry与当前位相加。
3. 依次类推,对每一位执行上述操作,直至最高位。

CPA由多个全加器(Full Adder)级联而成。每个全加器接收3个输入bit(被加数的一位、加数的一位和前一位的进位carry),根据加法真值表计算出一个总和sum和一个新的进位cout。

CPA的优点是结构简单、原理容易理解。但随着加法位数的增加,CPA中进位的传播链路会越来越长,从低位到高位需要多个时钟周期,从而降低了运算速度。

为了提高大位数加法的运算速度,现代处理器通常采用更先进的加法器如先行进位加法器(Carry Look-ahead Adder)、条件总和加法器(Conditional Sum Adder)等,它们预先计算并传递进位,缩短了进位传播的路径和时间。

总的来说,CPA是一种传统加法器,它的工作原理简单直观,适合位数不太高的加法操作,但处理大位数时会存在速度瓶颈。



实现代码：

> https://github.com/supranational/hardware/,其中包含CPA**(carry propagate adder)**，CSA**(carry save adder)**



<div style="page-break-after:always"></div>

## 乘法器设计 Multiplier Design



> F. U. D. Farrukh et al., "Power Efficient Tiny Yolo CNN Using Reduced Hardware Resources Based on Booth Multiplier and WALLACE Tree Adders," in IEEE Open Journal of Circuits and Systems, vol. 1, pp. 76-87, 2020, doi: 10.1109/OJCAS.2020.3007334.
> keywords: {Field programmable gate arrays;Convolution;Hardware;Adders;System-on-chip;Kernel;Task analysis;Convolutional neural network;booth encoding multiplier;WALLACE tree adders;FPGA;adder tree;object detection},

### parallel multipliers

并行乘法器包含3种操作：部分积生成、部分积压缩、使用进位传播加法器(Carry Propagate Adder,CPA)相加。
+ 部分积生成 

1、使用ANDing operation

部分积$PP_L$由乘数的每一位$b_L$与被乘数的所有位相乘。可以参考下图。

<center>
<img src="./img/屏幕截图 2024-03-28 195846.png" width="800"/>
</center>
<center>
<font size=2 >
Fig.Generation of partial products using ANDing operation.
</font>
</center>

2、使用 modified Booth encoding algorithm

产生部分积后需要有效的对$PP_s$压缩。具体来说,它指出在使用部分乘积方法进行乘法运算时,生成所有部分乘积后,需要对这些部分乘积进行适当的简化和压缩,以降低计算复杂度和加法步骤。

简化部分乘积的方法有:

垂直对齐部分乘积,方便进位相加。
压缩可并入同一位的部分乘积,如23x14中的230可与92并入得322。
舍去多余的前导0,减少不必要的位数。
利用乘法分配率等代数性质,合并部分乘积项。
通过以上措施减少部分乘积的数量和位数,可以有效降低后续加法运算的复杂度,从而提高乘法计算的效率。因此,在生成所有部分乘积后,对它们进行整理简化是很有必要的。

WALLACE reduction是最常用的方案。

### WALLACE TREE MULTIPLIER

<center>
<img src="./img/屏幕截图 2024-03-28 221636.png" width="800"/>
</center>
<center>
<font size=2 >
Fig.WALLACE tree multiplier (WM) for CNN accelerator.
</font>
</center>

在这个设计中输入特侦图和内核权重作为乘法器的输入，产生PPs（Partial Products），其中的AND op如前免得图像所描述。产生部分积后通过华莱士树Reduction产生部分和。为了进一步简化设计，使用了组合逻辑电路来实现全加器（FA）和半加器（HA），based on the CSA technique.

16-bit 乘法器将会产生16位的部分积，在路径上有6个FA的延迟。减少PPs的位数是另一种优化技术。

MBE乘法器设计可以进一步减少PPs的位数，消耗更少的硬件资源（与WALLACE tree multiplier相比）。

因此可以用MBE来替代WALLACE tree multiplier

### MODIFIED BOOTH ENCODING MULTIPLIER (RADIX-4)
Booth编码算法是一种用于执行有符号二进制数乘法的有效算法。它通过重新编码乘数位来减少部分乘积的数量,从而加速乘法运算。

Booth算法的基本思路如下:
1. 从乘数的最低有效位(LSB)开始,将乘数按位对扫描,每次使用当前遇到的两位。
2. 如果遇到两位模式为"01",则与上一个操作相反,执行1次A(加上A或减去A，A是被乘数)。
3. 如果遇到"00"或"11",则不执行任何操作。
4. 如果遇到"10",则与上一个操作相同,执行1次A。
5. 乘数位移一位,返回第2步,直到最高有效位(MSB)被遍历。

Booth算法的优势在于它可以通过编码将连续的1视为一个数值,从而大大减少了乘法中需要执行的部分乘积次数。这种方法比经典的乘法加/移位算法更高效。

Booth算法广泛应用于数字信号处理器(DSP)和现代CPU中,可以显著提高乘法运算的性能。

假设A和B分别是k-bit和l-bit 的整数二进制补码。其中A是被乘数（multiplicand），B是multiplier（乘数）。
$$
A=-a_{k-1} \cdot 2^{k-1} + \sum_{i=0}^{k-2} a_i \cdot 2^i
$$

$$
B=-b_{l-1} \cdot 2^{l-1} + \sum_{j=0}^{l-2} b_j \cdot 2^j
$$
Booth encoding algorithm可以在二进制补码乘法或无符号乘法中。

> O. L. Macsorley, "High-Speed Arithmetic in Binary Computers," in Proceedings of the IRE, vol. 49, no. 1, pp. 67-91, Jan. 1961, doi: 10.1109/JRPROC.1961.287779.
> keywords: {Digital arithmetic;Adders;Registers;Costs;Senior members;Concurrent computing;Application software;Logic circuits;Data systems},
>
> 这篇文章讨论了加快基本运算速度的一些方法，可以从运算效率和硬件成本两方面来比较。文章从加法、乘法、除法三个部分进行了详细介绍。

二进制补码乘法：

+ 在B的最右侧追加一个“0”。
+ l应该是偶数，如果现在l成了奇数，那应该对B进行符号拓展。

无符号乘法：

+ l是奇数，则进行0拓展。
+ l是偶数，则在最高位补两个0。

<font color="red">为什么要使l是偶数？</font>因为乘法器通常是为偶数位宽而设计的。通过扩展B的位宽并在最右边添加0,可以确保乘法运算的结果不会溢出或丢失数据。

B按组进行编码：对于$j \in \{ 0,2,3,4...,l-2 \}$，$b_{j+1},b_j,b_{j-1}$编码形成$b^{'}_{\alpha}$，是一个有符号数，$\alpha = j/2$,且$b^{'}_{ \alpha }= -2b_{j+1}+b_j+b_{j-1}$。每个部分积PP或者说$P_{\alpha}$由A与$b^{'}_{\alpha}$相乘产生。

最终的乘积P的计算方法如下所示：
$$
P=\sum^{l/2-1}_{\alpha=0}P_{\alpha} \cdot 2^{2\alpha}=\sum^{l/2-1}_{\alpha=0}A\cdot b_{\alpha}^{'} \cdot 2^{2\alpha}
$$

<center>
<img src="./img/屏幕截图 2024-04-01 160410.png" width="400"/>
</center>
<center>
<font size=2 >
Table.Radix-4 modified booth encoding and partial-product selection.
</font>
</center>






















<div style="page-break-after:always"></div>

## 卷积层计算模块的设计

### V1

> 赵玉琳,王东辉,王雷欧.卷积神经网络卷积层的FPGA实现[J].网络新媒体技术,2021,10(01):47-50.

<center>
<img src="./img/屏幕截图 2024-03-30 215457.png" width="500"/>
</center>
<center>
<font size=2 >
Fig.卷积层设计结构图.
</font>
</center>

卷积层和池化层实行流水线式的结构设计，卷积核大小选取为3×3，输入特征图大小为224×224。池化窗口为2×2，池化步长为2。每个时钟周期输出1个像素<font color="red">（这里一个像素具体多少bits呢，经过量化的应该是8bits吧，本文的像素采用16位定点精度）</font>。输入特征图像素首先从外部输入到缓冲Buffer模块进行缓冲，相邻的卷积运算中，输入特征图的像素存在着重叠和重用，因此必须对输入特征图的像素进行缓冲设计，从而提高数据重用性，减少对数据输入带宽的要求。Buffer模块是由寄存器组设计的FIFO(First in First Out)，宽度为4个像素，深度为112+2，共4×(112+2)=456个像素。

> 112+2中的“+2”的原因可能是在卷积运算的过程中，需要在输入特征图进行边界填充(padding)，填充0值 .
>
> 224×224=112×112×4，进行padding需要往外边扩2行。padding之后的大小是228*228=51984.注意51984/456=114.

<center>
<img src="./img/微信图片_20240331111057.jpg" width="200"/>
</center>
<center>
<font size=2 >
Fig.padding.
</font>
</center>

缓冲过程如下图所示（${\color{red} ？}$）：

> 下面这个图表示的是padding之后的输入图像。即、其大小是228×228。而图中的一行（两行方块）所占据的像素有2×228=456。456正好是FIFO所能容纳的大小。

<center>
<img src="./img/屏幕截图 2024-03-31 090632.png" width="500"/>
</center>
<center>
<font size=2 >
Fig.像素输入顺序图.
</font>
</center>

(a).每个时钟周期向Buffer模块输入4个像素，待buffer模块填满，填充阶段结束，开始给卷积模块送数据计算。

(b).每个时钟周期向buffer模块输入4个像素，同时移出最早的4个像素，将最早输入的8个像素和最近输入的8个像素组成4×4像素组，送给Conv模块进行卷积。

(c).在图c这个状态时显然不需要进行卷积计算。

> <font color="red">既然卷积核的大小是3×3，那为什么要组成4×4的像素组，而不用3×3的像素组？</font>
>
> 往下看

池化窗口为2×2，池化层需要每个时钟周期并行输入4个像素。那么就要求卷积层每个时钟周期能够产生4个输出特征图像像素。所以需要4×4的像素组输入，正好可以产生2×2的输出。此时Conv模块内需要4×3×3个乘法器，4×8个加法器。

卷积计算后会经过激活函数处理。

## FIFO

```verilog
module fc
( 	
    input  clk,
	input  rstn,
	input  [7:0] din0,din1,din2,din3,
	input  wr_en,
	input  rd_en,
	input  rd_rst,
	output empty,
	output full,
	output [7:0] dout0,dout1,dout2,dout3
);
	reg [7:0] rd_ptr, wr_ptr;
	reg [4*8-1:0] mem [0:114];// 深度为 114
	reg [7:0] dout_r0,dout_r1,dout_r2,dout_r3;
	integer i;
	
	assign empty = (wr_ptr == rd_ptr);
	assign full  = ((wr_ptr - rd_ptr) == 8'd150);
	
	// 延迟一拍
	reg wr_en_delay;
	always@(posedge clk)begin
		if(!rstn)
			wr_en_delay <= 0;
		else
			wr_en_delay <= wr_en;
	end
	// 读操作
	always @(posedge clk or negedge rstn)begin
		if(!rstn)begin
            dout_r0 <= 0;
			dout_r1 <= 0;
			dout_r2 <= 0;
			dout_r3 <= 0;
        end
		else if(rd_en && !empty) begin
			dout_r0 <= mem[rd_ptr][7:0];
			dout_r1 <= mem[rd_ptr][15:8];
			dout_r2 <= mem[rd_ptr][23:16];
			dout_r3 <= mem[rd_ptr][31:24];
        end
	end
	// 写操作
	always @(posedge clk) 
	begin
	if(rstn && wr_en_delay && !full)
		mem[wr_ptr] <= {din3,din2,din1,din0};
	end
	
	// 写指针递增	
	always @(posedge clk or negedge rstn) 
	begin
		if(!rstn) 
			wr_ptr <= 0;
		else if(!full && wr_en_delay)// 非满且写使能
			wr_ptr <= wr_ptr + 1;
	end
	
	// 读指针递增
	always @(posedge clk or negedge rstn) 
	begin
		if(!rstn)
			rd_ptr <= 0;
		else
			if(rd_rst)	
				rd_ptr <= 0;
			else if(!empty && rd_en)// 非空且读使能
				rd_ptr <= rd_ptr + 1;
		end
	
	assign dout0 = dout_r0;
    assign dout1 = dout_r1;
	assign dout2 = dout_r2;
	assign dout3 = dout_r3;
endmodule 

```



### Conv RTL代码


```verilog
//只考虑简单的二维卷积情况,数据是8bits,每个时钟周期要能产生4个像素输出。这是否意味着每个时钟周期也要接受新的输入
module conv #(
    parameter input_width = 4,   //输入图像的宽
    parameter input_height = 4,    //输入图像的高
    parameter kernel_width = 3,     //卷积核的宽度
    parameter kernel_height = 3,    //卷积核的高度
    parameter output_width = 2,     //输出特征图的宽度
    parameter output_height = 2,    //输出特征图的高度
    parameter stride = 1,          //卷积核移动的步长
    parameter DATA_WIDTH = 8       //数据位宽（bits）
)(
    input clk,
    input rst,//下降沿触发
    input initial_k, //初始化权值信号
 //   input en_input,    //输入有效信号
    input [(input_width*input_height)*DATA_WIDTH-1:0] input_data,  //输入数据
    input signed [(kernel_height*kernel_width)*DATA_WIDTH-1:0] weights, //卷积核权值
    output [2*DATA_WIDTH+3:0] aoutput_data,boutput_data,coutput_data,doutput_data //这里考虑乘法可能会造成位拓展
);

reg signed [DATA_WIDTH-1:0] k00,k01,k02,k10,k11,k12,k20,k21,k22;//卷积核权重寄存器
reg signed [DATA_WIDTH-1:0] m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23,m30,m31,m32,m33;//输入图像像素寄存器
reg signed [2*DATA_WIDTH-1:0] a00,a01,a02,a10,a11,a12,a20,a21,a22,
                              b00,b01,b02,b10,b11,b12,b20,b21,b22,
                              c00,c01,c02,c10,c11,c12,c20,c21,c22,
                              d00,d01,d02,d10,d11,d12,d20,d21,d22;//卷积过程中的乘积
reg signed [2*DATA_WIDTH:0] asum0,asum1,asum2,asum3,
                            bsum0,bsum1,bsum2,bsum3,
                            csum0,csum1,csum2,csum3,
                            dsum0,dsum1,dsum2,dsum3;//考虑加法可能上溢一位
reg signed [2*DATA_WIDTH+1:0] a1sum0,a1sum1,a1sum2,
                              b1sum0,b1sum1,b1sum2,
                              c1sum0,c1sum1,c1sum2,
                              d1sum0,d1sum1,d1sum2;
reg signed [2*DATA_WIDTH+2:0] a2sum0,a2sum1,b2sum0,b2sum1,c2sum0,c2sum1,d2sum0,d2sum1;
reg signed [2*DATA_WIDTH+3:0] a3sum0,b3sum0,c3sum0,d3sum0;                           

//------------------------初始化卷积核(耗费1个clk)-------------------------
always@(posedge clk or negedge rst)
begin
    if(!rst )
        k00 <= 0;
        k01 <= 0;
        k02 <= 0;

        k10 <= 0;
        k11 <= 0;
        k12 <= 0;

        k20 <= 0;
        k21 <= 0;
        k22 <= 0;
    else
        if(initial_k == 1'd1) 
            k00 <= weights[7:0];
            k01 <= weights[15:8];
            k02 <= weights[23:16];

            k10 <= weights[31:24];
            k11 <= weights[39:32];
            k12 <= weights[47:40];

            k20 <= weights[55:48];
            k21 <= weights[63:56];
            k22 <= weights[71:64];
        else
            k00 <= k00;
            k01 <= k01;
            k02 <= k02;

            k10 <= k10;
            k11 <= k11;
            k12 <= k12;

            k20 <= k20;
            k21 <= k21;
            k22 <= k22;
end

//-----------------------------设置输入特征图像像素------------------------------------
always@(posedge clk or negedge rst)
begin
    if(!rst )
        m00 <= 0;
        m01 <= 0;
        m02 <= 0;
        m03 <= 0;

        m10 <= 0;
        m11 <= 0;
        m12 <= 0;
        m13 <= 0;

        m20 <= 0;
        m21 <= 0;
        m22 <= 0;
        m23 <= 0;
    else
        m00 <= input_data[7:0];
        m01 <= input_data[15:8];
        m02 <= input_data[23:16];
        m03 <= input_data[31:24];

        m10 <= input_data[39:32];
        m11 <= input_data[47:40];
        m12 <= input_data[55:48];
        m13 <= input_data[63:56];

        m20 <= input_data[71:64];
        m21 <= input_data[79:72];
        m22 <= input_data[87:80];
        m23 <= input_data[95:88];
end

//---------------------------计算乘法-----------------------
//------注意并行的4个卷积计算为了同时输出4个卷积结果--------流水线方式
always@(posedge clk)
begin
    a00<=k00*m00;
    a01<=k01*m01;
    a02<=k02*m02;
    a10<=k10*m10;
    a11<=k11*m11;
    a12<=l12*m12;
    a20<=k20*m20;
    a21<=k21*m21;
    a22<=k22*m22;

    b00<=k00*m01;
    b01<=k01*m02;
    b02<=k02*m03;
    b10<=k10*m11;
    b11<=k11*m12;
    b12<=l12*m13;
    b20<=k20*m21;
    b21<=k21*m22;
    b22<=k22*m23;

    c00<=k00*m10;
    c01<=k01*m11;
    c02<=k02*m12;
    c10<=k10*m20;
    c11<=k11*m21;
    c12<=l12*m22;
    c20<=k20*m30;
    c21<=k21*m31;
    c22<=k22*m32;

    d00<=k00*m11;
    d01<=k01*m12;
    d02<=k02*m13;
    d10<=k10*m21;
    d11<=k11*m22;
    d12<=l12*m23;
    d20<=k20*m31;
    d21<=k21*m32;
    d22<=k22*m33;
end

//----------加法--------------
always@(posedge clk)
begin
    asum0<=a00+a22;
    asum1<=a01+a21;
    asum2<=a02+a20;
    asum3<=a10+a12;
    asum4<=a11;

    bsum0<=b00+b22;
    bsum1<=b01+b21;
    bsum2<=b02+b20;
    bsum3<=b10+b12;
    bsum4<=b11;

    csum0<=c00+c22;
    csum1<=c01+c21;
    csum2<=c02+c20;
    csum3<=c10+c12;
    csum4<=c11;

    dsum0<=d00+d22;
    dsum1<=d01+d21;
    dsum2<=d02+d20;
    dsum3<=d10+d12;
    dsum4<=d11;
end

always@(posedge clk)
begin
    a1sum0<=asum0+asum4;
    a1sum1<=asum1+asum3;
    a1sum2<=asum2;

    b1sum0<=bsum0+bsum1;
    b1sum1<=bsum1+bsum3;
    b1sum2<=bsum4;

    c1sum0<=csum0+csum4;
    c1sum1<=csum1+csum3;
    c1sum2<=csum2;

    d1sum0<=dsum0+dsum1;
    d1sum1<=dsum1+dsum3;
    d1sum2<=dsum4;
end

always@(posedge clk)
begin
    a2sum0<=a1sum0+a1sum2;
    a2sum1<=a1sum1;

    b2sum0<=b1sum0+b1sum2;
    b2sum1<=b1sum1;

    c2sum0<=c1sum0+c1sum2;
    c2sum1<=c1sum1;

    d2sum0<=d1sum0+d1sum2;
    d2sum1<=d1sum1;
end

always@(posedge clk)
begin
    a3sum0<=a2sum0+a2sum1;
    b3sum0<=b2sum0+b2sum1;
    c3sum0<=c2sum0+c2sum1;
    d3sum0<=d2sum0+d2sum1;   
end

assign aoutput_data = a3sum0;
assign boutput_data = b3sum0;
assign coutput_data = c3sum0;
assign doutput_data = d3sum0;
endmodule
```





## 激活函数

激活函数通常是非递减函数，因此池化层输出的最大值，在激活函数前也是最大值，因此可以将激活函数放到池化层之后，减少激活函数的计算次数。此处激活函数选取修正线性单元ReLU(Rectified Linear Unit)函数。

其形式化定义为：
$$
f(x)=max(0,x)
$$
在实现relu函数的过程中，有时可能会顺便带上量化，常见的是使用右移操作来进行定点数运算中的量化。量化的一种常见方式是通过移位操作来模拟乘除法。右移10位相当于除以2^10,即除以1024。这种做法通常是在对激活值进行量化时使用。为了量化到较低位宽的定点数表示,需要将输入值缩小到目标定点数的范围。通过右移10位,相当于将输入值除以1024,从而将较大的值映射到目标定点数表示范围内。这种移位运算量化的做法,可以大大节省资源,同时可控制精度损失,是定点数计算中的一种常用技术。



下面给出Relu函数的实现代码（没有进行量化）：

```verilog
module relu 
(
    input clk,
    input rst,
    input signed [7:0] data_in,
    output reg [7:0] data_out,
    input valid_in,
    output reg valid_out
);

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 0;
            valid_out <= 0;
        end else begin
            if (valid_in) begin
                if (data_in[7]) begin // 判断是否为负数
                    data_out <= 0; // 负数输出为0
                end else begin
                    data_out <= data_in; // 非负数直接输出
                end
                valid_out <= 1;
            end else begin
                valid_out <= 0;
            end
        end
    end

endmodule
```



## 最大池化

池化窗口2×2，由3个比较器级联组成，最大值延迟两个时钟周期输出，采用流水线式的设计，可以保证每个时钟输出1 个像素值。

```verilog
module max_pooling_2x2 (
    input clk,
    input rst_n,
    input [7:0] apixel_in,bpixel_in,cpixel_in,dpixel_in;
    input pixel_in_valid,
    output pixel_out_valid,
    output [7:0] pixel_out

);

    reg [7:0] pixel_buffer [0:3]; // 用于级联比较的像素缓冲区
    reg out_v;
    reg [1:0] line_idx; // 行缓冲区索引
    reg [1:0] pixel_idx; // 像素缓冲区索引
    reg [1:0] output_idx; // 输出像素索引

    reg [7:0] max_pixel,max_pixel0,max_pixel1; // 最大像素值
    reg [1:0] cont;

    // 第一级比较器
always@(posedge clk)
begin
    max_pixel0 = (pixel_buffer[0] > pixel_buffer[1]) ? pixel_buffer[0] : pixel_buffer[1];
    max_pixel1 = (pixel_buffer[2] > pixel_buffer[3]) ? pixel_buffer[2] : pixel_buffer[3];    
end

always@(posedge clk)
begin
    max_pixel = (max_pixel0 > max_pixel1) ? max_pixel0 : max_pixel1;
end


assign pixel_out = max_pixel;
assign pixel_out_valid = out_v;


always@(posedge clk)
begin
    if(cont == 2'd3 ) begin
        out_v<=1'd1;
        cont <= 0;
    end
end


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pixel_buffer[0] <= 0;
        pixel_buffer[1] <= 0;
        pixel_buffer[2] <= 0;
        pixel_buffer[3] <= 0;
        out_v <= 0;
        cont <= 0;
    end else if (pixel_in_valid) begin
        // 更新像素缓冲区
        pixel_buffer[0] <= apixel_in;
        pixel_buffer[1] <= bpixel_in;
        pixel_buffer[2] <= cpixel_in;
        pixel_buffer[3] <= dpixel_in; 
        cont <= cont + 2'd1;   
    end
end

endmodule
```







## 全连接







## Top model









<div style="page-break-after:always"></div>

## 论文



### *FPGA Implementation of processing element unit in CNN accelerator using Modified Booth Multiplier and Wallace Tree Adder on UniWiG Architecture*（2022）

> Thomas, Bless and Manju Manuel. “FPGA Implementation of processing element unit in CNN accelerator using Modified Booth Multiplier and Wallace Tree Adder on UniWiG Architecture.” *2022 IEEE International Power and Renewable Energy Conference (IPRECON)* (2022): 1-5.

处理单元PE(Processing Element)执行卷积运算。在这篇论文中，作者使用 MBE(Modified Booth Encoding multiplier)、Wallace tree adders 设计了新的PE。减少了硬件资源和功率的消耗。将改进的PE单元引入到UniWiG(Unified Winograd GEMM architecture)架构上(用改进的PE单元替换传统的PE单元，传统的PE单元中主要是MAC单元和加法树)，相比于之前的设计能够减少硬件复杂度和功耗。本文的硬件采用verilog实现，并在FPGA板上测试。





<center>
<img src="./img/屏幕截图 2024-03-27 122600.png" width="500"/>
</center>
<center>
<font size=2 >
Fig.Processing elements unit for Convolution
</font>
</center>



<center>
<img src="./img/image-20240327090757554.png" width="800"/>
</center>
<center>
<font size=2 >
Fig. Modified PE unit using MBE multiplier and wallace adder
</font>
</center>


相乘运算包含3个主要步骤：编码和部分积、通过某种策略减少pps、用CPA将待处理的行相加得到结果。

设计采用Verilog HDL实现，并部署在Artix7(xc7a35tcpg236) FPGA开发板上。与其他文献中的结果进行对比，这项工作降低了查找表、flip flop的占用。

****

<div style="page-break-after:always"></div>

### Power Efficient Tiny Yolo CNN Using Reduced Hardware Resources Based on Booth Multiplier and WALLACE Tree Adders（2020）

> F. U. D. Farrukh et al., "Power Efficient Tiny Yolo CNN Using Reduced Hardware Resources Based on Booth Multiplier and WALLACE Tree Adders," in IEEE Open Journal of Circuits and Systems, vol. 1, pp. 76-87, 2020, doi: 10.1109/OJCAS.2020.3007334.
> keywords: {Field programmable gate arrays;Convolution;Hardware;Adders;System-on-chip;Kernel;Task analysis;Convolutional neural network;booth encoding multiplier;WALLACE tree adders;FPGA;adder tree;object detection},

加速器设计的一个关键步骤是实现卷积操作的处理元素PE。本文提出了新的PE设计MBE乘法器和基于华莱士树的加法器来替代MAC单元以及典型的加法树。所提出的架构在目标检测任务上进行测试，在zynq-706上进行了部署，在Tiny-YOLO-v2架构下实现87.03GOP/s的吞吐量，硬件成本降低了24.5%，功率效率61.64GOP/s/W。优于以往的设计。 



时分多路串行化技术和近似计算技术被应用到多操作加法器（MOAs）但是没能取得预期的效果。

WALLACE tree adders提供了另一种关于MOAs的解决方案。



#### 系统架构及其概述

<center>
<img src="./img/屏幕截图 2024-03-27 213220.png" width="1000"/>
</center>
<center>
<font size=2 >
Fig. System Architecture.
</font>
</center>
#### PE-Processing Element

本研究针对计算引擎中的PE单元进行优化。



<center>
<img src="./img/屏幕截图 2024-03-27 222526.png" width="500"/>
</center>
<center>
<font size=2 >
Fig. The Pseudocode for a Convolutional Layer.
</font>
</center>

循环交换（loop interchange）决定了四个循环的计算顺序。有两种循环交换技术inter-tile（层间）和intra-tile（层内）。inter-tile loop order 决定了数据如何从片外内存向片上内存移动；intra-tile决定数据如何从片上内存移动到PEs。本文的加速器伪代码如下所示：

<center>
<img src="./img/屏幕截图 2024-03-27 224955.png" width="500"/>
</center>
<center>
<font size=2 >
Fig. The Pseudocode for a Proposed Accelerator Design.
</font>
</center>
使用上面的伪代码生成的硬件如下图所示：

<center>
<img src="./img/屏幕截图 2024-03-28 083539.png" width="400"/>
</center>
<center>
<font size=2 >
Fig. The computation engine of CNN..
</font>
</center>

输入特征图采用了数据重用，内核权重在线更新。由于硬件资源限制，Tm，Tn取为16。为了对Tm循环展开，重复了16个poly structure，即共有16个PE（processing element）。PE结构如下图所示，在每个PE中使用了16个乘法器和15个加法器来进行卷积运算。

<center>
<img src="./img/屏幕截图 2024-03-28 090315.png" width="450"/>
</center>
<center>
<font size=2 >
Fig. Hardware mapping of processing element for convolution layers.
</font>
</center>
为了剑招硬件资源消耗数量并提高系统的能量效率。在此设计中乘法器用MBE（modified booth encoding）算法替代。typical binary adder tree用WALLACE tree-based adders代替。

#### memory organization

内存结构需要根据输入特征图、输出特征图的大小，内核的权值数量来确定。卷积运算需要频繁切换不同的输入特征和卷积核，这就造成了很大的数据访问压力。为了降低从外部存储器访问数据的成本，增加数据重用，并调整相邻内存层次结构级别之间的数据流，应用循环展开、循环平铺和循环交换来定制具有三级内存层次结构的加速器的计算和通信模式。因此，可以同时用于片上计算的计算单元的数量大大增加，其代价是每次只增加存储在片上的数据量。

在FPGA中，block RAM（BRAM）有单端口或双端口，在一个时钟周期内可以访问一个值。在我们提出的系统中设计使用了多维存储器来方便同时访问多个数据。下图显示了存储层次结构，它由输入缓冲区、输出缓冲区、权值缓冲区组成。每个buffer set包含独立的buffer banks。输入buffer banks的数量等于Tn，输出buffer banks的数量等于Tm。权值buffer每组包含一组多个存储器，数据按照需要执行的计算进行排列。输入、输出buffer使用了Ping-Pong memory mode。

<center>
<img src="./img/屏幕截图 2024-03-28 145653.png" width="550"/>
</center>
<center>
<font size=2 >
Fig. On-chip memory organization (Tn = Tm = 16).
</font>
</center>

cnn加速器的数据流和并行结构的设计如下图所示。

<center>
<img src="./img/屏幕截图 2024-03-28 150757.png" width="750"/>
</center>
<center>
<font size=2 >
Fig. The parallel structure of proposed CNN accelerator design and a PE unit.
</font>
</center>

在PE单元上实现了三级流水线来优化计算顺序。

#### 激活函数和池化层

激活函数在例如sigmoid、Tang，etc，在池化之前作用，其目的是引入非线性。在我们的加速器设计中使用了Leaky ReLU，他的作用是可以在训练时保护神经元，避免死亡。

池化用于减少特征图的维度，减少神经网络的计算量，同时抛下不重要的信息。在所提出的设计中使用了最大池化。








## MBE - modified booth multiplier





<div style="page-break-after:always"></div>

## Compressor 

压缩器(Compressor)是用于大位数乘法运算中的一种逻辑电路。它的作用是将多个部分积(Partial Products)压缩成较少的部分积,从而降低后续加法器的计算压力。

具体来说,n位乘以m位会产生n+m个部分积。压缩器可以将几个(通常3个或4个)部分积合并成较少的部分积(通常2个或1个)。例如:

- 3:2压缩器将3个部分积合并成2个
- 4:2压缩器将4个部分积合并成2个

通过层层压缩,最终可以将所有部分积压缩至两个最终部分积,再由最后一级加法器相加得到乘积结果。

压缩器广泛应用于大位数乘法器的设计中,包括著名的瓦莱斯树(Wallace Tree)乘法器。使用压缩器可以有效减少中间的部分积条数,缩短关键路径,从而提高硬件乘法器的运算速度和效率。

不同类型的压缩器在面积、延迟、功耗等方面有不同的权衡,需要根据具体设计目标和约束条件选择合适的压缩器结构。压缩器的优化设计是提升乘法器性能的关键技术之一。



## CAP（Carry Spread Adder）

****


****




<div style="page-break-after:always"></div>

## NVDLA

NVIDIA Deep Learning Accelerator (NVDLA)提供一种设计深度学习推理加速器的标准方法。



参考资料：

[Github地址](https://github.com/nvdla/hw)，[项目网页](http://nvdla.org/)


## loop unrolling





<div style="page-break-after:always"></div>

## 性能评价指标

### 吞吐率 Throughput



吞吐率是用来评价算力的通用指标，单位是GOPS或TOPS，表示硬件加速器每秒执行的乘加和的总计算量。具体细分为峰值吞吐率和有效吞吐率









<div style="page-break-after:always"></div>

## 参考文献
[1].Sze V, Chen Y H, Yang T J, et al. Efficient processing of deep neural networks: A tutorial and
survey[J]. Proceedings of the IEEE, 2017, 105(12): 2295-2329.


























****

# 欢迎使用在线编辑器 Markdown Editor

**Markdown**是一种简单的文本格式语言，以简单的键盘字符编写文档，转换成html后就能显示复杂的页面效果。

![markdown](./assets/images/index/markdown.png "markdown")


## markdownEditor.cn是一个在线的Markdown文本编辑器

markdownEditor.cn是一个在线的Markdown文本编辑器，基于Vue开源项目mavonEditor开发(Git:[MavonEditer](https://github.com/hinesboy/mavonEditor "MavonEditer"))，扩展了HTML复制、html文件导出、md文件导出等功能。

### 开源项目mavonEditor

开源项目mavonEditor依赖[markdown-it](https://github.com/markdown-it/markdown-it),相应的继承了**markdown-it**的各种扩展，如语法高亮、表格（Tables）、删除线(Strikethrough)、下标(subscript)、上标(superscript)、emoji(emoji)等等。



## markdownEditor.cn 中的Markdown语法示例


@[toc](目录)

****
### 字符效果

~~删除线~~   ~~中划线~~

**粗体**  __粗体__

*斜体字*      _斜体字_


***粗斜体*** ___粗斜体___

上标：X^2^，下标：O~2~

++下划线++  会转化为 `下划线`

==标记==  会转化为 `marked`

abbr缩写

*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium
HTML 规范由 W3C 维护

***
### 分割线
***
---
****

***
### 标题


# 一级标题
# 一级标题 #
一级标题
====

## 二级标题
## 二级标题 ##
二级标题
----
### 三级标题
### 三级标题 ###
#### 四级标题
#### 四级标题 ####
##### 五级标题
##### 五级标题 #####
###### 六级标题
###### 六级标题 ######


***
### 列表

#### 有序列表
1. 第一件事情
2. 第二件事情
3. 第三件工作

#### 无序列表
- 无序markdown
- 无序markdown
- 无序markdown

* 列表一
* 列表二
* 列表三

+ 无序markdown
+ 无序markdown
    + 无序markdown-1
    + 无序markdown-2
    + 无序markdown-3
+ 无序markdown
    * 无序markdown
    * 无序markdown
    * 无序markdown
+ 无序列表
    1. 有序列表
    2. 有序列表
    3. 有序列表
    
****

### 任务列表

- [x] 已完成任务
- [ ] 未完成任务
    - [ ] 下级任务
    - [ ] 下级任务
        - [ ] 下下级任务
- [x] 已完成任务
- [ ] 未完成任务

****
### 链接及图片



[链接](www.markdowneditor.cn)

[链接带标题](https://www.markdowneditor.cn/ "链接带标题")

[mailto:nobody.test@qq.com](mailto:nobody.test@qq.com)

直接链接：




![图片描述](/assets/images/index/markdown.png)

****
### 代码


#### 代码块
``` type

  代码段落

```
```c
int main()
{
    printf("hello world!");
}
```
#### 缩进代码块

缩进四个空格，也能实现代码块的公共能

    function(){
        //todo something
    }

其他非代码内容

    Markdown is a simple way to format text that looks great on any device.
    It doesn’t do anything fancy like change the font size, color,
    or type — just the essentials, using keyboard symbols you already know.





#### 行内代码 `code`

通过命令`npm install markdown-it --save`安装 markdown-it


****
### 表格(table)

| 第一排  | 第二排 |
| ------------- | ------------- |
| 1 Cell  | 2 Cell  |
| 1 Cell  | 2 Cell  |

第一排  | 第二排
------------- | -------------
1 Cell  | 2 Cell
1 Cell  | 2 Cell

| 标题1 | 标题2 | 标题3 |
| :--  | :---: | ----: |
| 左对齐 | 居中 | 右对齐 |
| ----------------- | ---------------- | -------------- |





****
### 脚注(footnote)

见底部脚注[^hello]

[^hello]: 一个注脚

****
### 表情(emoji)
[参考网站: https://www.webpagefx.com/tools/emoji-cheat-sheet/](https://www.webpagefx.com/tools/emoji-cheat-sheet/)

:laughing:

:blush:

:smiley:

:)

****
### $\KaTeX$公式

$$E=mc^2$$

$$x > y$$

我们可以渲染公式例如：$x_i + y_i = z_i$和$\sum_{i=1}^n a_i=0$
我们也可以单行渲染

$$\sum_{i=1}^n a_i=0$$

$$(\sqrt{3x-1}+(1+x)^2)$$

$$\sin(\alpha)^{\theta}=\sum_{i=0}^{n}(x^i + \cos(f))$$

具体可参照[katex文档](http://www.intmath.com/cg5/katex-mathjax-comparison.php)和[katex支持的函数](https://github.com/Khan/KaTeX/wiki/Function-Support-in-KaTeX)以及[latex文档](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)
$$
\Delta E_{D}=\Delta E_{D,0}- \alpha_{D} \cdot N_{tot}^{1/3}
$$

$$
\Delta E_{A}=\Delta E_{A,0}- \alpha_{A} \cdot N_{tot}^{1/3}
$$

$$
E_{g,eff}(T)=E{g}(0)-\frac{\alpha T^{2}}{T+\beta}-\Delta E_{BGN} \tag{4b.1}
$$

$$
\Delta E_{BGN}=\Delta E_{g}^{0}+ \Delta E_{g}^{Fermi} \tag{4b.2}
$$

$$
\Delta E_{g}^{0}=E_{ref}[ ln(\frac{N_{tot}}{N_{ref}}) +\sqrt{(ln(\frac{N_{tot}}{N_{ref}}))^{2}+0.5}]
$$
$$
\chi (T)= \chi_{0} + \frac{\alpha T^{2}}{2(T+\beta)} + \gamma \Delta E_{BGN}
$$
$$
\alpha = \gamma \alpha ^{-\frac{\gamma b}{F}}
$$

$$
\overrightarrow{F}=\overrightarrow{F_{(0001)}}+\overrightarrow{F_{(11\overline{2}0)}}
$$
$$
%第一个极限
\lim_{n \to +\infty} \frac{1}{n(n+1)}
\quad %空一格
and %英文单词and
\quad %空一格
%第2个极限
\lim_{x\leftarrow{example} \infty} \frac{1}{n(n+1)}
$$
$$
a=a_{11\overline{2}0}^{(\frac{BF_{11\overline{2}0}}{b_{11\overline{2}0} F})^2} a_{0001}^{(\frac{BF_{0001}}{b_{0001} F})^2} 
\qquad 
b=B\sqrt{1-\theta A^{2}(\frac{BF_{11\overline{2}0}F_{0001}}{Fb_{11\overline{2}0}b_{0001}})^2}
$$
with<br>
$$
N_{D}=\frac{N_{D,0}}{1+g_{D}exp(\frac{E_{F,n}-E_{D}}{kT})}
\tag{4a.1}
$$

$$
N_{A}=\frac{N_{A,0}}{1+g_{A}exp(\frac{E_{A}-E_{F,p}}{kT})}
\tag{4a.2}
$$
$$
N_{D}=\frac{N_{D,0}}{1+g_{D}exp(\frac{E_{F,n}-E_{D}}{kT})}

\tag{4a.1}
$$

$$
N_{A}=\frac{N_{A,0}}{1+g_{A}exp(\frac{E_{A}-E_{F,p}}{kT})}

\tag{4a.2}
$$
$$
A=log\frac{a_{0001}}{a_{11\overline{2}0}} 
\qquad
B=\frac{F}{\sqrt{(\frac{F_{11\overline{2}0}}{b_{11\overline{2}0}})^2+(\frac{F_{0001}}{b_{0001}})^2}}
$$

****
### 布局

::: hljs-left
居左
:::

::: hljs-center
居中
:::

::: hljs-right
居右
:::

****

### 定义

术语一

:   定义一

包含有*行内标记*的术语二

:   定义二

        {一些定义二的文字或代码}
    
    定义二的第三段


****
### 引用 Blockquotes

> 引用单号文本 Blockquotes

> 引用多行文本
> 引用多行文本

多级样式

>  第一级引用格式
>  > 第二级引用
>  > 第二级引用
>  >
>  > > 第三级
>
>  第一级引用
>

****
### HTM实体符号

18ºC  "  '
X² Y³ ¾ ¼  ×  ÷   »

& < > ¥ € ® ± ¶ § ¦ ¯ « ·
© &  ¨ ™ ¡ £

结束

****