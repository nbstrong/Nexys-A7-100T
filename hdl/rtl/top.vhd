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
use IEEE.NUMERIC_STD.ALL;
-- library UNISIM;
-- use UNISIM.VComponents.all;
----------------------------------------------------------------------------------
entity top is
    Port (
        sys_clock_0 : in    std_logic;
        reset_0     : in    std_logic
        );
    end top;
----------------------------------------------------------------------------------
architecture rtl of top is
    -- CONSTANTS -----------------------------------------------------------------
    -- SIGNALS -------------------------------------------------------------------
    signal counter : unsigned(26 downto 0);
    -- ALIASES -------------------------------------------------------------------
    alias clk : std_logic is sys_clock_0;
    alias rst : std_logic is reset_0;
    -- ATTRIBUTES ----------------------------------------------------------------
    -- COMPONENTS ----------------------------------------------------------------
    component microblaze_wrapper is
        port (
          sys_clock_0 : in STD_LOGIC;
          reset_0     : in STD_LOGIC
        );
        end component microblaze_wrapper;
begin ----------------------------------------------------------------------------
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    microblaze_wrapper_0 : component microblaze_wrapper
    -- microblaze_wrapper_0 : entity microblaze_wrapper(structural) -- TODO: Make this work.
        port map (
            sys_clock_0 => clk,
            reset_0     => rst
        );

end rtl; -------------------------------------------------------------------------