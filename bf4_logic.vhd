-------------------------------------------------------------------------------
-- Lab Work 2 - Combinatorial Logic Implementations
-- Example 1: multiply output combinatorial circuit
--            using logic operators (2 variants)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity bf4_logic is
	port(
		X : in STD_LOGIC_VECTOR(3 downto 0);
		Y : out STD_LOGIC_VECTOR(3 downto 0)
	);
end bf4_logic;

architecture bf4_logic of bf4_logic is
	signal P : STD_LOGIC_VECTOR(13 downto 0); -- .p 14
begin
	-- Variant 1: equations built on default results of minimization
	P(0) <= not X(3) and X(2) and not X(1) and not X(0);	-- 0100
	P(1) <= X(3) and not X(2) and not X(1) and X(0);      	-- 1001
	P(2) <= X(3) and not X(2) and X(1) and not X(0);     	-- 1010
	P(3) <= X(3) and X(2) and not X(1) and X(0);     		-- 1101
	P(4) <= X(3) and X(2) and X(1) and not X(0);      		-- 1110
	P(5) <= X(2) and X(1) and X(0); 						-- -111
	P(6) <= not X(3) and X(2) and not X(0);     	 		-- 01-0
	P(7) <= not X(3) and not X(2) and X(1);      			-- 001-
	P(8) <= X(3) and not X(2) and not X(1) and not X(0);    -- 1000
	P(9) <= not X(3) and not X(1) and not X(0);      		-- 0-00
	P(10) <= X(3) and not X(2) and X(1) and X(0);           -- 1011
	P(11) <= not X(3) and X(1) and X(0);                  	-- 0-11
	P(12) <= not X(3) and not X(2) and not X(1) and X(0); 	-- 0001
	P(13) <= X(2) and not X(1) and not X(0); 				-- -100
	
	Y(3) <= P(1) or P(1) or P(3) or P(6) or P(11) or P(12);
	Y(2) <= P(1) or P(4) or P(3) or P(10) or P(11) or P(13);
	Y(1) <= P(0) or P(4) or P(7) or P(7) or P(8) or P(10) or P(12);
	Y(0) <= P(2) or P(5) or P(8) or P(10) or P(12) or P(11);

--	-- Variant 2: equations obtained with option "-o eqntott"
--	Y(3) = (X(3) and not X(2) and not X(1) and X(0)) or
--	       (X(3) and not X(2) and X(1) and not X(0)) or
--	       (X(3) and X(2) and not X(1) and X(0)) or
--	       (not X(3) and X(2) and not X(0)) or
--		   (not X(3) and X(1) and X(0)) or
--		   (not X(3) and not X(2) and not X(1) and X(0));
--	
--	Y(2) = (X(3) and not X(2) and not X(1) and X(0)) or
--	       (X(3) and X(2) and X(1) and not X(0)) or
--	       (not X(3) and not X(1) and not X(0)) or
--	       (X(3) and not X(2) and X(1) and X(0)) or
--	       (not X(3) and X(1) and X(0)) or
--		   (X(2) and not X(1) and not X(0));
--	
--	Y(1) = (not X(3) and X(2) and not X(1) and not X(0)) or
--	       (X(3) and X(2) and not X(1) and X(0)) or
--	       (X(3) and X(2) and X(1) and not X(0)) or
--	       (not X(3) and not X(2) and X(1)) or
--	       (X(3) and not X(2) and not X(1) and not X(0)) or
--		   (X(3) and not X(2) and X(1) and X(0)) or
--		   (not X(3) and not X(2) and not X(1) and X(0));
--	
--	Y(0) = (X(3) and not X(2) and X(1) and not X(0)) or
--	       (X(2) and X(1) and X(0)) or
--	       (X(3) and not X(2) and not X(1) and not X(0)) or
--	       (X(3) and not X(2) and X(1) and X(0)) or
--		   (not X(3) and not X(2) and not X(1) and X(0)) or
--		   (X(2) and not X(1) and not X(0));

end bf4_logic;
