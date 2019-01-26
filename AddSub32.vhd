library ieee;
use ieee.std_logic_1164.all;
entity AddSub32 is
   port( OP: in std_logic:='0';
          A  : in std_logic_vector(31 downto 0):="00000000000000000000000011111111";
			 B  : in std_logic_vector(31 downto 0):="00000000000000000000000000111111";
          Sum  : out std_logic_vector(31 downto 0);
          Cout: out std_logic);
end AddSub32;

architecture struct of AddSub32 is
component Full_Adder is
  port( X, Y, Cin : in std_logic;
        sum, Cout : out std_logic);
end component;
signal C_s: std_logic_vector(31 downto 0);
signal TMP: std_logic_vector(31 downto 0);

begin
TMP <= B when(OP = '0') else not B;
FA0:Full_Adder port map(A(0),TMP(0),OP, Sum(0),C_s(0));
GEN_FA: 
   for I in 1 to 31 generate
      FA1:Full_Adder port map(A(I),TMP(I),C_s(I-1), Sum(I),C_s(I));
   end generate GEN_FA;
Cout <= C_s(31);
end struct;