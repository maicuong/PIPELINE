library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PARSER is
		port(clk, rst : in std_logic;
			Fail, match : out std_logic);
end PARSER;

architecture Behavioral of PARSER is

	component VM
		port(clk,rst : in std_logic;
		mem_d_in : in std_logic_vector(15 downto 0);
		read,write : out std_logic;
		S_fail, S_match : out std_logic;
		addr,mem_d_out : out std_logic_vector(15 downto 0));
	end component;
	
	component MEMORY
		port (read, write : in std_logic;
				addr : in std_logic_vector(15 downto 0);
				data : inout std_logic_vector(15 downto 0));
	end component;

	signal mem_d_in : std_logic_vector(15 downto 0);
	signal read,write : std_logic;
	signal addr,mem_d_out : std_logic_vector(15 downto 0);
	
	--- MEMORY
	signal data : std_logic_vector(15 downto 0);

begin
	
	VM1 : VM port map(clk, rst, mem_d_in, read, write, Fail, match , addr, mem_d_out);
	MEMORY1 : MEMORY port map(read, write, addr, mem_d_in);


end Behavioral;

