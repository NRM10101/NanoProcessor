----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2023 17:28:09
-- Design Name: 
-- Module Name: SimAdderSubUnit - Behavioral
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

entity SimAdderSubUnit is
--  Port ( );
end SimAdderSubUnit;

architecture Behavioral of SimAdderSubUnit is
COMPONENT RCA_4
     PORT( A0, A1, A2,A3,B0,B1,B2,B3,M : IN STD_LOGIC; 
           S0,S1,S2,S3,C_OUT : OUT STD_LOGIC);
 END COMPONENT;
SIGNAL A0,A1,A2,A3,B0,B1,B2,B3,M : std_logic;
SIGNAL S0,S1,S2,S3,C_OUT : std_logic;
begin
 UUT: RCA_4 PORT MAP(
        A0=>A0,
        A1=>A1,
        A2=>A2,
        A3=>A3,
        B0=>B0,
        B1=>B1,
        B2=>B2,
        B3=>B3,
        
        M=>M,
        
        S0=>S0,
        S1=>S1,
        S2=>S2,
        S3=>S3,
        C_OUT=>C_OUT
 );
 process
begin
    A0 <= '0'; -- set initial values
    A1 <= '0';
    A2 <= '0';
    A3 <= '0';
    B0 <= '0'; -- set initial values
    B1 <= '1';
    B2 <= '1';
    B3 <= '1';
    M<='0';

WAIT FOR 100 ns; -- after 100 ns change inputs

    A0 <= '1'; -- set initial values
    A1 <= '0';
    A2 <= '1';
    A3 <= '0';
    B0 <= '1'; -- set initial values
    B1 <= '1';
    B2 <= '0';
    B3 <= '0';

WAIT FOR 100 ns; -- after 100 ns change inputs

    A0 <= '1'; -- set initial values
    A1 <= '0';
    A2 <= '1';
    A3 <= '0';
    B0 <= '1'; -- set initial values
    B1 <= '1';
    B2 <= '0';
    B3 <= '1';
 
WAIT FOR 100 ns; -- after 100 ns change inputs
    
    A0 <= '1'; -- set initial values
    A1 <= '1';
    A2 <= '1';
    A3 <= '1';
    B0 <= '1'; -- set initial values
    B1 <= '1';
    B2 <= '1';
    B3 <= '0';
       
WAIT; -- will wait forever

end process;

end Behavioral;
