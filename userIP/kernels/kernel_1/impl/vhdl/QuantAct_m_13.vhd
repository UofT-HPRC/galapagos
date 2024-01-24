-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_13_rom is 
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


architecture rtl of QuantAct_m_13_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000011000100001111111110110110", 
    1 => "1000010011100101011101011010100", 
    2 => "1101000110010000010001001100001", 
    3 => "1101000110010001111010010101100", 
    4 => "1010110111011101001111101101101", 
    5 => "1111110011010011101000001011011", 
    6 => "1000111100100110001010101001100", 
    7 => "1101001100000011010011000001101", 
    8 => "1110110001110111100000001111101", 
    9 => "1101000111110101100110001001000", 
    10 => "1001011101111000000000011001110", 
    11 => "1000111001010000011011101101010", 
    12 => "1000110011001001101101100000110", 
    13 => "1001100100011000111110111110110", 
    14 => "1000100001000100111100111101111", 
    15 => "1100100001011000111100011001111", 
    16 => "1100100000111011010000011001100", 
    17 => "1101101111101101110101110110110", 
    18 => "1100111010001101010011010000011", 
    19 => "1110100010001101011111110010010", 
    20 => "1100100011110100110100001001001", 
    21 => "1001101001001000100001110110100", 
    22 => "1001000011001101011111101011111", 
    23 => "1000110000010011111110011001111", 
    24 => "1001011010010110100000000010110", 
    25 => "1000100011100011111011001000010", 
    26 => "1000000110001011011111000010100", 
    27 => "1001001000111001100000000110011", 
    28 => "1110110101010000011011111110000", 
    29 => "1010000111001100101101011111111", 
    30 => "1001110110011110111010000000010", 
    31 => "1110101100010000001111101011101", 
    32 => "1000110011001100011001010111011", 
    33 => "1001000101110011111011100010001", 
    34 => "1000100001001000101110101000110", 
    35 => "1010001011111001100011011000100", 
    36 => "1110111111011001011010111110011", 
    37 => "1001011111111110001111111110110", 
    38 => "1000000111000100100000011001011", 
    39 => "1001110100100110001001101001111", 
    40 => "1000100111100001110001010010010", 
    41 => "1101010000101001011001100101001", 
    42 => "1001000111010100010011111010011", 
    43 => "1000000100100100101010100011010", 
    44 => "1011010110000001100110110010001", 
    45 => "1100100111111010110000101100000", 
    46 => "1101110000110101101110010110001", 
    47 => "1110011101101011011001010100010" );


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

entity QuantAct_m_13 is
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

architecture arch of QuantAct_m_13 is
    component QuantAct_m_13_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_13_rom_U :  component QuantAct_m_13_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


