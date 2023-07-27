-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_8_rom is 
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


architecture rtl of QuantAct_m_8_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011101100111100001001101110110", 
    1 => "1010001000000000010000000101001", 
    2 => "1101000000011000000110010101111", 
    3 => "1110011111011001010011011101111", 
    4 => "1000110010111010111111101101001", 
    5 => "1100101001010110011111011011100", 
    6 => "1111110111111111010000000011010", 
    7 => "1001001101010110111001100010101", 
    8 => "1001100101000010100000100000001", 
    9 => "1110101110101011110000110011110", 
    10 => "1100100000010000010001000010010", 
    11 => "1010110111011110011100100110001", 
    12 => "1010010100011010100101100010101", 
    13 => "1011010000011000011001000000011", 
    14 => "1010001111010110110011010000111", 
    15 => "1000111011011001011110111010011", 
    16 => "1100100001001010110100001100010", 
    17 => "1011110111011100100011010111111", 
    18 => "1100101011001001001110100001011", 
    19 => "1100001111001010011010001101000", 
    20 => "1001111010101010001111000110110", 
    21 => "1001001010011111100000100101001", 
    22 => "1000011000101100111011010010010", 
    23 => "1010100001111111011101101001101", 
    24 => "1001010100101001101101111000011", 
    25 => "1000110100010010110101101101100", 
    26 => "1001011000001001101110111111000", 
    27 => "1110110011110100001101100100100", 
    28 => "1100111111101110101001111010001", 
    29 => "1100100011011000001101011000110", 
    30 => "1100101001011101001000010000101", 
    31 => "1100011000011010000000011001000", 
    32 => "1010100111010111110100110100010", 
    33 => "1100010001010010101011110011011", 
    34 => "1000101001111000100100110100011", 
    35 => "1001100111101010000001111000101", 
    36 => "1011111011000000110010101100011", 
    37 => "1010101100111100010101000000001", 
    38 => "1000111111111001000001100101010", 
    39 => "1100100000101000111100001110101", 
    40 => "1100111000101111000010100011011", 
    41 => "1111010100001010111110100010000", 
    42 => "1001100111011101000001001011110", 
    43 => "1001011111100100010010100010010", 
    44 => "1100011101101111101101011001101", 
    45 => "1100100100001000101110010110100", 
    46 => "1100100000001001110011100000110", 
    47 => "1100000001011011011111100111101" );


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

entity QuantAct_m_8 is
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

architecture arch of QuantAct_m_8 is
    component QuantAct_m_8_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_8_rom_U :  component QuantAct_m_8_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


