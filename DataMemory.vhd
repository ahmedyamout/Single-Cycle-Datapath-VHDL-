----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:13 01/23/2019 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMemory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           WD : in  STD_LOGIC_VECTOR (31 downto 0);
           RD : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           MemWrite : in  STD_LOGIC);
end DataMemory;

architecture Behavioral of DataMemory is
type D2 is array (0 to 63) of std_logic_vector(31 downto 0);
signal Mem: D2;
begin
process(WD,A,MemWrite)
begin
if(MemWrite = '1') then
	Mem(to_integer(unsigned(A(6 downto 2))))<= WD;
end if;
end process;
RD<= Mem(to_integer(unsigned(A(6 downto 2))));

end Behavioral;

