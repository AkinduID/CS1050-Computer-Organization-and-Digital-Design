----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 10:04:20 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity Add_Subtract_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in std_logic;
                     
           ASOutput_out  : out STD_LOGIC_VECTOR (3 downto 0);           
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end Add_Subtract_4bit;

architecture Behavioral of Add_Subtract_4bit is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);

end component;

signal C1, C2, C3, X0, X1, X2, X3 : STD_LOGIC;


begin

FA0 : FA
    PORT MAP(
    C_in => Ctrl ,
    A => A(0),
    B => X0,
    C_out => C1
    );

FA1 : FA
    PORT MAP(
    C_in => C1,
    A => A(1),
    B => X1,
    C_out => C2
    );

FA2 : FA
    PORT MAP(
    C_in => C2,
    A => A(2),
    B => X2,
    C_out => C3
    );

FA3 : FA
    PORT MAP(
    C_in => C3,
    A => A(3),
    B => X3,
    C_out => Overflow );

X0 <= B(0) XOR Ctrl;
X1 <= B(1) XOR Ctrl;
X2 <= B(2) XOR Ctrl;
X3 <= B(3) XOR Ctrl;

ASOutput_out(0) <= X0 XOR A(0) XOR Ctrl;
ASOutput_out(1) <= X1 XOR A(1) XOR C1;
ASOutput_out(2) <= X2 XOR A(2) XOR C2;
ASOutput_out(3) <= X3 XOR A(3) XOR C3;

Zero <=not((X0 XOR A(0) XOR Ctrl) or
           (X1 XOR A(1) XOR C1) or
           (X2 XOR A(2) XOR C2) or
           (X3 XOR A(3) XOR C3));



end Behavioral;
