----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 03:09:16 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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
entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is

signal count : integer := 0;
signal clk_status : std_logic := '0';

begin
    process(Clk_in) begin
        if(rising_edge(Clk_in)) then
            count <= count + 1;
            if(count = 50000000) then --50000000
                clk_status <= NOT clk_status;
                Clk_out <= clk_status;
                count <= 1;
            end if;
        end if;
    end process;
end Behavioral;
