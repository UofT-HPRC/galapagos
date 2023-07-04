-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_11_rom is 
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


architecture rtl of AddBias_bias_11_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01000101110010", 1 => "10110110101011", 2 => "11110111011001", 
    3 => "00000011001000", 4 => "10110001110111", 5 => "00001110110011", 
    6 => "11110111110100", 7 => "11101110010111", 8 => "00011001111000", 
    9 => "00011000110101", 10 => "00100111110011", 11 => "11011010010110", 
    12 => "00000110101010", 13 => "00000110110111", 14 => "11100101100111", 
    15 => "00010100101100", 16 => "11111001101010", 17 => "11110110000111", 
    18 => "00001000101111", 19 => "00000000000101", 20 => "11001001111011", 
    21 => "00000110110011", 22 => "00010010001010", 23 => "11000101101111", 
    24 => "11110100011111", 25 => "00000110001100", 26 => "10110011010011", 
    27 => "11111110111000", 28 => "00001011110101", 29 => "00010001010010", 
    30 => "11100000010110", 31 => "00001000111110", 32 => "00010010100111", 
    33 => "00110111010011", 34 => "11111111101000", 35 => "00111011011100", 
    36 => "11100001100000", 37 => "01000101011101", 38 => "00100101010010", 
    39 => "00101111111101", 40 => "11100011011000", 41 => "11111101011011", 
    42 => "11110111011000", 43 => "00100000111011", 44 => "01100000101101", 
    45 => "11111000001111", 46 => "01011101111100", 47 => "10110101011001" );

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

entity AddBias_bias_11 is
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

architecture arch of AddBias_bias_11 is
    component AddBias_bias_11_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_11_rom_U :  component AddBias_bias_11_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


