-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_15_rom is 
    generic(
             DWIDTH     : integer := 31; 
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


architecture rtl of QuantAct_m_15_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1110000110011000100110111000001", 
    1 => "1101000010110111101010011000011", 
    2 => "1101110001110011000001010100001", 
    3 => "1101110011110111000111001111010", 
    4 => "1000000101101111010110001111101", 
    5 => "1100100110001111110110001011011", 
    6 => "1100100111110111011010001001110", 
    7 => "1000101001011000111010100110111", 
    8 => "1111110101100001010011001011101", 
    9 => "1100100100101110001100011001011", 
    10 => "1111100010000111111110110010010", 
    11 => "1011101100101111100001111001110", 
    12 => "1111001111110010110101011100110", 
    13 => "1010010011110001001101111010011", 
    14 => "1010011011101001000011101111110", 
    15 => "1111010101001101011111100110010", 
    16 => "1100011111100110111001011010001", 
    17 => "1101010001001101110111001011100", 
    18 => "1101101000111101010001001110010", 
    19 => "1100111011000010000101100011000", 
    20 => "1111110001110011110001001001110", 
    21 => "1011110100010001000001001110001", 
    22 => "1001011000011011001010010101110", 
    23 => "1001001001001101011111101011100", 
    24 => "1001001100010000111011001010001", 
    25 => "1000001011000101001001100111010", 
    26 => "1111100010100001000110110011110", 
    27 => "1111111101000101110011010001010", 
    28 => "1110011010001000000111100111010", 
    29 => "1001010010110101101110110011001", 
    30 => "1100011001011010100100001111011", 
    31 => "1101011100111101000011111100110", 
    32 => "1011101100110000000111011111110", 
    33 => "1100010101101000011101111100101", 
    34 => "1010001010011010101100001111010", 
    35 => "1011110100010001101000001110101", 
    36 => "1001010110011101101100011001100", 
    37 => "1000100011110100100110001001110", 
    38 => "1000001100011111100011111110111", 
    39 => "1011110101010101001110110100111", 
    40 => "1100011101010000011000110011111", 
    41 => "1110010100101111011101110010101", 
    42 => "1010010111010010010111011000000", 
    43 => "1000111001100001011101111010000", 
    44 => "1011110111000010000101011011000", 
    45 => "1011000110110010100100110010000", 
    46 => "1111011001011001111011010111001", 
    47 => "1010010001000100111000101110000" );


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

entity QuantAct_m_15 is
    generic (
        DataWidth : INTEGER := 31;
        AddressRange : INTEGER := 48;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of QuantAct_m_15 is
    component QuantAct_m_15_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_15_rom_U :  component QuantAct_m_15_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


