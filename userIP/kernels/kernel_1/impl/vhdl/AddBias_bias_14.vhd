-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_14_rom is 
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


architecture rtl of AddBias_bias_14_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01011010111111", 1 => "00001001111100", 2 => "00101001001001", 
    3 => "10101000101010", 4 => "00001100011111", 5 => "00000001000101", 
    6 => "00110101011111", 7 => "00000101111010", 8 => "11110000000100", 
    9 => "11110101100010", 10 => "11111111100001", 11 => "11110010111111", 
    12 => "00000000111011", 13 => "00000000000100", 14 => "11110011001111", 
    15 => "11100010100011", 16 => "00010001111010", 17 => "11010111010100", 
    18 => "11110000011001", 19 => "00010001010100", 20 => "11101110100111", 
    21 => "00101110101101", 22 => "00001101111111", 23 => "11101000001010", 
    24 => "00001100101001", 25 => "10110010011110", 26 => "11000111010111", 
    27 => "00101001111011", 28 => "00101111011011", 29 => "00001101100101", 
    30 => "11010010000110", 31 => "11110011110101", 32 => "11111111110010", 
    33 => "00110111101111", 34 => "11101110100100", 35 => "00100110000100", 
    36 => "00111111010010", 37 => "10111001110011", 38 => "00101101011110", 
    39 => "11000111111000", 40 => "00010010100000", 41 => "11100000010000", 
    42 => "11001000011010", 43 => "11100000100110", 44 => "11101001000100", 
    45 => "01011101000011", 46 => "10001101001010", 47 => "01110011111110" );

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

entity AddBias_bias_14 is
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

architecture arch of AddBias_bias_14 is
    component AddBias_bias_14_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_14_rom_U :  component AddBias_bias_14_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


