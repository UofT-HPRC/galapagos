-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_1_rom is 
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


architecture rtl of QuantAct_m_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1101001110010101001101101010010", 
    1 => "1101001001101000001000001110101", 
    2 => "1110001110100111111100001001110", 
    3 => "1111101110010000000000000100111", 
    4 => "1000011010010000101100000010010", 
    5 => "1100101011100010001101100000000", 
    6 => "1010101010110101011110011010110", 
    7 => "1111000010111100001011010100110", 
    8 => "1001000001001001000111100001110", 
    9 => "1000001100001000100101010101000", 
    10 => "1001001010001111110101011100000", 
    11 => "1110110110110001000010110000110", 
    12 => "1001101000010000000110010111101", 
    13 => "1001001000101111111101110110010", 
    14 => "1000011011111011101011110001100", 
    15 => "1000000101000111110100111010000", 
    16 => "1101001111001101100100100111101", 
    17 => "1100111111100010111111001000101", 
    18 => "1101100100010000011001000100111", 
    19 => "1110000111100111111101111001110", 
    20 => "1001011011000100101010101000101", 
    21 => "1001110011110010100111000100101", 
    22 => "1001100111101001100111100110010", 
    23 => "1011110111100101110000001001001", 
    24 => "1101011001111010110000110101001", 
    25 => "1001101001111010111001100010000", 
    26 => "1001100010101010001001011110011", 
    27 => "1110101111100001110101111010110", 
    28 => "1000100011010000000101110111100", 
    29 => "1011100110100100101000100110011", 
    30 => "1000111011001110110000110001001", 
    31 => "1100111111000110100110100000110", 
    32 => "1000011101111010100001111001111", 
    33 => "1000110001100111110111110110111", 
    34 => "1101011100101001110111001111111", 
    35 => "1001110001100111101010001011110", 
    36 => "1001111010001101100001110110010", 
    37 => "1001110001010000101000101101000", 
    38 => "1001001010001010111111000101011", 
    39 => "1001010111010110100110111110001", 
    40 => "1110100001111111101101010101101", 
    41 => "1100000111100011110011100100100", 
    42 => "1010010110111000111101110101000", 
    43 => "1100010110011100100111010000010", 
    44 => "1000010101100111011010110100010", 
    45 => "1010010111001101111111100011000", 
    46 => "1100010110110010100110100101111", 
    47 => "1100011111001101010000000010000" );


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

entity QuantAct_m_1 is
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

architecture arch of QuantAct_m_1 is
    component QuantAct_m_1_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_1_rom_U :  component QuantAct_m_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


