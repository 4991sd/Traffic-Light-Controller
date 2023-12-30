library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity StreetLight is
    Port ( clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           Street1: out std_logic_vector(2 downto 0);
           Street2: out std_logic_vector(2 downto 0);
			  walk: in std_logic
			  );
end StreetLight;

architecture Behavioral of StreetLight is
signal counter: std_logic_vector(2 downto 0); 
signal red1_enable, yellow1_enable, green1_enable: std_logic:='0';
signal red2_enable, yellow2_enable, green2_enable: std_logic:='0';
begin
process(clk)
begin
	
	--set up timer 
	if(rising_edge(clk)) then
		if (reset = '1' or counter = "100") then
			counter <= "000";	
		else
			counter <= counter + '1';
		end if;
	end if;
	
	--set up outputs
	if (counter = "000") then
		green1_enable <= '1';
		red2_enable <= '1';
	elsif (counter = "001") then
		yellow1_enable <= '1';
		red2_enable <= '1';
	elsif (counter = "010") then
		red1_enable <= '1';
		green2_enable <= '1';
	elsif  (counter = "011") then
		red1_enable <= '1';
		yellow2_enable <= '1';
	end if;
	
	--set up walk
	if (walk = '1') then
	counter <= "000";
	end if;
	
	--set up delay
	
	end process;
end Behavioral;
