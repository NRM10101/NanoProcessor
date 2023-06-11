----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 15:13:15
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
    Port ( 
           pushButton : in STD_LOGIC;
           jump_Flag: out std_logic;
           Address_to_jump:out std_logic_vector(2 downto 0);
           
           Register_check_for_jump:out std_logic_vector(3 downto 0);
           LED_R0:out std_logic_vector(3 downto 0);
           
           Imm_Value:out std_logic_vector(3 downto 0);
           Clk : in STD_LOGIC;
           nextInsVal : out std_logic_vector(2 downto 0);
           RegisterEnable:out std_logic_vector(2 downto 0);
           RegisterBank_DataIn: out std_logic_vector(3 downto 0);
           LED : out STD_LOGIC_VECTOR (3 downto 0);
           LED_R6 : out std_logic_vector(3 downto 0);
           LED_R5 : out std_logic_vector(3 downto 0);
           LED_OVERFLOW:out STD_LOGIC;
           LED_ZERO:out STD_LOGIC;
           Instruction : out std_logic_vector(11 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is
COMPONENT Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;
COMPONENT Mux_8_Way_4_Bit is  --MUX 8 X 1 (4 BIT)
    Port ( Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           Mux_Out  : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
COMPONENT Mux_2_Way_4_Bit is --MUX 2 X 1 (4 BIT)
    Port ( ImmVal : in STD_LOGIC_VECTOR (3 downto 0);
           ASU : in STD_LOGIC_VECTOR (3 downto 0);
           out_RegIn : out STD_LOGIC_VECTOR (3 downto 0);
           LS : in STD_LOGIC);
end COMPONENT;
COMPONENT Way_2_Bit3_Mux is  --MUX 2 X 1 (3 BIT)
    Port ( Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Adder_3_Out: in STD_LOGIC_VECTOR (2 downto 0);
           Sel_Jump : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;
COMPONENT AddSubUnit IS
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           M : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_OUT : out STD_LOGIC;
           OVERFLOW: out STD_LOGIC;
           ZERO: out STD_LOGIC );
end COMPONENT;
COMPONENT RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           B : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_out : out STD_LOGIC);
END COMPONENT ;
COMPONENT ProgramROM is  --ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end COMPONENT;
COMPONENT InstructionDecoder is --Instruction Decoder
    Port ( InsBus : in STD_LOGIC_VECTOR (11 downto 0);  --instruction bus
           RCJ : in STD_LOGIC_VECTOR (3 downto 0);      --Register check for jump
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);   --Register Enable
           LS : out STD_LOGIC;                          --Load Select
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);   --Immediate Value
           RegS1 : out STD_LOGIC_VECTOR (2 downto 0);   --Register Select 1
           RegS2 : out STD_LOGIC_VECTOR (2 downto 0);   --Register Select 2
           AddSubS : out STD_LOGIC;                     --Add/Sub Select
           JumpFlag : out STD_LOGIC;                    --JumpFlag
           ATJ : out STD_LOGIC_VECTOR (2 downto 0));    --Address to jump
end COMPONENT;
COMPONENT Reg_Bank is
    Port ( Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           push_button :in std_logic;
           Reg_Bank_In : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_4 : out STD_LOGIC_VECTOR (3 downto 0);--register banks
           Reg_B_Out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end COMPONENT;
COMPONENT ProgramCounter_3Bit is
    Port ( Reset_PushButton : in STD_LOGIC;
           Clk : in STD_LOGIC;
           pc_in : in STD_LOGIC_VECTOR (2 downto 0);
           MemSel : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;
SIGNAL CLOCK:STD_LOGIC;
-----MUX 8 X 1
SIGNAL MUX_0_OUT,MUX_1_OUT:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL R0,R1,R2,R3,R4,R5,R6,R7,REG_BANK_IN:STD_LOGIC_VECTOR(3 DOWNTO 0); --MUX 8X1 AND REG OUTS CONNECTERS
SIGNAL REG_S1,REG_S2,REG_EN:STD_LOGIC_VECTOR(2 DOWNTO 0);

SIGNAL LS_s:STD_LOGIC;
SIGNAL IMMVAL,ASU_s:STD_LOGIC_VECTOR(3 DOWNTO 0);
-----ADD SUB UNIT
SIGNAL M,OVERFLOW,ZERO,C_OUT:STD_LOGIC;
------DECODER
SIGNAL InsBus: STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL JUMPFLAG:STD_LOGIC;
SIGNAL ATJ:STD_LOGIC_VECTOR(2 DOWNTO 0);
---ROM
SIGNAL MEMORYSELECT:STD_LOGIC_VECTOR(2 DOWNTO 0);
--3 BIT ADDER
SIGNAL THREE_BIT_ADDER_OUT:STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL C_OUTT:STD_LOGIC;
---PC
SIGNAL NextIns:STD_LOGIC_VECTOR(2 DOWNTO 0);

SIGNAL SLOW_CLOCK_OUT:STD_LOGIC;

signal pushButton_s : std_logic;
----------------------------------------------------------------------------------------------------
begin
    pushButton_s <= pushButton;
REGBANK :Reg_Bank
    port map(
    Clk=>CLOCK,
    Reg_EN=>REG_EN,
    Reg_Bank_In=>REG_BANK_IN,
    Reg_B_Out_0=>R0,
    Reg_B_Out_1=>R1,
    Reg_B_Out_2=>R2,
    Reg_B_Out_3=>R3,
    Reg_B_Out_4=>R4,
    Reg_B_Out_5=>R5,
    Reg_B_Out_6=>R6,
    Reg_B_Out_7=>R7,
    push_button=>pushButton_s
    );
MUX8X1_0:Mux_8_Way_4_Bit
    port map(
     Reg_Sel =>REG_S1,
     R0 =>R0,
     R1 =>R1,
     R2 =>R2,
     R3 =>R3,
     R4 =>R4,
     R5 =>R5,
     R6 =>R6,
     R7 =>R7,
     Mux_Out =>MUX_0_OUT);
MUX8X1_1:Mux_8_Way_4_Bit
     port map(
     Reg_Sel =>REG_S2,
     R0 =>R0,
     R1 =>R1,
     R2 =>R2,
     R3 =>R3,
     R4 =>R4,
     R5 =>R5,
     R6 =>R6,
     R7 =>R7,
     Mux_Out =>MUX_1_OUT);
MUX2X1_4BIT: Mux_2_Way_4_Bit
    port map(
    out_RegIn=>REG_BANK_IN,
    ImmVal=>IMMVAL,
    ASU=>ASU_s,
    LS=>LS_s);
MUX2X1_3BIT:Way_2_Bit3_Mux
    port map(
    Jump_Address=>ATJ,
    Adder_3_Out=>THREE_BIT_ADDER_OUT,
    Sel_Jump=>JUMPFLAG,
    Output=>NextIns
    );
ADDSUBUNIT_0: AddSubUnit--ADD SUB UNIT
    Port map (
    A0 =>MUX_0_OUT(0),
    A1 =>MUX_0_OUT(1),
    A2 =>MUX_0_OUT(2),
    A3 =>MUX_0_OUT(3),
    M  =>M,
    B0 =>MUX_1_OUT(0),
    B1 =>MUX_1_OUT(1),
    B2 =>MUX_1_OUT(2),
    B3 =>MUX_1_OUT(3),
    S0 =>ASU_s(0),
    S1 =>ASU_s(1),
    S2 =>ASU_s(2),
    S3 =>ASU_s(3),
    C_OUT =>C_OUT,
    ZERO =>ZERO,
    OVERFLOW => OVERFLOW);
INSTRUCTIONDECODER0:InstructionDecoder
    Port map(
    InsBus=>InsBus,
    RCJ(0)=>MUX_0_OUT(0),
    RCJ(1)=>MUX_0_OUT(1),
    RCJ(2)=>MUX_0_OUT(2),
    RCJ(3) =>MUX_0_OUT(3),
    RegEn =>REG_EN,
    LS =>LS_s,
    ImVal=>IMMVAL,
    RegS1=>REG_S1,
    RegS2 =>REG_S2,
    AddSubS =>M,
    JumpFlag=>JUMPFLAG,
    ATJ=>ATJ);
THREEBITADDER:RCA_4
    Port map(
    A=>MEMORYSELECT,
    C_in=>'0',
    B => "001",
    S=>THREE_BIT_ADDER_OUT,
    C_out=>C_OUTT
    );
ROM :ProgramROM
    Port map(
    address=>MEMORYSELECT,
    data=>InsBus);
SLOWCLOCK :Slow_Clk
    Port map(
    Clk_in=>Clk,
    Clk_out=>SLOW_CLOCK_OUT
    );
PROGRAMCOUNTER:ProgramCounter_3Bit
    Port map(
    Reset_PushButton=>pushButton_s,
    --Clk=>SLOW_CLOCK_OUT,
    Clk=>CLOCK,
    pc_in=>NextIns,
    MemSel=>MEMORYSELECT
    );
    --SET OUTPUTS TO LEDS-----------------------------------

    CLOCK <= Clk;
    nextInsVal <= NextIns;
--    pushButton_s <= pushButton;
    LED<=R7;
    LED_R6 <= R6;
    LED_R5 <= R5;
    LED_OVERFLOW<=OVERFLOW;
    LED_ZERO<=ZERO;
    RegisterEnable<=REG_EN;
    RegisterBank_DataIn<=REG_BANK_IN;
    Imm_Value<=IMMVAL;
    Instruction <= InsBus;
    jump_Flag<=JUMPFLAG;
    Address_to_jump<=ATJ;
    Register_check_for_jump<=MUX_0_OUT;
    LED_R0<=R0;
end Behavioral;
