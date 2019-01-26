----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:11:20 12/30/2018 
-- Design Name: 
-- Module Name:    PCPlus - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCPlus is
    Port ( PCCurr : in  STD_LOGIC_VECTOR (31 downto 0);
           PCP4 : out  STD_LOGIC_VECTOR (31 downto 0));
end PCPlus;

architecture Behavioral of PCPlus is
begin
PCP4<=PCCurr+"00000000000000000000000000000100";
end Behavioral;

