--name = Thet Hlaing Phyo, Ly Hoang Rivera, Daniel Gruhn
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_tb is
end memory_tb;

architecture arch of memory_tb is 
	COMPONENT Instruction_Memory
	PORT (
   		MemR: in std_logic; --memory read: 1(read) or 0(cannot read)
   		Clk: in std_logic; --clock counter
		Addr : in std_logic_vector (4 downto 0);
   		Dout: out std_logic_vector(7 downto 0)
	      );
	END COMPONENT;
	
	signal MemR : std_logic := '0';
	signal Clk : std_logic := '0';
	signal Addr : std_logic_vector (4 downto 0):= "00000";

	
	signal Dout : std_logic_vector(7 downto 0);
	signal IRout : std_logic_vector(31 downto 0);
	constant Clock_Period : time := 200 ps;
BEGIN
	uut: Instruction_Memory PORT MAP (
	memR => memR,
	Clk => Clk,
	Addr => Addr,
	Dout => Dout
	);
Clock_Process : process
begin
	Clk <= '1';
	wait for Clock_Period/2;
	Clk <= '0';
	wait for Clock_Period/2;
	end process;


stimulus: process
	variable PC, IR : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
	begin
        Addr <= PC(4 downto 0); --assign the least significant 5 bits of program counter to the ram address
	MemR <= '1';		     --set signal memR to high
        PC :=  std_logic_vector(unsigned(PC) + 1); --increment program counter by 1
        wait for Clock_Period;
        IR(31 downto 24) := dout; --copy data from dout to IR register using Big Indians


        Addr <= PC(4 downto 0);
        MemR <= '1';
        PC :=  std_logic_vector(unsigned(PC) + 1);
        wait for Clock_Period;
        IR(23 downto 16) := dout;


        Addr <= PC(4 downto 0);
        MemR <= '1';
        PC :=  std_logic_vector(unsigned(PC) + 1);
        wait for Clock_Period;
        IR(15 downto 8) := dout;


        Addr <= PC(4 downto 0);
        MemR <= '1';
        PC :=  std_logic_vector(unsigned(PC) + 1);
        wait for Clock_Period;
        IR(7 downto 0) := dout;

        IRout <= IR;
    end process stimulus;
END;
