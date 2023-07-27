-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_3_rom is 
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


architecture rtl of AddBias_bias_3_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01010110101111", 1 => "11111111111011", 2 => "11100000011111", 
    3 => "00010110101111", 4 => "11001100011011", 5 => "11000101110011", 
    6 => "10111011011011", 7 => "00000000110101", 8 => "11110100100011", 
    9 => "11110111101001", 10 => "00001100100011", 11 => "11111110001100", 
    12 => "00010001100100", 13 => "11111000100100", 14 => "00010000111011", 
    15 => "11011100101000", 16 => "00000001010100", 17 => "11110100100100", 
    18 => "11010011010011", 19 => "11110110111000", 20 => "11001101001000", 
    21 => "00101110100010", 22 => "00000101010010", 23 => "11111110110100", 
    24 => "01000100100111", 25 => "00011011101001", 26 => "11011110111110", 
    27 => "00001010001011", 28 => "11011101000101", 29 => "11001011101110", 
    30 => "00010001100001", 31 => "00000111001100", 32 => "11111011100111", 
    33 => "11100000101010", 34 => "11101110100101", 35 => "11011100011100", 
    36 => "00111000000001", 37 => "10111100111011", 38 => "01000110101111", 
    39 => "00100100110101", 40 => "11011111110100", 41 => "11010001111111", 
    42 => "00010010110000", 43 => "11001110100101", 44 => "00001001100111", 
    45 => "01010001011000", 46 => "01000010101011", 47 => "00100110010011" );

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

entity AddBias_bias_3 is
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

architecture arch of AddBias_bias_3 is
    component AddBias_bias_3_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_3_rom_U :  component AddBias_bias_3_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


