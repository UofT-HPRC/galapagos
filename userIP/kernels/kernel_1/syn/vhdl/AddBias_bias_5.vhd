-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_5_rom is 
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


architecture rtl of AddBias_bias_5_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11001010101001", 1 => "00001111101010", 2 => "00001100100011", 
    3 => "00001101011111", 4 => "00001110100110", 5 => "11111100000011", 
    6 => "00010011001010", 7 => "00100111110101", 8 => "11111100010101", 
    9 => "00000010110100", 10 => "00010010011000", 11 => "11110111111010", 
    12 => "00001111000110", 13 => "00011011010010", 14 => "00000011100100", 
    15 => "11010110110011", 16 => "00000011000011", 17 => "00001100010100", 
    18 => "11101100011110", 19 => "00100010111001", 20 => "11010110000010", 
    21 => "11111000010001", 22 => "01000011110001", 23 => "01000100010000", 
    24 => "11000111001101", 25 => "10100111010111", 26 => "00000111011010", 
    27 => "01011011010000", 28 => "11001100111011", 29 => "00010001001100", 
    30 => "11101101001001", 31 => "11010111011110", 32 => "00001110001110", 
    33 => "00000111010001", 34 => "11101001010011", 35 => "00010111000000", 
    36 => "11100000101111", 37 => "00111000000001", 38 => "00111010111011", 
    39 => "11110010010001", 40 => "00000010010100", 41 => "11111010001110", 
    42 => "11100110001101", 43 => "11111110111111", 44 => "00110001011001", 
    45 => "11100111101010", 46 => "00111111000111", 47 => "11000000110011" );

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

entity AddBias_bias_5 is
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

architecture arch of AddBias_bias_5 is
    component AddBias_bias_5_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_5_rom_U :  component AddBias_bias_5_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


