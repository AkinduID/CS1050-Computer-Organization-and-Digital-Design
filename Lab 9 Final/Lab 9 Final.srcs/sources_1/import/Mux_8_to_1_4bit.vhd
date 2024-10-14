----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 07:01:22 AM
-- Design Name: 
-- Module Name: Mux_8_to_1_4_Bit - Behavioral
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

entity Mux_8_to_1_4bit is
    Port (-- D : in STD_LOGIC_VECTOR (31 downto 0); 
           R0 : in STD_LOGIC_VECTOR(3 downto 0);          
           R1 : in STD_LOGIC_VECTOR(3 downto 0);          
           R2 : in STD_LOGIC_VECTOR(3 downto 0);          
           R3 : in STD_LOGIC_VECTOR(3 downto 0);          
           R4 : in STD_LOGIC_VECTOR(3 downto 0);          
           R5 : in STD_LOGIC_VECTOR(3 downto 0);          
           R6 : in STD_LOGIC_VECTOR(3 downto 0);          
           R7 : in STD_LOGIC_VECTOR(3 downto 0);          

           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_to_1_4bit;

architecture Behavioral of Mux_8_to_1_4bit is

SIGNAL DY: STD_LOGIC_VECTOR(7 downto 0);
begin   
Output <= R0 when Sel="000" else
     R1 when Sel="001" else
     R2 when Sel="010" else
     R3 when Sel="011" else
     R4 when Sel="100" else
     R5 when Sel="101" else
     R6 when Sel="110" else
     R7 when Sel="111" ;    
end Behavioral;