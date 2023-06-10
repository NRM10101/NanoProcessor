----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 05:04:59 PM
-- Design Name: 
-- Module Name: Mux_8_Way_4_Bit - Behavioral
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

entity Mux_8_Way_4_Bit is
    Port ( Reg_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           Mux_Out  : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_Way_4_Bit;

architecture Behavioral of Mux_8_Way_4_Bit is
component Decoder_3_to_8
    port(I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Dec_Out : std_logic_vector(7 downto 0);
signal Mux_Output : std_logic_vector(3 downto 0);
signal D0 : std_logic_vector(3 downto 0);
signal A0 : std_logic_vector(3 downto 0);
signal D1 : std_logic_vector(3 downto 0);
signal A1 : std_logic_vector(3 downto 0);
signal D2 : std_logic_vector(3 downto 0);
signal A2 : std_logic_vector(3 downto 0);
signal D3 : std_logic_vector(3 downto 0);
signal A3 : std_logic_vector(3 downto 0);
signal D4 : std_logic_vector(3 downto 0);
signal A4 : std_logic_vector(3 downto 0);
signal D5 : std_logic_vector(3 downto 0);
signal A5 : std_logic_vector(3 downto 0);
signal D6 : std_logic_vector(3 downto 0);
signal A6 : std_logic_vector(3 downto 0);
signal D7 : std_logic_vector(3 downto 0);
signal A7 : std_logic_vector(3 downto 0);


begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map (
        I => Reg_Sel,
        EN => '1',
        Y => Dec_Out
    );
    A0 <= (others=> Dec_Out(0));
    A1 <= (others=> Dec_Out(1)); 
    A2 <= (others=> Dec_Out(2));
    A3 <= (others=> Dec_Out(3));
    A4 <= (others=> Dec_Out(4)); 
    A5 <= (others=> Dec_Out(5));
    A6 <= (others=> Dec_Out(6)); 
    A7 <= (others=> Dec_Out(7));
    
    D0 <= R0 AND A0;
    D1 <= R1 AND A1;
    D2 <= R2 AND A2;
    D3 <= R3 AND A3;
    D4 <= R4 AND A4;
    D5 <= R5 AND A5;
    D6 <= R6 AND A6;
    D7 <= R7 AND A7;

    Mux_Out <= D0 or D1 or D2 or D3 or D4 or D5 or D6 or D7;

end Behavioral;
