----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 06:15:10 PM
-- Design Name: 
-- Module Name: System_TB - Behavioral
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

entity System_TB is
--  Port ( );
end System_TB;

architecture Behavioral of System_TB is
component System 
    Port ( Clk : in STD_LOGIC;
    
           --realclk : out STD_LOGIC;

    
           ResetPush : in STD_LOGIC;
           Seg7 : out STD_LOGIC_VECTOR (6 downto 0);
           Overflow : out STD_LOGIC;
           Reg7 : out STD_LOGIC_VECTOR(3 downto 0);
           Zero : out STD_LOGIC);
end component;
signal Clk : STD_LOGIC:='0';
signal ResetPush : STD_LOGIC:='0';
signal Seg7 : STD_LOGIC_VECTOR (6 downto 0);
signal OVERFLOW : STD_LOGIC;
signal ZERO : STD_LOGIC;
signal Reg7 : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: System
port map(
     Clk => Clk,
     
     --realclk => realclk,

     
     ResetPush => ResetPush,
     Seg7 => Seg7,
     OVERFLOW => OVERFLOW,
     ZERO => ZERO,
     Reg7 => Reg7
);

process begin
Clk <= not Clk;
wait for 2ns;
end process;

process begin
wait for 300ns;


ResetPush <= '1';
wait for 40ns;
ResetPush<= '0';
wait for 150ns;
ResetPush <= '1';
wait for 40ns;
ResetPush<= '0';
end process;



end Behavioral;
