LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY MUX IS
	PORT (
		a, b  : IN std_logic_vector(32 DOWNTO 0); --input a, b
		s  : IN STD_logic; --control signal s

		y  : OUT STD_logic_vector(32 DOWNTO 0) --output y
	);
END MUX;
ARCHITECTURE Behavioral OF MUX IS
BEGIN
	--when s = 0, y is the same as a
	--when s = 1, y is the same as b
	y <= a WHEN s = '0' ELSE b;
END Behavioral;
