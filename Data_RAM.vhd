library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity Data_RAM is
port(
 add: in std_logic_vector(31 downto 0);
 in: in std_logic_vector(31 downto 0); 
 write: in std_logic; 
 clk: in std_logic; 
 read: out std_logic_vector(31 downto 0)
);
end Data_RAM;

architecture Behavioral of Data_RAM is
type RAM_ARRAY is array (0 to 15 ) of std_logic_vector (31 downto 0);
signal RAM: RAM_ARRAY;
begin
process(clk)
begin
 if(rising_edge(clk)) then
 if(write='1') then 
 RAM(to_integer(unsigned(add))) <= in;
 end if;
 read <= RAM(to_integer(unsigned(add)));
 end if;
end process; 
end Behavioral;
