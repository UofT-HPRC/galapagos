-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_3_rom is 
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


architecture rtl of QuantAct_m_3_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1101000001000001110111011010001", 
    1 => "1101100000010100001110000011000", 
    2 => "1101101110110010110110101101111", 
    3 => "1100001011100001101001011100011", 
    4 => "1000011011000100011111110111000", 
    5 => "1101110100100111100111101000110", 
    6 => "1110010110011001010110101110011", 
    7 => "1100000111011101000011011001001", 
    8 => "1100111011001110000000001001101", 
    9 => "1000100111001000001100011011100", 
    10 => "1000001001000010010101100001000", 
    11 => "1001010100000001111011001010010", 
    12 => "1000101010010111101110111100110", 
    13 => "1001111011111100011111100011011", 
    14 => "1000101001000010100010011001010", 
    15 => "1010001100011000101011100010010", 
    16 => "1110101110111010111101111111011", 
    17 => "1101010010110101111110110001001", 
    18 => "1101000000010101100100111100100", 
    19 => "1100110100001010001111011000011", 
    20 => "1000100011011000000001011000000", 
    21 => "1100011001011101101010011000011", 
    22 => "1010111111101010100011100010001", 
    23 => "1000110000111001010101001111011", 
    24 => "1110011110010100010101110011111", 
    25 => "1111110000010111101111110000011", 
    26 => "1111101110100111100000000101010", 
    27 => "1111111000011111001100110001101", 
    28 => "1000011010010000110101001110001", 
    29 => "1111101100000000001000000001110", 
    30 => "1100100101011110011111110010110", 
    31 => "1110001101000100100100111110111", 
    32 => "1011000101110101011110100010001", 
    33 => "1010011000111000001110110011111", 
    34 => "1100100010111100010011100100110", 
    35 => "1010011001100101100111111100000", 
    36 => "1011100011111110100000010000001", 
    37 => "1000000010001000101001010101111", 
    38 => "1010101000100110011001100001111", 
    39 => "1000101110101110000001001011001", 
    40 => "1100010010110011001100101010010", 
    41 => "1001000010110000100011101110110", 
    42 => "1100011110101111101010110011110", 
    43 => "1000111101101110011011100101110", 
    44 => "1100100011011110110001111110101", 
    45 => "1100100010101110100000010001110", 
    46 => "1100110111000001011011100111111", 
    47 => "1100001110010010100100100110010" );


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

entity QuantAct_m_3 is
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

architecture arch of QuantAct_m_3 is
    component QuantAct_m_3_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_3_rom_U :  component QuantAct_m_3_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


