-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_5_rom is 
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


architecture rtl of QuantAct_m_5_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1100100011100011001100101000100", 
    1 => "1111100100111110001011101101101", 
    2 => "1110101011000001011101111101111", 
    3 => "1101111110111000111010111000011", 
    4 => "1110111010000000100001000010101", 
    5 => "1101010110101001100110110111000", 
    6 => "1100111100010110110111111101001", 
    7 => "1000110100010001111010110001110", 
    8 => "1000011100111101101001010111011", 
    9 => "1000001110011110001010000000001", 
    10 => "1001110100001111111000100000100", 
    11 => "1001101100010010101010011001101", 
    12 => "1001111000110001010000000011101", 
    13 => "1000010001100010110001100001000", 
    14 => "1001110001110010011101100011110", 
    15 => "1000111000011101011001101000010", 
    16 => "1101110110100000001111110010101", 
    17 => "1110010001010000010111001100101", 
    18 => "1100011101101010010010100101010", 
    19 => "1110001010101110011000001011001", 
    20 => "1000100111100100100001101010011", 
    21 => "1010010011100111001111111101100", 
    22 => "1000101000101111110110110000111", 
    23 => "1000010101010101011111100001011", 
    24 => "1001001010101011011001110001010", 
    25 => "1000010110011101001100101101001", 
    26 => "1110101011000000100011011101010", 
    27 => "1110000000110111011001110101011", 
    28 => "1000000101011100100100111101100", 
    29 => "1000110111101001000111110110000", 
    30 => "1100000000111010010001011111011", 
    31 => "1100011010000001101010010011010", 
    32 => "1001010111001101000011010011101", 
    33 => "1100100101111101001101111100001", 
    34 => "1010101101010100101101100010100", 
    35 => "1011111110110110000001011000111", 
    36 => "1100011100010100001000110101011", 
    37 => "1000010110010111111101100111100", 
    38 => "1001001100011101111001100110010", 
    39 => "1010000110110011010111101000000", 
    40 => "1001111011100110011101111101000", 
    41 => "1011000101110011111100001010111", 
    42 => "1111001011000010101101110101011", 
    43 => "1000001100100100100010110100010", 
    44 => "1101011111101100011001101000011", 
    45 => "1100101010001111011100100011000", 
    46 => "1100100100111001100101000101001", 
    47 => "1100101000110001111011010101001" );


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

entity QuantAct_m_5 is
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

architecture arch of QuantAct_m_5 is
    component QuantAct_m_5_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_5_rom_U :  component QuantAct_m_5_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


