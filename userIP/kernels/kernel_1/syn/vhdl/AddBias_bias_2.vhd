-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_2_rom is 
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


architecture rtl of AddBias_bias_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11001011011010", 1 => "00000100011110", 2 => "00010000100110", 
    3 => "00101011010010", 4 => "11111111010111", 5 => "00001011100010", 
    6 => "11111000001010", 7 => "11110111100101", 8 => "10110101000111", 
    9 => "11001110011101", 10 => "00000100111001", 11 => "11011001001111", 
    12 => "11100111111011", 13 => "11111111101001", 14 => "00001011110110", 
    15 => "11110011011101", 16 => "00010111101001", 17 => "00001011001011", 
    18 => "11100011110100", 19 => "11100110001101", 20 => "11001011010011", 
    21 => "11111110000000", 22 => "11110001101000", 23 => "00001001011000", 
    24 => "00000101001100", 25 => "00001000100111", 26 => "11100011101100", 
    27 => "11110011111001", 28 => "11100010111110", 29 => "11100010111011", 
    30 => "11101111010001", 31 => "11001001011100", 32 => "11111000001010", 
    33 => "00010000000101", 34 => "00011011000101", 35 => "00000010011100", 
    36 => "00111110101111", 37 => "11100111111011", 38 => "10110001001111", 
    39 => "11111110001010", 40 => "11011110010111", 41 => "11101100101110", 
    42 => "11110111111100", 43 => "11101011111111", 44 => "11010001111111", 
    45 => "01100100000001", 46 => "10110100010011", 47 => "01000111010101" );

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

entity AddBias_bias_2 is
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

architecture arch of AddBias_bias_2 is
    component AddBias_bias_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_2_rom_U :  component AddBias_bias_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


