-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ReadA123138_weights_0_5_23_rom is 
    generic(
             DWIDTH     : integer := 32; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 768
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of ReadA123138_weights_0_5_23_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00010111000001101110011011101110", 
    1 => "11100010000001001111100100001011", 
    2 => "00000011111110100010101100010101", 
    3 => "11110000110111000010010000000110", 
    4 => "00111100001110011111010101001001", 
    5 => "00011010000001011111111110001101", 
    6 => "00001001000110110010110111111110", 
    7 => "11010100000011110000010000000001", 
    8 => "00000101111111111111010000100011", 
    9 => "00100010111111100000110011110111", 
    10 => "11100011000101011101001000100000", 
    11 => "11100100000010101110110100010101", 
    12 => "10101100000111000001110000011001", 
    13 => "00110000000100011101010011110001", 
    14 => "00000111111011001110101000001110", 
    15 => "00100010111100010010110000010101", 
    16 => "11110111001111010000000011101101", 
    17 => "00001001110101000000101000110000", 
    18 => "00010010000001100100110000010010", 
    19 => "11110111001010010001100000110011", 
    20 => "10110111111110110000000011100101", 
    21 => "00000101110111000001001000011111", 
    22 => "00011001111101011100100000000011", 
    23 => "11111000000001011111001011111111", 
    24 => "11111111000000010001000100001001", 
    25 => "00011011110011100000011011010000", 
    26 => "00101011110001101110101010111110", 
    27 => "11110011000111010010001011111000", 
    28 => "00001110111100010001001000000010", 
    29 => "00001111000100111110101000000111", 
    30 => "00111010011000001100110011001110", 
    31 => "00010000000111111110100011101110", 
    32 => "11110100001001010001010101000011", 
    33 => "11100010110000101111011000000011", 
    34 => "11111101000000100001001011110001", 
    35 => "00001010101110000000000000011000", 
    36 => "00000011101101000011010001000101", 
    37 => "00100101111001010000001111101100", 
    38 => "11111000001000000001100000001111", 
    39 => "00010101110101001110111000001011", 
    40 => "10111110010000101001001101001110", 
    41 => "11000000111001110010110100100001", 
    42 => "11101110111010011100101100100101", 
    43 => "00010110000100110011000100010001", 
    44 => "00011100111010110001100111111111", 
    45 => "11101111110100111101010011000110", 
    46 => "00011011111111000011000100011001", 
    47 => "01000110000001101110010100000010", 
    48 => "11001100001100010000100111011110", 
    49 => "00000001000001011101100000001001", 
    50 => "11110000110001110100011101001010", 
    51 => "10111111110011010000010000101101", 
    52 => "11101100000000001100110011001111", 
    53 => "11100011001010110001001100100001", 
    54 => "11010010111001001111011111111010", 
    55 => "11110001111111001111000011100110", 
    56 => "00100011000011111110110111110111", 
    57 => "11111010111011110000010100001110", 
    58 => "00011101111110110010000011011110", 
    59 => "11110011110111011010110000011000", 
    60 => "11110111000010100010100000011100", 
    61 => "11100111111010010000110000001101", 
    62 => "11111111111110000010001000001110", 
    63 => "11010000111011010001110100011100", 
    64 => "11111101110010010001010000111110", 
    65 => "11011110111001001110111011110100", 
    66 => "00011111001001100010001000100101", 
    67 => "11110000110110000000001000000100", 
    68 => "00101000000001111111110000110000", 
    69 => "10111100001100110010001100010001", 
    70 => "10110100000111111101110000110111", 
    71 => "00100000110101111110001000101000", 
    72 => "00011111111111000000100000010011", 
    73 => "00000100110111001111010000011011", 
    74 => "11100110001100000000111100000011", 
    75 => "00101110111100110000001011111101", 
    76 => "00000010001110100000000100000101", 
    77 => "11110110000101010000011011100111", 
    78 => "11011011000001101110101011101000", 
    79 => "11101101110111011111110100000010", 
    80 => "11110101001001001101000101000100", 
    81 => "00010011110110000001011100010011", 
    82 => "00101001001001110001101010111110", 
    83 => "11110111000011100001001100110101", 
    84 => "11100000111111001101001100100010", 
    85 => "00001100110010010000001000101011", 
    86 => "11110100110101010001000100001100", 
    87 => "00010100111100110010110011101101", 
    88 => "00011010111001001011111110110100", 
    89 => "11111110111010111011101001010001", 
    90 => "01000001000101100000000111111001", 
    91 => "00101101110111110011010100000011", 
    92 => "11011000110101011110110100110011", 
    93 => "00011111000101000010110100000101", 
    94 => "11110110010000000000110011100110", 
    95 => "11101101000101010000100000101100", 
    96 => "00011001000110110001011111010101", 
    97 => "00010110000001100000010100000010", 
    98 => "11011111000101001110010011111100", 
    99 => "11110001000111011110001011010100", 
    100 => "11101111110110111011000111101010", 
    101 => "11111110111110010010100011000100", 
    102 => "00010001000000001101101011110101", 
    103 => "11101101111110101111010011101010", 
    104 => "11011100000110011100100111100110", 
    105 => "11011111000110001111001011101010", 
    106 => "11100000000111100010111100011100", 
    107 => "00001011111110011110011100100010", 
    108 => "11111110001100111111001111101011", 
    109 => "00000100001010110010011000001100", 
    110 => "01011010001110010010011110110110", 
    111 => "00000000111110110010011011101001", 
    112 => "11110011000111000101110011110101", 
    113 => "00001000001010100001011111110100", 
    114 => "00001000111011011101110111111001", 
    115 => "11110000000010001111101011011011", 
    116 => "00010111111111101111111100000101", 
    117 => "11001100111110100000011011011111", 
    118 => "11010100001111001110010111111000", 
    119 => "00010111010001100001011100010101", 
    120 => "11101000111001001101001011110001", 
    121 => "00001100010000101110011111010010", 
    122 => "00001001001001000011000111111011", 
    123 => "00000010000000111111101111111010", 
    124 => "00010100110011011110100100011001", 
    125 => "00001011000111010001011011110001", 
    126 => "00000100111111101101001111111111", 
    127 => "00111100000001001111110100010011", 
    128 => "11101000001011011101110011010111", 
    129 => "11011101111110000001001111111100", 
    130 => "00010101000011000010011011110110", 
    131 => "00101100111010110000100011111000", 
    132 => "11000000000101101111001011101011", 
    133 => "10101101111110101111000111100101", 
    134 => "01010101000010110010001100001101", 
    135 => "00100111001000111110001111111011", 
    136 => "00001000000111110011010100000010", 
    137 => "11010000101111101110110011111101", 
    138 => "00000100111000111110010111010110", 
    139 => "00011100000101100000000100011111", 
    140 => "00011010111000011110000100010101", 
    141 => "01000000111111100000000101000100", 
    142 => "11110110110100110011111011000110", 
    143 => "00110100000100011110001100010100", 
    144 => "11001010000011001111001111101011", 
    145 => "00011101110110001111000100010110", 
    146 => "00010001110111111101000100100100", 
    147 => "00010001111101000010010000100011", 
    148 => "11100010111110000101010000101010", 
    149 => "00011110001011001101111111001110", 
    150 => "11101100010010100011010100010110", 
    151 => "01101100001000001111001101110101", 
    152 => "00011100000001110011001000011001", 
    153 => "00011111001000010001010011110011", 
    154 => "11111101001000101111100111111001", 
    155 => "01010101111111110001010000011000", 
    156 => "00000110111110001110110000000001", 
    157 => "00010100111101101110010100001001", 
    158 => "00011101000001101101100011111101", 
    159 => "00001011000001111111110100001101", 
    160 => "00001111111001000001010100101000", 
    161 => "00100001111100001101110111101110", 
    162 => "00001101111001010100100100110010", 
    163 => "00001110110101001110000111010100", 
    164 => "00001011111000000010101000001011", 
    165 => "11110000110010001110100000000100", 
    166 => "11111100000011110000100000010001", 
    167 => "11110110110001101101110011011000", 
    168 => "00011000110100110001001100011101", 
    169 => "11110011010000111110101100010001", 
    170 => "00100000001100101101110100001111", 
    171 => "10101010111101110001110011101110", 
    172 => "00010001111011001111100100101100", 
    173 => "00111111110110001100001000000110", 
    174 => "00011111000001000001011111101111", 
    175 => "11011111000000001110001000010110", 
    176 => "11111111101110100001001100001001", 
    177 => "11011100111011110011011011010101", 
    178 => "11101101110001111111100111101010", 
    179 => "11100111001000110001000111101100", 
    180 => "00010101000011010001001111110001", 
    181 => "00010001111011101110110011101110", 
    182 => "00010111010000100001001100110001", 
    183 => "00101101110101110000100000001110", 
    184 => "11110111100101100010001100010001", 
    185 => "11000010110001100001111000110100", 
    186 => "11010110111111010000100010101001", 
    187 => "11110010000000100000000111001001", 
    188 => "11011101110001001111111111011100", 
    189 => "00100011010000011101011011101000", 
    190 => "11010111111101010001110100100001", 
    191 => "11110101111111011111011000001100", 
    192 => "00001111111001101110100000011011", 
    193 => "00000110000101111111001111100100", 
    194 => "00101101111001010010100111110001", 
    195 => "11011110000110101111111100001011", 
    196 => "11011100001111111110000100100011", 
    197 => "00010010000000000001101100011000", 
    198 => "11101100000111000000001111101101", 
    199 => "11110100001101110001001001010111", 
    200 => "00011001111100001101101111101011", 
    201 => "11110101111000000010001000001001", 
    202 => "00001101010010000000111100011010", 
    203 => "11100001110010011101110000010101", 
    204 => "10101000110011100000010100100001", 
    205 => "00111100111101111111110111111110", 
    206 => "00011110101010111110000011111001", 
    207 => "00100111000001101111000011110100", 
    208 => "10100011000011101101101111011000", 
    209 => "00010100111100000000110111111110", 
    210 => "11001000111011100000101100010000", 
    211 => "00010101111110011111010111111110", 
    212 => "00100010110111101001100011111111", 
    213 => "11111001111100101110000100101000", 
    214 => "11111100001000110000110111100000", 
    215 => "11100010000011001110100011111001", 
    216 => "00110101111001101111101011001110", 
    217 => "11111001111110011110001011011101", 
    218 => "00100010111000100000000000110100", 
    219 => "11101000111100101110001011110000", 
    220 => "00001011000001001100011011010011", 
    221 => "11100000111110000000011111010010", 
    222 => "00001001001101101111111111111000", 
    223 => "00000010000011010011011011100001", 
    224 => "11010101111110001101010000010001", 
    225 => "00101000001000101111011111110110", 
    226 => "00001110110111100101011011100001", 
    227 => "11100100001101100001111011101100", 
    228 => "11100100111101101111100011101010", 
    229 => "11010111000001010001100111101011", 
    230 => "11111000001010011110010111100000", 
    231 => "11100011001101001111111000011011", 
    232 => "11101101000101101110110100110001", 
    233 => "11101101001010001111111100010001", 
    234 => "00001010000010110001000100001010", 
    235 => "00000000111010010001011011101111", 
    236 => "11110010111101011111110001001101", 
    237 => "00011110000110110010011000010000", 
    238 => "11110111111001101101101011010001", 
    239 => "11010001101100001011111011011100", 
    240 => "11100111111010000001100100101100", 
    241 => "00000011110101010001110011101001", 
    242 => "00001100110111010010000100000111", 
    243 => "11110110000001001111111100000111", 
    244 => "00111010111110000000011000011111", 
    245 => "00010010001000110100001111101001", 
    246 => "00001000110001001100101111011110", 
    247 => "11111101111001000000100111100000", 
    248 => "00101001111110011111011111101001", 
    249 => "11001011000010110000001000000011", 
    250 => "11010001111101000011110011100111", 
    251 => "00001001111011001111010110111110", 
    252 => "11111101111010110001101011100011", 
    253 => "00000101000011110000101000000011", 
    254 => "11111100000001111110001111111101", 
    255 => "00111011110100001110010011101001", 
    256 => "11101010111111100001110011011001", 
    257 => "11100010111011001111111000011110", 
    258 => "11101001110001101111110000100001", 
    259 => "11100110110111100000000011110000", 
    260 => "11101010110100000010011011110100", 
    261 => "11110111000000110001000000000111", 
    262 => "00100100111100010010000100101001", 
    263 => "11110001111010100000101011101011", 
    264 => "00000011111100101111110100110110", 
    265 => "11111000001000100001011100000101", 
    266 => "00011110000001101110010100010000", 
    267 => "11100010111010100001000100010000", 
    268 => "00001110111101111110010011101100", 
    269 => "11111101000111011111000110111010", 
    270 => "00110111111010000011000011110001", 
    271 => "11100110001000110000100011100011", 
    272 => "00001101110000110001000011110101", 
    273 => "11110100111110100010010000100110", 
    274 => "00001011111101101111001011111110", 
    275 => "11101000111100101111110011010001", 
    276 => "11110011000110001111111011111101", 
    277 => "00000011001000011111100000010110", 
    278 => "00010000001001111111010111101100", 
    279 => "00000010111111111111101100000110", 
    280 => "00100010111101011111101000000001", 
    281 => "00000111111101111111011011110110", 
    282 => "11101111111011110011000011111000", 
    283 => "11110101111101110001101011110000", 
    284 => "11111111111001101101011000101011", 
    285 => "11111110111010001111100111011100", 
    286 => "00000101001111101111100100001101", 
    287 => "11101111000001010000011000010001", 
    288 => "11111011001010010001001000101001", 
    289 => "11011110110000011111110111111000", 
    290 => "11100001101111011111010111111001", 
    291 => "00001101111010100001011111110111", 
    292 => "11011010000111000000101111110111", 
    293 => "00010000111001111101011100101100", 
    294 => "11100011110111010100000011111101", 
    295 => "00001111110100110001011000001011", 
    296 => "11100011001100000000001100011000", 
    297 => "11110001000100001110011100101001", 
    298 => "11011011111110110010001011101000", 
    299 => "00011101000001001110110111101110", 
    300 => "00101010000101000000111000110110", 
    301 => "00000111111001110001000111010110", 
    302 => "11111001000101010000101100000001", 
    303 => "11101100111111001110001011111100", 
    304 => "00010100111101011110011000000001", 
    305 => "00000100000100111111101100000001", 
    306 => "00010010110010001111110000100011", 
    307 => "00010000001000100010101100000011", 
    308 => "00000110110111001110010111100111", 
    309 => "00001011111011111111110111100011", 
    310 => "11001010001101100100000000100100", 
    311 => "00001010111010001110101011111100", 
    312 => "11000101111101001111101000100001", 
    313 => "11100001001000011111001000111110", 
    314 => "00000000010000110000001011110001", 
    315 => "00110011001001100010000111111111", 
    316 => "00011000111111010000000111011111", 
    317 => "11111011001100100000000000000111", 
    318 => "00001011110000011101110011010111", 
    319 => "00001100001101111110111111101111", 
    320 => "11010000000101011111111100100110", 
    321 => "11101110000101101110110111111111", 
    322 => "00000101111011100010001011000110", 
    323 => "01010111111000011101011011010010", 
    324 => "11110111111101001110101000011000", 
    325 => "11111110111010110001110011111010", 
    326 => "00001111010000110011111111100100", 
    327 => "11111011111000000010010100000010", 
    328 => "11100010111100011111010111011100", 
    329 => "00101000010000100011111000000011", 
    330 => "11100010111000000000111011101101", 
    331 => "10111000001100001110011111110000", 
    332 => "00100000000110100000111000001100", 
    333 => "00111110000001100001001100100110", 
    334 => "00001000111100011101101000011100", 
    335 => "00110100000000011111110000111100", 
    336 => "00000110111110111111011110111101", 
    337 => "11110100000110111111101111001010", 
    338 => "10110101000100101100110011110000", 
    339 => "00001000001011011111111100000110", 
    340 => "11101011111110110000011011011100", 
    341 => "00110111111111000000101111011111", 
    342 => "10111100000110010000001100111000", 
    343 => "11100011001010000101011011100111", 
    344 => "01010101010011010000000000010001", 
    345 => "00001100110001001111011011100111", 
    346 => "00001011110011000000011000111001", 
    347 => "00000111111111101111001000101101", 
    348 => "00001011000001110000111011011000", 
    349 => "00011111000001011110010011100111", 
    350 => "00000101000010110000110100101111", 
    351 => "00100101101111010001100011110000", 
    352 => "11010000111000101111101100000110", 
    353 => "10111111111001101101100111110011", 
    354 => "11101111000100011110100100010010", 
    355 => "00011010001100011110011011111111", 
    356 => "00100000111101110001010011010100", 
    357 => "11111110110111101100110111011000", 
    358 => "00001001000000100001001100010000", 
    359 => "11011101101011000001001000001101", 
    360 => "00110100111101100000101011001011", 
    361 => "11110000111101101111011000011010", 
    362 => "11101101000101000000000011011000", 
    363 => "11010000000011100011011100001100", 
    364 => "11101111000010101110100100010001", 
    365 => "11111110111010000010001001010111", 
    366 => "11011101110101110001000011110010", 
    367 => "11111110001011010001000111001111", 
    368 => "11100000000011111110111011110011", 
    369 => "00011000001100101110000000000110", 
    370 => "00100100111111100000001000011001", 
    371 => "11111011100111100100100111000110", 
    372 => "11100001111001111100110000011100", 
    373 => "00001000001110100001111000011111", 
    374 => "11001001001011010101001100001111", 
    375 => "11110100001000110011010111101101", 
    376 => "00100110111101111111101011101100", 
    377 => "11110110000010110001111000000101", 
    378 => "00000110111011001110001111101111", 
    379 => "00110100111010110010011111110100", 
    380 => "00011110000100101111100000101110", 
    381 => "00101011111000100001110111011010", 
    382 => "11000111000100011111111010110100", 
    383 => "00001000111011110001001010100110", 
    384 => "11010111101101010001101101011011", 
    385 => "11111111000000011101111000011011", 
    386 => "11001111110110011011111000111000", 
    387 => "11100010111101011101010100100101", 
    388 => "11011011111010000000000100100101", 
    389 => "11011000001000001111111100111011", 
    390 => "11111110001001101101111000101100", 
    391 => "00000001001001001111011000001000", 
    392 => "11001011111010101111011111110000", 
    393 => "11101101101110001101001000100100", 
    394 => "00000100110010110000011011100101", 
    395 => "01100000000011001110011111101110", 
    396 => "00101010000101000000001001001111", 
    397 => "11111010111100100010010000011110", 
    398 => "11010100111101011110100100010110", 
    399 => "11101001010000000000001111100111", 
    400 => "11010001110010110010110100000000", 
    401 => "11111011111101000000101100101100", 
    402 => "11111011110011111110011011001001", 
    403 => "00010011111110010010101111110101", 
    404 => "00101011001000101111101000100000", 
    405 => "00011100000001101111000111101011", 
    406 => "00010001000100000001011100000101", 
    407 => "11101001000011101101000001010111", 
    408 => "11111100111111010001111000011111", 
    409 => "00100111111110110000111000001111", 
    410 => "00010001000001101111110111101100", 
    411 => "11101001000001100001010111001001", 
    412 => "11011111111011110011000111101010", 
    413 => "11111000000111001111111100111101", 
    414 => "11010000010001110001111011011110", 
    415 => "11100011000111001111010111011011", 
    416 => "00100000000010000001001000100111", 
    417 => "00001111000000111110111111011000", 
    418 => "00000000111110111111001100010011", 
    419 => "01111001000001010000101100001111", 
    420 => "10111001001100000011111111011101", 
    421 => "11111110000011101110000011000011", 
    422 => "11011110110101000000110000101100", 
    423 => "11101101010101100000011100010011", 
    424 => "00001001110111111100111011000010", 
    425 => "00101011000110100000101000010101", 
    426 => "00000011000111010011110111101110", 
    427 => "11111110111100101111101000000111", 
    428 => "00000100111100010000001011011110", 
    429 => "00011100000110001111000100100110", 
    430 => "11111001101101001111010111101011", 
    431 => "11001010111111111111011000000000", 
    432 => "00101000110000100000100001000111", 
    433 => "11000101000010010001100011101110", 
    434 => "00011011111000110000101100101010", 
    435 => "00111000110101010100111111110011", 
    436 => "11111111111111111110111011000100", 
    437 => "11111010111110111101010000000110", 
    438 => "11010100001001000100110100100010", 
    439 => "11111000000010110010000111110111", 
    440 => "00001111000100100001101111110111", 
    441 => "11001000111010001101100101000010", 
    442 => "00000111000101011111000111000111", 
    443 => "00000110000010111101000100001110", 
    444 => "00010100000010110011000000001010", 
    445 => "00001001000111010000100011110011", 
    446 => "00000001000101001010100000110010", 
    447 => "11000010000100000001000101000111", 
    448 => "00001110000011001101000000010000", 
    449 => "00100000111100000000101000000100", 
    450 => "11111011000100111011010000001110", 
    451 => "11001100110100111111101000100111", 
    452 => "00010001000001110001000000000001", 
    453 => "11101111111111100010100011110011", 
    454 => "00000010110111001111010011111101", 
    455 => "11110111101111111110010100010001", 
    456 => "00011011000100001101111111010010", 
    457 => "00101111111000011111001111101110", 
    458 => "11111110000001110000001000011110", 
    459 => "11101110111111010000000111110110", 
    460 => "00110100000010111111111011011000", 
    461 => "11111010001100000011110111101110", 
    462 => "11111100110100111101101000011000", 
    463 => "00101101000110100000001111100111", 
    464 => "00010001000001100000101000011000", 
    465 => "00010110000101010000000100100101", 
    466 => "11111010111110101110110111100110", 
    467 => "11101011000110101111010100001010", 
    468 => "00001111110111000000000100000100", 
    469 => "11110010110001001101001100110010", 
    470 => "00100010111111100000000011110000", 
    471 => "11100111110101010000001111101011", 
    472 => "00001000000010111110011011101010", 
    473 => "11111011111011010000101111110100", 
    474 => "11111110000110110010001111110001", 
    475 => "00001011110101101101011000000000", 
    476 => "00000101111000011111111011111110", 
    477 => "11110011000001010001010000011000", 
    478 => "11010001000000011110001111111111", 
    479 => "11111100111101101101011011011101", 
    480 => "00011000000000010000101100010000", 
    481 => "00011100111100101111110100001101", 
    482 => "00001100111010110001101111110000", 
    483 => "11101100111111011111111000100101", 
    484 => "11101111001110011110011100000111", 
    485 => "00000000111001101111101000010110", 
    486 => "00010101110110011111100111111010", 
    487 => "10010100000100010010010011110101", 
    488 => "11111111000011111100100111001111", 
    489 => "00010110001001100011000011011011", 
    490 => "00101111110101010000100000000101", 
    491 => "11111001000010101110000111111101", 
    492 => "00011011111111111111111100000010", 
    493 => "11110101111111010000100100000100", 
    494 => "11110011110111001110010111001000", 
    495 => "11110110000010110001110100111100", 
    496 => "11110010111101111111101100000111", 
    497 => "00001111110110100000010011100110", 
    498 => "11110110111010111110001100001010", 
    499 => "00101111111010010000000011011111", 
    500 => "11101111111011101111010011111100", 
    501 => "11110011000010000000000100001000", 
    502 => "01000111101111111111111011100110", 
    503 => "00000110001000111101101100100100", 
    504 => "00001110000111010000101011100111", 
    505 => "11111101000101111101101111101111", 
    506 => "00011000111111111111100011111011", 
    507 => "11111101111010100000110111111000", 
    508 => "11101100101010111111001100010010", 
    509 => "00100011111111000000110111011001", 
    510 => "11101001000011111111111111111101", 
    511 => "00001000001010101110111011101001", 
    512 => "10111010111011010000010100110011", 
    513 => "11101000110111110001101000010000", 
    514 => "10111101110111110111111011101101", 
    515 => "11111001110111001110111011110011", 
    516 => "00001000000000110000010000001101", 
    517 => "00101011111001111110011111111000", 
    518 => "00000111110101111101011000101111", 
    519 => "00100101001001110000011100010010", 
    520 => "11101000111101011101110111011010", 
    521 => "00101100111110010000111011110000", 
    522 => "11100010110101001111100000001011", 
    523 => "11100101111101011111001111111010", 
    524 => "01011001011000001101011100001010", 
    525 => "11001011001110000000010011100100", 
    526 => "11111010110100110011001111011100", 
    527 => "11101001001011100001011100111101", 
    528 => "11011011110101110001111111110111", 
    529 => "00010001111000001111111111111011", 
    530 => "00010101000110110000000000010010", 
    531 => "11111111110100001110000100000010", 
    532 => "00001111111010001101001011110011", 
    533 => "11100101000100010000001011011010", 
    534 => "11111111000110111111000011111100", 
    535 => "00000100111010110010111000001001", 
    536 => "11111001111010111111100000001011", 
    537 => "11110111000000011110010011011000", 
    538 => "11011010000110000010010000110110", 
    539 => "11101110111011100000110110100010", 
    540 => "11101001000000010000100000100011", 
    541 => "11101000111100010010111111111001", 
    542 => "00000011110111110000001100011011", 
    543 => "11101110000010110000011000000010", 
    544 => "11101101101110011111010011010000", 
    545 => "11110101111111010000010000010010", 
    546 => "11110111111100110010111011011111", 
    547 => "00001010110110000000111011100101", 
    548 => "00011110111110111100010011101011", 
    549 => "11111111111100000010010011010011", 
    550 => "00011101001101100000100100101111", 
    551 => "11110010111010100010010011101111", 
    552 => "00010011110110010001100011100100", 
    553 => "11111100001001010000001000001010", 
    554 => "00001110111011111101000111001010", 
    555 => "00011000110011010000111011100101", 
    556 => "11101000000100100100010000010100", 
    557 => "00011010001100001101100100000110", 
    558 => "00010001001100111111010100000010", 
    559 => "00001110110110010001101011101001", 
    560 => "11100010110111010001000111001001", 
    561 => "11101011110111010001000011101000", 
    562 => "00111000010100101111111000111010", 
    563 => "11110111001000110010000011110110", 
    564 => "11100011111011001110011000010110", 
    565 => "00100011000010111110101000000111", 
    566 => "00010101101110100010100111111011", 
    567 => "00001111001000001111100111110011", 
    568 => "11011010101111101100101100110001", 
    569 => "10111101110111010000100011101010", 
    570 => "00011101110010101101101000101001", 
    571 => "00000100000100000000101100010001", 
    572 => "11010101000110110000100100101111", 
    573 => "00000010110001110001110000100100", 
    574 => "00000101110110000000100100001101", 
    575 => "00010110000100010011000000000001", 
    576 => "00100010111001111110111100110001", 
    577 => "00110011000010100011000000000000", 
    578 => "11110101110101110001010100000000", 
    579 => "11110001000101100010100111101110", 
    580 => "11100010001010000001001100001001", 
    581 => "11110100111100111111010111110001", 
    582 => "11001111111001001111010000101010", 
    583 => "11011001000101110001100000001010", 
    584 => "00000011001010011111000000101000", 
    585 => "11111000011000010001111010101000", 
    586 => "10110011111100010000001011011100", 
    587 => "11101110111011110001111000001010", 
    588 => "11000101011000010001011000111110", 
    589 => "11001011010001001110111000110001", 
    590 => "00011100001011100100001000011001", 
    591 => "11001000001110101111000111111010", 
    592 => "00011010111011011111000000001011", 
    593 => "11010001000110101111110111111111", 
    594 => "00010011101011100001000101010111", 
    595 => "11101110110001110100111100000000", 
    596 => "11100110101010000001101100010100", 
    597 => "01011010110011110000000000011000", 
    598 => "00001110111000101100011100101011", 
    599 => "00110000111010001111111111101010", 
    600 => "00000011110100110010010111101110", 
    601 => "00001110111000110001101000010100", 
    602 => "00011110111010101100011111001000", 
    603 => "00010110110111100000111111101001", 
    604 => "11111101000001110100100000001011", 
    605 => "00000111001010010001111111010110", 
    606 => "11011111111101010001111100100000", 
    607 => "00000011000011010100001100001010", 
    608 => "11010110010010100000101000110001", 
    609 => "11111010001000100101100100101010", 
    610 => "11011111000001110000101100010010", 
    611 => "00010000110010010001100111011010", 
    612 => "00010011111110100000110001111110", 
    613 => "11101010000101000001011000011001", 
    614 => "11101001110110110000000100100111", 
    615 => "00111101110101001111100100101110", 
    616 => "00001000110001101110010100111010", 
    617 => "10111100111010000010110011110101", 
    618 => "00010100000110011100111011110101", 
    619 => "11011011000110101111100000011011", 
    620 => "11110111101111111111001100001000", 
    621 => "11011110111001101011101000011000", 
    622 => "10010001110100000001000000100111", 
    623 => "11111110000001010010010111100000", 
    624 => "11010100000011101100000011011001", 
    625 => "00011010000111101100000011110011", 
    626 => "11101111000101001110010100101011", 
    627 => "11110111110100101101100111101111", 
    628 => "11110111000110111101100000111001", 
    629 => "11100010101111101001101111100010", 
    630 => "00000011000001100010111111100100", 
    631 => "00010110001011101011000100001000", 
    632 => "00101100111111011110100000001001", 
    633 => "11101010111010000100101011000100", 
    634 => "11011001111011010001101100010001", 
    635 => "00110110111001110010011000001100", 
    636 => "00000000101001110000110111000001", 
    637 => "00000011000010010011011111100101", 
    638 => "00100010111010000001000111010010", 
    639 => "11111110111100010011011000100010", 
    640 => "11011111110001001111010001010010", 
    641 => "11110110000011001100110111110010", 
    642 => "00000111110101011110100011111110", 
    643 => "11111000111100101111000000000111", 
    644 => "11111101000000010001000000110001", 
    645 => "00000100000101001110101011110110", 
    646 => "10101001000111101110101011111010", 
    647 => "00011011111011001111110011011111", 
    648 => "00010011000011110001110100100010", 
    649 => "00100010001001100000010000001101", 
    650 => "11001111000101101111010100010110", 
    651 => "11100000111101010000000000011010", 
    652 => "00000000000011011110011011101110", 
    653 => "00000000110100001110111111011111", 
    654 => "00010011000001001110011011101110", 
    655 => "00100100111110000000110100010001", 
    656 => "00010000000001101110101100110010", 
    657 => "11101011110101101111101000010001", 
    658 => "11110000110101000001000000000110", 
    659 => "00001010000101000000001100001011", 
    660 => "11001010000101001111010000000100", 
    661 => "00001110000000010000111100010101", 
    662 => "00011000111110111110100111111011", 
    663 => "11100110111000111110001000000011", 
    664 => "00010110110011011101111100010110", 
    665 => "11111100000010001100110011101111", 
    666 => "00011010111000011111111100010101", 
    667 => "11111001000111001111010100100111", 
    668 => "11110101001110001110011100001011", 
    669 => "11111101111111111110011000101110", 
    670 => "00011010010001111111110000001000", 
    671 => "00100101111111100011110000110011", 
    672 => "00010110000110100010001011100101", 
    673 => "00100001111110111111100111100100", 
    674 => "00011001110101000000010111110100", 
    675 => "11101010111110110000100000001101", 
    676 => "00000011110111001100101011010101", 
    677 => "00011111000001000001001011110110", 
    678 => "00001001111111000000010011101111", 
    679 => "00101101001000111101011100001101", 
    680 => "01101000001100001111000000010101", 
    681 => "00000100111101101111000011111011", 
    682 => "00000000000011110001011111011100", 
    683 => "00010001110101101111110000100100", 
    684 => "11101111110011101101110011100011", 
    685 => "11100011111111010000011111101010", 
    686 => "11011011110101000000111100010010", 
    687 => "00001110110100101110100100001110", 
    688 => "11111011111111000000100011101111", 
    689 => "11110001001000010000001100001101", 
    690 => "00010011000001010010100011100101", 
    691 => "11110111000111111110100000001001", 
    692 => "11011000001001000011011011011101", 
    693 => "00111110111001111111111011011010", 
    694 => "11110010001100100001000000000000", 
    695 => "11011111111000001111010111111101", 
    696 => "00001101010100000000000111100010", 
    697 => "00000110000101100001000000001001", 
    698 => "11011110110110001111011100101010", 
    699 => "11110110001000111110111011110010", 
    700 => "11101011000000110000000111111111", 
    701 => "00100100010000011110000100010110", 
    702 => "00010010111100000010001011110110", 
    703 => "11111010111111010000010000001000", 
    704 => "11101010011000111110110111110000", 
    705 => "01000100010000000011000000010001", 
    706 => "11110100000010000001001000100010", 
    707 => "11010111000010101100101111100101", 
    708 => "11100000000110110000001100010101", 
    709 => "11101010111001100010000100101110", 
    710 => "11111000001011111011101011101110", 
    711 => "00001101001111110000010111010100", 
    712 => "00101011001111001110010100101010", 
    713 => "00001000000010001111110000011011", 
    714 => "00001000110010011101111000011000", 
    715 => "11100101111110011111101101001111", 
    716 => "01000001000111110010000111100000", 
    717 => "11010001110000011111110000000110", 
    718 => "00001001110110010000101100010000", 
    719 => "11100110111101111111001011110001", 
    720 => "11011000111010111100111011101100", 
    721 => "11111000000010010011100000110101", 
    722 => "11100111001000010001010111110110", 
    723 => "00001110111011111101110011111100", 
    724 => "00001100000000100000010100100011", 
    725 => "00001000000010000001001111101100", 
    726 => "11010100111100100011011011001100", 
    727 => "11011001000010111111101011100101", 
    728 => "00101001101101011011111111001000", 
    729 => "00010101111110011111010100010111", 
    730 => "11011110000111101110110100001100", 
    731 => "11111111110011110001110000111101", 
    732 => "00101001000010110000011100010001", 
    733 => "00101101000011111100101000100011", 
    734 => "11111101001000100000111100010110", 
    735 => "00000111111110110100001011111001", 
    736 => "00011000101110101010101111001101", 
    737 => "00011010111110000011010000100011", 
    738 => "00000100000001100001111100011010", 
    739 => "11110110001010111101000111111011", 
    740 => "11111110110111001111101100010010", 
    741 => "11001101001001011110100000011001", 
    742 => "00001101111100011110101011010111", 
    743 => "00010011001100111111001011111011", 
    744 => "01000100000001011111111110101110", 
    745 => "00010110000100011110000011100000", 
    746 => "11110111111011110000000000011111", 
    747 => "11100100111000111110111011110000", 
    748 => "00000010111101111111110111010010", 
    749 => "11101011110101101110011010111010", 
    750 => "00000010000100110001011111101110", 
    751 => "10110101000010110000010011111100", 
    752 => "11100100111000110000100011011100", 
    753 => "11101001000100101111111111000110", 
    754 => "00011111000011001111010000111101", 
    755 => "11100101111110110001100111001001", 
    756 => "00011000000000110011001011110101", 
    757 => "00100100110101100000111100001101", 
    758 => "11011110111101011111001011101001", 
    759 => "00001001111101010011101100000110", 
    760 => "00001111001101100001110011101111", 
    761 => "00101111110100000001001111010010", 
    762 => "00001011110111011101111011101011", 
    763 => "00111010111001101110000011110010", 
    764 => "11100010000010001110011100000100", 
    765 => "11010111111001101111100111111110", 
    766 => "00101000111111011111100100101111", 
    767 => "00110110000011001101111100011010" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "auto";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "hls_ultra";

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

entity ReadA123138_weights_0_5_23 is
    generic (
        DataWidth : INTEGER := 32;
        AddressRange : INTEGER := 768;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of ReadA123138_weights_0_5_23 is
    component ReadA123138_weights_0_5_23_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ReadA123138_weights_0_5_23_rom_U :  component ReadA123138_weights_0_5_23_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

