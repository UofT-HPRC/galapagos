-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_11_rom is 
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


architecture rtl of QuantAct_m_11_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001100111010111101010100110110", 
    1 => "1100011110101101010110101100101", 
    2 => "1100001010110010010100100000111", 
    3 => "1100101100101011010110100011000", 
    4 => "1001100000101110000100010010010", 
    5 => "1101100001100011101001100110001", 
    6 => "1001010000011101001011111001100", 
    7 => "1001001100000011110111000100001", 
    8 => "1010100110110010001110100100111", 
    9 => "1000000111000000001001010001100", 
    10 => "1111101001100010110010011100101", 
    11 => "1001000001110100000101110000101", 
    12 => "1000011011010110001101010011100", 
    13 => "1001000101001101110000110101001", 
    14 => "1000011000010000010000010010100", 
    15 => "1000000111001101111001001011100", 
    16 => "1100111110100011000110001111111", 
    17 => "1101001111100100000111000000100", 
    18 => "1101000111000000000001100010011", 
    19 => "1100110011000100001001010111011", 
    20 => "1011001011010000011000001110100", 
    21 => "1001001101001010011101110111101", 
    22 => "1001010010111111001000000000011", 
    23 => "1001110110000000110101001000000", 
    24 => "1000111110010000101010110111110", 
    25 => "1001110010010001000000000111100", 
    26 => "1000100111011010100010101110001", 
    27 => "1111011101000101110011011001010", 
    28 => "1100100001000011010010100011000", 
    29 => "1010101100110101110011001111010", 
    30 => "1010101001101000000001011111111", 
    31 => "1010011100101000101001101100100", 
    32 => "1010010000011111100010100101101", 
    33 => "1001011110001010101111111111011", 
    34 => "1100100010111101110111111010101", 
    35 => "1001110110100100000110001000000", 
    36 => "1100010101000011101010100101011", 
    37 => "1010000000001011110101100101100", 
    38 => "1001010100001010001000100111011", 
    39 => "1010010110111010100011110111011", 
    40 => "1000000000001111101111111100101", 
    41 => "1100100011100001110101100100111", 
    42 => "1000001011001011101001010000011", 
    43 => "1000100010111000100001000011101", 
    44 => "1001111111100011011101110101101", 
    45 => "1011101111101110111001111001111", 
    46 => "1010010110111001000110100101110", 
    47 => "1100101010001010011011001010110" );


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

entity QuantAct_m_11 is
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

architecture arch of QuantAct_m_11 is
    component QuantAct_m_11_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_11_rom_U :  component QuantAct_m_11_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


