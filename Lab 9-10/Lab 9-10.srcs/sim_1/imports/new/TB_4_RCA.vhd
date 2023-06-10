----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 16:01:59
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is
COMPONENT RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           B : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_out : out STD_LOGIC);
end COMPONENT;
SIGNAL A,B,S : std_logic_vector(2 downto 0);
SIGNAL C_out,C_in : std_logic;
begin
 UUT: RCA_4 PORT MAP(
    A=>A,
    B=>B,
    C_in=>C_in,
    C_out=>C_out,
    S=>S
 );
 process
 begin
      A<="000";
      B<="001";
      C_in<='0';
      
      WAIT FOR 100 ns; -- after 100 ns change inputs
      A<="001";
      
      WAIT FOR 100 ns; -- after 100 ns change inputs
      A<="010";
      
      WAIT FOR 100 ns; -- after 100 ns change inputs
      A<="011";
      
      WAIT FOR 100 ns; -- after 100 ns change inputs
      A<="100";
      
      WAIT FOR 100 ns; -- after 100 ns change inputs
      
      A<="101";
      WAIT FOR 100 ns; -- after 100 ns change inputs
      
      A<="110";
      WAIT FOR 100 ns; -- after 100 ns change inputs

      A<="111";
--      WAIT FOR 100 ns; -- after 100 ns change inputs
--      B<="001";  
--      A<="000";      
      WAIT; -- will wait forever 
  end process;

end Behavioral;
