----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 06:56:51 AM
-- Design Name: 
-- Module Name: Mux_2_to_1_4Bit - Behavioral
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

entity Mux_2_to_1_4bit is
    Port (
        Select_in  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(3 downto 0);  
        D1 : in STD_LOGIC_VECTOR(3 downto 0);  
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux_2_to_1_4bit;

architecture Behavioral of Mux_2_to_1_4bit is
begin
Y <= D0 when Select_in ='0' else D1;
end Behavioral;
