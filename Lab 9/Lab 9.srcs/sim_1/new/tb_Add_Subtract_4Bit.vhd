----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 06:18:10 AM
-- Design Name: 
-- Module Name: tb_Add_Subtract_4Bit - Behavioral
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

entity tb_Add_Subtract_4Bit is
end tb_Add_Subtract_4Bit;

architecture Behavioral of tb_Add_Subtract_4Bit is
    component Add_Subtract_4Bit
        Port (
            A0 : in STD_LOGIC;
            A1 : in STD_LOGIC;
            A2 : in STD_LOGIC;
            A3 : in STD_LOGIC;
            B0 : in STD_LOGIC;
            B1 : in STD_LOGIC;
            B2 : in STD_LOGIC;
            B3 : in STD_LOGIC;
            C_in : in STD_LOGIC;
            M : in STD_LOGIC;
            S0 : out STD_LOGIC;
            S1 : out STD_LOGIC;
            S2 : out STD_LOGIC;
            S3 : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    end component;
    
    signal A0_tb, A1_tb, A2_tb, A3_tb, B0_tb, B1_tb, B2_tb, B3_tb, C_in_tb, M_tb : STD_LOGIC;
    signal S0_tb, S1_tb, S2_tb, S3_tb, C_out_tb : STD_LOGIC;

begin
    uut : Add_Subtract_4Bit
        port map (
            A0 => A0_tb,
            A1 => A1_tb,
            A2 => A2_tb,
            A3 => A3_tb,
            B0 => B0_tb,
            B1 => B1_tb,
            B2 => B2_tb,
            B3 => B3_tb,
            C_in => C_in_tb,
            M => M_tb,
            S0 => S0_tb,
            S1 => S1_tb,
            S2 => S2_tb,
            S3 => S3_tb,
            C_out => C_out_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case : Addition
        A0_tb <= '0';
        A1_tb <= '1';
        A2_tb <= '0';
        A3_tb <= '1';
        B0_tb <= '1';
        B1_tb <= '1';
        B2_tb <= '0';
        B3_tb <= '0';
        C_in_tb <= '0';
        M_tb <= '0';
        wait for 200 ns;
 
        A0_tb <= '1';
        A1_tb <= '1';
        A2_tb <= '0';
        A3_tb <= '1';
        B0_tb <= '1';
        B1_tb <= '1';
        B2_tb <= '0';
        B3_tb <= '1';
        C_in_tb <= '0';
        M_tb <= '0';
        wait for 200 ns;       
        
        -- Test case : Subtraction
        A0_tb <= '0';
        A1_tb <= '1';
        A2_tb <= '0';
        A3_tb <= '1';
        B0_tb <= '1';
        B1_tb <= '1';
        B2_tb <= '0';
        B3_tb <= '0';
        C_in_tb <= '0';
        M_tb <= '1';
        wait for 200 ns;

        A0_tb <= '1';
        A1_tb <= '1';
        A2_tb <= '1';
        A3_tb <= '1';
        B0_tb <= '1';
        B1_tb <= '0';
        B2_tb <= '0';
        B3_tb <= '0';
        C_in_tb <= '0';
        M_tb <= '1';
        wait for 200 ns;
    
        
        wait;
    end process;

end Behavioral;

