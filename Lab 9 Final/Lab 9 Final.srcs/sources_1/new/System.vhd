----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 05:57:51 PM
-- Design Name: 
-- Module Name: System - Behavioral
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

entity System is
Port ( Clk : in STD_LOGIC;
       ResetPush : in STD_LOGIC;
           
       --realclk : out STD_LOGIC;
       Seg7 : out STD_LOGIC_VECTOR (6 downto 0);
       Reg7 : out STD_LOGIC_VECTOR(3 downto 0);
       Overflow : out STD_LOGIC;
       Anode : out STD_LOGIC_VECTOR(3 downto 0);
       Zero : out STD_LOGIC);
end System;

architecture Behavioral of System is

component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk is
 Port (Clk_in : in STD_LOGIC;
 Clk_out : out STD_LOGIC );
end component;

component Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0)   );
end component;

signal Reg7_data_bus : STD_LOGIC_VECTOR(3 downto 0);
signal Clk_out_bus : STD_LOGIC;
 
begin
LUT : LUT_16_7
port map(
    address => Reg7_data_bus,
    data =>  Seg7
);

Slow_Clock_0 : Slow_Clk
Port map ( Clk_in => Clk,
      Clk_out => Clk_out_bus);
      
processor:Nano_Processor 
        Port map 
         ( Clk => Clk_out_bus,
           Reset => ResetPush,
           Zero => Zero,
           Overflow => Overflow,
           R7 => Reg7_data_bus);

Reg7<= Reg7_data_bus;
Anode <= "1110";
end Behavioral;
