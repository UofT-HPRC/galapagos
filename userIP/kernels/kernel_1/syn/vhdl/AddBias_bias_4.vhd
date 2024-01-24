-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_4_rom is 
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


architecture rtl of AddBias_bias_4_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01111000111010", 1 => "10100101001101", 2 => "01001010001110", 
    3 => "10111101111010", 4 => "00011110110110", 5 => "11110010000010", 
    6 => "11100111001110", 7 => "10111010110101", 8 => "11100111011001", 
    9 => "00100100011011", 10 => "11110101011011", 11 => "00101100110100", 
    12 => "00010000001011", 13 => "11110100111100", 14 => "11100001110101", 
    15 => "00000111100101", 16 => "00001110010010", 17 => "11110100110001", 
    18 => "11111000010010", 19 => "00000111000010", 20 => "00011001111001", 
    21 => "11111100011111", 22 => "00000001101101", 23 => "00010101010110", 
    24 => "00110001101101", 25 => "11110101111110", 26 => "00100111001101", 
    27 => "11001100100110", 28 => "00000000011001", 29 => "11101001100101", 
    30 => "00111010001011", 31 => "11010110110011", 32 => "11101011001000", 
    33 => "00100000001010", 34 => "11110111110111", 35 => "11010010010000", 
    36 => "11100111010110", 37 => "11000000010010", 38 => "11001111100101", 
    39 => "00101001111011", 40 => "00110001101000", 41 => "11010111100111", 
    42 => "11101101111001", 43 => "11111101101110", 44 => "11111010110001", 
    45 => "01001010111100", 46 => "00101000101110", 47 => "00110011100101" );

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

entity AddBias_bias_4 is
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

architecture arch of AddBias_bias_4 is
    component AddBias_bias_4_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_4_rom_U :  component AddBias_bias_4_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


