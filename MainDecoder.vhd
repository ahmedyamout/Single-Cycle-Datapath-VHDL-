----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:53:26 12/30/2018 
-- Design Name: 
-- Module Name:    MainDecoder - Behavioral 
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

entity MainDecoder is
    Port ( ORI : out std_logic;
			  BNE : out std_logic;
			  Jump : out std_logic;
			  clk : in std_logic;
			  Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           Mem2Reg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0));
end MainDecoder;

architecture Behavioral of MainDecoder is
begin
process(Opcode)
begin
if(Opcode = "000000") then
	RegWrite<= '1';
	RegDst<= '1';
	ALUSrc<= '0';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="10";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "100011") then
	RegWrite<= '1';
	RegDst<= '0';
	ALUSrc<= '1';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "101011") then
	RegWrite<= '0';
	RegDst<= '0';
	ALUSrc<= '1';
	Branch<='0';
	MemWrite<='1';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "000100") then
	RegWrite<= '0';
	RegDst<= '0';
	ALUSrc<= '0';
	Branch<='1';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="01";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "001000") then
	RegWrite<='1';
	RegDst<='0';
	ALUSrc<='1';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "000010") then
	RegWrite<='0';
	RegDst<='0';
	ALUSrc<='0';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "001101") then
	RegWrite<='1';
	RegDst<='0';
	ALUSrc<='1';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="11";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "000101")then
	RegWrite<='0';
	RegDst<='0';
	ALUSrc<='0';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="01";
	Jump<='0';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "000010")then
	RegWrite<='0';
	RegDst<='0';
	ALUSrc<='0';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='1';
	BNE<='0';
	ORI <='0';
elsif (Opcode = "000101")then
	RegWrite<='0';
	RegDst<='0';
	ALUSrc<='0';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="00";
	Jump<='1';
	BNE<='1';
	ORI <='0';
elsif (Opcode = "001101")then
	RegWrite<='1';
	RegDst<='0';
	ALUSrc<='1';
	Branch<='0';
	MemWrite<='0';
	Mem2Reg<='0';
	ALUOp<="11";
	Jump<='0';
	BNE<='0';
	ORI <='1';
end if;
end process;
end Behavioral;

