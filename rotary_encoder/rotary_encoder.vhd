LIBRARY ieee ;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY rotary_encoder IS

    PORT		(rot_a, rot_b				: in STD_LOGIC;
				 lout2, lout1, lout0		: out STD_LOGIC_VECTOR (6 downto 0));
				 
END rotary_encoder;

ARCHITECTURE logic OF rotary_encoder IS
	
	SIGNAL aprev	:	STD_LOGIC						  := rot_a;
	SIGNAL counter :	STD_LOGIC_VECTOR (9 DOWNTO 0):= "0000000000";
	SIGNAL bcd0		:	STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
	SIGNAL bcd1		:	STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
	SIGNAL bcd2		:	STD_LOGIC_VECTOR (3 DOWNTO 0):= "0000";
	
BEGIN
	PROCESS (rot_a, rot_b)
	variable Z		:	STD_LOGIC_VECTOR (21 DOWNTO 0);
   BEGIN
		--memastikan nilai z kembali 0
		FOR i in 0 to 21 LOOP
			Z(i) := '0';
		END LOOP;
		--rotary encoder
		IF (rot_a /= aprev) THEN
			IF (rot_b /= rot_a) THEN
				IF (counter < "1111100111") THEN
					counter <= counter + 1;
				ELSE
					counter <= "0000000000";
				END IF;
			ELSIF (rot_b = rot_a) THEN
				IF (counter > "0000000000") THEN
					counter <= counter - 1;
				ELSE
					counter <= "1111100111";
				END IF;
			END IF;
		END IF;
		aprev <= rot_a;
		--convert ke bcd
		Z(12 DOWNTO 3) := counter;
		FOR i IN 0 TO 6 LOOP
			IF Z(13 DOWNTO 10) > "0100" THEN
				Z(13 DOWNTO 10) := Z(13 DOWNTO 10) + "0011";
			END IF;
			IF Z(17 DOWNTO 14) > "0100" THEN
				Z(17 DOWNTO 14) := Z(17 DOWNTO 14) + "0011";
			END IF;
			Z(21 DOWNTO 1) := Z(20 DOWNTO 0);
		END LOOP;
		
		bcd0 <= Z(13 DOWNTO 10);
		bcd1 <= Z(17 DOWNTO 14);
		bcd2 <= Z(21 DOWNTO 18);
	END PROCESS;
	
	--seven segment
	lout0 <= "0000001" when bcd0 = "0000" else
				"1001111" when bcd0 = "0001" else
				"0010010" when bcd0 = "0010" else
				"0000110" when bcd0 = "0011" else
				"1001100" when bcd0 = "0100" else
				"0100100" when bcd0 = "0101" else
				"0100000" when bcd0 = "0110" else
				"0001111" when bcd0 = "0111" else
				"0000000" when bcd0 = "1000" else
				"0000100" when bcd0 = "1001" else
				"0110000";
					
	lout1 <= "0000001" when bcd1 = "0000" else
				"1001111" when bcd1 = "0001" else
				"0010010" when bcd1 = "0010" else
				"0000110" when bcd1 = "0011" else
				"1001100" when bcd1 = "0100" else
				"0100100" when bcd1 = "0101" else
				"0100000" when bcd1 = "0110" else
				"0001111" when bcd1 = "0111" else
				"0000000" when bcd1 = "1000" else
				"0000100" when bcd1 = "1001" else
				"0110000";
				
	lout2 <= "0000001" when bcd2 = "0000" else
				"1001111" when bcd2 = "0001" else
				"0010010" when bcd2 = "0010" else
				"0000110" when bcd2 = "0011" else
				"1001100" when bcd2 = "0100" else
				"0100100" when bcd2 = "0101" else
				"0100000" when bcd2 = "0110" else
				"0001111" when bcd2 = "0111" else
				"0000000" when bcd2 = "1000" else
				"0000100" when bcd2 = "1001" else
				"0110000";
END logic;