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

--set up states
type FSM_States is (green1_red2, yellow1_red2, red1_green2, red1_yellow2);
signal current_state, next_state: FSM_States; 
begin
process(clk)
begin
	
	--set up timer 
	if(rising_edge(clk)) then
		if (reset = '1' or counter = "100") then
			counter <= "000";	
		else
			counter <= counter + '1';
			current_state <= next_state;
		end if;
	end if;
end process;
	
	--set up outputs
process(current_state, next_state)
begin
	case current_state is 
	
	when green1_red2 =>
		
		--street 1
		red1_enable <= '0';
		yellow1_enable <= '0';
		green1_enable <= '1';
		
		--street 2
		red2_enable <= '1';
		yellow2_enable <= '0';
		green2_enable <= '0';
		
		next_state <= yellow1_red2;
	when yellow1_red2 =>
	
	--street 1
		red1_enable <= '0';
		yellow1_enable <= '1';
		green1_enable <= '0';
		
		--street 2
		red2_enable <= '1';
		yellow2_enable <= '0';
		green2_enable <= '0';
	
		next_state <= red1_green2;
	when red1_green2 =>
	
	--street 1
		red1_enable <= '1';
		yellow1_enable <= '0';
		green1_enable <= '0';
		
		--street 2
		red2_enable <= '0';
		yellow2_enable <= '0';
		green2_enable <= '1';
		
		next_state <= red1_yellow2;
	when red1_yellow2 =>	
	
	--street 1
		red1_enable <= '1';
		yellow1_enable <= '0';
		green1_enable <= '0';
		
		--street 2
		red2_enable <= '0';
		yellow2_enable <= '1';
		green2_enable <= '0';
		
		next_state <= green1_red2;
	when others => next_state <= green1_red2;
end case;
end process;		
	--set up walk
--	if (walk = '1') then
--	counter <= "000";
--	end if;
--	
	--set up delay
end Behavioral;
