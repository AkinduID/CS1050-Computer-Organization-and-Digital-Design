----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 10:38:44 PM
-- Design Name: 
-- Module Name: TB_AU_7_Seg - Behavioral
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

entity TB_AU_7_Seg is
--  Port ( );
end TB_AU_7_Seg;

architecture Behavioral of TB_AU_7_Seg is
component AU_7_seg
    Port (
      A : in STD_LOGIC_VECTOR (3 downto 0);
      RegSel : in STD_LOGIC;
      Clk : in STD_LOGIC;
      S_LED : out STD_LOGIC_VECTOR (3 downto 0);
      S_7Seg: out STD_LOGIC_VECTOR (6 downto 0);
      Zero : out STD_LOGIC;
      Carry : out STD_LOGIC
    );
end component;
  
signal A : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RegSel : STD_LOGIC := '0';
signal Clk : STD_LOGIC := '0';

signal S_LED : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Zero : STD_LOGIC;
signal Carry : STD_LOGIC;
    

begin
-- Instantiate the DUT
  uut: AU_7_seg port map (
    A => A,
    RegSel => RegSel,
    Clk => Clk,
    S_LED => S_LED,
    S_7Seg => S_7Seg,
    Zero => Zero,
    Carry => Carry
  );
  
  process begin
  Clk <= not (Clk);
  wait for 2ns;
  end process;
  
  process begin
  A<="1111";
  wait for 100 ns;
  RegSel<='1';
  A<="0001";
  wait for 80 ns;
  end process;

end Behavioral;
