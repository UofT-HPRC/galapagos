-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_10_rom is 
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


architecture rtl of QuantAct_m_10_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1111011011111011100011101011101", 
    1 => "1100001100000010000111110011100", 
    2 => "1101010100011100100000100110100", 
    3 => "1101010110101101110011011000011", 
    4 => "1011000001011001100000000110111", 
    5 => "1000010000110111100100010011011", 
    6 => "1111001101100111011111011010000", 
    7 => "1100100100111001110000111100111", 
    8 => "1001011000100011110101001100010", 
    9 => "1010100010101100101101011100110", 
    10 => "1111000111111011111100101010110", 
    11 => "1000110001101010101010001101101", 
    12 => "1001010001001011011001100110011", 
    13 => "1001101011010111011000010100110", 
    14 => "1001010011110011011001100000100", 
    15 => "1001100000111000100101100100011", 
    16 => "1100010110010100010100111111100", 
    17 => "1100111101100100111001010101101", 
    18 => "1110111011111011001001110011010", 
    19 => "1100010110011101111000101010001", 
    20 => "1001100001110010010101110110010", 
    21 => "1010001110111000110010000011101", 
    22 => "1011000100101001011110010100111", 
    23 => "1000010111001010111000000100001", 
    24 => "1000010010111110000110111101011", 
    25 => "1110110010100010111001000010111", 
    26 => "1101100111010110000110101100000", 
    27 => "1101111000001100011111000110001", 
    28 => "1100100000101110110000001101000", 
    29 => "1110001000110000110010111000011", 
    30 => "1100101111110001000110001000110", 
    31 => "1100010100011001010101010101101", 
    32 => "1001100001111111011100011111000", 
    33 => "1011011101110101000111100111100", 
    34 => "1001010011101011110100001100001", 
    35 => "1100100100001100110110010110100", 
    36 => "1000110101100001000011000110110", 
    37 => "1010001100101000100100001111101", 
    38 => "1001100100010011110010010011000", 
    39 => "1001000011111111111101110111011", 
    40 => "1100000010111000101101100111100", 
    41 => "1011010111101101001000100101010", 
    42 => "1010000011110110000110001010101", 
    43 => "1100011001111001111110011110111", 
    44 => "1100011110010111110010110001101", 
    45 => "1101101011011001111010001001001", 
    46 => "1011010100111110011100101111000", 
    47 => "1101011110111111111111110100011" );


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

entity QuantAct_m_10 is
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

architecture arch of QuantAct_m_10 is
    component QuantAct_m_10_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_10_rom_U :  component QuantAct_m_10_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


