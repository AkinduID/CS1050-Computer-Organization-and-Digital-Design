library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder is
    port (
    Instruction : in std_logic_vector(11 downto 0); --inbus
    Reg_Chk_Jmp : in std_logic_vector(3 downto 0);  --jmp reg val
    
    Mux_A : out std_logic_vector(2 downto 0);  
    Mux_B : out std_logic_vector(2 downto 0);
    Add_Sub_Select_out : out std_logic; --as select
    
    Jmp_Flag : out std_logic;
    Jmp_Address : out std_logic_vector(2 downto 0);
    
    
    Immediate : out std_logic_vector(3 downto 0);
    Load_Select : out std_logic;
    
    Opcode_ID_Output : out STD_LOGIC_VECTOR(1 downto 0);
    
    Reg_En : out std_logic_vector(2 downto 0)
    
);
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4 port (
I : in std_logic_vector(1 downto 0);
En : in std_logic;
Y : out std_logic_vector(3 downto 0)   );
end component;

SIGNAL ADD_EN,NEG_EN,MOV_EN,JNZ_EN : std_logic;

signal Opcode_ID  : std_logic_vector(1 downto 0);
signal Reg_A,Reg_B : std_logic_vector(2 downto 0);
signal Input_Val : std_logic_vector(3 downto 0);
signal Jmp_Val: std_logic_vector(2 downto 0);
signal Jmp_Chk : STD_LOGIC;

begin

Opcode_ID <= Instruction(11 downto 10);  -- 2 bit type of operation
Reg_A <= Instruction (9 downto 7);    -- 3 bit Register A address
Reg_B <= Instruction(6 downto 4);     -- 3 bit Register B Address
Input_Val <= Instruction(3 downto 0);     -- 4 bit Value to be stored in Register
Jmp_Val <= Instruction(2 downto 0);   -- 3 bit Value to jump

Decoder_0 : Decoder_2_to_4 port map (
I => Opcode_ID,
En => '1',
Y(0) => ADD_EN,
Y(1) => NEG_EN,
Y(2) => MOV_EN,
Y(3) => JNZ_EN      );

Reg_En <= Reg_A;

Load_Select <= (not (MOV_EN) OR NEG_EN OR ADD_EN);

Immediate <= Input_Val;

MUX_A(0) <= ADD_EN AND Reg_A(0);
MUX_A(1) <= ADD_EN AND Reg_A(1);
MUX_A(2) <= ADD_EN AND Reg_A(2);

MUX_B(0) <= (ADD_EN and Reg_B(0)) or (NEG_EN and Reg_A(0));
MUX_B(1) <= (ADD_EN and Reg_B(1)) or (NEG_EN and Reg_A(1));
MUX_B(2) <= (ADD_EN and Reg_B(2)) or (NEG_EN and Reg_A(2));

Jmp_Chk <= not(Reg_Chk_Jmp(0)) and not(Reg_Chk_Jmp(1)) and not(Reg_Chk_Jmp(2)) and not (Reg_Chk_Jmp(3));

Add_Sub_Select_out <= NEG_EN;

Jmp_Flag <= not(Jmp_Chk and JNZ_EN);
jmp_Address <= Jmp_Val;

--Opcode_ID_Output <= Opcode_ID ;

end Behavioral;
