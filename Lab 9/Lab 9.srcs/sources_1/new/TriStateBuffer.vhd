----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 07:06:14 AM
-- Design Name: 
-- Module Name: TriStateBuffer - Behavioral
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

entity TriStateBuffer is
    Port (
        Data: in STD_LOGIC;
        En: in STD_LOGIC;
        Output: out STD_LOGIC
    );
end TriStateBuffer;

architecture Behavioral of TriStateBuffer is
begin
    process(Data, En)
    begin
        if En = '1' then
            Output <= Data;
        else
            Output <= 'Z';
        end if;
    end process;
end Behavioral;