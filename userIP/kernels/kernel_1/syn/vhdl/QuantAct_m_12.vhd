-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_12_rom is 
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


architecture rtl of QuantAct_m_12_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1100110001100101010011111010110", 
    1 => "1110010011101110010000000111000", 
    2 => "1001010110011001011010110010100", 
    3 => "1000000100111111110101101110100", 
    4 => "1000101010000010010001001111110", 
    5 => "1101101110111011110011011000000", 
    6 => "1111110111110100100101101110001", 
    7 => "1001101101011000011001001111010", 
    8 => "1000100110000001001101000010010", 
    9 => "1111011011000011111100110001101", 
    10 => "1110111001101001011111010001110", 
    11 => "1110010111001000001110110100110", 
    12 => "1010100001000010101000101001010", 
    13 => "1010011001010100110111100010111", 
    14 => "1001011111111010011000111100001", 
    15 => "1011100101010011100010001101010", 
    16 => "1100110010100101010111010000110", 
    17 => "1100101011101010000110111000110", 
    18 => "1101010100111100100011010000110", 
    19 => "1000111011000110101001110100000", 
    20 => "1000011100011000011001100110001", 
    21 => "1100001110000001011111110110101", 
    22 => "1010011011011001100100011110100", 
    23 => "1111100111101101001101010100111", 
    24 => "1001011100010101001101011010011", 
    25 => "1110001011011110010010001000011", 
    26 => "1001011111000010100101111000010", 
    27 => "1000101011100100010100011101111", 
    28 => "1100101011010011000101101100001", 
    29 => "1000111110110000000010001001010", 
    30 => "1101001111011111100110001000101", 
    31 => "1100100101000100001101001001100", 
    32 => "1001011000010000101101010011000", 
    33 => "1011101101110110101111101101101", 
    34 => "1010001011000010100000101010000", 
    35 => "1010100010110101110000111001000", 
    36 => "1000001110100010110110111000111", 
    37 => "1001111101011010000001100111100", 
    38 => "1101100101111010011101010100010", 
    39 => "1000100110011000010111010001110", 
    40 => "1001000111001000111011100000101", 
    41 => "1100101101110100000000110010010", 
    42 => "1001010001011010101000001100011", 
    43 => "1001101101010100010001100001011", 
    44 => "1100011001101101110001001110011", 
    45 => "1100011100101011100001011111011", 
    46 => "1011111000110011001111111000110", 
    47 => "1101001101111010100001100101000" );


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

entity QuantAct_m_12 is
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

architecture arch of QuantAct_m_12 is
    component QuantAct_m_12_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_12_rom_U :  component QuantAct_m_12_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


