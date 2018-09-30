----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:44 04/26/2018 
-- Design Name: 
-- Module Name:    sin_wave - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sinwave is
    Port (sel : in  std_logic_vector(1 downto 0);
           clk : in  STD_LOGIC;
			  d_out : out  std_logic_vector(7 downto 0));
end sinwave;

architecture Behavioral of sinwave is
type memory is array(0 to 63) of std_logic_vector(7 downto 0);
signal ram:memory:=("10001100","10011000","10100100","10110000","10111011","11000110","11010000","11011001","11100010","11101001","11110000","11110101","11111001","11111100","11111110","11111111","11111110","11111100","11111001","11110101","11110000","11101001","11100010","11011001","11010000","11000110","10111011","10110000","10100100","10011000","10001100","10000000","01110100","01101000","01011100","01010000","01000101","00111010","00110000","00100111","00011110","00010111","00010000","00001011","00000111","00000100","00000010","00000001","00000010","00000100","00000111","00001011","00010000","00010111","00011110","00100111","00110000","00111010","01000101","01010000","01011100","01101000","01110100","10000000");	
signal i:integer range 0 to 63:=0;
signal count1:integer range 0 to 1562:=0;
signal count2:integer range 0 to 3124:=0;
signal count3:integer range 0 to 6249:=0;

begin
process(clk)
  begin
  if rising_edge(clk) then
     if sel="00" then
	     if count1=1562 then
		     d_out<=ram(i);
			  count1<=0;
			  i<=i+1;
			  if ( i = 63 ) then
						i <= 0;
			  end if;
		  else count1<=count1+1	;  
		  end if;
	 end if;	  
	 if sel="01" then
	     if count2=3124 then
		     d_out<=ram(i);
			  count2<=0;
			  i<=i+1;
			  if ( i = 63 ) then
						i <= 0;
			  end if;
		  else count2<=count2+1	;  
		  end if;
	 end if;	
    if sel="10" then
	     if count3=6240 then
		     d_out<=ram(i);
			  count3<=0;
			  i<=i+1;
			  if ( i = 63 ) then
						i <= 0;
			  end if;
		  else count3<=count3+1	;  
		  end if;
	 end if;	
    if sel="11" then
	        if count3=6249 then
		     d_out<='0' & (ram(i)(7 downto 1));
			  count3<=0;
			  i<=i+1;
			  if ( i = 63 ) then
						i <= 0;
			  end if;
		  else count3<=count3+1	;  
		  end if;
	 end if;	 	 
 end if;  
	  
end process;
end Behavioral;

