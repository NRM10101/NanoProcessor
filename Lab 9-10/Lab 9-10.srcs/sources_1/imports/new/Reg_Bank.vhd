----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 07:28:23 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( Clk : in STD_LOGIC;
           Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_Bank_In : in STD_LOGIC_VECTOR (3 downto 0);
           push_button:in std_logic;
           Reg_B_Out_0 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_1 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_2 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_3 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_4 : out STD_LOGIC_VECTOR (3 downto 0);--register banks
           Reg_B_Out_5 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_6 : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_B_Out_7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Reg
    port( 
        D : in STD_LOGIC_VECTOR (3 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
     );   
 end component;
 
 component Decoder_3_to_8 
        Port ( 
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
        );  
 end component;
 
 signal decoder_out :  std_LOGIC_VECTOR(7 downto 0);
  
begin
--    process(Clk,push_button)
--    begin
--    if(push_button='1') then
--        Reg_B_Out_0<="0000";
--        Reg_B_Out_1<="0000";
--        Reg_B_Out_2<="0000";
--        Reg_B_Out_3<="0000";
--        Reg_B_Out_4<="0000";
--        Reg_B_Out_5<="0000";
--        Reg_B_Out_6<="0000";
--        Reg_B_Out_7<="0000";
--end if;
--end process;  
---------------------------------------------------------------------------
    Decoder_reg_enable : Decoder_3_to_8
        port map(
            I => Reg_EN,
            EN => '1',
            Y => decoder_out
            );
------------------------------------------------------------------------------            
          register_0 : Reg
              port map(
                 D => "0000",
                 EN=> decoder_out(0),
                 Clk => Clk,
                 Q=> Reg_B_Out_0
            );
          register_1 : Reg
              port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(1),
                 Clk => Clk,
                 Q=> Reg_B_Out_1
           );
           register_2 : Reg
              port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(2),
                 Clk => Clk,
                 Q=> Reg_B_Out_2
            );
          register_3 : Reg
               port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(3),
                 Clk => Clk,
                 Q=> Reg_B_Out_3
            );
           register_4 : Reg
               port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(4),
                 Clk => Clk,
                 Q=> Reg_B_Out_4
            );
           register_5 : Reg
                port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(5),
                 Clk => Clk,
                 Q=> Reg_B_Out_5
            );
           register_6 : Reg
                port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(6),
                 Clk => Clk,
                 Q=> Reg_B_Out_6
                                        );  
           register_7 : Reg
                port map(
                 D =>Reg_Bank_In,
                 EN=> decoder_out(7),
                 Clk => Clk,
                 Q=> Reg_B_Out_7
        );   
    
--       process(Clk,push_button)
--           begin
--              if(rising_edge(Clk)) then
--                  if(push_button='1') then
--                        Reg_B_Out_0<="0000";
--                        Reg_B_Out_1<="0000";
--                        Reg_B_Out_2<="0000";
--                        Reg_B_Out_3<="0000";
--                        Reg_B_Out_4<="0000";
--                        Reg_B_Out_5<="0000";
--                        Reg_B_Out_6<="0000";
--                        Reg_B_Out_7<="0000";
--                   end if;
--               end if;
--        end process;                                  
end Behavioral;