----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 11:36:58
-- Design Name: 
-- Module Name: SimAddSubUnit - Behavioral
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

entity SimAddSubUnit is
--  Port ( );
end SimAddSubUnit;

architecture Behavioral of SimAddSubUnit is
component AddSubUnit 
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
           ZERO: out STD_LOGIC;
           OVERFLOW: out STD_LOGIC );
end component;
SIGNAL A0,A1,A2,A3,M,B0,B1,B2,B3,S0,S1,S2,S3,C_OUT,OVERFLOW,zero: STD_LOGIC;
begin
UUT : AddSubUnit
    port map(
        A0=>A0,
        A1=>A1,
        A2=>A2,
        A3=>A3,
        M=>M,
        B0=>B0,
        B1=>B1,
        B2=>B2,
        B3=>B3,
        S0=>S0,
        S1=>S1,
        S2=>S2,
        S3=>S3,
        C_OUT=>C_OUT,
        OVERFLOW=>OVERFLOW,
        ZERO=>zero);
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
         M<='1';
    WAIT FOR 100 ns; -- after 100 ns change inputs
         
             A0 <= '1'; -- set initial values
             A1 <= '0';
             A2 <= '1';
             A3 <= '0';
             B0 <= '1'; -- set initial values
             B1 <= '1';
             B2 <= '0';
             B3 <= '0';
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
                        M<='1';
    
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
        M<='0';
     
     WAIT FOR 100 ns; -- after 100 ns change inputs
            
            A0 <= '0'; -- set initial values
            A1 <= '0';
            A2 <= '0';
            A3 <= '1';
            B0 <= '0'; -- set initial values
            B1 <= '0';
            B2 <= '0';
            B3 <= '1';
           
    WAIT; -- will wait forever
    
end process;
        
end Behavioral;
