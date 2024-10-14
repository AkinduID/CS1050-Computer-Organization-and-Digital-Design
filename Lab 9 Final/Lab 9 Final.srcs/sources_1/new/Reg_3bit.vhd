----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 11:44:14 PM
-- Design Name: 
-- Module Name: Reg_3bit - Behavioral
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

entity Reg_3bit is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0):="000";
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0):="000");
end Reg_3bit;

architecture Behavioral of Reg_3bit is

begin

process(Clk) begin
if(rising_edge(Clk)) then
    if(Res ='1') then
        Q <= "000";
    else
        Q <= D;
    end if;
end if;
end process;

end Behavioral;
