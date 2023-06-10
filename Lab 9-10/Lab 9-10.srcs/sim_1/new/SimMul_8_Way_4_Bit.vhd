----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 09:15:06
-- Design Name: 
-- Module Name: SimMul_8_Way_4_Bit - Behavioral
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

entity SimMul_8_Way_4_Bit is
--  Port ( );
end SimMul_8_Way_4_Bit;

architecture Behavioral of SimMul_8_Way_4_Bit is
component Mux_8_Way_4_Bit is
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
end component;
signal Reg_Sel :STD_LOGIC_VECTOR (2 downto 0);
signal R0 : STD_LOGIC_VECTOR (3 downto 0);
signal R1 : STD_LOGIC_VECTOR (3 downto 0);
signal R2 : STD_LOGIC_VECTOR (3 downto 0);
signal R3 : STD_LOGIC_VECTOR (3 downto 0);
signal R4 : STD_LOGIC_VECTOR (3 downto 0);
signal R5 : STD_LOGIC_VECTOR (3 downto 0);
signal R6 : STD_LOGIC_VECTOR (3 downto 0);
signal R7 : STD_LOGIC_VECTOR (3 downto 0);
signal Mux_Out  :STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:Mux_8_Way_4_Bit port map(
    Reg_Sel=>Reg_Sel,
    R0=>R0,
    R1=>R1,
    R2=>R2,
    R3=>R3,
    R4=>R4,
    R5=>R5,
    R6=>R6,
    R7=>R7,
    Mux_Out=>Mux_Out);
process
    begin
        R0<="0000";
        R1<="0001";
        R2<="0010";
        R3<="0011";
        R4<="0100";
        R5<="0101";
        R6<="0110";
        R7<="0111";
        Reg_Sel<="000";
        WAIT FOR 100 ns;
        Reg_Sel<="001";
        WAIT FOR 100 ns;
        Reg_Sel<="010";
        WAIT FOR 100 ns;
        Reg_Sel<="011";
        WAIT FOR 100 ns;
        Reg_Sel<="100";
        WAIT FOR 100 ns;
        Reg_Sel<="101";
        WAIT FOR 100 ns;
        Reg_Sel<="110";
        WAIT FOR 100 ns;
        Reg_Sel<="111";
        WAIT;
end process ;  
end Behavioral;
