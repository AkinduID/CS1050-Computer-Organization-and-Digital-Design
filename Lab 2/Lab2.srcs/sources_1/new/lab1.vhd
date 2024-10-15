----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2023 02:14:34 PM
-- Design Name: 
-- Module Name: lab1 - Behavioral
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

entity lab1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           RED : out STD_LOGIC;
           AMBER : out STD_LOGIC;
           GREEN : out STD_LOGIC);
end lab1;

architecture Behavioral of lab1 is
signal A_AND_B_out : std_logic;
signal B_AND_C_out : std_logic;
signal A_AND_C_out : std_logic;
begin
A_AND_B_out <= A and B;
B_AND_C_out <= C and B;
A_AND_C_out <= A and C;
GREEN <= A_AND_B_out and C;

AMBER <= (B_AND_C_out and not A) OR (A_AND_B_out and not C) OR (A_AND_C_out and not B);

RED <= (not A and not B) OR (not A and not C) OR (not B and not C);

end Behavioral;
