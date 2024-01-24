-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_12_rom is 
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


architecture rtl of AddBias_bias_12_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00011100011011", 1 => "11110111011000", 2 => "00101000110010", 
    3 => "01001011011010", 4 => "00001010000010", 5 => "00010001011100", 
    6 => "10111000001010", 7 => "11010101000101", 8 => "00110010011011", 
    9 => "00010011110111", 10 => "11110100100101", 11 => "11110100111011", 
    12 => "00000001110000", 13 => "11111010101100", 14 => "11011111011000", 
    15 => "11110010011010", 16 => "00001000001000", 17 => "00010000110000", 
    18 => "00010101001010", 19 => "00001010000001", 20 => "11010010100101", 
    21 => "11011110001101", 22 => "11001000100100", 23 => "10111110001100", 
    24 => "00111110011101", 25 => "11111001001010", 26 => "11010010011110", 
    27 => "11101000000011", 28 => "11100010001111", 29 => "00011010101001", 
    30 => "00001111100001", 31 => "11101101101100", 32 => "00000011111000", 
    33 => "00001100110100", 34 => "11111011110001", 35 => "00010011011010", 
    36 => "10101101101110", 37 => "11101111011001", 38 => "11001100010100", 
    39 => "00101011110011", 40 => "00101001101011", 41 => "11111111111101", 
    42 => "11100110010000", 43 => "11111000101111", 44 => "11110000000000", 
    45 => "10110001010011", 46 => "01000111010001", 47 => "00101100001001" );

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

entity AddBias_bias_12 is
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

architecture arch of AddBias_bias_12 is
    component AddBias_bias_12_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_12_rom_U :  component AddBias_bias_12_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


