-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_7_rom is 
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


architecture rtl of AddBias_bias_7_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00100001101111", 1 => "11101111101100", 2 => "00100000000101", 
    3 => "11011011101011", 4 => "11110010001111", 5 => "11111110111110", 
    6 => "01000100101101", 7 => "11110001011001", 8 => "11011110001110", 
    9 => "11110110100011", 10 => "00000000110011", 11 => "11011100011011", 
    12 => "00001110010001", 13 => "00100010001111", 14 => "00001111101101", 
    15 => "00011001010100", 16 => "00011000110101", 17 => "11100101101001", 
    18 => "11101110111000", 19 => "11010100111101", 20 => "00010100101001", 
    21 => "00001010110001", 22 => "11100100100100", 23 => "11100100001011", 
    24 => "11101010110101", 25 => "11011000101111", 26 => "11110101101000", 
    27 => "11101100001001", 28 => "00000111110111", 29 => "11100100001000", 
    30 => "11010111110110", 31 => "00001100001101", 32 => "00000100111011", 
    33 => "11101110100111", 34 => "11101011001001", 35 => "11001001101001", 
    36 => "00111000001010", 37 => "11000100111000", 38 => "11001001010010", 
    39 => "00000010110100", 40 => "01000010100011", 41 => "11101100010000", 
    42 => "00100101110000", 43 => "00011111110000", 44 => "10100100001101", 
    45 => "11001101010000", 46 => "10101110101101", 47 => "01000010101101" );

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

entity AddBias_bias_7 is
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

architecture arch of AddBias_bias_7 is
    component AddBias_bias_7_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_7_rom_U :  component AddBias_bias_7_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


