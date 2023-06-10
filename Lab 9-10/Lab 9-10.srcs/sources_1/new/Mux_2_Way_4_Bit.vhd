
---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.06.2023 12:10:21
-- Design Name: 
-- Module Name: Mux_2_Way_4_Bit - Behavioral
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

entity Mux_2_Way_4_Bit is
    Port ( ImmVal : in STD_LOGIC_VECTOR (3 downto 0);
           ASU : in STD_LOGIC_VECTOR (3 downto 0);
           out_RegIn : out STD_LOGIC_VECTOR (3 downto 0);
           LS : in STD_LOGIC);
end Mux_2_Way_4_Bit;

architecture Behavioral of Mux_2_Way_4_Bit is

signal ls_s : std_logic;
signal asu_s : std_logic_vector(3 downto 0);
signal immVal_s : std_logic_vector(3 downto 0);
signal output : std_logic_vector(3 downto 0);
begin

    ls_s <= LS;
    asu_s <= ASU;
    immVal_s <= ImmVal;
    process (ls_s, asu_s, immVal_s) begin
        if ls_s='1' then
            output<=asu_s;
        else 
            output<=immVal_s;
        end if;
    end process;
    
    out_RegIn <= output;
end Behavioral;
