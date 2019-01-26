----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:27:02 12/30/2018 
-- Design Name: 
-- Module Name:    InstructionMemory - Behavioral 
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

entity InstructionMemory is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           RD : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type D2 is array (0 to 90) of std_logic_vector(31 downto 0);
signal Mem: D2;
begin
Mem(0)<="00100000000000100000000000000101";
Mem(4)<=x"2003000c";
Mem(8)<=x"2067fff7";
Mem(12)<=x"00e22025";
Mem(16)<=x"00642824";
Mem(20)<=x"00a42820";
Mem(24)<=x"10a7000a";
Mem(28)<=x"0064202a";
Mem(32)<=x"10800001";
Mem(36)<=x"20050000";
Mem(40)<=x"00e2202a";
Mem(44)<=x"00853820";
Mem(48)<=x"00e23822";
Mem(52)<=x"ac670044";
Mem(56)<=x"8c020050";
Mem(60)<=x"08000011";
Mem(64)<=x"20020001";
Mem(68)<=x"ac020054";

RD<= Mem(to_integer(unsigned(A)));
end Behavioral;

