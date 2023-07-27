-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_15_rom is 
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


architecture rtl of AddBias_bias_15_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11010000010001", 1 => "11000001100000", 2 => "00100011101101", 
    3 => "00011101111001", 4 => "01001000010101", 5 => "10110101010000", 
    6 => "11110110110101", 7 => "11101100010001", 8 => "11110010110011", 
    9 => "00110010110000", 10 => "00101110001110", 11 => "00011010101010", 
    12 => "00110000110011", 13 => "00000000011000", 14 => "00001001011000", 
    15 => "11110000110101", 16 => "00000101000111", 17 => "00011001110001", 
    18 => "11100100000011", 19 => "11100100111101", 20 => "01010011011011", 
    21 => "11101111000011", 22 => "00111100001101", 23 => "00011100101010", 
    24 => "11111100110100", 25 => "11001110111101", 26 => "00010111000101", 
    27 => "00000000111111", 28 => "11100001110110", 29 => "00000101001111", 
    30 => "00101100111000", 31 => "00100001100100", 32 => "00000010010100", 
    33 => "00010001111101", 34 => "11110001000101", 35 => "00000101001101", 
    36 => "10110100111000", 37 => "01000111101011", 38 => "00010010000100", 
    39 => "11101000011001", 40 => "00001111111101", 41 => "00001011110011", 
    42 => "00010011101111", 43 => "11010101110111", 44 => "11110110001001", 
    45 => "10110000101011", 46 => "00101111011110", 47 => "01010110000100" );

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

entity AddBias_bias_15 is
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

architecture arch of AddBias_bias_15 is
    component AddBias_bias_15_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_15_rom_U :  component AddBias_bias_15_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


