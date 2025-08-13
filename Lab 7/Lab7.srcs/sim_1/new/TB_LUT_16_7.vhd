----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 10:09:24 PM
-- Design Name: 
-- Module Name: TB_LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_LUT_16_7 is
--  Port ( );
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is
component LUT_16_7 is Port 
(address : in STD_LOGIC_VECTOR (3 downto 0);
data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal address0:std_logic_vector(3 downto 0);
signal data0:std_logic_vector(6 downto 0);

begin
UUT:LUT_16_7 PORT MAP(
address => address0,
data => data0);
process
    begin
        for i in 0 to 15 loop
            address0 <= std_logic_vector(to_unsigned(i, address0'length));
            wait for 60 ns;
        end loop;
        wait;
    end process;

end Behavioral;
