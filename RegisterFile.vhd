library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity registerFile is
	port (
		readReg1 : in std_logic_vector (4 downto 0);
		readReg2 : in std_logic_vector (4 downto 0);
		writeReg : in std_logic_vector (4 downto 0);
		writeData: in std_logic_vector (31 downto 0);
		regWrite : in std_logic;

		readData1     : out std_logic_vector (31 downto 0);
		readData2     : out std_logic_vector (31 downto 0)
	);
END registerFile;
ARCHITECTURE Behavioral OF registerFile IS
	-- create type 2d array: 32 locations, each location has 32 bits
	TYPE reg_type IS ARRAY (0 to 31) OF std_logic_vector(31 downto 0);
	-- MIPs has 32 registers and each register has 32 bits
	SIGNAL reg_data : reg_type := (
		--RegName = RegNumber : Register's value in hexadecimal
		x"00000000", --$zero = 0 : 0
		x"00000001", --$at = 1 : 1
		x"00000002", --$v0 = 2 : 2
		x"00000003", --$v1 = 3 : 3
		x"00000004", --$a0 = 4 : 4
		x"00000005", --$a1 = 5 : 5
		x"00000006", --$a2 = 6 : 6
		x"00000007", --$a3 = 7 : 7
		x"00000008", --$t0 = 8 : 8
		x"00000009", --$t1 = 9 : 9
		x"0000000A", --$t2 = 10 : A
		x"0000000B", --$t3 = 11 : B
		x"0000000C", --$t4 = 12 : C
		x"0000000D", --$t5 = 13 : D
		x"0000000E", --$t6 = 14 : E
		x"0000000F", --$t7 = 15 : F
		x"00000010", --$s0 = 16 : 10
		x"00000011", --$s1 = 17 : 11
		x"00000012", --$s2 = 18 : 12
		x"00000013", --$s3 = 19 : 13
		x"00000014", --$s4 = 20 : 14
		x"00000015", --$s5 = 21 : 15
		x"00000016", --$s6 = 22 : 16
		x"00000017", --$s7 = 23 : 17
		x"00000018", --$t8 = 24 : 18
		x"00000019", --$t9 = 25 : 19
		x"0000001A", --$k0 = 26 : 1A
		x"0000001B", --$k1 = 27 : 1B
		x"0000001C", --$global pointer = 28 : 1C
		x"0000001D", --$stack pointer = 29 : 1D
		x"0000001E", --$frame pointer = 30 : 1E
		x"0000001F" --$return address = 31 : 1F
	);
BEGIN
	PROCESS (regWrite) -- regWrite is 1 bit input comes from the controller
			   -- if regWrite changes, do tasks below
	BEGIN
		-- writeRegister is the register which we want to write to
		-- writeData is the data which we dant to save
		IF (regWrite = '1') THEN
			reg_data(to_integer(unsigned(writeReg))) <= writeData;
		END IF;
	END PROCESS;
	readData1 <= reg_data(to_integer(unsigned(readReg1)));
	readData2 <= reg_data(to_integer(unsigned(readReg2)));
END Behavioral;
