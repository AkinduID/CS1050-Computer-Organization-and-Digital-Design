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

entity Mux_8_to_1_4_Bit is
    Port (
        S  : in STD_LOGIC_VECTOR(2 downto 0);
        D  : in STD_LOGIC_VECTOR(31 downto 0);
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux_8_to_1_4_Bit;

architecture Behavioral of Mux_8_to_1_4_Bit is
    component Mux_8_to_1 is
        Port (
            S  : in STD_LOGIC_VECTOR(2 downto 0);
            D  : in STD_LOGIC_VECTOR(7 downto 0);
            EN : in STD_LOGIC;
            Y  : out STD_LOGIC
        );
    end component;
    
    signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC;
    signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : STD_LOGIC;
    
begin
    Mux_0 : Mux_8_to_1
        port map (
            S => S,
            D => D(7 downto 0),
            EN => '1',
            Y => Y0
        );
        
    Mux_1 : Mux_8_to_1
        port map (
            S => S,
            D => D(15 downto 8),
            EN => '1',
            Y => Y1
        );
        
    Mux_2 : Mux_8_to_1
        port map (
            S => S,
            D => D(23 downto 16),
            EN => '1',
            Y => Y2
        );
        
    Mux_3 : Mux_8_to_1
        port map (
            S => S,
            D => D(31 downto 24),
            EN => '1',
            Y => Y3
        );
        
    Y <= Y3 & Y2 & Y1 & Y0;
    
end Behavioral;