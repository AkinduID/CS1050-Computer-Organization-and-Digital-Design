----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 03:13:06 PM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           inst0 : out STD_LOGIC_VECTOR(11 downto 0);
           instaddr : out STD_LOGIC_VECTOR(2 downto 0);
           NEXT_IA: out STD_LOGIC_VECTOR (2 downto 0);
           CURR_IA: out STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0)   );
end Nano_Processor;

architecture Behavioral of Nano_Processor is
--1
component Register_Bank port (
    EN : in STD_LOGIC;
    Res : in STD_LOGIC;
    RegEN:in std_logic_vector(2 downto 0);
    clk:in std_logic;
    RegInput:in std_logic_vector(3 downto 0);
    --Intermediate : out STD_LOGIC_VECTOR(7 downto 0);
    R0:out std_logic_vector(3 downto 0);
    R1:out std_logic_vector(3 downto 0);
    R2:out std_logic_vector(3 downto 0);
    R3:out std_logic_vector(3 downto 0);
    R4:out std_logic_vector(3 downto 0);
    R5:out std_logic_vector(3 downto 0);
    R6:out std_logic_vector(3 downto 0);
    R7:out std_logic_vector(3 downto 0)     );
end component;

component Instruction_Decoder is Port (
    Instruction : in std_logic_vector(11 downto 0); 
    Reg_Chk_Jmp : in std_logic_vector(3 downto 0);  
    
    Mux_A : out std_logic_vector(2 downto 0);
    Mux_B : out std_logic_vector(2 downto 0);
    Add_Sub_Select_out : out std_logic;
    
    Jmp_Flag : out std_logic;
    Jmp_Address : out std_logic_vector(2 downto 0);
    
    Immediate : out std_logic_vector(3 downto 0);
    Load_Select : out std_logic;
    
    Opcode_ID_Output : out STD_LOGIC_VECTOR(1 downto 0);
    
    Reg_En : out std_logic_vector(2 downto 0)       );
end component;

component Program_ROM is Port (  
    Mem_Select : in STD_LOGIC_VECTOR (2 downto 0);
    Instruction_Bus : out STD_LOGIC_VECTOR (11 downto 0)    );       
end component;


component Add_Subtract_4bit is Port ( 
    A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
    B : in STD_LOGIC_VECTOR (3 downto 0);
    Ctrl : in std_logic;
    ASOutput_out  : out STD_LOGIC_VECTOR (3 downto 0);           
    Zero : out STD_LOGIC;
    Overflow : out STD_LOGIC     );
end component;

component Mux_8_to_1_4bit is Port (
           R0 : in STD_LOGIC_VECTOR(3 downto 0);          
           R1 : in STD_LOGIC_VECTOR(3 downto 0);          
           R2 : in STD_LOGIC_VECTOR(3 downto 0);          
           R3 : in STD_LOGIC_VECTOR(3 downto 0);          
           R4 : in STD_LOGIC_VECTOR(3 downto 0);          
           R5 : in STD_LOGIC_VECTOR(3 downto 0);          
           R6 : in STD_LOGIC_VECTOR(3 downto 0);          
           R7 : in STD_LOGIC_VECTOR(3 downto 0);          
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0)   );
end component;

component Mux_2_to_1_4bit is Port (
    Select_in  : in STD_LOGIC;  
    D0 : in STD_LOGIC_VECTOR(3 downto 0);  
    D1 : in STD_LOGIC_VECTOR(3 downto 0);  
    Y  : out STD_LOGIC_VECTOR(3 downto 0)       );
end component;

component Mux_2_to_1_3bit is Port (
        S  : in STD_LOGIC;  
        D0 : in STD_LOGIC_VECTOR(2 downto 0);  
        D1 : in STD_LOGIC_VECTOR(2 downto 0);  
        Y  : out STD_LOGIC_VECTOR(2 downto 0)    );
end component ;

component Adder_3bit is Port ( 
     A : in STD_LOGIC_VECTOR (2 downto 0);
     EN : in STD_LOGIC;
     S : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

component Reg_3bit is Port ( 
           D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC
           --EN : in STD_LOGIC
           );
end component;

signal PI_NEXT_INST_ADDR: STD_LOGIC_VECTOR(2 downto 0):= "000";
--signal PI_CURR_INST_ADDR: STD_LOGIC_VECTOR(2 downto 0):= "000";
signal CURR_ADDED_INST_ADDR: STD_LOGIC_VECTOR(2 downto 0):= "000";
--signal CURR_INST: STD_LOGIC_VECTOR(11 downto 0):= "000000000000";

signal data_bus_0,data_bus_1,data_bus_2,data_bus_3,data_bus_4,data_bus_5,data_bus_6,data_bus_7: std_logic_vector(3 downto 0):="0000";

signal Mem_Select: STD_LOGIC_VECTOR (2 downto 0):="000";
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0):= "000000000000";

signal load_select_bus : std_logic:='0';
signal register_enable_bus : std_logic_vector(2 downto 0):="000";
signal register_input_bus : std_logic_vector(3 downto 0):="0000";
signal jmp_flag_bus:std_logic:='0';
signal jmp_address_bus:std_logic_vector(2 downto 0):="000";
signal immediate_val_bus : std_logic_vector(3 downto 0):="0000";

signal register_A_select_bus,register_B_select_bus : std_logic_vector(2 downto 0):="000";
signal add_sub_select_bus : std_logic:='0';

signal add_sub_out_bus :std_logic_vector(3 downto 0):="0000";


signal Mux_A_out_bus, Mux_B_out_bus : std_logic_vector(3 downto 0):="0000";

signal add_sub_unit_out_bus:std_logic_vector(3 downto 0):="0000";

--signal inter : std_logic_vector(7 downto 0);

signal pc_to_adder_3bit,adder_3_bit_to_2_1_Mux,Mux_2_1_to_pc : std_logic_vector(2 downto 0):="000";


begin

Reg_Bank : Register_Bank port map (
    EN => '1',
    Res => Reset,
    RegEN => register_enable_bus,
    clk => Clk,
    RegInput => register_input_bus,
    --Intermediate => inter,
    R0 => data_bus_0,
    R1 => data_bus_1,
    R2 => data_bus_2,
    R3 => data_bus_3,
    R4 => data_bus_4,
    R5 => data_bus_5,
    R6 => data_bus_6,
    R7 => data_bus_7    );    

Mux_A:Mux_8_to_1_4bit port map (
  Sel  => register_A_select_bus,
  Output  => Mux_A_out_bus,
             R0 => data_bus_0,         
             R1 => data_bus_1,          
             R2 => data_bus_2,          
             R3 => data_bus_3,           
             R4 => data_bus_4,           
             R5 => data_bus_5,           
             R6 => data_bus_6,           
             R7 => data_bus_7           );

Mux_B:Mux_8_to_1_4bit port map (
  Sel  => register_B_select_bus,
  Output  => Mux_B_out_bus,
             R0 => data_bus_0,         
             R1 => data_bus_1,          
             R2 => data_bus_2,          
             R3 => data_bus_3,           
             R4 => data_bus_4,           
             R5 => data_bus_5,           
             R6 => data_bus_6,           
             R7 => data_bus_7           );
    
Mux_2_to_1_4bit_0 : Mux_2_to_1_4bit Port map(
          Select_in  => load_select_bus,
          D0 =>  immediate_val_bus,
          D1 =>  add_sub_out_bus,
          Y  =>  register_input_bus   );


                  
InstructionDecoder : Instruction_Decoder port map (
    Instruction => Instruction_Bus,
    Reg_Chk_Jmp => Mux_A_out_bus,
    
    Mux_A => register_A_select_bus,
    Mux_B => register_B_select_bus,
    Add_Sub_Select_out => add_sub_select_bus,
    
    Jmp_Flag => jmp_flag_bus,
    Jmp_Address => jmp_address_bus,
    
    Immediate => immediate_val_bus,
    Load_Select => load_select_bus,
    
    Reg_En => register_enable_bus      );

Program_ROM_0 :Program_ROM port map (
    Mem_Select => Mem_Select,
    Instruction_Bus => Instruction_Bus  );
    
Add_Subtract_4bit_0 : Add_Subtract_4bit port map ( 
        A => Mux_A_out_bus,
        B => Mux_B_out_bus,
        Ctrl  => add_sub_select_bus,
        ASOutput_out => add_sub_out_bus,           
        Zero => Zero,
        Overflow =>  Overflow   );  
        
Adder_3bit_0 :Adder_3bit Port map( 
            A =>Mem_Select,
            EN =>'1',
            S =>adder_3_bit_to_2_1_Mux
            ); 
 
Mux_2_to_1_3bit_0: Mux_2_to_1_3bit port map(
            S  => jmp_flag_bus, 
            D0 => immediate_val_bus(2 downto 0) ,
            D1 =>adder_3_bit_to_2_1_Mux, 
            Y  => Mux_2_1_to_pc   );           
            
Program_Counter : Reg_3bit port map (
           D =>Mux_2_1_to_pc,
           Res =>Reset,
           Q =>Mem_Select,
           --EN =>'1',
           Clk=>Clk
              
           );

R0 <= data_bus_0;
R1 <= data_bus_1;
R2 <= data_bus_2;
R3 <= data_bus_3;
R4 <= data_bus_4;
R5 <= data_bus_5;
R6 <= data_bus_6;
R7 <= data_bus_7;

inst0 <=Instruction_Bus;
    
    --ZERO <= '0' when not (REG_BANK_R7 = "0000") or not(ZeroFlag0 = '1') else '1';
    --Z
instaddr <=Mem_Select;
    
NEXT_IA <= Mem_Select;
CURR_IA <= Mem_Select;

end Behavioral;
