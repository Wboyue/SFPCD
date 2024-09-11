
------------------------------------------------------------------------------------
-------- 		   (C) Copyright 2004 SMIC Inc. 		      ------
--------      			SMIC  VHDL  Models     			      ------
------------------------------------------------------------------------------------
--	 Filename   : SP018N_V1p0.vhd						  --
--	 Function   : VHDL Vital Models					 	  --
--	 Version    : 1.0					  		  --
--	 Author     : May_Ma					  		  --
--	 CreateDate : Feb-16-2004					  	  --
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
--DISCLAIMER                                                                      --
--                                                                                --
--   SMIC hereby provides the quality information to you but makes no claims,     --
-- promises or guarantees about the accuracy, completeness, or adequacy of the    --
-- information herein. The information contained herein is provided on an "AS IS" --
-- basis without any warranty, and SMIC assumes no obligation to provide support  --
-- of any kind or otherwise maintain the information.                             --
--   SMIC disclaims any representation that the information does not infringe any --
-- intellectual property rights or proprietary rights of any third parties.SMIC   --
-- makes no other warranty, whether express, implied or statutory as to any       --
-- matter whatsoever,including but not limited to the accuracy or sufficiency of  --
-- any information or the merchantability and fitness for a particular purpose.   --
-- Neither SMIC nor any of its representatives shall be liable for any cause of   --
-- action incurred to connect to this service.                                    --
--                                                                                --
-- STATEMENT OF USE AND CONFIDENTIALITY                                           --
--                                                                                --
--   The following/attached material contains confidential and proprietary        --
-- information of SMIC. This material is based upon information which SMIC        --
-- considers reliable, but SMIC neither represents nor warrants that such         --
-- information is accurate or complete, and it must not be relied upon as such.   --
-- This information was prepared for informational purposes and is for the use    --
-- by SMIC's customer only. SMIC reserves the right to make changes in the        --
-- information at any time without notice.                                        --
--   No part of this information may be reproduced, transmitted, transcribed,     --
-- stored in a retrieval system, or translated into any human or computer         --
-- language, in any form or by any means, electronic, mechanical, magnetic,       --
-- optical, chemical, manual, or otherwise, without the prior written consent of  --
-- SMIC. Any unauthorized use or disclosure of this material is strictly          --
-- prohibited and may be unlawful. By accepting this material, the receiving      --
-- party shall be deemed to have acknowledged, accepted, and agreed to be bound   --
-- by the foregoing limitations and restrictions. Thank you.                      --
------------------------------------------------------------------------------------

-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PANA1APN.vhd
-- Description  : Analog IO PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PANA1APN IS
    port (    
            PAD   : INOUT   std_ulogic   
         );

    ATTRIBUTE VITAL_level0 OF PANA1APN : ENTITY IS TRUE;
END PANA1APN;



 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PANA1AP1N.vhd
-- Description  : Analog IO PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PANA1AP1N IS
    port (    
            PAD   : INOUT   std_ulogic   
         );

    ATTRIBUTE VITAL_level0 OF PANA1AP1N : ENTITY IS TRUE;
END PANA1AP1N;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PANA2APN.vhd
-- Description  : Analog IO PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PANA2APN IS
    port (    
            PAD   : INOUT   std_ulogic   
         );

    ATTRIBUTE VITAL_level0 OF PANA2APN : ENTITY IS TRUE;
END PANA2APN;



 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PANA2AP1N.vhd
-- Description  : Analog IO PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PANA2AP1N IS
    port (    
            PAD   : INOUT   std_ulogic   
         );

    ATTRIBUTE VITAL_level0 OF PANA2AP1N : ENTITY IS TRUE;
END PANA2AP1N;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB12N.vhd
-- Description  : CMOS I/O Buffer, 12X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB12N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB12N : ENTITY IS TRUE;
END PB12N;

ARCHITECTURE behavioral OF PB12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB16N.vhd
-- Description  : CMOS I/O Buffer, 16X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB16N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB16N : ENTITY IS TRUE;
END PB16N;

ARCHITECTURE behavioral OF PB16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB2N.vhd
-- Description  : CMOS I/O Buffer, 2X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB2N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB2N : ENTITY IS TRUE;
END PB2N;

ARCHITECTURE behavioral OF PB2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB24N.vhd
-- Description  : CMOS I/O Buffer, 24X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB24N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB24N : ENTITY IS TRUE;
END PB24N;

ARCHITECTURE behavioral OF PB24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB4N.vhd
-- Description  : CMOS I/O Buffer, 4X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB4N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB4N : ENTITY IS TRUE;
END PB4N;

ARCHITECTURE behavioral OF PB4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PB8N.vhd
-- Description  : CMOS I/O Buffer, 8X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PB8N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PB8N : ENTITY IS TRUE;
END PB8N;

ARCHITECTURE behavioral OF PB8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad

VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD12N : ENTITY IS TRUE;
END PBCD12N;

ARCHITECTURE behavioral OF PBCD12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD16N : ENTITY IS TRUE;
END PBCD16N;

ARCHITECTURE behavioral OF PBCD16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD2N : ENTITY IS TRUE;
END PBCD2N;

ARCHITECTURE behavioral OF PBCD2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD24N : ENTITY IS TRUE;
END PBCD24N;

ARCHITECTURE behavioral OF PBCD24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD4N : ENTITY IS TRUE;
END PBCD4N;

ARCHITECTURE behavioral OF PBCD4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCD8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pulldown with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCD8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCD8N : ENTITY IS TRUE;
END PBCD8N;

ARCHITECTURE behavioral OF PBCD8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCDL12N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-down, 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCDL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCDL12N : ENTITY IS TRUE;
END PBCDL12N;

ARCHITECTURE behavioral OF PBCDL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCDL16N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-down, 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCDL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCDL16N : ENTITY IS TRUE;
END PBCDL16N;

ARCHITECTURE behavioral OF PBCDL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCDL24N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-down, 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCDL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCDL24N : ENTITY IS TRUE;
END PBCDL24N;

ARCHITECTURE behavioral OF PBCDL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCDL8N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-down, 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCDL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCDL8N : ENTITY IS TRUE;
END PBCDL8N;

ARCHITECTURE behavioral OF PBCDL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'L', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU12N : ENTITY IS TRUE;
END PBCU12N;

ARCHITECTURE behavioral OF PBCU12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU16N : ENTITY IS TRUE;
END PBCU16N;

ARCHITECTURE behavioral OF PBCU16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU2N : ENTITY IS TRUE;
END PBCU2N;

ARCHITECTURE behavioral OF PBCU2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU24N : ENTITY IS TRUE;
END PBCU24N;

ARCHITECTURE behavioral OF PBCU24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU4N : ENTITY IS TRUE;
END PBCU4N;

ARCHITECTURE behavioral OF PBCU4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCU8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + controlled pullup with active low enable

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCU8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCU8N : ENTITY IS TRUE;
END PBCU8N;

ARCHITECTURE behavioral OF PBCU8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCUL12N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-up, 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCUL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCUL12N : ENTITY IS TRUE;
END PBCUL12N;

ARCHITECTURE behavioral OF PBCUL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCUL16N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-up, 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCUL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCUL16N : ENTITY IS TRUE;
END PBCUL16N;

ARCHITECTURE behavioral OF PBCUL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCUL24N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-up, 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCUL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCUL24N : ENTITY IS TRUE;
END PBCUL24N;

ARCHITECTURE behavioral OF PBCUL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBCUL8N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate Input and  Controllable Pull-up, 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBCUL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_ren_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBCUL8N : ENTITY IS TRUE;
END PBCUL8N;

ARCHITECTURE behavioral OF PBCUL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'H', '0', '1', 'Z');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,ren_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- oen  i  ren   -  pad
 (  '0',  '1',  '-',  '-',  '1'),
 (  '0',  '0',  '-',  '-',  '0'),
 (  '1',  '-',  '0',  '-',  'X'),
 (  '1',  '-',  '1',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd,ren_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE),
 2=>(ren_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_ren_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD12N : ENTITY IS TRUE;
END PBD12N;

ARCHITECTURE behavioral OF PBD12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD16N : ENTITY IS TRUE;
END PBD16N;

ARCHITECTURE behavioral OF PBD16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD2N : ENTITY IS TRUE;
END PBD2N;

ARCHITECTURE behavioral OF PBD2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD24N : ENTITY IS TRUE;
END PBD24N;

ARCHITECTURE behavioral OF PBD24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD4N : ENTITY IS TRUE;
END PBD4N;

ARCHITECTURE behavioral OF PBD4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBD8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBD8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBD8N : ENTITY IS TRUE;
END PBD8N;

ARCHITECTURE behavioral OF PBD8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBDL12N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pulldown, 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBDL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBDL12N : ENTITY IS TRUE;
END PBDL12N;

ARCHITECTURE behavioral OF PBDL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBDL16N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pulldown, 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBDL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBDL16N : ENTITY IS TRUE;
END PBDL16N;

ARCHITECTURE behavioral OF PBDL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBDL24N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pulldown, 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBDL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBDL24N : ENTITY IS TRUE;
END PBDL24N;

ARCHITECTURE behavioral OF PBDL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBDL8N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pulldown, 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBDL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBDL8N : ENTITY IS TRUE;
END PBDL8N;

ARCHITECTURE behavioral OF PBDL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBL12N.vhd
-- Description  : CMOS 3-state Output Pad with Input and Limited Slew Rate, 5V-Tolerant, 12X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBL12N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBL12N : ENTITY IS TRUE;
END PBL12N;

ARCHITECTURE behavioral OF PBL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBL16N.vhd
-- Description  : CMOS 3-state Output Pad with Input and Limited Slew Rate, 5V-Tolerant, 16X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBL16N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBL16N : ENTITY IS TRUE;
END PBL16N;

ARCHITECTURE behavioral OF PBL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBL24N.vhd
-- Description  : CMOS 3-state Output Pad with Input and Limited Slew Rate, 5V-Tolerant, 24X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBL24N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBL24N : ENTITY IS TRUE;
END PBL24N;

ARCHITECTURE behavioral OF PBL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBL8N.vhd
-- Description  : CMOS 3-state Output Pad with Input and Limited Slew Rate, 5V-Tolerant, 8X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBL8N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBL8N : ENTITY IS TRUE;
END PBL8N;

ARCHITECTURE behavioral OF PBL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS12N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 12X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS12N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS12N : ENTITY IS TRUE;
END PBS12N;

ARCHITECTURE behavioral OF PBS12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS16N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 16X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS16N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS16N : ENTITY IS TRUE;
END PBS16N;

ARCHITECTURE behavioral OF PBS16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS2N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 2X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS2N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS2N : ENTITY IS TRUE;
END PBS2N;

ARCHITECTURE behavioral OF PBS2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS24N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 24X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS24N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS24N : ENTITY IS TRUE;
END PBS24N;

ARCHITECTURE behavioral OF PBS24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS4N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 4X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS4N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS4N : ENTITY IS TRUE;
END PBS4N;

ARCHITECTURE behavioral OF PBS4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBS8N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input , 5V-Tolerant, 8X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBS8N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBS8N : ENTITY IS TRUE;
END PBS8N;

ARCHITECTURE behavioral OF PBS8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD12N : ENTITY IS TRUE;
END PBSD12N;

ARCHITECTURE behavioral OF PBSD12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD16N : ENTITY IS TRUE;
END PBSD16N;

ARCHITECTURE behavioral OF PBSD16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD2N : ENTITY IS TRUE;
END PBSD2N;

ARCHITECTURE behavioral OF PBSD2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD24N : ENTITY IS TRUE;
END PBSD24N;

ARCHITECTURE behavioral OF PBSD24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD4N : ENTITY IS TRUE;
END PBSD4N;

ARCHITECTURE behavioral OF PBSD4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSD8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pulldown 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSD8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSD8N : ENTITY IS TRUE;
END PBSD8N;

ARCHITECTURE behavioral OF PBSD8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSDL12N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pulldown, 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSDL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSDL12N : ENTITY IS TRUE;
END PBSDL12N;

ARCHITECTURE behavioral OF PBSDL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSDL16N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pulldown, 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSDL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSDL16N : ENTITY IS TRUE;
END PBSDL16N;

ARCHITECTURE behavioral OF PBSDL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSDL24N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pulldown, 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSDL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSDL24N : ENTITY IS TRUE;
END PBSDL24N;

ARCHITECTURE behavioral OF PBSDL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSDL8N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pulldown, 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSDL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSDL8N : ENTITY IS TRUE;
END PBSDL8N;

ARCHITECTURE behavioral OF PBSDL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'L');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSL12N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input and Limited Slew Rate, 5V-Tolerant, 12X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBSL12N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBSL12N : ENTITY IS TRUE;
END PBSL12N;

ARCHITECTURE behavioral OF PBSL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSL16N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input and Limited Slew Rate, 5V-Tolerant, 16X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBSL16N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBSL16N : ENTITY IS TRUE;
END PBSL16N;

ARCHITECTURE behavioral OF PBSL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSL24N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input and Limited Slew Rate, 5V-Tolerant, 24X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBSL24N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBSL24N : ENTITY IS TRUE;
END PBSL24N;

ARCHITECTURE behavioral OF PBSL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSL8N.vhd
-- Description  : CMOS 3-state Output Pad with Schmitt Trigger Input and Limited Slew Rate, 5V-Tolerant, 8X Drive

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PBSL8N IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PBSL8N : ENTITY IS TRUE;
END PBSL8N;

ARCHITECTURE behavioral OF PBSL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU12N : ENTITY IS TRUE;
END PBSU12N;

ARCHITECTURE behavioral OF PBSU12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU16N : ENTITY IS TRUE;
END PBSU16N;

ARCHITECTURE behavioral OF PBSU16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU2N : ENTITY IS TRUE;
END PBSU2N;

ARCHITECTURE behavioral OF PBSU2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU24N : ENTITY IS TRUE;
END PBSU24N;

ARCHITECTURE behavioral OF PBSU24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU4N : ENTITY IS TRUE;
END PBSU4N;

ARCHITECTURE behavioral OF PBSU4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSU8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + Schmitt trigger input and pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSU8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSU8N : ENTITY IS TRUE;
END PBSU8N;

ARCHITECTURE behavioral OF PBSU8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSUL12N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pullup 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSUL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSUL12N : ENTITY IS TRUE;
END PBSUL12N;

ARCHITECTURE behavioral OF PBSUL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSUL16N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pullup 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSUL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSUL16N : ENTITY IS TRUE;
END PBSUL16N;

ARCHITECTURE behavioral OF PBSUL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSUL24N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pullup 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSUL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSUL24N : ENTITY IS TRUE;
END PBSUL24N;

ARCHITECTURE behavioral OF PBSUL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBSUL8N.vhd
-- Description  : CMOS 3-state IO pad  with Schmitt trigger andLimited Slew Rate Input and Pullup 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBSUL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBSUL8N : ENTITY IS TRUE;
END PBSUL8N;

ARCHITECTURE behavioral OF PBSUL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU12N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU12N : ENTITY IS TRUE;
END PBU12N;

ARCHITECTURE behavioral OF PBU12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU16N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU16N : ENTITY IS TRUE;
END PBU16N;

ARCHITECTURE behavioral OF PBU16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU2N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU2N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU2N : ENTITY IS TRUE;
END PBU2N;

ARCHITECTURE behavioral OF PBU2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU24N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU24N : ENTITY IS TRUE;
END PBU24N;

ARCHITECTURE behavioral OF PBU24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU4N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU4N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU4N : ENTITY IS TRUE;
END PBU4N;

ARCHITECTURE behavioral OF PBU4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBU8N.vhd
-- Description  : BUFFER + TRISTATE BUFFER + pullup 

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBU8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBU8N : ENTITY IS TRUE;
END PBU8N;

ARCHITECTURE behavioral OF PBU8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBUL12N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pullup, 12X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBUL12N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBUL12N : ENTITY IS TRUE;
END PBUL12N;

ARCHITECTURE behavioral OF PBUL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBUL16N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pullup, 16X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBUL16N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBUL16N : ENTITY IS TRUE;
END PBUL16N;

ARCHITECTURE behavioral OF PBUL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBUL24N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pullup, 24X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBUL24N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBUL24N : ENTITY IS TRUE;
END PBUL24N;

ARCHITECTURE behavioral OF PBUL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 1999 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PBUL8N.vhd
-- Description  : CMOS 3-state IO pad  with Limited Slew Rate Input and Pullup, 8X Drive

LIBRARY ieee;                  USE ieee.std_logic_1164.ALL;
                               USE ieee.vital_timing.ALL;
                               USE ieee.vital_primitives.ALL;

ENTITY PBUL8N IS
 GENERIC
 (
  tpd_pad_c         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_i_pad         : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : INOUT      std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PBUL8N : ENTITY IS TRUE;
END PBUL8N;

ARCHITECTURE behavioral OF PBUL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;
CONSTANT PullUpDown : VitalResultZMapType := ('U', 'X', '0', '1', 'H');

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 4);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd1 : std_ulogic IS Res1(0);
VARIABLE pad_zd  :std_ulogic :='0';

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i  -  pad
 (  '0',  '1',  '-',  '1'),
 (  '0',  '0',  '-',  '0'),
 (  '1',  '-',  '-',  'Z')
);

BEGIN


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0=>pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );

pad_zd := VitalIDENT(pad_zd1, ResultMap=>PullUpDown);


--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;


---------------------------------------------------------------------------
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PCI3BN.vhd
-- Description  : 3-state Output 33MHz PCI Buffer Pad with Input,5V Tolerant

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PCI3BN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PCI3BN : ENTITY IS TRUE;
END PCI3BN;

ARCHITECTURE behavioral OF PCI3BN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PCI3BSN.vhd
-- Description  : 3-state Output 33MHz PCI Buffer Pad with Input and Limited Slew Rate,5V Tolerant

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PCI3BSN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PCI3BSN : ENTITY IS TRUE;
END PCI3BSN;

ARCHITECTURE behavioral OF PCI3BSN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PCI6BN.vhd
-- Description  : 3-state Output 66MHz PCI Buffer Pad with Input ,5V Tolerant

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PCI6BN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PCI6BN : ENTITY IS TRUE;
END PCI6BN;

ARCHITECTURE behavioral OF PCI6BN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PCI6BSN.vhd
-- Description  : 3-state Output 66MHz PCI Buffer Pad with Input and Limited Slew Rate,5V Tolerant

LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

-- ENTITY DECLARATION
ENTITY PCI6BSN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01  := (0 ps, 0 ps);
  tpd_i_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad    : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_oen       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );

 PORT
 (
  pad        : INOUT      std_ulogic:='Z';
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic;
  c          : OUT        std_ulogic
 );

ATTRIBUTE VITAL_LEVEL0 OF PCI6BSN : ENTITY IS TRUE;
END PCI6BSN;

ARCHITECTURE behavioral OF PCI6BSN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';
SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd,pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv0 : std_logic_vector(0 TO 0);
VARIABLE Res0 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS c_zd : std_ulogic IS Res0(0);

CONSTANT StateTab0 : VitalStateTableType (1 TO 2, 1 TO 3) := (
-- pad    -  c
 (  '1',  '-',  '1'),
 (  '0',  '-',  '0')
);
VARIABLE Prv1 : std_logic_vector(0 TO 1);
VARIABLE Res1 : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res1(0);

CONSTANT StateTab1 : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" ; c = pad


VitalStateTable ( StateTable => StateTab0,
                      DataIn => (0 => pad_ipd),
                   NumStates => 1,
                      Result => Res0,
              PreviousDataIn => Prv0
              );

VitalStateTable ( StateTable => StateTab1,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res1,
              PreviousDataIn => Prv1
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PDIODEN.vhd
-- Description  : POWER CUT

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PDIODEN IS

    port (    
            VDD1   : INOUT   std_ulogic;
            VDD2   : INOUT   std_ulogic;
            VSS1   : INOUT   std_ulogic;
            VSS2   : INOUT   std_ulogic               
         );

    ATTRIBUTE VITAL_level0 OF PDIODEN : ENTITY IS TRUE;
END PDIODEN;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PDIODE8N.vhd
-- Description  : POWER CUT FOR HIGH VOLTAGE

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PDIODE8N IS

    port (    
            VSS1   : INOUT   std_ulogic;
            VSS2   : INOUT   std_ulogic               
         );

    ATTRIBUTE VITAL_level0 OF PDIODE8N : ENTITY IS TRUE;
END PDIODE8N;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PINN.vhd
-- Description  : Input Pad,5V-Tolerant

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PINN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PINN : ENTITY IS TRUE;
END PINN;

ARCHITECTURE behavioral OF PINN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- c = pad


 c_zd := VitalBUF( pad_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PICDN.vhd
-- Description  : Input Pad with Pull-down  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PICDN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PICDN : ENTITY IS TRUE;
END PICDN;

ARCHITECTURE behavioral OF PICDN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd,ren_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
  VARIABLE PUD_ipdH : std_ulogic := 'X';
  VARIABLE PUD_ipdZ : std_ulogic := 'X';
BEGIN


----------------------------------------------------------------
-- Pulldown Section
----------------------------------------------------------------

  PUD_ipdZ := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','Z'));
  PUD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','L'));

  PAD_ipdH := VitalMUX2(PUD_ipdZ,PUD_ipdH,ren_ipd);


  c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PICUN.vhd
-- Description  : Input Pad with Pull-down  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PICUN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_ren       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  ren        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PICUN : ENTITY IS TRUE;
END PICUN;

ARCHITECTURE behavioral OF PICUN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';
SIGNAL ren_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
  VitalWireDelay ( ren_ipd, ren, tipd_ren );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd,ren_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
  VARIABLE PUD_ipdH : std_ulogic := 'X';
  VARIABLE PUD_ipdZ : std_ulogic := 'X';
BEGIN


----------------------------------------------------------------
-- Pulldown Section
----------------------------------------------------------------

  PUD_ipdZ := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','Z'));
  PUD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','H'));

  PAD_ipdH := VitalMUX2(PUD_ipdZ,PUD_ipdH,ren_ipd);


  c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PIDN.vhd
-- Description  : Input Pad with Pull-down  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PIDN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PIDN : ENTITY IS TRUE;
END PIDN;

ARCHITECTURE behavioral OF PIDN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
BEGIN


----------------------------------------------------------------
-- Pulldown Section
----------------------------------------------------------------

  PAD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','L'));


  c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PISN.vhd
-- Description  : Schmitt Trigger Input Pad,5V-Tolerant

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PISN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PISN : ENTITY IS TRUE;
END PISN;

ARCHITECTURE behavioral OF PISN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- c = pad


 c_zd := VitalBUF( pad_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PISDN.vhd
-- Description  : Schmitt Trigger Input Pad with Pull-down  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PISDN IS
 GENERIC
 (
  tpd_pad_c      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad       : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PISDN : ENTITY IS TRUE;
END PISDN;

ARCHITECTURE behavioral OF PISDN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
BEGIN


----------------------------------------------------------------
-- Pulldown Section
----------------------------------------------------------------

  PAD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','L'));


  c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PISUN.vhd
-- Description  : Schmitt Trigger Input Pad with Pull-up  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PISUN IS
 GENERIC
 (
  tpd_pad_c       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PISUN : ENTITY IS TRUE;
END PISUN;

ARCHITECTURE behavioral OF PISUN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
BEGIN

----------------------------------------------------------------
-- Pullup Section
----------------------------------------------------------------

  PAD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','H'));


 c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PIUN.vhd
-- Description  : Input Pad with Pull-up  

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY PIUN IS
 GENERIC
 (
  tpd_pad_c       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_pad      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : IN         std_ulogic;
  c          : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PIUN : ENTITY IS TRUE;
END PIUN;

ARCHITECTURE behavioral OF PIUN IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL pad_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( pad_ipd, pad, tipd_pad );
END BLOCK;

VITALBehavior : PROCESS (pad_ipd)
VARIABLE c_GlitchData : VitalGlitchDataType;
VARIABLE c_zd : std_ulogic;

  VARIABLE PAD_ipdH : std_ulogic := 'X';
BEGIN

----------------------------------------------------------------
-- Pullup Section
----------------------------------------------------------------

  PAD_ipdH := VitalIDENT(data => PAD_ipd, 
			ResultMap => ('U','X','0','1','H'));


 c_zd := VitalBUF( pad_ipdH );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (c, c_GlitchData, "c", c_zd,
 Paths=>(0=>(pad_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_pad_c),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO12N.vhd
-- Description  : CMOS Output Only Pad, 12X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO12N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO12N : ENTITY IS TRUE;
END PO12N;

ARCHITECTURE behavioral OF PO12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO16N.vhd
-- Description  : CMOS Output Only Pad, 16X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO16N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO16N : ENTITY IS TRUE;
END PO16N;

ARCHITECTURE behavioral OF PO16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO2N.vhd
-- Description  : CMOS Output Only Pad, 2X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO2N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO2N : ENTITY IS TRUE;
END PO2N;

ARCHITECTURE behavioral OF PO2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO24N.vhd
-- Description  : CMOS Output Only Pad, 24X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO24N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO24N : ENTITY IS TRUE;
END PO24N;

ARCHITECTURE behavioral OF PO24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO4N.vhd
-- Description  : CMOS Output Only Pad, 4X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO4N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO4N : ENTITY IS TRUE;
END PO4N;

ARCHITECTURE behavioral OF PO4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PO8N.vhd
-- Description  : CMOS Output Only Pad, 8X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PO8N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PO8N : ENTITY IS TRUE;
END PO8N;

ARCHITECTURE behavioral OF PO8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POL12N.vhd
-- Description  : CMOS Output Only Pad with Limited Slew Rate, 12X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY POL12N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POL12N : ENTITY IS TRUE;
END POL12N;

ARCHITECTURE behavioral OF POL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- pad =  i 


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POL16N.vhd
-- Description  : CMOS Output Only Pad with Limited Slew Rate, 16X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY POL16N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POL16N : ENTITY IS TRUE;
END POL16N;

ARCHITECTURE behavioral OF POL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- pad =  i 


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POL24N.vhd
-- Description  : CMOS Output Only Pad with Limited Slew Rate, 24X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY POL24N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POL24N : ENTITY IS TRUE;
END POL24N;

ARCHITECTURE behavioral OF POL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- pad =  i 


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POL8N.vhd
-- Description  : CMOS Output Only Pad with Limited Slew Rate, 8X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY POL8N IS
 GENERIC
 (
  tpd_i_pad      : VitalDelayType01 := (0 ps, 0 ps);
  tipd_i         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POL8N : ENTITY IS TRUE;
END POL8N;

ARCHITECTURE behavioral OF POL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE pad_zd : std_ulogic;

BEGIN

--------------------
--Functionality
--------------------
-- pad =  i 


 pad_zd := VitalBUF( i_ipd );

--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT12N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 12X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT12N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT12N : ENTITY IS TRUE;
END POT12N;

ARCHITECTURE behavioral OF POT12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT16N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 16X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT16N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT16N : ENTITY IS TRUE;
END POT16N;

ARCHITECTURE behavioral OF POT16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT2N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 2X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT2N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT2N : ENTITY IS TRUE;
END POT2N;

ARCHITECTURE behavioral OF POT2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT24N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 24X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT24N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT24N : ENTITY IS TRUE;
END POT24N;

ARCHITECTURE behavioral OF POT24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT4N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 4X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT4N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT4N : ENTITY IS TRUE;
END POT4N;

ARCHITECTURE behavioral OF POT4N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POT8N.vhd
-- Description  : CMOS 3-state Output Pad,5V-Tolerant, 8X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POT8N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POT8N : ENTITY IS TRUE;
END POT8N;

ARCHITECTURE behavioral OF POT8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? i : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POTL12N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate,5V-Tolerant, 12X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POTL12N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POTL12N : ENTITY IS TRUE;
END POTL12N;

ARCHITECTURE behavioral OF POTL12N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POTL16N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate,5V-Tolerant, 16X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POTL16N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POTL16N : ENTITY IS TRUE;
END POTL16N;

ARCHITECTURE behavioral OF POTL16N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POTL24N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate,5V-Tolerant, 24X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POTL24N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POTL24N : ENTITY IS TRUE;
END POTL24N;

ARCHITECTURE behavioral OF POTL24N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : POTL8N.vhd
-- Description  : CMOS 3-state Output Pad with Limited Slew Rate,5V-Tolerant, 8X Drive

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

ENTITY POTL8N IS
 GENERIC
 (
  tpd_i_pad        : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_oen_pad      : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tipd_oen      : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_i        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn : Boolean    := TRUE;
  XOn            : Boolean    := TRUE;
  MsgOn          : Boolean    := TRUE;
  InstancePath   : string     := ""
 );
 PORT
 (
  pad        : OUT        std_ulogic;
  oen        : IN         std_ulogic;
  i          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF POTL8N : ENTITY IS TRUE;
END POTL8N;

ARCHITECTURE behavioral OF POTL8N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL oen_ipd         : std_ulogic :='X';
SIGNAL i_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( oen_ipd, oen, tipd_oen );
  VitalWireDelay ( i_ipd, i, tipd_i );
END BLOCK;

VITALBehavior : PROCESS (oen_ipd,i_ipd)
VARIABLE pad_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 0) := (OTHERS=>'X');
ALIAS pad_zd : std_ulogic IS Res(0);

CONSTANT StateTab : VitalStateTableType (1 TO 3, 1 TO 4) := (
-- oen  i    -  pad
 (  '1',  '-',  '-',  'Z'),
 (  '0',  '0',  '-',  '0'),
 (  '0',  '1',  '-',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- pad = !oen ? I : "Z" 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (oen_ipd,i_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (pad, pad_GlitchData, "pad", pad_zd,
 Paths=>(0=>(i_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_i_pad),TRUE),
 1=>(oen_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_oen_pad),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD1N.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD1N IS
    port (    
            VDD   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD1N : ENTITY IS TRUE;
END PVDD1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    VDD <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD1APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD1APN IS
    port (    
            SVDD1AP   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD1APN : ENTITY IS TRUE;
END PVDD1APN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD1APN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVDD1AP <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD1AP1N.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD1AP1N IS
    port (    
            SVDD1AP1   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD1AP1N : ENTITY IS TRUE;
END PVDD1AP1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD1AP1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVDD1AP1 <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD2N.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD2N IS

    ATTRIBUTE VITAL_level0 OF PVDD2N : ENTITY IS TRUE;
END PVDD2N;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD2APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD2APN IS

    ATTRIBUTE VITAL_level0 OF PVDD2APN : ENTITY IS TRUE;
END PVDD2APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD3APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD3APN IS
    port (    
            SAVDD   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD3APN : ENTITY IS TRUE;
END PVDD3APN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD3APN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SAVDD <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD4APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD4APN IS

    ATTRIBUTE VITAL_level0 OF PVDD4APN : ENTITY IS TRUE;
END PVDD4APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD5APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD5APN IS

    ATTRIBUTE VITAL_level0 OF PVDD5APN : ENTITY IS TRUE;
END PVDD5APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS1N.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS1N IS
    port (    
            VSS   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS1N : ENTITY IS TRUE;
END PVSS1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    VSS <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS1APN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS1APN IS
    port (    
            SVSS1AP   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS1APN : ENTITY IS TRUE;
END PVSS1APN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS1APN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVSS1AP <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS1AP1N.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS1AP1N IS
    port (    
            SVSS1AP1   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS1AP1N : ENTITY IS TRUE;
END PVSS1AP1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS1AP1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVSS1AP1 <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS2N.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS2N IS

    ATTRIBUTE VITAL_level0 OF PVSS2N : ENTITY IS TRUE;
END PVSS2N;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS2APN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS2APN IS

    ATTRIBUTE VITAL_level0 OF PVSS2APN : ENTITY IS TRUE;
END PVSS2APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS3N.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS3N IS
    port (    
            VSS   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS3N : ENTITY IS TRUE;
END PVSS3N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS3N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    VSS <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS3APN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS3APN IS
    port (    
            SAVSS   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS3APN : ENTITY IS TRUE;
END PVSS3APN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS3APN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SAVSS <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS4APN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS4APN IS

    ATTRIBUTE VITAL_level0 OF PVSS4APN : ENTITY IS TRUE;
END PVSS4APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS5APN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS5APN IS

    ATTRIBUTE VITAL_level0 OF PVSS5APN : ENTITY IS TRUE;
END PVSS5APN;

 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PX1N.vhd
-- Description  : Crystal Oscillator Circuit 

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PX1N IS
 GENERIC
 (
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT      std_ulogic;
  xc         : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PX1N : ENTITY IS TRUE;
END PX1N;

ARCHITECTURE behavioral OF PX1N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 0);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 2, 1 TO 4) := (
--  xin    -  xc  xout
 ( '1',  '-',  '1',  '0'),
 ( '0',  '-',  '0',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = !xin; xc = xin 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (0 => xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PX2N.vhd
-- Description  : Crystal Oscillator Circuit 

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PX2N IS
 GENERIC
 (
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT      std_ulogic;
  xc         : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PX2N : ENTITY IS TRUE;
END PX2N;

ARCHITECTURE behavioral OF PX2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 0);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 2, 1 TO 4) := (
--  xin    -  xc  xout
 ( '1',  '-',  '1',  '0'),
 ( '0',  '-',  '0',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = !xin; xc = xin 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (0 => xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PX3N.vhd
-- Description  : Crystal Oscillator Circuit 

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PX3N IS
 GENERIC
 (
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT      std_ulogic;
  xc         : OUT        std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PX3N : ENTITY IS TRUE;
END PX3N;

ARCHITECTURE behavioral OF PX3N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 0);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 2, 1 TO 4) := (
--  xin    -  xc  xout
 ( '1',  '-',  '1',  '0'),
 ( '0',  '-',  '0',  '1')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = !xin; xc = xin 


VitalStateTable ( StateTable => StateTab,
                      DataIn => (0 => xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PXWE1N.vhd
-- Description  : Crystal Oscillator Circuit With High Enable

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PXWE1N IS
 GENERIC
 (
  tpd_e_xc         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_e_xout       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xout        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_e           : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT        std_ulogic;
  xc         : OUT        std_ulogic;
  e          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PXWE1N : ENTITY IS TRUE;
END PXWE1N;

ARCHITECTURE behavioral OF PXWE1N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';
SIGNAL e_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
  VitalWireDelay ( e_ipd, e, tipd_e );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd,e_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- e  xin    -  xc xout
 (  '1',  '1',  '-',  '1',  '0'),
 (  '1',  '0',  '-',  '0',  '1'),
 (  '0',  '-',  '-',  '1',  'Z'),
 (  'X',  '1',  '-',  '1',  'X')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = e ? !xin : "1" ; xc = !xout


VitalStateTable ( StateTable => StateTab,
                      DataIn => (e_ipd,xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xc),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xout),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PXWE2N.vhd
-- Description  : Crystal Oscillator Circuit With High Enable

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PXWE2N IS
 GENERIC
 (
  tpd_e_xc         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_e_xout       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xout        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_e           : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT        std_ulogic;
  xc         : OUT        std_ulogic;
  e          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PXWE2N : ENTITY IS TRUE;
END PXWE2N;

ARCHITECTURE behavioral OF PXWE2N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';
SIGNAL e_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
  VitalWireDelay ( e_ipd, e, tipd_e );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd,e_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- e  xin    -  xc xout
 (  '1',  '1',  '-',  '1',  '0'),
 (  '1',  '0',  '-',  '0',  '1'),
 (  '0',  '-',  '-',  '1',  'Z'),
 (  'X',  '1',  '-',  '1',  'X')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = e ? !xin : "1" ; xc = !xout


VitalStateTable ( StateTable => StateTab,
                      DataIn => (e_ipd,xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xc),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xout),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PXWE3N.vhd
-- Description  : Crystal Oscillator Circuit With High Enable

LIBRARY ieee;                  
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_timing.ALL; 
USE ieee.vital_primitives.ALL;

--ENTITY DECLARATION
ENTITY PXWE3N IS
 GENERIC
 (
  tpd_e_xc         : VitalDelayType01 := (0 ps, 0 ps);
  tpd_e_xout       : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xout     : VitalDelayType01Z := (0 ps, 0 ps, 0 ps, 0 ps, 0 ps, 0 ps);
  tpd_xin_xc       : VitalDelayType01 := (0 ps, 0 ps);
  tipd_xout        : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_xin         : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  tipd_e           : VitalDelayType01Z := (0 ps,0 ps,0 ps,0 ps,0 ps,0 ps);
  TimingChecksOn   : Boolean    := TRUE;
  XOn              : Boolean    := TRUE;
  MsgOn            : Boolean    := TRUE;
  InstancePath     : string     := ""
 );
 PORT
 (
  xin        : IN         std_ulogic;
  xout       : OUT        std_ulogic;
  xc         : OUT        std_ulogic;
  e          : IN         std_ulogic
 );
ATTRIBUTE VITAL_LEVEL0 OF PXWE3N : ENTITY IS TRUE;
END PXWE3N;

ARCHITECTURE behavioral OF PXWE3N IS

ATTRIBUTE VITAL_LEVEL1 OF behavioral : ARCHITECTURE IS TRUE;

SIGNAL xin_ipd         : std_ulogic :='X';
SIGNAL e_ipd           : std_ulogic :='X';

BEGIN

WIREDELAY : BLOCK
BEGIN
  VitalWireDelay ( xin_ipd, xin, tipd_xin );
  VitalWireDelay ( e_ipd, e, tipd_e );
END BLOCK;

VITALBehavior : PROCESS (xin_ipd,e_ipd)
VARIABLE xc_GlitchData : VitalGlitchDataType;
VARIABLE xout_GlitchData : VitalGlitchDataType;
VARIABLE Prv : std_logic_vector(0 TO 1);
VARIABLE Res : std_logic_vector(0 TO 1) := (OTHERS=>'X');
ALIAS xc_zd : std_ulogic IS Res(0);
ALIAS xout_zd : std_ulogic IS Res(1);

CONSTANT StateTab : VitalStateTableType (1 TO 4, 1 TO 5) := (
-- e  xin    -  xc xout
 (  '1',  '1',  '-',  '1',  '0'),
 (  '1',  '0',  '-',  '0',  '1'),
 (  '0',  '-',  '-',  '1',  'Z'),
 (  'X',  '1',  '-',  '1',  'X')
);

BEGIN

--------------------
--Functionality
--------------------
-- xout = e ? !xin : "1" ; xc = !xout


VitalStateTable ( StateTable => StateTab,
                      DataIn => (e_ipd,xin_ipd),
                   NumStates => 1,
                      Result => Res,
              PreviousDataIn => Prv
              );
--------------------
--Path Delay Section
--------------------
VitalPathDelay01Z (xc, xc_GlitchData, "xc", xc_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xc),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xc),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
VitalPathDelay01Z (xout, xout_GlitchData, "xout", xout_zd,
 Paths=>(0=>(e_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_e_xout),TRUE),
 1=>(xin_ipd'LAST_EVENT,VitalExtendToFillDelay(tpd_xin_xout),TRUE)),
 DefaultDelay=>VitalZeroDelay01Z, Mode=>OnDetect, XOn=>XOn, MsgOn=>MsgOn );
END PROCESS;
END behavioral;
 

-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD1CAPN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD1CAPN IS
    port (    
            SVDD1CAP   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD1CAPN : ENTITY IS TRUE;
END PVDD1CAPN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD1CAPN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVDD1CAP <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD1CAP1N.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD1CAP1N IS
    port (    
            SVDD1CAP1   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD1CAP1N : ENTITY IS TRUE;
END PVDD1CAP1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD1CAP1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVDD1CAP1 <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS1CAPN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS1CAPN IS
    port (    
            SVSS1CAP   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS1CAPN : ENTITY IS TRUE;
END PVSS1CAPN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS1CAPN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVSS1CAP <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS1CAP1N.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS1CAP1N IS
    port (    
            SVSS1CAP1   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS1CAP1N : ENTITY IS TRUE;
END PVSS1CAP1N;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS1CAP1N IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SVSS1CAP1 <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVSS3CAPN.vhd
-- Description  : VSS PAD 

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVSS3CAPN IS
    port (    
            SAVSS   : OUT   std_ulogic := '0'  
         );

    ATTRIBUTE VITAL_level0 OF PVSS3CAPN : ENTITY IS TRUE;
END PVSS3CAPN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVSS3CAPN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SAVSS <= '0';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PVDD3CAPN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PVDD3CAPN IS
    port (    
            SAVDD   : OUT   std_ulogic := '1'  
         );

    ATTRIBUTE VITAL_level0 OF PVDD3CAPN : ENTITY IS TRUE;
END PVDD3CAPN;

-- ARCHITECTURE DECLARATION

ARCHITECTURE vhdl_behavioral OF PVDD3CAPN IS
    ATTRIBUTE VITAL_level1 OF vhdl_behavioral : ARCHITECTURE IS FALSE;
BEGIN
    SAVDD <= '1';

END vhdl_behavioral;
 
-- (C) Copyright 2004 SMIC Corp. All rights reserved.
-- SMIC Vital Models.
-- Filename     : PANA4APN.vhd
-- Description  : VDD PAD

LIBRARY ieee;   
USE ieee.std_logic_1164.ALL; 
USE ieee.vital_primitives.all; 
USE ieee.vital_timing.all;

--ENTITY DECLARATION
ENTITY PANA4APN IS
    port (    
            PAD   : INOUT   std_ulogic   
         );

    ATTRIBUTE VITAL_level0 OF PANA4APN : ENTITY IS TRUE;
END PANA4APN;

