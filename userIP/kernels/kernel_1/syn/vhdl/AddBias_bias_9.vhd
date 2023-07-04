-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_9_rom is 
    generic(
             DWIDTH     : integer := 14; 
             AWIDTH     : integer := 6; 
             MEM_SIZE    : integer := 48
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of AddBias_bias_9_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00111010000011", 1 => "00100001001111", 2 => "00010101110011", 
    3 => "00010101101100", 4 => "00001110111100", 5 => "00011110100110", 
    6 => "00000010000000", 7 => "11100111110101", 8 => "11101010010100", 
    9 => "00001100000001", 10 => "00010011101100", 11 => "00011011010111", 
    12 => "11101100101110", 13 => "00111000001110", 14 => "11010000101111", 
    15 => "11100101010100", 16 => "00100101100000", 17 => "00010110101111", 
    18 => "00000000011010", 19 => "00101010101111", 20 => "11010111001110", 
    21 => "00111011000100", 22 => "10111101110010", 23 => "11001001111101", 
    24 => "00001010010000", 25 => "01010001010101", 26 => "00011001000011", 
    27 => "00010011000011", 28 => "00000010011011", 29 => "01000011011011", 
    30 => "11101010011000", 31 => "00000010000010", 32 => "11111111011011", 
    33 => "00010000111110", 34 => "11110010001011", 35 => "00011011011011", 
    36 => "00001011111001", 37 => "11101010001100", 38 => "10111001001101", 
    39 => "01010010101100", 40 => "11111001000001", 41 => "01000101110011", 
    42 => "00011011010110", 43 => "11111000101000", 44 => "01011111100110", 
    45 => "01000010101110", 46 => "01110001010011", 47 => "10110110111100" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity AddBias_bias_9 is
    generic (
        DataWidth : INTEGER := 14;
        AddressRange : INTEGER := 48;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of AddBias_bias_9 is
    component AddBias_bias_9_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_9_rom_U :  component AddBias_bias_9_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


