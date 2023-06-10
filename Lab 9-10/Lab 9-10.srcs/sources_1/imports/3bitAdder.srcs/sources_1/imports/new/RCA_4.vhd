----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2023 15:44:28
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           B : in STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

    component FA 
        port ( 
        A: in std_logic; 
        B: in std_logic; 
        C_in: in std_logic; 
        S: out std_logic; 
        C_out: out std_logic); 
    end component; 
 
    SIGNAL FA0_C,FA1_C,FA2_C: std_logic; 
    SIGNAL TEMP_S:STD_LOGIC_VECTOR(2 DOWNTO 0);

begin
    FA_0 : FA 
        port map ( 
             A => A(0), 
             B => B(0), 
             C_in => '0', 
             S => TEMP_S(0), 
             C_Out => FA0_C); 
    FA_1 : FA 
        port map ( 
             A => A(1), 
             B => B(1), 
             C_in => FA0_C, 
             S => TEMP_S(1), 
             C_Out => FA1_C); 
     FA_2 : FA 
         port map ( 
             A => A(2), 
             B => B(2), 
             C_in => FA1_C, 
             S => TEMP_S(2), 
             C_Out => FA2_C); 
             
--      process(FA2_C) begin
--      if(FA2_C='1') THEN 
--        S<="000";
--        C_out<=FA2_C;
--      else
--       S(0)<=TEMP_S(0);
--       S(1)<=TEMP_S(1);
--       S(2)<=TEMP_S(2);
--       C_out<=FA2_C;
--      end if;
--      end process;  

    S<=TEMP_S;
    C_out<=FA2_C;         
end Behavioral;
