-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_10_rom is 
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


architecture rtl of AddBias_bias_10_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01010010101111", 1 => "00011000010001", 2 => "00010000010011", 
    3 => "10111000100111", 4 => "00110101111011", 5 => "00011000011110", 
    6 => "11100101100001", 7 => "11110111111011", 8 => "11100101110001", 
    9 => "11010101000001", 10 => "00001111000111", 11 => "11011010100010", 
    12 => "11100010010011", 13 => "00000001000000", 14 => "00001110111011", 
    15 => "00000000010011", 16 => "00001101101001", 17 => "00010010000011", 
    18 => "00000000010011", 19 => "11111100101101", 20 => "11001100100001", 
    21 => "11110111001010", 22 => "11111101010010", 23 => "11010000110110", 
    24 => "00010000010110", 25 => "11011000110100", 26 => "11110000000111", 
    27 => "11110101000100", 28 => "11101110011010", 29 => "00111101110100", 
    30 => "11011111010010", 31 => "00101101011101", 32 => "00001010110000", 
    33 => "11101000000101", 34 => "00010001011010", 35 => "11111111111001", 
    36 => "00111011001110", 37 => "11001101010001", 38 => "11100111001000", 
    39 => "11100001001111", 40 => "11111110010100", 41 => "11011110110111", 
    42 => "11110100110010", 43 => "00011110101100", 44 => "10100010111110", 
    45 => "10111000010101", 46 => "10011010000010", 47 => "00001111110011" );

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

entity AddBias_bias_10 is
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

architecture arch of AddBias_bias_10 is
    component AddBias_bias_10_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_10_rom_U :  component AddBias_bias_10_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


