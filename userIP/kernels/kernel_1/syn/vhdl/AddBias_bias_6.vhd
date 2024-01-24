-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity AddBias_bias_6_rom is 
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


architecture rtl of AddBias_bias_6_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "11110000100110", 1 => "11111000011011", 2 => "00010100010111", 
    3 => "10100001100100", 4 => "00101101100011", 5 => "00011110011101", 
    6 => "00000011101010", 7 => "00010001000011", 8 => "11110011111111", 
    9 => "00000001100011", 10 => "11001100001101", 11 => "11100011011110", 
    12 => "00001100111001", 13 => "11101110111110", 14 => "11111001110010", 
    15 => "11001011001001", 16 => "11111110101001", 17 => "00000100000000", 
    18 => "00010011000011", 19 => "11100101110010", 20 => "00000110111001", 
    21 => "01000010010010", 22 => "01000010000101", 23 => "01001000000011", 
    24 => "00011010110010", 25 => "11110111100010", 26 => "10111010101011", 
    27 => "11011110001101", 28 => "00010100011000", 29 => "11001111000110", 
    30 => "11101110110110", 31 => "00100000010011", 32 => "11110101101001", 
    33 => "11100010000100", 34 => "11111011001001", 35 => "11111000110101", 
    36 => "00000101111110", 37 => "00000001011010", 38 => "11110000000110", 
    39 => "11010011111110", 40 => "11110001111111", 41 => "00110001000100", 
    42 => "11111110111001", 43 => "11011100111111", 44 => "01001001101111", 
    45 => "10110010111111", 46 => "11001100000001", 47 => "00110110111111" );

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

entity AddBias_bias_6 is
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

architecture arch of AddBias_bias_6 is
    component AddBias_bias_6_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    AddBias_bias_6_rom_U :  component AddBias_bias_6_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


