-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_2_rom is 
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


architecture rtl of QuantAct_m_2_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000001001001101110101001000000", 
    1 => "1100101101000001101001011000111", 
    2 => "1101011110010100000001101101010", 
    3 => "1110100100100010110111011101010", 
    4 => "1001000101100001111101011010011", 
    5 => "1000100001110011011110101111001", 
    6 => "1111100001001111111111110110100", 
    7 => "1100100011100011100100011000001", 
    8 => "1000000001000000000000000110000", 
    9 => "1001110000001111011101100100010", 
    10 => "1100100100111101011110101010100", 
    11 => "1000100101001111010000011111100", 
    12 => "1000001010001001110100111111100", 
    13 => "1001101011111000100100110000100", 
    14 => "1001101100000010010101101101010", 
    15 => "1111100111101110010100100011100", 
    16 => "1110011010100101101111011000010", 
    17 => "1100100100000100111101110100000", 
    18 => "1100110100010100100101111011001", 
    19 => "1110111011111111001010001010111", 
    20 => "1111111010001010111001100110010", 
    21 => "1100010000111111110010111000111", 
    22 => "1100010001000001110110000010100", 
    23 => "1001111111000110010001001101001", 
    24 => "1111010011010110011010000101111", 
    25 => "1111111011000110010011110111110", 
    26 => "1110011101001011100011000101111", 
    27 => "1111100110111101101101101001111", 
    28 => "1001000011010101110010110010110", 
    29 => "1010110111001110011000110111010", 
    30 => "1100101011110100101100011010010", 
    31 => "1101111011101011100000100110101", 
    32 => "1100000011010011110011101101001", 
    33 => "1001101000110101001100101010111", 
    34 => "1100000100101110100010000000001", 
    35 => "1010000111101001100110000011111", 
    36 => "1001011101000110001110010100010", 
    37 => "1001000101011010100101111100011", 
    38 => "1000001010011110010101001101111", 
    39 => "1010001110000011011110101100100", 
    40 => "1011100011010111010010100011111", 
    41 => "1100101010010010011100001100000", 
    42 => "1011100011001010110111101111000", 
    43 => "1001000101110110000111011100101", 
    44 => "1100101001000000011101110101001", 
    45 => "1001011001100110111011010010010", 
    46 => "1011111010010101100101011110110", 
    47 => "1011010100010110010001111111001" );


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

entity QuantAct_m_2 is
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

architecture arch of QuantAct_m_2 is
    component QuantAct_m_2_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_2_rom_U :  component QuantAct_m_2_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


