-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity QuantAct_m_9_rom is 
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


architecture rtl of QuantAct_m_9_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1111110110000010110110110010110", 
    1 => "1100011001111011011111111111111", 
    2 => "1101111010000110110111011101101", 
    3 => "1110001101000110011111000101110", 
    4 => "1101001111101011011000100010101", 
    5 => "1110100001110110011111101110000", 
    6 => "1111010000001011110111010000011", 
    7 => "1110010110000100111111011001111", 
    8 => "1001000001000000011010011010101", 
    9 => "1001100001011100100010101010011", 
    10 => "1001111011110101010100001111010", 
    11 => "1000101001000001110111100100101", 
    12 => "1001011010011011001100110010100", 
    13 => "1000100100100111010111101100011", 
    14 => "1010010101101010000111100101110", 
    15 => "1001111111111110011001011101111", 
    16 => "1101010000010101011101011001010", 
    17 => "1110100000001101010100000000101", 
    18 => "1101110010100111010111111001111", 
    19 => "1101000010100011101010001111001", 
    20 => "1110110010100000000100011011100", 
    21 => "1000101011010011111000001001001", 
    22 => "1000100111010010101001100111011", 
    23 => "1001110001000011011000101111011", 
    24 => "1100111111101110011000111100110", 
    25 => "1111011100010100110111010010111", 
    26 => "1110010000111000111001001010111", 
    27 => "1111001110010010010000000100100", 
    28 => "1001001111000001011111011010110", 
    29 => "1101011111010010101111011010000", 
    30 => "1100100001101110000011001101101", 
    31 => "1100011000111110000110001111110", 
    32 => "1001010010001111011001010110101", 
    33 => "1011110110011001001111001001011", 
    34 => "1000101111101100000010010110110", 
    35 => "1000110011011100100000101000011", 
    36 => "1111110001111011001001110000001", 
    37 => "1001011000010001110100100001101", 
    38 => "1000100100001111000100011000101", 
    39 => "1110101001100100101100001111001", 
    40 => "1001000100100000001110011000000", 
    41 => "1000111110001100101100001100110", 
    42 => "1000100011110011100010111000011", 
    43 => "1100011101011010010100100000001", 
    44 => "1010101111110001111011011111010", 
    45 => "1101000100011111011011010110111", 
    46 => "1001011100101011011111111110010", 
    47 => "1010100100001000001000011001111" );


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

entity QuantAct_m_9 is
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

architecture arch of QuantAct_m_9 is
    component QuantAct_m_9_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    QuantAct_m_9_rom_U :  component QuantAct_m_9_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


