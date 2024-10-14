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

entity Add_Subtract_4Bit is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           M : in STD_LOGIC; --substract input
           
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Add_Subtract_4Bit;

architecture Behavioral of Add_Subtract_4Bit is

component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component; 
 
 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;
 SIGNAL B0_S ,B1_S,B2_S,B3_S : std_logic;

begin 
FA_0 : FA 
 port map ( 
 A => A0, 
 B => B0_S, 
 C_in => M, 
 S => S0, 
 C_Out => FA0_C); 
 
FA_1 : FA 
 port map ( 
 A => A1, 
 B => B1_S, 
 C_in => FA0_C, 
 S => S1, 
 C_Out => FA1_C); 
 
FA_2 : FA 
 port map ( 
 A => A2, 
 B => B2_S, 
 C_in => FA1_C, 
 S => S2, 
 C_Out => FA2_C); 
 
FA_3 : FA 
 port map ( 
 A => A3, 
 B => B3_S, 
 C_in => FA2_C, 
 S => S3, 
 C_Out => C_out); 
 
 
 B0_S <= B0 XOR M;
 B1_S <= B1 XOR M;
 B2_S <= B2 XOR M;
 B3_S <= B3 XOR M;
 

 
end Behavioral; 
