----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 13:07:48
-- Design Name: 
-- Module Name: ProgramCounter_3Bit - Behavioral
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

entity ProgramCounter_3Bit is
    Port ( Reset_PushButton : in STD_LOGIC;
           Clk : in STD_LOGIC;
           pc_in : in STD_LOGIC_VECTOR (2 downto 0);
           MemSel : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter_3Bit;

architecture Behavioral of ProgramCounter_3Bit is
begin
    process(Clk,Reset_PushButton)
    begin
    if(Reset_PushButton='1') then
        MemSel<="000";
    else
        if(rising_edge(Clk)) then
            MemSel<=pc_in;
        end if;
     end if;
end process;
--begin
--    process(Clk)
--    begin
--    if(rising_edge(Clk)) then
--        if(Reset_PushButton='1') then
--          MemSel<="000";
--        else
--          MemSel<=pc_in;
--        end if;
--    end if;
--end process;


end Behavioral;
