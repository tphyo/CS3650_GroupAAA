--Group Member-Thet Hlaing Phyo, Ly Hoang Rivera, Daniel Gruhn
--HW5
library ieee;
use ieee.std_logic_1164.all;

entity Controller is
	port(
		OpCode	: in std_logic_vector(5 downto 0);
		RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite : out std_logic;
		ALUOp	: out std_logic_vector(1 downto 0)
	);
end Controller;

architecture Behavior of Controller is
begin
	process (OpCode)
		variable control_signals: std_logic_vector(9 downto 0);
		constant R_Type: std_logic_vector(5 downto 0) := "000000";
		constant Addi: std_logic_vector(5 downto 0) := "001000";
		constant LW: std_logic_vector(5 downto 0) := "100011";
		constant SW: std_logic_vector(5 downto 0) := "101011";
		constant BranchEqual: std_logic_vector(5 downto 0) := "000100";
		constant BranchNotEqual: std_logic_vector(5 downto 0) := "000101";
		constant BranchLessThanEqualZero: std_logic_vector(5 downto 0):= "000110";
		constant j: std_logic_vector(5 downto 0) := "000010";
 	begin
		regWrite <= '0';
		case opcode is 
			when R_Type => control_signals := "1000000110";
			when Addi => control_signals := "0000001100";
			when LW => control_signals := "0001101100";
			when SW => control_signals := "-000-11000";
			when BranchEqual => control_signals := "-010-00001";
			when BranchNotEqual => control_signals := "-010-00001";
			when BranchLessThanEqualZero => control_signals := "-010-00001";
			when j => control_signals := "-100-00011";	
			when others => null;
				control_signals := "0000000000";	
		end case;
	
	RegDst <= control_signals(9);
	Jump <= control_signals(8);
	Branch <= control_signals(7);
	MemRead <= control_signals(6);
	MemToReg <= control_signals(5);
	MemWrite <= control_signals(4);
	ALUSrc <= control_signals(3);
	RegWrite <= control_signals(2);
	ALUOp <= control_signals(1 downto 0);
	end process;
end Behavior;
