----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 07:44:44 PM
-- Design Name: 
-- Module Name: 2_Way_3_Bit_Mux - Behavioral
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

entity Way_2_Bit3_Mux is
    Port ( Jump_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Adder_3_Out: in STD_LOGIC_VECTOR (2 downto 0);
           Sel_Jump : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end Way_2_Bit3_Mux;

architecture Behavioral of Way_2_Bit3_Mux is

begin
process (Sel_Jump,Jump_Address,Adder_3_Out)
begin 
 if Sel_Jump ='0' then 
    Output <= Adder_3_Out;
 else 
    Output<= Jump_Address ;
 end if;
 end process;
end Behavioral;
