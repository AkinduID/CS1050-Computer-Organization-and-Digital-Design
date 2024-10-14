library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Bank_TB is
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is

    component Register_Bank is
        Port (
            RegEN : in std_logic_vector(0 downto 3);
            clk : in std_logic;
            input : in std_logic_vector(0 downto 3);
            out_0 : out std_logic_vector(0 downto 3);
            out_1 : out std_logic_vector(0 downto 3);
            out_2 : out std_logic_vector(0 downto 3);
            out_3 : out std_logic_vector(0 downto 3);
            out_4 : out std_logic_vector(0 downto 3);
            out_5 : out std_logic_vector(0 downto 3);
            out_6 : out std_logic_vector(0 downto 3);
            out_7 : out std_logic_vector(0 downto 3)
        );
    end component;

    signal clk : std_logic := '0';
    signal RegEN : std_logic_vector(0 downto 3) := (others => '0');
    signal input : std_logic_vector(0 downto 3) := "0000";
    signal out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7 : std_logic_vector(0 downto 3);

begin

    DUT: Register_Bank port map (
        RegEN => RegEN,
        clk => clk,
        input => input,
        out_0 => out_0,
        out_1 => out_1,
        out_2 => out_2,
        out_3 => out_3,
        out_4 => out_4,
        out_5 => out_5,
        out_6 => out_6,
        out_7 => out_7
    );

    clk_process: process
    begin
        while now <= 100 ns loop  -- Adjust the simulation time as needed
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process clk_process;

    stimulus_process: process
    begin
        -- Apply stimulus here, for example:
        -- Wait for initial stability
        wait for 10 ns;
        
        -- Set inputs
        input <= "1010";
        RegEN <= "0101";

        -- Wait for a few clock cycles
        wait for 20 ns;
        
        -- Change inputs
        input <= "1100";
        RegEN <= "0010";

        -- Wait for a few clock cycles
        wait for 20 ns;
        
        -- Change inputs
        input <= "0110";
        RegEN <= "1111";

        -- Wait for a few clock cycles
        wait for 20 ns;
        
        -- Add more stimulus if needed
        
        -- End simulation
        wait;
    end process stimulus_process;

end Behavioral;
