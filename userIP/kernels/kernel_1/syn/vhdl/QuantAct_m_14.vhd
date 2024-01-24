-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_14_rom is 
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


architecture rtl of QuantAct_m_14_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1110100011000110111100010001110", 
    1 => "1111000011000011010111110001010", 
    2 => "1111001110001110111101011111100", 
    3 => "1100110100111110011000101100000", 
    4 => "1010011100101100011111010100101", 
    5 => "1001110101111101000000010110001", 
    6 => "1100110110000000101110101110110", 
    7 => "1101111100111101011000001011010", 
    8 => "1100010000010001110101010011001", 
    9 => "1110100111111011011101001000101", 
    10 => "1111001101101001100111111011011", 
    11 => "1001101000101000001110110011000", 
    12 => "1001110000001100011111100111110", 
    13 => "1001111010010000101001011001110", 
    14 => "1010111000011110100001111010110", 
    15 => "1011010010010000111110111001100", 
    16 => "1100100110011111000000010000000", 
    17 => "1101110010001011100010010101001", 
    18 => "1101110011010111001101000011101", 
    19 => "1101011101100111111101011000000", 
    20 => "1010011010011011101000110011101", 
    21 => "1010100010100001110010001010010", 
    22 => "1000000001011000111111110001111", 
    23 => "1100000100011110010111110001001", 
    24 => "1101111000011101001011100010000", 
    25 => "1101110111010100101001110001100", 
    26 => "1010010000100011001101011110011", 
    27 => "1000100011100010010101010111111", 
    28 => "1100011110011110000110101100001", 
    29 => "1101000101100000111001101101110", 
    30 => "1000110100110110000111010001101", 
    31 => "1101110011010000000110010001000", 
    32 => "1001110101100101011100000110011", 
    33 => "1001111011100010000011100101001", 
    34 => "1100001011101110100111000010010", 
    35 => "1001000010011110011101001000001", 
    36 => "1000010101011000110011100000110", 
    37 => "1000001001000100000011010101000", 
    38 => "1001110111001111011100111100101", 
    39 => "1001101010010000001100001101011", 
    40 => "1111001110110000011111001000000", 
    41 => "1101010010000100000010001110011", 
    42 => "1111001001011011101000000110101", 
    43 => "1001111000000000011011010011101", 
    44 => "1110001101010000000100011100111", 
    45 => "1011000000011111100000110110010", 
    46 => "1010000100010110010001110111111", 
    47 => "1001111110101110011101011010100" );


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

entity QuantAct_m_14 is
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

architecture arch of QuantAct_m_14 is
    component QuantAct_m_14_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_14_rom_U :  component QuantAct_m_14_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


