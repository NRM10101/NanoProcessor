----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.06.2023 20:01:19
-- Design Name: 
-- Module Name: SimProgramCounter - Behavioral
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

entity SimProgramCounter is
--  Port ( );
end SimProgramCounter;

architecture Behavioral of SimProgramCounter is
component ProgramCounter_3Bit is
    Port ( Reset_PushButton : in STD_LOGIC;
           Clk : in STD_LOGIC;
           pc_in : in STD_LOGIC_VECTOR (2 downto 0);
           MemSel : out STD_LOGIC_VECTOR (2 downto 0));
end component;
SIGNAL ResetPushButton:std_logic;
SIGNAL Clock:std_logic;
SIGNAL pcIn:std_logic_vector(2 downto 0);
SIGNAL Mem_Sel:std_logic_vector(2 downto 0);
begin
UUT:ProgramCounter_3Bit port map(
    Reset_PushButton=>ResetPushButton,
    Clk=>Clock,
    pc_in=>pcIn,
    MemSel=>Mem_Sel
);
process begin
    ResetPushButton<='1';
    Clock<='1';
    pcIn<="111";
    WAIT FOR 100 ns;
    Clock<='0';
    ResetPushButton<='0';

    pcIn<="101";
    WAIT FOR 100 ns;
    Clock<='1';
    ResetPushButton<='1';
    pcIn<="001";
    WAIT FOR 100 ns;
    Clock<='0';
    ResetPushButton<='0';
    pcIn<="011";
    WAIT FOR 100 ns;
    Clock<='1';
    pcIn<="110";
    WAIT FOR 100 ns;
    Clock<='0';
    pcIn<="111";
    WAIT FOR 100 ns;   
    Clock<='1'; 
    pcIn<="100";
    WAIT;  
end process;
end Behavioral;
