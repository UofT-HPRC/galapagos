-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_4_rom is 
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


architecture rtl of QuantAct_m_4_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1101101011100001101001111010111", 
    1 => "1100110010101101000010001110111", 
    2 => "1001011110110011101110011101100", 
    3 => "1110101010101111100001100010100", 
    4 => "1001110111000001100100110110001", 
    5 => "1011101101111110001100110101011", 
    6 => "1000011111010101110001101100100", 
    7 => "1001100001111111000100011101011", 
    8 => "1100011100111101101101001011101", 
    9 => "1101000110010111100001010011110", 
    10 => "1000110010110111111011111101111", 
    11 => "1001100101100001111110001000101", 
    12 => "1111111100001111110100101010011", 
    13 => "1000001100100101001100110010101", 
    14 => "1010110000010100000111110011011", 
    15 => "1011000000111110000001101101100", 
    16 => "1111101101010100110010110011100", 
    17 => "1101100001001101101101010111011", 
    18 => "1101011101101010110001101101011", 
    19 => "1101000101111111100101111000101", 
    20 => "1010011010000010000001011010001", 
    21 => "1010110111101000000001111101010", 
    22 => "1010010101100001100100010111101", 
    23 => "1010000101101101111011101110011", 
    24 => "1111011101010101111111010100110", 
    25 => "1001000011001001010100000000101", 
    26 => "1101010100101110100010000111011", 
    27 => "1111011110001111010010001101001", 
    28 => "1100011110001110001001001011001", 
    29 => "1111000011010010101100000001000", 
    30 => "1101110011110000001001011111100", 
    31 => "1010100011001111011101101010010", 
    32 => "1100001100000100010101111110110", 
    33 => "1000100010011001011010011101011", 
    34 => "1011100011001011111001100110000", 
    35 => "1001001001101011101010110001110", 
    36 => "1000111010010100001111010011101", 
    37 => "1011001101101110000010001010001", 
    38 => "1100100111100101100111000011011", 
    39 => "1000100101000101100010000101100", 
    40 => "1111111011011100001011000000111", 
    41 => "1010001011011101011101011010101", 
    42 => "1001000010010010000101101100011", 
    43 => "1011101110001111001000100010001", 
    44 => "1011111010100100010000101111101", 
    45 => "1100101000000100100011000011010", 
    46 => "1100100000000000110000111010101", 
    47 => "1100000011111010110100000111010" );


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

entity QuantAct_m_4 is
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

architecture arch of QuantAct_m_4 is
    component QuantAct_m_4_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_4_rom_U :  component QuantAct_m_4_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


