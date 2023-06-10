----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 12:37:00
-- Design Name: 
-- Module Name: Mux_2_Way_3_Bit - Behavioral
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

entity Mux_2_Way_3_Bit is
    Port ( AdderOut : in STD_LOGIC_VECTOR (2 downto 0);
           ATJ : in STD_LOGIC_VECTOR (2 downto 0);
           JumpFlag : in STD_LOGIC;
           PC_In : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_Way_3_Bit;

architecture Behavioral of Mux_2_Way_3_Bit is

begin


end Behavioral;
