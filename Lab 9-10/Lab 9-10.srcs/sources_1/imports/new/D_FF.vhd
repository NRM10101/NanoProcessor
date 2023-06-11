----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2023 02:57:21 PM
-- Design Name: 
-- Module Name: D_FF - Behavioral
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


entity D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC
           --Qbar : out STD_LOGIC
           );
end D_FF;

architecture Behavioral of D_FF is
begin
    process (Clk) begin
        if(rising_edge (Clk)) then
            if Res = '1' then
                    Q <= '0';
                    --Qbar <= '1' ;
            else    
                    Q <= D;
                    --Qbar <= not D;
             end if;
        end if;
     end process;
                
            
        


end Behavioral;
