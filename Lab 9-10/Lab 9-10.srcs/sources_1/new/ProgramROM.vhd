----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 19:07:16
-- Design Name: 
-- Module Name: ProgramROM - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
signal rom : rom_type :=(
    "101110000001", --0     MOVI R7,1
    "101100000010", --1     MOVI R6,2
    "101010000011", --2     MOVI R5,3
    "001111100000", --3     ADD R7 <- R7 + R6 
    "001111010000", --4     ADD R7 <- R7 + R5
    "110000000000", --5     JZR R0,0
    "000000000000", --6
    "000000000000"  --7    
  );
begin
    data <= rom(to_integer(unsigned(address)));
end Behavioral;
