-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_6_rom is 
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


architecture rtl of QuantAct_m_6_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1110110110111110010001100110001", 
    1 => "1101001000110100000100000000110", 
    2 => "1100100001100011111010001111001", 
    3 => "1101011101110010010101000011001", 
    4 => "1110000011110101011100001100010", 
    5 => "1110001011110111111010011000001", 
    6 => "1000101001101111001111001001010", 
    7 => "1000100000100101100010101110011", 
    8 => "1011101100010111010100011000111", 
    9 => "1001000010011011000000101010000", 
    10 => "1110111001101110010001111101011", 
    11 => "1001000101001001010010001110000", 
    12 => "1001000001100110101100100111000", 
    13 => "1001010110000000100001011101101", 
    14 => "1010000101001111101001100011110", 
    15 => "1111000011100100010011001111101", 
    16 => "1100100001100001100100011011100", 
    17 => "1101101000100110001000000111001", 
    18 => "1000001000001001001110101001011", 
    19 => "1110100011001010001110110110110", 
    20 => "1100000101011000100100010011111", 
    21 => "1000110001101000110010101001101", 
    22 => "1000110000110110010101010100011", 
    23 => "1000011001110100110001001110111", 
    24 => "1000101000000011101110111001101", 
    25 => "1010010010001011110100001010000", 
    26 => "1000011001101001011000011010000", 
    27 => "1000101100101110001101000000000", 
    28 => "1100100100000111100001001100000", 
    29 => "1110100001011010111101010111011", 
    30 => "1110011001001101011011011010011", 
    31 => "1100010110000110101011110111111", 
    32 => "1010100011111111101001111111011", 
    33 => "1001101001000110100000011001010", 
    34 => "1100001011110111110101110010001", 
    35 => "1100010111010110111010010011001", 
    36 => "1111011101111110111101110010111", 
    37 => "1010110101101100101011000111111", 
    38 => "1000111101111011000010110110100", 
    39 => "1000010111110111000101110111010", 
    40 => "1000010110100000111001010010011", 
    41 => "1000011000111011101101010101001", 
    42 => "1001001101101100010110000111010", 
    43 => "1000101100010011011100011001010", 
    44 => "1100001011110001000110011101000", 
    45 => "1010011011101111100100011000011", 
    46 => "1100101010010001111100001111110", 
    47 => "1010110110101010001010110011111" );


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

entity QuantAct_m_6 is
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

architecture arch of QuantAct_m_6 is
    component QuantAct_m_6_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_6_rom_U :  component QuantAct_m_6_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


