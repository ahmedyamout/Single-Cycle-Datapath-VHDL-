library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_CU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
			  clk: in std_logic;
			  OpCode : in std_logic_vector (2 downto 0);
			  Zflag : out std_logic;
			  --Cout : out std_logic:='0';
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU_CU;
architecture Behavioral of ALU_CU is
type D2 is array (0 to 8) of std_logic_vector(31 downto 0);
component OR32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component AND32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SLT32 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component AddSub32 is
   port( OP: in std_logic:='0';
          A  : in std_logic_vector(31 downto 0);
			 B  : in std_logic_vector(31 downto 0);
          Sum  : out std_logic_vector(31 downto 0);
          Cout: out std_logic);
end component;
signal Results : D2;
signal C_s : std_logic_vector (1 downto 0);
signal BN : std_logic_vector(31 downto 0);
signal buff : std_logic_vector(31 downto 0);
begin
process(OpCode,A,B,clk)
begin
	if(OpCode="000") then
		Output<= Results(0);
		Results(8)<=Results(0);
	elsif (OpCode = "001") then
		Output<= Results(1);
		Results(8)<=Results(1);
	elsif (OpCode ="010") then
		Output<= Results(2);
		Results(8)<=Results(2);
		--Cout<= C_s(0);
	elsif (OpCode = "011") then
		Results(3)<="00000000000000000000000000000000";
		Output<= Results(3);
		Results(8)<=Results(3);
	elsif (OpCode = "100") then
		Output<= Results(4);
		Results(8)<=Results(4);
	elsif (OpCode = "101") then
		Output<= Results(5);
		Results(8)<=Results(5);
	elsif (OpCode = "110") then
		Output<= Results(6);
		Results(8)<=Results(6);
		--Cout<= C_s(1);
	elsif (OpCode = "111") then
		Output<= Results(7);
		Results(8)<=Results(7);
	end if;
end process;
BN<= not B;
Zflag<= '1' when (Results(8) = "00000000000000000000000000000000") else '0';
S000:AND32 port map(A, B, Results(0));
S001:OR32  port map(A, B, Results(1));
S010:AddSub32 port map('0', A, B,Results(2), C_s(0));
S100:AND32 port map(A, BN, Results(4));
S101:OR32  port map(A, BN, Results(5));
S110:AddSub32 port map('1', A, B, Results(6), C_s(1));
S111:SLT32 port map(A, B, Results(7));
end Behavioral;

