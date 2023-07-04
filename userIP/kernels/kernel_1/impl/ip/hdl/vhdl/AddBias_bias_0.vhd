-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_0_rom is 
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


architecture rtl of AddBias_bias_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00101010000110", 1 => "11011000100110", 2 => "11010011001001", 
    3 => "00011001011111", 4 => "00011011111000", 5 => "11110111010011", 
    6 => "11100111001011", 7 => "10101100010100", 8 => "00100000100101", 
    9 => "00101001100000", 10 => "00100010000111", 11 => "11001010111010", 
    12 => "11110111110111", 13 => "11111101100001", 14 => "00000110110101", 
    15 => "11101001110100", 16 => "11110010000001", 17 => "00011111001111", 
    18 => "11111100100001", 19 => "11111001100101", 20 => "11101000011000", 
    21 => "00011110000110", 22 => "00100100100110", 23 => "00000000101000", 
    24 => "00010010011001", 25 => "11000001111101", 26 => "11110010101010", 
    27 => "11110110011110", 28 => "00000011101100", 29 => "00001111010000", 
    30 => "11110101100100", 31 => "00000111100010", 32 => "11110100000101", 
    33 => "00010111100011", 34 => "00000001010101", 35 => "00010110111100", 
    36 => "00000000010101", 37 => "00011101001010", 38 => "00110100101101", 
    39 => "00110111000011", 40 => "00001101101000", 41 => "11011100010111", 
    42 => "11100000101111", 43 => "00100111011000", 44 => "10100101010101", 
    45 => "10101000001101", 46 => "01001010111000", 47 => "01000101000111" );

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

entity AddBias_bias_0 is
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

architecture arch of AddBias_bias_0 is
    component AddBias_bias_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_0_rom_U :  component AddBias_bias_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


