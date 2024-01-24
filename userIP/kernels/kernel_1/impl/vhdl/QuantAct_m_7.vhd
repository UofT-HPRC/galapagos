-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_7_rom is 
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


architecture rtl of QuantAct_m_7_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1000111001010000100110001010100", 
    1 => "1111101101000000000100010011100", 
    2 => "1101110111100000001011001110001", 
    3 => "1001010101100000110001011101010", 
    4 => "1110101101111001010010111010010", 
    5 => "1111010011011001110001011110011", 
    6 => "1101011100100000001000110101111", 
    7 => "1101011001111100001110000110110", 
    8 => "1000001100000010100011001110010", 
    9 => "1111100001100001100001111111100", 
    10 => "1010010010011100011000000111001", 
    11 => "1111001100011110001010110001010", 
    12 => "1001010101000010111110101010101", 
    13 => "1011000011011010010010010100110", 
    14 => "1000011111011101100100110111010", 
    15 => "1000011110111100011011011001100", 
    16 => "1101000000001100010010100001100", 
    17 => "1101101011010100110111111010101", 
    18 => "1100100010110111110010111111000", 
    19 => "1100100100100010010010111011001", 
    20 => "1000110101010011100110110110000", 
    21 => "1000111110100011110111010010100", 
    22 => "1001001011101010001100100011101", 
    23 => "1000011011011101101101000111001", 
    24 => "1000010010101100011101110000001", 
    25 => "1110011101011101100010101000010", 
    26 => "1110110010100100000111111010000", 
    27 => "1001001101101100100010110101011", 
    28 => "1000100101001000101000001110100", 
    29 => "1100100000001110101101110100110", 
    30 => "1101001000011000100101111001100", 
    31 => "1011011011010101110001011011011", 
    32 => "1100011101111101111000101110010", 
    33 => "1101000010001011011001100111010", 
    34 => "1011010110000110110100010100010", 
    35 => "1001100001011000101101100110011", 
    36 => "1010011100010100101011110100000", 
    37 => "1101100000111111111011011110111", 
    38 => "1001010101011000000100101000001", 
    39 => "1001010001101110011011100111100", 
    40 => "1110110100110111101010010001101", 
    41 => "1000100010010001000000110110011", 
    42 => "1000111001110100001101110001101", 
    43 => "1000100110111001000001010111101", 
    44 => "1010011001101000000101011000001", 
    45 => "1011110001110011011100011000001", 
    46 => "1011000001101111111000010100100", 
    47 => "1100110010011101101000111001100" );


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

entity QuantAct_m_7 is
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

architecture arch of QuantAct_m_7 is
    component QuantAct_m_7_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_7_rom_U :  component QuantAct_m_7_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


