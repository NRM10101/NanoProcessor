----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 01:00:42
-- Design Name: 
-- Module Name: SimInstructionDecoder - Behavioral
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

entity SimInstructionDecoder is
--  Port ( );
end SimInstructionDecoder;

architecture Behavioral of SimInstructionDecoder is
component InstructionDecoder
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
end component;
SIGNAL insbus : STD_LOGIC_VECTOR(11 downto 0);
SIGNAL rcj    :STD_LOGIC_VECTOR(3 downto 0);
SIGNAL regen  :STD_LOGIC_VECTOR(2 downto 0);
SIGNAL ls : STD_LOGIC;                         --Load Select
SIGNAL imval :STD_LOGIC_VECTOR (3 downto 0);   --Immediate Value
SIGNAL regs1 :STD_LOGIC_VECTOR (2 downto 0);   --Register Select 1
SIGNAL regs2 :STD_LOGIC_VECTOR (2 downto 0);   --Register Select 2
SIGNAL addsubs : STD_LOGIC;                    --Add/Sub Select
SIGNAL jumpflag : STD_LOGIC;                   --JumpFlag
SIGNAL atj : STD_LOGIC_VECTOR (2 downto 0);   
begin
UUT :InstructionDecoder 
    port map(
        insbus=>InsBus,
        rcj=>RCJ,
        regen=>RegEn,
        ls=>LS,
        imval=>ImVal,
        regs1=>RegS1,
        regs2=>RegS2,
        addsubs=>AddSubS,
        jumpflag=>JumpFlag,
        atj=>ATJ);
process
 begin
    rcj<="0000";
    insbus<="101110000001"; --MOVI
    WAIT FOR 100ns;
    insbus<="101100000010";  --MOVI
    WAIT FOR 100ns;
    insbus<="101010000011"; -- MOVI
    WAIT FOR 100ns;
    insbus<="001111100000"; -- ADD
    WAIT FOR 100ns;
    insbus<="110000000000";  --JZR
    WAIT FOR 100ns;
    insbus<="110000000000"; --JZR
    WAIT FOR 100ns;
    insbus<="000000000000"; 
    WAIT;
end process;
end Behavioral;
