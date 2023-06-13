----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2023 20:36:09
-- Design Name: 
-- Module Name: SimRegisterBank - Behavioral
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

entity SimRegisterBank is
--  Port ( );
end SimRegisterBank;

architecture Behavioral of SimRegisterBank is
component Reg_Bank is
    Port ( Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_Bank_In : in STD_LOGIC_VECTOR (3 downto 0);
           push_button:in std_logic;  ---push_button=1 =>reset
           Reg_B_Out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_4 : out STD_LOGIC_VECTOR (3 downto 0);--register banks
           Reg_B_Out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;
signal pushButton:std_logic;
signal clock:std_logic;
signal reg_enable:std_logic_vector(2 downto 0);
signal reg_in,R0,R1,R2,R3,R4,R5,R6,R7:std_logic_vector(3 downto 0);
begin
UUT: Reg_Bank port map(
    Clk=>clock,
    Reg_En=>reg_enable,
    Reg_Bank_In=>reg_in,
    push_button=>pushButton,
    Reg_B_Out_0=>R0,
    Reg_B_Out_1=>R1,
    Reg_B_Out_2=>R2,
    Reg_B_Out_3=>R3,
    Reg_B_Out_4=>R4,
    Reg_B_Out_5=>R5,
    Reg_B_Out_6=>R6,
    Reg_B_Out_7=>R7
    );
process begin
    pushButton<='1';
    --------------------------------
    wait for 100 ns;
    pushButton<='0';
    
    clock<='0';
    reg_enable<="111";
    reg_in<="0001";
    wait for 100 ns;
    clock<='1';
    
    wait for 100 ns;
    clock<='0';
    reg_enable<="110";
    reg_in<="0010";
    wait for 100 ns;
    clock<='1';
    
    wait for 100 ns;
    clock<='0';
    reg_enable<="101";
    reg_in<="0011";
    wait for 100 ns;
    clock<='1';
    
    wait for 100 ns;
    clock<='0';
    reg_enable<="011";
    reg_in<="0101";
    wait for 100 ns;
    clock<='1';
    

    
 end process;

end Behavioral;
