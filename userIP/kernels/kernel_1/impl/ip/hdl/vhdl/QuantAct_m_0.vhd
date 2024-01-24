-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_0_rom is 
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


architecture rtl of QuantAct_m_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1100111100100010010010100111101", 
    1 => "1100100100110110101111000011010", 
    2 => "1110010000111111010001100110110", 
    3 => "1100110001011111110100110111000", 
    4 => "1000011000011011001110100010111", 
    5 => "1110001110010101101001101011100", 
    6 => "1000011101000101001001101111010", 
    7 => "1110011110100001001100000011011", 
    8 => "1000101100101111100110111000101", 
    9 => "1001011110011100000001101111001", 
    10 => "1010000110101111111001011101010", 
    11 => "1111111110101010010111111000110", 
    12 => "1111000110001000001100000000001", 
    13 => "1001100101101111100001000010100", 
    14 => "1000110000111000110011011101101", 
    15 => "1001101001101010010111010001010", 
    16 => "1011111100001011010110001100010", 
    17 => "1101011000101010000100101110011", 
    18 => "1110011010000001101100101000100", 
    19 => "1101011111110001011110000111101", 
    20 => "1100100001111111000011001001101", 
    21 => "1001001011100000011101000001010", 
    22 => "1010111100110110100100110010000", 
    23 => "1010011010100011111101000011000", 
    24 => "1111101100011001101111011011010", 
    25 => "1111011001100001000110111101011", 
    26 => "1001100011010111100110100011110", 
    27 => "1111001000100100110000101011101", 
    28 => "1110000100110100010010101001111", 
    29 => "1100011000011101111000010001111", 
    30 => "1100010111100101011001000111111", 
    31 => "1100100110101011000100101111110", 
    32 => "1011111101001100000001111101001", 
    33 => "1010111010010111010010110101011", 
    34 => "1010001010000100100110011001101", 
    35 => "1100000111100010111011000010100", 
    36 => "1010011000100111111111110001011", 
    37 => "1000100011001000111111100000000", 
    38 => "1100001101110010100010110010010", 
    39 => "1001011001000101010010000001010", 
    40 => "1010011100101110111110001011001", 
    41 => "1011001010011001110001001100110", 
    42 => "1111111010110011110000011100000", 
    43 => "1100011011011011110011100100100", 
    44 => "1010111111101110100000110010110", 
    45 => "1011001011011101011111011011100", 
    46 => "1100010000011010001010000110101", 
    47 => "1101011011110110000011101101010" );


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

entity QuantAct_m_0 is
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

architecture arch of QuantAct_m_0 is
    component QuantAct_m_0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_0_rom_U :  component QuantAct_m_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


