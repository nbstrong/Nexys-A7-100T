----------------------------------------------------------------------------------
-- Company: Personal
-- Engineer: Nicholas Strong
--
-- Create Date: 11/25/2021 08:16:14 PM
-- Design Name: Nexys-A7-100T
-- Module Name: top - rtl
-- Project Name: Nexys-A7-100T
-- Target Devices: xc7a100tcsg324-1
-- Tool Versions: 2021.2
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
-- library UNISIM;
-- use UNISIM.VComponents.all;
-- use IEEE.NUMERIC_STD.ALL;

entity top is
    Port (
        sys_clock_0 : in    std_logic;
        reset_0     : in    std_logic
        );
end top;

architecture rtl of top is

    component microblaze_wrapper is
        port (
          sys_clock_0 : in STD_LOGIC;
          reset_0     : in STD_LOGIC
        );
        end component microblaze_wrapper;

begin

    microblaze_wrapper_0 : component microblaze_wrapper
    -- microblaze_wrapper_0 : entity microblaze_wrapper(structural)
        port map (
            sys_clock_0 => sys_clock_0,
            reset_0     => reset_0
        );

end rtl;