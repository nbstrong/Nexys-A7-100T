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
        CLK100MHZ    : in    std_logic;
        CPU_RESETN   : in    std_logic;
        SW           : in    std_logic_vector(15 downto 0);
        LED          :   out std_logic_vector(15 downto 0);
        LED16_B      :   out std_logic;
        LED16_G      :   out std_logic;
        LED16_R      :   out std_logic;
        LED17_B      :   out std_logic;
        LED17_G      :   out std_logic;
        LED17_R      :   out std_logic;
        UART_TXD_IN  : in    std_logic;
        UART_RXD_OUT :   out std_logic;
        UART_CTS     :   out std_logic;
        UART_RTS     : in    std_logic
        );
    end top;
----------------------------------------------------------------------------------
architecture rtl of top is
    -- CONSTANTS -----------------------------------------------------------------
    -- SIGNALS -------------------------------------------------------------------
    signal counter : unsigned(26 downto 0);
    -- ALIASES -------------------------------------------------------------------
    alias sys_clk : std_logic is CLK100MHZ;
    alias rst_n   : std_logic is CPU_RESETN;
    -- ATTRIBUTES ----------------------------------------------------------------
    -- COMPONENTS ----------------------------------------------------------------
    component Nexys_A7_Block_Design_wrapper is
        port (
          sys_clock : in std_logic;
          reset     : in std_logic
        );
    end component Nexys_A7_Block_Design_wrapper;
begin ----------------------------------------------------------------------------
    LED     <= SW;
    LED17_R <= counter(counter'left);
    process(sys_clk)
    begin
        if rising_edge(sys_clk) then
            if rst_n = '0' then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    microblaze_wrapper_0 : component Nexys_A7_Block_Design_wrapper
    -- microblaze_wrapper_0 : entity microblaze_wrapper(structural) -- TODO: Make this work.
        port map (
            sys_clock => sys_clk,
            reset     => rst_n
        );

end rtl; -------------------------------------------------------------------------