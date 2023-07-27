-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_8_rom is 
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


architecture rtl of AddBias_bias_8_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11110110101110", 1 => "10110111111110", 2 => "11110011101001", 
    3 => "00000111101100", 4 => "00100101101010", 5 => "11010100011110", 
    6 => "11001100111101", 7 => "00001101111011", 8 => "00011010110111", 
    9 => "00011000001011", 10 => "11100000101000", 11 => "11101111110010", 
    12 => "11101011011010", 13 => "00001001101111", 14 => "11111011101101", 
    15 => "11111001000101", 16 => "11111001000110", 17 => "00101100000100", 
    18 => "11101010010101", 19 => "11110110001100", 20 => "00000011010010", 
    21 => "11000000010011", 22 => "01000101110111", 23 => "11000011010110", 
    24 => "11011111000101", 25 => "11111011001000", 26 => "11111100000111", 
    27 => "11010101011111", 28 => "00010000111100", 29 => "00000011011111", 
    30 => "11110000111111", 31 => "11001111010101", 32 => "00010011000110", 
    33 => "00011010110001", 34 => "11001010001101", 35 => "00001000001101", 
    36 => "11000111011000", 37 => "00100110110011", 38 => "00111111101100", 
    39 => "11010011101111", 40 => "11011011110011", 41 => "00101111110101", 
    42 => "00000101011011", 43 => "11011111110101", 44 => "10100011001010", 
    45 => "00111110111011", 46 => "10111101111110", 47 => "01000001011010" );

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

entity AddBias_bias_8 is
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

architecture arch of AddBias_bias_8 is
    component AddBias_bias_8_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_8_rom_U :  component AddBias_bias_8_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


