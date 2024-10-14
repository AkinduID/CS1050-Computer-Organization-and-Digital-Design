library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_3bit is
    Port (
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Count : out STD_LOGIC_VECTOR(2 downto 0)
    );
end PC_3bit;

architecture Behavioral of PC_3bit is
    component D_FF is
        Port (
            D : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qbar : out STD_LOGIC
        );
    end component;
    
    signal Q0, Q1, Q2 : STD_LOGIC;
    
begin
    FF0: D_FF 
    port map (D => '0',
     Res => Reset,
      Clk => Clock, 
      Q => Q0, 
      Qbar => open);
    
    FF1: D_FF 
    port map (D => Q0,
     Res => Reset, 
     Clk => Clock, 
     Q => Q1, 
     Qbar => open);
    
    FF2: D_FF 
    port map (D => Q1,
     Res => Reset, 
     Clk => Clock, 
     Q => Q2, 
     Qbar => open);
    
    Count <= Q2 & Q1 & Q0;
    
end Behavioral;
