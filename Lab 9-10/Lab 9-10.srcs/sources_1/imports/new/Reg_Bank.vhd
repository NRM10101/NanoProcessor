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
           push_button:in std_logic;  ---push_button=1 =>reset
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
        RESET: IN STD_LOGIC;
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
-- signal regout0,regout1,regout2,regout3,regout4,regout5,regout6,regout7:std_logic_vector(3 downto 0);

begin
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
                 RESET=>push_button,
                 Q=> Reg_B_Out_0
            );
          register_1 : Reg
              port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(1),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_1
           );
           register_2 : Reg
              port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(2),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_2
            );
          register_3 : Reg
               port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(3),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_3
            );
           register_4 : Reg
               port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(4),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_4
            );
           register_5 : Reg
                port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(5),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_5
            );
           register_6 : Reg
                port map(
                 D => Reg_Bank_In,
                 EN=> decoder_out(6),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_6
                                        );  
           register_7 : Reg
                port map(
                 D =>Reg_Bank_In,
                 EN=> decoder_out(7),
                 Clk => Clk,
                 RESET=>push_button,
                 Q=> Reg_B_Out_7
        );   
                                  
end Behavioral;
