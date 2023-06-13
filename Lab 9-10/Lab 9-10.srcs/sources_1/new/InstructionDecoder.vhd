----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.06.2023 21:03:54
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( InsBus : in STD_LOGIC_VECTOR (11 downto 0);  --instruction bus
           RCJ : in STD_LOGIC_VECTOR (3 downto 0);      --Register check for jump
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);   --Register Enable
           LS : out STD_LOGIC;                          --Load Select
           ImVal : out STD_LOGIC_VECTOR (3 downto 0);   --Immediate Value
           RegS1 : out STD_LOGIC_VECTOR (2 downto 0);   --Register Select 1
           RegS2 : out STD_LOGIC_VECTOR (2 downto 0);   --Register Select 2
           AddSubS : out STD_LOGIC;                     --Add/Sub Select
           JumpFlag : out STD_LOGIC;                    --JumpFlag
           ATJ : out STD_LOGIC_VECTOR (2 downto 0));    --Address to jump
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
SIGNAL op : std_logic_vector(1 downto 0);
signal jumpSel : std_logic := '0';
signal regA : std_logic_vector(2 downto 0);
signal regB : std_logic_vector(2 downto 0);
signal immediateValue_s : std_logic_vector(3 downto 0);
signal jumpAddress : std_logic_vector(2 downto 0);
signal regChkForJump : std_logic_vector(3 downto 0);
signal muxSelect_1 : std_logic_vector(2 downto 0);
signal muxSelect_2 : std_logic_vector(2 downto 0);
signal regEn_s : std_logic_vector(2 downto 0);
signal loadSel : std_logic;
signal addSub_s : std_logic;
signal immVal_s : std_logic_vector(3 downto 0);
begin
    op <= InsBus(11 downto 10);
    regA <= InsBus(9 downto 7);
    regB <= InsBus(6 downto 4);
    immediateValue_s <= InsBus(3 downto 0); 
    regChkForJump <= RCJ;
    process (op, regA, regB, immediateValue_s, regChkForJump ) 
    
    begin
       jumpSel <= '0'; 
        if op = "00" then   --ADD---RA <- RA+RB
            muxSelect_1<=regA;
            muxSelect_2<=regB;
            addSub_s<='0';
            loadSel<='1';
            regEn_s<=regA; --Register enable
            
        elsif op = "01"then --NEG
            muxSelect_1<=regA;
            muxSelect_2<="000";
            addSub_s<='1';
            loadSel<='1';
            regEn_s<=regA;

        elsif op = "10" then --MOVI--
              --Register Enable
            immVal_s<=immediateValue_s;
            loadSel <='0';
            regEn_s<=regA;

        elsif op = "11" then   --JZR --  
            regEn_s<="UUU";          
            muxSelect_1<=regA;
            jumpAddress<=immediateValue_s(2 downto 0);
            if RCJ= "0000" then   --PC<--D  regChkForJump
                jumpSel<='1';
            else                 --PC<--PC+1
                jumpSel<='0';
            end if; 
        end if;
    end process;
    
    JumpFlag <= jumpSel;
    LS <= loadSel;
    RegEn <= regEn_s;
    ImVal <= immVal_s;
    RegS1 <= muxSelect_1;
    RegS2 <= muxSelect_2;
    AddSubS <= addSub_s;
    ATJ <= jumpAddress;
end Behavioral;
