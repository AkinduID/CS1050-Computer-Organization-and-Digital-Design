----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2023 02:23:09 PM
-- Design Name: 
-- Module Name: Circuit2Sim - Behavioral
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

entity Circuit2Sim is
--  Port ( );
end Circuit2Sim;

architecture Behavioral of Circuit2Sim is
COMPONENT lab1
    PORT( A,B,C : IN STD_LOGIC;
GREEN,AMBER,RED : OUT STD_LOGIC);
END COMPONENT;
SIGNAL A,B,C           : std_logic;
SIGNAL GREEN,AMBER,RED : std_logic;
begin
UUT : lab1 PORT MAP(
        A => A,
        B => B,
        C =>C,
        GREEN => GREEN,
        AMBER => AMBER,
        RED => RED
);

process
begin
         A <= '0';
         B <= '0';
         C <= '0';
         
         WAIT FOR 100 ns; 
         C <='1';
         
         WAIT FOR 100 ns;
         B <= '1';
         C <= '0';
         
         WAIT FOR 100 ns;
         C <= '1';
         
         WAIT FOR 100 ns;
         A <= '1';
         B <= '0';
         C <= '0';
         
         WAIT FOR 100 ns;
         C <= '1';
         
         WAIT FOR 100 ns;
         B <= '1';
         C <= '0';
         
         WAIT FOR 100 ns;
         C <= '1';
         
         WAIT;
      end process;
end Behavioral;
