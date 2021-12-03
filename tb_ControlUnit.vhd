--Group Member-Thet Hlaing Phyo, Ly Hoang Rivera, Daniel Gruhn
--HW5
library ieee;
use ieee.std_logic_1164.all;

entity tb_Controller is
end tb_Controller;

architecture behavior of tb_Controller is
	--inputs
	signal tb_OpCode: std_logic_vector(5 downto 0);
	--outputs
	signal tb_RegDst, tb_Jump, tb_Branch, tb_MemRead, tb_MemtoReg, tb_MemWrite, tb_ALUSrc, tb_RegWrite: std_logic;
	signal tb_ALUOp: std_logic_vector(1 downto 0);
begin
	Controller_Test: entity work.Controller
	port map(
		OpCode => tb_OpCode,
		RegDst => tb_RegDst,
		Jump => tb_Jump,
		Branch => tb_Branch,
		MemRead => tb_Memread,
		MemtoReg => tb_MemtoReg,
		MemWrite => tb_MemWrite,
		ALUSrc => tb_ALUSrc,
		RegWrite => tb_RegWrite,
		ALUOp => tb_ALUOp
	);
	stimulus: process
	begin
		-- Test instruction R-type
		tb_OpCode <= "000000";
		wait for 100 ps;
		-- Test instruction addi
		tb_OpCode <= "001000";
		wait for 100 ps;
		-- Test instruction LW
		tb_OpCode <= "100011";
		wait for 100 ps;
		-- Test instruction SW
		tb_OpCode <= "101011";
		wait for 100 ps;
		-- Test instruction Branch equal
		tb_OpCode <= "000100";
		wait for 100 ps;
		-- Test instruction Branch not equal
		tb_OpCode <= "000101";
		wait for 100 ps;
		-- Test instruction Branch less than or equal to zero
		tb_OpCode <= "000110";
		wait for 100 ps;
		-- Test instruction Jump
		tb_OpCode <= "000010";
		wait for 100 ps;
		-- Test unknown instruction
		tb_OpCode <= "000001";
		wait for 100 ps;
	end process;
end;
