--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:01:29 05/04/2018
-- Design Name:   
-- Module Name:   F:/fpgaProject/sinwave/sinwave_test.vhd
-- Project Name:  sin_wave
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sin_wave
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
 
ENTITY sinwave_test IS
END sinwave_test;
 
ARCHITECTURE behavior OF sinwave_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sin_wave
    PORT(
         sel : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         d_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal d_out : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sinwave PORT MAP (
          sel => sel,
          clk => clk,
          d_out => d_out
        );

   
 clk <= not clk after 10ns;
 sel<="00"  after 0 ms , "01" after 3 ms , "10" after 8 ms , "11" after 17 ms , "00" after 26 ms ;

END;
