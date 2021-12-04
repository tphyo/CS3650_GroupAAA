LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		aluControl : IN STD_LOGIC_VECTOR (2 DOWNTO 0);

		result : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		zero : OUT STD_LOGIC
	);
END ALU;

ARCHITECTURE Behavioral OF ALU IS
	SIGNAL resultX : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN
	PROCESS (a, b, aluControl)
	BEGIN
		CASE aluControl IS
			-- Bitwise and
			WHEN "000" => resultX <= a AND b;
			-- Bitwise or
			WHEN "001" => resultX <= a OR b;
			-- addition
			WHEN "010" => resultX <= std_logic_vector(unsigned(a) + unsigned(b));
			-- subtract
			WHEN "110" => resultX <= std_logic_vector(unsigned(a) - unsigned(b));
			-- set less than
			WHEN "111" =>
				IF (signed(a) < signed(b)) THEN
					resultX <= x"00000001";
				ELSE
					resultX <= x"00000000";
				END IF;
			-- Bitwise nor
			WHEN "100" => resultX <= a NOR b;
			WHEN others => NULL;
			resultX <= x"00000000";
		END CASE;
	END PROCESS;
	result <= resultX;
	zero <= '1' WHEN resultX = x"00000000" ELSE '0';
END Behavioral;
