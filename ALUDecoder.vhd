----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:38:16 12/30/2018 
-- Design Name: 
-- Module Name:    ALUDecoder - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUDecoder is
    Port ( clk : in std_logic;
			  Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUControl : out  STD_LOGIC_VECTOR (2 downto 0));
end ALUDecoder;

architecture Behavioral of ALUDecoder is
begin
process(ALUOp,Funct)
begin
if (ALUOp = "00") then 
	ALUControl<= "010";
elsif (ALUOp = "01") then
	ALUControl<="110";
elsif (ALUOp = "10") then
	if (Funct = "100000") then
		ALUControl<="010";
	elsif (Funct = "100010") then
		ALUControl<="110";
	elsif (Funct = "100100") then
		ALUControl<="000";
	elsif (Funct = "100101") then
		ALUControl<="001";
	elsif (Funct = "101010") then
		ALUControl<="111";
	else
		ALUControl<="001";
	end if;
end if;
end process;
end Behavioral;

