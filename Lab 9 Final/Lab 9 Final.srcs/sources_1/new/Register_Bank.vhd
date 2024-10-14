----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:47:49 AM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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

entity Register_Bank is Port ( 
 EN : in STD_LOGIC;
 Res : in STD_LOGIC;
 RegEN:in std_logic_vector(2 downto 0);
 Clk:in std_logic;
 RegInput:in std_logic_vector(3 downto 0);
 Intermediate : out STD_LOGIC_VECTOR(7 downto 0);
 R0:out std_logic_vector(3 downto 0);
 R1:out std_logic_vector(3 downto 0);
 R2:out std_logic_vector(3 downto 0);
 R3:out std_logic_vector(3 downto 0);
 R4:out std_logic_vector(3 downto 0);
 R5:out std_logic_vector(3 downto 0);
 R6:out std_logic_vector(3 downto 0);
 R7:out std_logic_vector(3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg_4bit port(
D : in STD_LOGIC_VECTOR (3 downto 0);
Res : in STD_LOGIC;
En : in STD_LOGIC;
Clk : in STD_LOGIC;
Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 port(
I : in STD_LOGIC_VECTOR (2 downto 0);
EN : in STD_LOGIC;
Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal y:std_logic_vector(7 downto 0);

begin

R0<="0000";

Reg_0:Reg_4bit port map (
D=> RegInput,
En=> y(0),
Res => Res,
Clk => clk,
Q =>R0   );

Reg_1:Reg_4bit port map (
D=> RegInput,
En=> y(1),
Res => Res,
Clk => clk,
Q =>R1   );

Reg_2:Reg_4bit port map (
D=> RegInput,
En=> y(2),
Res => Res,
Clk => clk,
Q =>R2   );

Reg_3:Reg_4bit port map (
D=> RegInput,
En=> y(3),
Res => Res,
Clk => clk,
Q =>R3   );

Reg_4:Reg_4bit port map (
D=> RegInput,
En=> y(4),
Res => Res,
Clk => clk,
Q =>R4   );

Reg_5:Reg_4bit port map (
D=> RegInput,
En=> y(5),
Res => Res,
Clk => clk,
Q =>R5   );

Reg_6:Reg_4bit port map (
D=> RegInput,
En=> y(6),
Res => Res,
Clk => clk,
Q =>R6   );

Reg_7:Reg_4bit port map (
D=> RegInput,
En=> y(7),
Res => Res,
Clk => clk,
Q =>R7   );

Decoder_3_to_8_0:Decoder_3_to_8 port map (
I =>RegEn,
EN=>'1',
Y =>y   );

intermediate <= y;

end Behavioral;
