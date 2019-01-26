--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:10:03 01/24/2019
-- Design Name:   
-- Module Name:   C:/Windows/System32/SingleCycleDatapath/alt.vhd
-- Project Name:  SingleCycleDatapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_CU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alt IS
END alt;
 
ARCHITECTURE behavior OF alt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_CU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         OpCode : IN  std_logic_vector(2 downto 0);
         Zflag : OUT  std_logic;
         Output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
   signal B : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
   signal clk : std_logic := '0';
   signal OpCode : std_logic_vector(2 downto 0) := "000";

 	--Outputs
   signal Zflag : std_logic;
   signal Output : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_CU PORT MAP (
          A => A,
          B => B,
          clk => clk,
          OpCode => OpCode,
          Zflag => Zflag,
          Output => Output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
