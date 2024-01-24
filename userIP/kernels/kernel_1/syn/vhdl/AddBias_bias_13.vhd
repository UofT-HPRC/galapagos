-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_13_rom is 
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


architecture rtl of AddBias_bias_13_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11101000001001", 1 => "00101111100001", 2 => "11110010101110", 
    3 => "11101011101011", 4 => "10110111111001", 5 => "00001100100010", 
    6 => "11111111000101", 7 => "11101011100110", 8 => "00000000101110", 
    9 => "11101011111001", 10 => "11110001101100", 11 => "11101010001000", 
    12 => "00010101100101", 13 => "11001001110110", 14 => "00000101101111", 
    15 => "11110100010000", 16 => "11111110001001", 17 => "11110110001000", 
    18 => "00101010111101", 19 => "11111001101111", 20 => "11101011011110", 
    21 => "00101100001111", 22 => "11111111001101", 23 => "00100010100110", 
    24 => "00010000100101", 25 => "11000010001111", 26 => "00001110011000", 
    27 => "01001100111110", 28 => "11010101111111", 29 => "00111011011100", 
    30 => "00111011001101", 31 => "11010010110011", 32 => "00011101100010", 
    33 => "01000000001111", 34 => "11011110101001", 35 => "11011100001011", 
    36 => "00111111001111", 37 => "11110110111011", 38 => "11100001111100", 
    39 => "00000111001101", 40 => "11010010110111", 41 => "01000011100100", 
    42 => "11010000000000", 43 => "11000101000011", 44 => "11001101000001", 
    45 => "01010111111111", 46 => "00100001111000", 47 => "11000111010011" );

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

entity AddBias_bias_13 is
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

architecture arch of AddBias_bias_13 is
    component AddBias_bias_13_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_13_rom_U :  component AddBias_bias_13_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


