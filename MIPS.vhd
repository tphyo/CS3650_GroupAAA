library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity processor is
port (
clk, reset, MemR	: in std_logic;
pc_out, alu_result: out std_logic_vector(31 downto 0)
);
end processor;

architecture Behavioral of processor is
begin
process(clk, reset)

variable PC, IR : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
--deal with itype first 

--if R type, load it into instruction
begin
instruction: ENTITY work.instruction_memory(Behavioral)
port map(
);

--Controller will control the data path
control: ENTITY work.Controller(Behavioral)
port map(
);

register_file: entity work.registerFile()
port map(
);

ALUControl: entity work.ALU_Ctrl()
port map(
);

alu: entity work.ALU()
port map(
);

data_ram: entity work.Data_RAM()
port map(
);

--Write Back
