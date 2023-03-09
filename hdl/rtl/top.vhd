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
    CLK100MHZ_IN  : in    std_logic;
    CPU_RESETN_IN : in    std_logic;
    SW_IN         : in    std_logic_vector(15 downto 0);
    LED_OUT       :   out std_logic_vector(15 downto 0);
    LED16_B_OUT   :   out std_logic;
    LED16_G_OUT   :   out std_logic;
    LED16_R_OUT   :   out std_logic;
    LED17_B_OUT   :   out std_logic;
    LED17_G_OUT   :   out std_logic;
    LED17_R_OUT   :   out std_logic;
    UART_TXD_IN   : in    std_logic;
    UART_RXD_OUT  :   out std_logic;
    UART_RTS_IN   : in    std_logic;
    UART_CTS_OUT  :   out std_logic
    );
  end top;
----------------------------------------------------------------------------------
architecture rtl of top is
  -- CONSTANTS -------------------------------------------------------------------
  -- SIGNALS ---------------------------------------------------------------------
  signal counter : unsigned(31 downto 0);
  -- ALIASES ---------------------------------------------------------------------
  alias sys_clk : std_logic is CLK100MHZ_IN;
  alias rst_n   : std_logic is CPU_RESETN_IN;
  -- ATTRIBUTES ------------------------------------------------------------------
  -- COMPONENTS ------------------------------------------------------------------
begin ----------------------------------------------------------------------------
  -- LED_OUT     <= SW_IN;
  LED16_B_OUT <= SW_IN(10) when (or(SW_IN(15 downto 10))) else '0';
  LED16_G_OUT <= SW_IN(11) when (or(SW_IN(15 downto 10))) else '0';
  LED16_R_OUT <= SW_IN(12) when (or(SW_IN(15 downto 10))) else '0';
  LED17_B_OUT <= SW_IN(13) when (or(SW_IN(15 downto 10))) else '0';
  LED17_G_OUT <= SW_IN(14) when (or(SW_IN(15 downto 10))) else '0';
  LED17_R_OUT <= SW_IN(15) when (or(SW_IN(15 downto 10))) else counter(26);

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

  ------------------------------------------------------------------------------
  -- ENTITIES
  ------------------------------------------------------------------------------

end rtl; -------------------------------------------------------------------------