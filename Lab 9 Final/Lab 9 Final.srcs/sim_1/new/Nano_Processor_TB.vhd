----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 05:42:24 PM
-- Design Name: 
-- Module Name: Nano_Processor_TB - Behavioral
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

entity Nano_Processor_TB is
--  Port ( );
end Nano_Processor_TB;

architecture Behavioral of Nano_Processor_TB is
component Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0)   );
end component;

    signal instaddr : STD_LOGIC_VECTOR(2 downto 0);
    signal R7 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R6 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R5 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R4 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R3 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal R0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal CLK : STD_LOGIC := '0';
    signal RESETPUSH : STD_LOGIC:= '0';
    signal ZERO : STD_LOGIC := '0';
    signal OVERFLOW : STD_LOGIC := '0';
    signal NEXT_IA: STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal CURR_IA: STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal Inst0 :STD_LOGIC_VECTOR (11 downto 0);

begin
UUT: Nano_Processor port map(
            R7 => R7,
            R6 => R6,
            R5 => R5,
            R4 => R4,
            R3 => R3,
            R2 => R2,
            R1 => R1,
            R0 => R0,
            CLK  => CLK,
            Reset => RESETPUSH,
            Zero=> ZERO,
            Overflow => OVERFLOW
       );  
       
process begin
    Clk <= not Clk;
    wait for 20ns;
end process;

process begin
    wait for 300ns;
    RESETPUSH <= '1';
    wait for 50ns;
    RESETPUSH <= '0';
end process;          

end Behavioral;
