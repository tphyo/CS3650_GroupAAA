LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
entity ALU_Ctrl is
port(
  Ctrl: out std_logic_vector(2 downto 0);
  Op : in std_logic_vector(1 downto 0);
  Funct : in std_logic_vector(2 downto 0)
);
end ALU_Ctrl;

architecture Behavioral of ALU_Ctrl is
begin
process(Op,Funct)
begin
case p is
when "00" => 
 Ctrl <= "010";
when "01" => 
 Ctrl <= "110";
when "10" =>
case Funct is 
when "100000" => 
 Ctrl <= "010";
when "100010" => 
 Ctrl <= "110";
when "100100" => 
 Ctrl <= "000";
when "100101" => 
 Ctrl <= "001";
when "101010" => 
 Ctrl <= "111";
end case;
when others =>
Ctrl <= "000";
end case;
end process;
end Behavioral;
