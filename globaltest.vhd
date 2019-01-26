--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:02:25 01/24/2019
-- Design Name:   
-- Module Name:   C:/Windows/System32/SingleCycleDatapath/globaltest.vhd
-- Project Name:  SingleCycleDatapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SingleCycle
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
 
ENTITY globaltest IS
END globaltest;
 
ARCHITECTURE behavior OF globaltest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SingleCycle
    PORT(
         resetGlobal : IN  std_logic;
         clkGlobal : IN  std_logic;
         ResultGlobal : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal resetGlobal : std_logic := '1';
   signal clkGlobal : std_logic := '0';

 	--Outputs
   signal ResultGlobal : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkGlobal_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SingleCycle PORT MAP (
          resetGlobal => resetGlobal,
          clkGlobal => clkGlobal,
          ResultGlobal => ResultGlobal
        );

   -- Clock process definitions
   clkGlobal_process :process
   begin
		clkGlobal <= '0';
		wait for clkGlobal_period/2;
		clkGlobal <= '1';
		wait for clkGlobal_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 20 ns;	

      wait for clkGlobal_period*1;

      -- insert stimulus here 
		resetGlobal<= '0';

      wait;
   end process;

END;
