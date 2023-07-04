-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_1_rom is 
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


architecture rtl of AddBias_bias_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00001000010100", 1 => "00010001001111", 2 => "11000001001110", 
    3 => "11000100100110", 4 => "11000111101100", 5 => "11000110001010", 
    6 => "00001100001011", 7 => "10111111101010", 8 => "11011000111000", 
    9 => "11001010001001", 10 => "00001110110111", 11 => "00001110010000", 
    12 => "00010001001011", 13 => "00001100011001", 14 => "11110001100001", 
    15 => "11100011100011", 16 => "00010011110100", 17 => "11101001010001", 
    18 => "11111100111100", 19 => "11111001001100", 20 => "11001010111111", 
    21 => "11111101111110", 22 => "11000110111111", 23 => "11001100100010", 
    24 => "11101111011101", 25 => "10111010011001", 26 => "00110110010101", 
    27 => "11100011001010", 28 => "11101100010101", 29 => "11101110011100", 
    30 => "00000000101110", 31 => "11011111100010", 32 => "11000001110100", 
    33 => "00000001001010", 34 => "00000100011110", 35 => "00001110110001", 
    36 => "11110001001010", 37 => "11110001101000", 38 => "11000010001010", 
    39 => "10111011111100", 40 => "11001100101111", 41 => "11010111001111", 
    42 => "00111011000000", 43 => "00000011010011", 44 => "01111110101010", 
    45 => "10011100000001", 46 => "00110001100110", 47 => "10101111100100" );

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

entity AddBias_bias_1 is
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

architecture arch of AddBias_bias_1 is
    component AddBias_bias_1_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_1_rom_U :  component AddBias_bias_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


