----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 11:31:04
-- Design Name: 
-- Module Name: AddSubUnit - Behavioral
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

entity AddSubUnit is
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
end AddSubUnit;

architecture Behavioral of AddSubUnit is
    component FA 
        port ( 
        A: in std_logic; 
        B: in std_logic; 
        C_in: in std_logic; 
        S: out std_logic; 
        C_out: out std_logic); 
    end component; 
    SIGNAL FA0_C, FA1_C, FA2_C, FA3_C ,V,CARRY: std_logic; 
    SIGNAL ONES0,ONES1,ONES2,ONES3 :std_logic; --For ones complement
    SIGNAL S_0,S_1,S_2,S_3 :STD_LOGIC;
begin
    ONES0<=B0 XOR M;
    FA_0 : FA
        port map ( 
             A => A0, 
             B => ONES0, 
             C_in => M , --M
             S => S_0, 
             C_out => FA0_C); 
             
    ONES1<=B1 XOR M;
    FA_1 : FA 
        port map ( 
             A => A1, 
             B => ONES1, 
             C_in => FA0_C, 
             S => S_1, 
             C_out => FA1_C); 
             
     ONES2<=B2 XOR M;
     FA_2 : FA 
         port map ( 
             A => A2, 
             B => ONES2, 
             C_in => FA1_C, 
             S => S_2, 
             C_out => FA2_C); 
             
     ONES3<=B3 XOR M;
     FA_3 : FA 
         port map ( 
             A => A3, 
             B => ONES3, 
             C_in => FA2_C, 
             S => S_3, 
             C_out => CARRY);
      
     C_OUT<=CARRY;
     S0<=S_0;
     S1<=S_1;
     S2<=S_2;
     S3<=S_3;
     ZERO <=NOT S_0 AND NOT S_1 AND NOT S_2 AND NOT S_3 AND CARRY;
     
     OVERFLOW<= NOT(FA2_C AND (A3 XOR ONES3)) AND M;
     
     
     --OVERFLOW<= (FA2_C AND (A3 XOR ONES3)) XOR FA2_C;
     --OVERFLOW<= (C_OUT XOR FA2_C);  
end Behavioral;
