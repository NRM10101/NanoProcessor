----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.06.2023 18:42:25
-- Design Name: 
-- Module Name: VerySlowClock - Behavioral
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

entity VerySlowClock is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end VerySlowClock;

architecture Behavioral of VerySlowClock is
signal count : integer := 0;
signal clk_status : std_logic := '0';
begin
    process(Clk_in) begin
        if(rising_edge(Clk_in)) then
            count <= count + 1;
            if(count = 30) then
                clk_status <= NOT clk_status;
                Clk_out <= clk_status;
                count <= 1;
            end if;
        end if;
    end process;
end Behavioral;
