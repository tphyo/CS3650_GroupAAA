LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity ALU_Ctrl is
port(
  Ctrl: out std_logic_vector(2 downto 0);
  Op : in std_logic_vector(1 downto 0);
  Funct : in std_logic_vector(5 downto 0)
);
end ALU_Ctrl;

architecture Behavioral of ALU_Ctrl is
begin
process(Op,Funct)
begin
if Op = "00" => 
  Ctrl <= "010";
elsif Op = "01" => 
  Ctrl <= "110";
else
  if Funct = "100000" => 
    Ctrl <= "010";
elsif Funct = "100010" => 
  Ctrl <= "110";
elsif Funct = "100100" => 
  Ctrl <= "000";
elsif Funct = "100101" => 
  Ctrl <= "001";
elsif Funct = "101010" => 
  Ctrl <= "111";
else
  Ctrl <= "000";
end if;
  end if;
end process;
end Behavioral;
