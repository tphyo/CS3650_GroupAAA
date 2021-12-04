LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY programcounter IS
	PORT (
		programCounterIn   : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		programCounterOut  : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END programcounter;
ARCHITECTURE Behavioral OF programcounter IS
BEGIN
	programCounterOut <= programCounterIn;
	programCounterOut <= std_logic_vector(to_unsigned(progamCounterIn * 4, 32));
END Behavioral;
