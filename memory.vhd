--name = Thet Hlaing Phyo, Ly Hoang Rivera, Daniel Gruhn
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instruction_Memory is
port (
   MemR: in std_logic; --memory read: 1(read) or 0(cannot read)
   Clk: in std_logic; --clock counter
   Addr: in std_logic_vector(4 downto 0);
   Dout: out std_logic_vector(7 downto 0)
);
end Instruction_Memory;

architecture Behavior of Instruction_Memory is

--this memory has 16 locations. Each location is 1 byte
--the memory contains 4 instructions (1 instruction = 4 bytes)
type sram_type is array(0 to 31) of std_logic_vector(7 downto 0);
--memory's content
constant sram_data: sram_type:=(
--add $t0,$s0,$s1
"00000010", "00010001", "01000000", "00100000",
--addi $t1,$t0,8
"00100001", "00001001", "00000000", "00001000",
--sub $t2,$t1,$s1
"00000001", "00110001", "01010000", "00100010",
--sll $t3, $t2, 2
"00000000", "00001010", "01011000", "10000000",
"00000000", "00000000", "00000000", "00000000",
"00000000", "00000000", "00000000", "00000000",
"00000000", "00000000", "00000000", "00000000",
"00000000", "00000000", "00000000", "00000000"

);
begin
process(Clk)
begin
      if(rising_edge(clk)) then
	 if(MemR = '1') then
      		Dout <= sram_data(to_integer(unsigned(Addr))); --copy data from that address to Dout if the conditions are satisfied
	 end if;
      end if;
end process;
end Behavior;
