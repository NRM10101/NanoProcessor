----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 19:40:23
-- Design Name: 
-- Module Name: SimProgramROM - Behavioral
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

entity SimProgramROM is
--  Port ( );
end SimProgramROM;

architecture Behavioral of SimProgramROM is
component ProgramROM
    port(
    address : in std_logic_vector(2 downto 0);
    data : out std_logic_vector(11 downto 0)
    );
end component;
SIGNAL temp_address :std_logic_vector(2 downto 0);
SIGNAL temp_data: std_logic_vector(11 downto 0);
begin
    UUT:ProgramROM port map(
        address=>temp_address,
        data=>temp_data
        );
process
 begin
    temp_address<="000";
    WAIT FOR 100 ns;
    temp_address<="001";
    WAIT FOR 100 ns;
    temp_address<="010";
    WAIT FOR 100 ns;
    temp_address<="011";
    WAIT FOR 100 ns;
    temp_address<="100";
    WAIT FOR 100 ns;
    temp_address<="101";
    WAIT FOR 100 ns;
    temp_address<="110";
    WAIT FOR 100 ns;
    temp_address<="111";
    WAIT;

end process;
end Behavioral;
