-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ReadA113128_weights_0_0_14_rom is 
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


architecture rtl of ReadA113128_weights_0_0_14_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00001011111110001110001011111100", 
    1 => "00110001111101101111111010111000", 
    2 => "00101011000001011101111100011110", 
    3 => "00000110111010101111011100001000", 
    4 => "00010101111011010010110011101000", 
    5 => "00011010000110000011011000000101", 
    6 => "11000001000010001100101001100001", 
    7 => "11101010000011100000001100101011", 
    8 => "00100000110001110001101100000011", 
    9 => "11111110001001111110111111111000", 
    10 => "00000010000100100000001100000101", 
    11 => "00100010111010011110000111011000", 
    12 => "11100011111100100000101000011011", 
    13 => "00010111000111110010100000011110", 
    14 => "11110110000100101101110111001001", 
    15 => "00000010000110011110101000001001", 
    16 => "00010000110110001110100101100011", 
    17 => "00000001001011100100011000000011", 
    18 => "11101101000110000000001000010011", 
    19 => "00111010110011101010000111111110", 
    20 => "00010001111100011100100011110101", 
    21 => "00010011000011110001001100010001", 
    22 => "00011010000000010010101101000011", 
    23 => "00010111111010100001000111010110", 
    24 => "11110010000011111110110011101001", 
    25 => "11110000000101001111010100000001", 
    26 => "01011110000100101111100100101001", 
    27 => "00101011110111010000011000000101", 
    28 => "00001010000000000001100111001101", 
    29 => "00001001001001110010111100010011", 
    30 => "00000001111001011110100100101001", 
    31 => "11110010111100001110010000100000", 
    32 => "11111011000100010010100100010101", 
    33 => "01000001000000000001100000001101", 
    34 => "11010111000101010010010110011011", 
    35 => "11010101000101101111101111111110", 
    36 => "00011110111010101111110101100010", 
    37 => "00001101111110010001011000100111", 
    38 => "00100011110001011101110111110001", 
    39 => "11010000000111011111101000010101", 
    40 => "00100011000011100001111011100000", 
    41 => "11101110111101100011010110110001", 
    42 => "00110010000110010000101100110110", 
    43 => "00001110001000010001100111011110", 
    44 => "11001100000110011111000111111100", 
    45 => "00100000111111001111000100010011", 
    46 => "00011100111011100000101000011100", 
    47 => "00010000000010001110110011101011", 
    48 => "00101000101011010011011000000010", 
    49 => "00101110000001111111100111101010", 
    50 => "11101001000001010011010011110110", 
    51 => "11101011111101111110101111011011", 
    52 => "00000000001000111111111111101011", 
    53 => "00110001111011010000111111110011", 
    54 => "00000001110111100010001000010001", 
    55 => "00001000000011000010110111110110", 
    56 => "10110100001100001111010011101101", 
    57 => "00010110000110101110111001010001", 
    58 => "11001010001001101101001000010110", 
    59 => "11100110111011000011100000001100", 
    60 => "00010100001101000000000111001010", 
    61 => "11001000000101010100000011101111", 
    62 => "00100101110010001111001111000111", 
    63 => "00010000111111100001100011100100", 
    64 => "11110000000001100001011010111001", 
    65 => "00010011000000110001011111110101", 
    66 => "11010101000011011101000100010000", 
    67 => "00011111111001011111101100010001", 
    68 => "11111000111000001111101011010100", 
    69 => "11110011111111100001001011111100", 
    70 => "00110011101100010010000000101000", 
    71 => "00010111111001101110111111010101", 
    72 => "11100011000011101110100111111100", 
    73 => "00000110111101110010111111011110", 
    74 => "00000000111111101111100111111100", 
    75 => "11101111000001101111011000010011", 
    76 => "00010100000100111110110100101011", 
    77 => "00001110111010111110010100000111", 
    78 => "00101000111101101111000000100000", 
    79 => "11110010111110000000011000000011", 
    80 => "11100100111100011111000011110101", 
    81 => "00100001000100111110100000100010", 
    82 => "10111101111001111101001000010000", 
    83 => "00000110111001001110101011100101", 
    84 => "11100001111011011110111100011011", 
    85 => "00010000000011111100100011111101", 
    86 => "11100000001001100000000011110101", 
    87 => "11001000000101011100111000101010", 
    88 => "11000011111101100000010110111110", 
    89 => "11111111111011001110011011110001", 
    90 => "11011011110111110000101011110100", 
    91 => "00001001000001110001100111001001", 
    92 => "00001011000010111110111111101001", 
    93 => "00110000111100100100100011110000", 
    94 => "00001001000001011111010011101111", 
    95 => "00000111111111011100100100111011", 
    96 => "00010100000110111101110100010011", 
    97 => "11011100000010000001001001000010", 
    98 => "11011101000110010011101111010111", 
    99 => "11100101111011110010000011101101", 
    100 => "00000010000111101110111011011111", 
    101 => "11101000111001100100011000000010", 
    102 => "11101000111011110000100011110100", 
    103 => "11111000001010011111010000000100", 
    104 => "00010001111010100100111100100001", 
    105 => "11111011111110010010100111111001", 
    106 => "01011110111100110010001011101010", 
    107 => "11011111110100111111010000011001", 
    108 => "11111000111110000000011011101010", 
    109 => "11001011001001011101010100001110", 
    110 => "11110111000001010000010100011100", 
    111 => "11111101000100011111100011110011", 
    112 => "11101001001101101101101101001010", 
    113 => "11101101000010010010010111111011", 
    114 => "11101100000000110011010111010111", 
    115 => "11111010011101100100011100001111", 
    116 => "11110101111100001110101100110111", 
    117 => "00000101110110100000001000010110", 
    118 => "11110110110101010001010100110111", 
    119 => "11111111000010100001110100000001", 
    120 => "00001010111110111110111000100110", 
    121 => "11110101111110011111001111110110", 
    122 => "00001000000010011110110100110101", 
    123 => "00001000000011010010100000000001", 
    124 => "00011000001111010001100100001010", 
    125 => "00010110111101000010001100100110", 
    126 => "00000111110100111110100000101011", 
    127 => "11110010111100000000001000010011", 
    128 => "11110101000011111110011100001010", 
    129 => "01000000110100010101000111010001", 
    130 => "00100100111000001100001111110010", 
    131 => "00001011001101110001010101100110", 
    132 => "00001110111101100010011000001100", 
    133 => "11111110111011110001100000010001", 
    134 => "00010001111111110000100011111001", 
    135 => "11101111111110101101111100001010", 
    136 => "00011101111010110001101100101011", 
    137 => "00100010111000001110100000100100", 
    138 => "00100110000011110011010100010111", 
    139 => "10111001111101101101111000001110", 
    140 => "11101101101100110101010011100000", 
    141 => "00011101101001000000111100100100", 
    142 => "00001000000101110001000111101110", 
    143 => "00101000001011011111000000000010", 
    144 => "11100111000110100000100100010110", 
    145 => "00010011000011000000101000001001", 
    146 => "00010001000110100001100111100011", 
    147 => "11110101110111011011111000010001", 
    148 => "00100010010101110000010011000101", 
    149 => "00011001111111110010110000101001", 
    150 => "00001111111100001111001111001110", 
    151 => "00001000010000001110010011100111", 
    152 => "00011011000101100000111111101010", 
    153 => "00001011111000100001100100000111", 
    154 => "00100010000100011100100011110101", 
    155 => "10101000000110110001011000001010", 
    156 => "00011011111001001110101111100000", 
    157 => "01010011000001110001000011001000", 
    158 => "11111000010011101111000100010100", 
    159 => "01000010000011011100000100010000", 
    160 => "00001101000111001111011011100011", 
    161 => "11011101001000011111000011000011", 
    162 => "00100111110011111111101000100001", 
    163 => "00000000111101010001010000000100", 
    164 => "00100011111011111111100011001100", 
    165 => "00001010110111110010001111101101", 
    166 => "01010010101110010100001111011000", 
    167 => "00100011111000111101101011110000", 
    168 => "00000101111101110000010000001011", 
    169 => "00000010110111011101110000000010", 
    170 => "11101111111100011011100000001110", 
    171 => "11100010001101100001000100010101", 
    172 => "11001010110101111110110100000011", 
    173 => "11100110111011000010101100011000", 
    174 => "00101001101111001101010000000011", 
    175 => "00000110000010011101001000011111", 
    176 => "00111110111011011111110011100001", 
    177 => "01001000111011001100011011100001", 
    178 => "11011101000000010001011100101011", 
    179 => "11111101111110111101101100010101", 
    180 => "11110010110101110100011000010101", 
    181 => "00011001001011101110101000011001", 
    182 => "11100100001100000001010000011110", 
    183 => "00000101001101100001100000100100", 
    184 => "11110011000111001110001000010100", 
    185 => "00010011000001010000110000100101", 
    186 => "11100100111000010001111011100111", 
    187 => "00011000000100000101011000000010", 
    188 => "00000110001011010010110111101100", 
    189 => "00010011101100110011000011000100", 
    190 => "00000010110111000001101011110010", 
    191 => "00001110000001010001011000001000", 
    192 => "00101100001011001110110111111100", 
    193 => "00010000000011100001110111111000", 
    194 => "00100101111100100100010000000001", 
    195 => "11100101010100001110101011111010", 
    196 => "11110000000110111011111100011101", 
    197 => "11100101101111001110110011111111", 
    198 => "11011000001010001110010011110011", 
    199 => "00011100000010000101011111100101", 
    200 => "11111011010100100010111000001100", 
    201 => "11110001111100010001100111111100", 
    202 => "11001000000011101110000000000111", 
    203 => "00100010001000110001101001000001", 
    204 => "00001101000101111110110011110001", 
    205 => "00100011000010001110000111111100", 
    206 => "00011000001011001111010001001111", 
    207 => "00010110111011011110101010111011", 
    208 => "00100110111010110001011011100000", 
    209 => "11011110000010010001010011101111", 
    210 => "11111110111000011011010111010110", 
    211 => "00000100111101110011000011110110", 
    212 => "11100100001010011011001110111011", 
    213 => "11111001110110110010011011010111", 
    214 => "00011011110101111110001111111101", 
    215 => "00010111000001101111000011000011", 
    216 => "00101100111000100010111000001010", 
    217 => "00010001111010000011110011111100", 
    218 => "11110101111010110100101011011100", 
    219 => "00000000001101111111111100110100", 
    220 => "00101100000001110010110000010010", 
    221 => "11011001001010110001100000101010", 
    222 => "11101110111001100000000000100011", 
    223 => "11111111001100011111010000000101", 
    224 => "11010011000011111011011000101000", 
    225 => "11010010000001100001001111110100", 
    226 => "00010010000010010001101011111011", 
    227 => "00110000111000101110101100110100", 
    228 => "00000010111000100000100100110110", 
    229 => "00001110001100010000100111110101", 
    230 => "11111001111100101100100111110010", 
    231 => "00001000111010001101001100100010", 
    232 => "11010110000001111110111011100110", 
    233 => "00010101111011011110111100000001", 
    234 => "11010111111011100011010011110001", 
    235 => "00010000111110011111001001001001", 
    236 => "10110110000010000001110100010100", 
    237 => "11111101000110010100110011000110", 
    238 => "11111011111011111101101110101110", 
    239 => "11001011000001111110001011010000", 
    240 => "11100000000101011111100100011010", 
    241 => "00001011110101011111110100001010", 
    242 => "00011001110101101110011011101011", 
    243 => "00011111111110110010000100010100", 
    244 => "00010111111100111101101000000100", 
    245 => "11100011111000001111010111101100", 
    246 => "01001001000011010010110111101001", 
    247 => "00000001111100010000100111000101", 
    248 => "11111010000001011110101000000100", 
    249 => "00100010000001111111010011111100", 
    250 => "11111110000001000001110011011100", 
    251 => "00010100111100000010111000011010", 
    252 => "11110110000101011110110100000011", 
    253 => "11110010001100100001100000000000", 
    254 => "11110111000101000001000100001001", 
    255 => "11110100111101010000101011011011", 
    256 => "11110110111011011100110100111001", 
    257 => "00000110111010110011100000010011", 
    258 => "11001001000100011111010011110100", 
    259 => "00001001111000110000001011011000", 
    260 => "11110111000100000011001100011001", 
    261 => "00101100000000011110101000101010", 
    262 => "01100001110111110000001001101100", 
    263 => "11101110111000000001000111100000", 
    264 => "11110100000000100000010111011110", 
    265 => "11110000001010000011001111110011", 
    266 => "00100011111101000001111011000111", 
    267 => "00100110000100010000010100010101", 
    268 => "11111100000011100001010110110101", 
    269 => "00011100000001000000001110111110", 
    270 => "11101100111110000000000011110100", 
    271 => "00010010000001010000011100101010", 
    272 => "11110000111111101111001000011001", 
    273 => "00001110000110111111010111101001", 
    274 => "00010001111101001110000001001111", 
    275 => "11111000000100011100111111111010", 
    276 => "00000000111111001110111010100000", 
    277 => "00011010000011110000100111111000", 
    278 => "11111010111000011011011010110110", 
    279 => "00010000111010001101110011111100", 
    280 => "00000101000101101101111010100000", 
    281 => "00001101111110110001010011101011", 
    282 => "00100001111011101111111011110111", 
    283 => "00010011000001110001011100100100", 
    284 => "11011011110000110001011001100011", 
    285 => "00101000110111001111000000000010", 
    286 => "11111111111110000000000100010001", 
    287 => "00001111110101000001111011110010", 
    288 => "00011110111010000000010011010010", 
    289 => "00011111111001001111111011100101", 
    290 => "00011011000000011111010111000100", 
    291 => "11111010000100011011111100101110", 
    292 => "11011000000010110000100101010110", 
    293 => "00001111111100000100100111101011", 
    294 => "00001110110101110000000001100011", 
    295 => "11110011110111000000101111111010", 
    296 => "11101000001111111110111100000000", 
    297 => "00010000110110111110010100001110", 
    298 => "00000101111111110000100101101001", 
    299 => "00011010111101110010001100011011", 
    300 => "11110100111100100000010100000101", 
    301 => "00001111000110100100001000000010", 
    302 => "00011101110110011110100000011110", 
    303 => "00001010111111001101000100101001", 
    304 => "00011110000110000010001001001011", 
    305 => "11100100110011110000001111011101", 
    306 => "00001100000000101101111110011110", 
    307 => "11011010110110010010011011111011", 
    308 => "11111101000010101101001111001111", 
    309 => "11010110111111001101101111000111", 
    310 => "11011101111011000000100001101101", 
    311 => "00001100001011100010100111011000", 
    312 => "00001111111010000000110101110100", 
    313 => "00010011000000100001010111110101", 
    314 => "00101100111101001101101101011110", 
    315 => "11010001110111001110011000100001", 
    316 => "00100001111110100000000111000110", 
    317 => "00100110000111111110011100001001", 
    318 => "00010011001010011101110100000101", 
    319 => "11110101000100000000000100000100", 
    320 => "11110100000011011110100100001100", 
    321 => "11111001110101010000001111100101", 
    322 => "00001101101110110100000000011001", 
    323 => "00100111000000110001111010111100", 
    324 => "00001100000001010000000111000101", 
    325 => "00010100000011100001111111001111", 
    326 => "00010110000100001111011000001000", 
    327 => "00001111110001100000000100001010", 
    328 => "00011100111010010010111111001001", 
    329 => "11100000000011111111011011011100", 
    330 => "10110110111111000001010000100100", 
    331 => "11000000111110001111000111100100", 
    332 => "11011101010000110001010100011011", 
    333 => "01100011000000001101001000110000", 
    334 => "00000001000010000000001011110111", 
    335 => "11100110001011111110111111100111", 
    336 => "11011100000111110010011010100111", 
    337 => "11110110000011000001010111100101", 
    338 => "00000010000000010000000011001100", 
    339 => "11101100111101001111100100001101", 
    340 => "11110100000110011101001011000011", 
    341 => "11100111111000111110110000010000", 
    342 => "01010101001000010001010011111010", 
    343 => "00010011111011111100110101000000", 
    344 => "11011010111111011100110011101111", 
    345 => "11101100111011011100110100011111", 
    346 => "11101010000101100000110011100110", 
    347 => "00101000111100110001100000100101", 
    348 => "11111101000011001111101000010001", 
    349 => "11101011111011101111011011100101", 
    350 => "11010010111101111100101100010000", 
    351 => "00100111001000101111000111100100", 
    352 => "11110001001001000001010000000110", 
    353 => "00010000111010111111000000101000", 
    354 => "00010000000110101111110100000100", 
    355 => "00001001111110000010100100001101", 
    356 => "00010110000100101100001111011101", 
    357 => "11110101111111111100101000111110", 
    358 => "11100111111110001110100001011000", 
    359 => "11101011001010001100010011111001", 
    360 => "11001011110111111001010011001100", 
    361 => "00000110000101100010001000111100", 
    362 => "00011001001010100000100101001100", 
    363 => "00000010111100001110101100001001", 
    364 => "11001100000000000001000100111101", 
    365 => "11011110111111001111010100001101", 
    366 => "00101011111100100000001001000001", 
    367 => "00010011000011110001110000111110", 
    368 => "01000010110101010001010100100001", 
    369 => "11111000001010110000000100101001", 
    370 => "01000010110010001111010000101101", 
    371 => "00010110111100011111011100010110", 
    372 => "11100110111101010010111101111110", 
    373 => "11011011110101000001001100000001", 
    374 => "00011110111110110010010000010100", 
    375 => "10111110000001101111110011010010", 
    376 => "11101101111110000000110110010110", 
    377 => "00000000111110100000001100001001", 
    378 => "00000100000110101110011100000111", 
    379 => "00001100000010011111001100011010", 
    380 => "00110010111011010011001100100110", 
    381 => "01100001001110000011110000100110", 
    382 => "11110001000011011111010111111111", 
    383 => "00011001000110000000101111100000", 
    384 => "11010111111000110000100011101100", 
    385 => "00010101111110111010111100010001", 
    386 => "01000011010001000010100100010000", 
    387 => "00001111000001100000101100101010", 
    388 => "11000101001001010000001110111110", 
    389 => "00001111001001111101011000010110", 
    390 => "11111110111101110000111100010011", 
    391 => "11101110001001001101110011101100", 
    392 => "00101110110110001010100011110100", 
    393 => "11100110001110100001011011001101", 
    394 => "00001011001010111101110111111001", 
    395 => "11110101000110101111111000001111", 
    396 => "00011100110011010000100000100010", 
    397 => "11101101111010110000011011101111", 
    398 => "11110101110111001111010000000000", 
    399 => "00011100110101001110100011010110", 
    400 => "11111000110101101110011000101010", 
    401 => "11101111000100110010100100010000", 
    402 => "00111011000110000010001000001011", 
    403 => "10110011001100011110111111110010", 
    404 => "00011111111000101111101100001100", 
    405 => "00100101110100011101111011100000", 
    406 => "11000001001010111111111111111110", 
    407 => "11111011000001111001111100000011", 
    408 => "00001011000000000001101000100010", 
    409 => "00011011110101010100011010110010", 
    410 => "00100111110111000001001000100000", 
    411 => "11111110110101100001000101011001", 
    412 => "01000110111001111101101000001010", 
    413 => "01100001111000101111011111110111", 
    414 => "00000101111101110001010001000111", 
    415 => "00000011111110101101100011101011", 
    416 => "11111000000010100011010111011101", 
    417 => "00001100001000011110010000011000", 
    418 => "00011001111010011110011100000100", 
    419 => "01000011000000001111001100010100", 
    420 => "00000010110011101101110000011110", 
    421 => "00001111001010111010110011110110", 
    422 => "11100111001110011111110111010010", 
    423 => "11100100000011001111110000101011", 
    424 => "11010110001010000000110111100011", 
    425 => "00001110111011010010010111011010", 
    426 => "11101001010111011111110011100101", 
    427 => "11100110110100100001010011101010", 
    428 => "11011100000110110010011100001010", 
    429 => "00110010111011101110010011110101", 
    430 => "11100100000100000000110010010000", 
    431 => "11100101111110100001011100001011", 
    432 => "11110000001001110010001111011101", 
    433 => "00100111001000011111010110110010", 
    434 => "00000110000101110100100111110010", 
    435 => "11011100101110111110010100010000", 
    436 => "11101010000001010001101011111101", 
    437 => "00010000000000111100110100110100", 
    438 => "11100000001000110000101101000011", 
    439 => "11011001000000100011101111101011", 
    440 => "10110010010001001111101111100010", 
    441 => "11101111111010011101110100001111", 
    442 => "11101000110111100100110111010111", 
    443 => "11110110111101001110100011000100", 
    444 => "11111001101101010000011100011101", 
    445 => "00001100000001101101100011100000", 
    446 => "00001000000101001101111111100110", 
    447 => "00001000111010011110101000100110", 
    448 => "00000111111111111110011100000100", 
    449 => "11111001111100110000011111101011", 
    450 => "11100100000001010000011100000110", 
    451 => "00000001000011001111010100100001", 
    452 => "11110110000111010001101111101011", 
    453 => "11101011111110110000101100100100", 
    454 => "11101100000100010001000000010100", 
    455 => "11101110000000001100100100010101", 
    456 => "11111100111001100000110000000100", 
    457 => "11110010111101011110011111101010", 
    458 => "11111100001010011111101000011000", 
    459 => "11111010000000000000001000011111", 
    460 => "11101011110111010000011000010111", 
    461 => "11101010000010111111110100010111", 
    462 => "11101011000000010000110111100001", 
    463 => "11101111111011111111011111110100", 
    464 => "11111001111111010000100000000000", 
    465 => "00000011111110000010000000110010", 
    466 => "11001100001000000010000100000100", 
    467 => "00100101000001010000010111100100", 
    468 => "11101011000011000001101011011101", 
    469 => "11101010000100000100111100100101", 
    470 => "00011010000011101111100100100110", 
    471 => "00000110000100101100011100100010", 
    472 => "00001000000111001101010100011010", 
    473 => "00001100110111111111110111100110", 
    474 => "11111100000001000000010111011101", 
    475 => "00100101111111100001000111101100", 
    476 => "00001101111110011111100111111110", 
    477 => "00100011000001111101111011110110", 
    478 => "11010001001100100001000111101100", 
    479 => "00100000000100000000000111111100", 
    480 => "00010001111100011111001000010001", 
    481 => "00001100111111011101111100001010", 
    482 => "00000100111011111111010011110011", 
    483 => "11111011000010111101100011010010", 
    484 => "11101010111110000010011000001100", 
    485 => "11011110111110000011101100001010", 
    486 => "11111101000100111110010000100101", 
    487 => "11100101110011010100000111100000", 
    488 => "11111001000001110000100011101111", 
    489 => "00000011111101110000000100010000", 
    490 => "00110011110111001110001100110010", 
    491 => "11110101001000110100110011111111", 
    492 => "00101000110110101111011100001100", 
    493 => "11001001000101010011111000000000", 
    494 => "11101110000011010010101111101001", 
    495 => "11110000111111001101000110111010", 
    496 => "00001011111011000000000100001011", 
    497 => "00000110000100001110111011010000", 
    498 => "00000101111110100000101111011011", 
    499 => "10101110110001111100110100100011", 
    500 => "00011011001100011111101000011100", 
    501 => "11111100000100011101001111110110", 
    502 => "00100100000010100000011000001101", 
    503 => "11110111110101011111010100010011", 
    504 => "00110011111111000001001111110101", 
    505 => "11011011001010100000100111001111", 
    506 => "00100001000011001110110100110010", 
    507 => "00000000111010111111000000001100", 
    508 => "11100111111101001111111111101010", 
    509 => "11101011111110000000110111001010", 
    510 => "00001011111011001111000000011101", 
    511 => "00000100001001100001011100000010", 
    512 => "11011011000011101111110011100100", 
    513 => "00000010000001001111100000010000", 
    514 => "11111000000001111110000111010110", 
    515 => "11101101000010011111011111110111", 
    516 => "00000011000011100010001100111010", 
    517 => "11010011110111001101101100110110", 
    518 => "01010100000001001111001111100111", 
    519 => "00100011000001010000100100000101", 
    520 => "00101100111101000000010100110101", 
    521 => "11011010000001010001110011100101", 
    522 => "11110010111100000000001011011110", 
    523 => "11100000001000000010101100001010", 
    524 => "11010110000111010000010100010000", 
    525 => "11100010000000001111010000010000", 
    526 => "00010010000001111100100011101100", 
    527 => "11101010000010010000011100000000", 
    528 => "11111001001100010000001100011101", 
    529 => "11110010111011111101011000010010", 
    530 => "00101100000110001111110000100101", 
    531 => "11100011111011111110011100000011", 
    532 => "00000111000001000010000000010111", 
    533 => "11010111000000101011111100000110", 
    534 => "00011101000000011111001011011011", 
    535 => "00100010111101110000001011100111", 
    536 => "00100100111101000000100100110110", 
    537 => "11001111111000000001000011111111", 
    538 => "01000101000100101111000000100010", 
    539 => "00000110000101001110001100010011", 
    540 => "00110111110000011110010011101101", 
    541 => "11010101000000001111111100011110", 
    542 => "10100011000011011110111000000010", 
    543 => "00000000111100011100101111011100", 
    544 => "00100001111001010000000100110110", 
    545 => "11101111111111001101101111101011", 
    546 => "00111100000010101110100011110100", 
    547 => "00001000000010010010000111100111", 
    548 => "00000001111011000010010100001010", 
    549 => "00100111000001010001000111111101", 
    550 => "11010110111110111110110000010100", 
    551 => "00001000000101111101011100001111", 
    552 => "11010011111100001011101011101110", 
    553 => "00010101111000010001010000100000", 
    554 => "00100000001011010000111000011000", 
    555 => "11100100000010001101111000010000", 
    556 => "11110000111111001111011000011011", 
    557 => "11100011000010110001101111110111", 
    558 => "11110111000011001110000111000010", 
    559 => "11111111111101010000000011011111", 
    560 => "00100111111111101101111111001101", 
    561 => "11111011111001110000110000000100", 
    562 => "01010011000100111111111011111000", 
    563 => "11111101111010010010011100110001", 
    564 => "00001000111110001110110111110110", 
    565 => "11000010111101110001000111011010", 
    566 => "11011110000101101100111100100110", 
    567 => "01000001000100111111101111110101", 
    568 => "11110101000000111110110101011001", 
    569 => "11110010000000000100001000001101", 
    570 => "00000111000001100000011000001011", 
    571 => "00011000000000110000010011110001", 
    572 => "01001111110110000000000000101110", 
    573 => "00011010001000100001100000110011", 
    574 => "00001010000110001111010100110001", 
    575 => "00100111000111100000011001000001", 
    576 => "00000110111101111010111111101010", 
    577 => "11111011111000010001000100010101", 
    578 => "00101000001010110001110000001011", 
    579 => "11100101111110100000100111110110", 
    580 => "11010000110110111110010000011001", 
    581 => "11110011111111011011100100101001", 
    582 => "11101100111111110110111001000010", 
    583 => "11011011111100000010011100010010", 
    584 => "00100010000000001110110000001101", 
    585 => "11110011000001110000110111010101", 
    586 => "11111111111110100011000000101110", 
    587 => "01000001110101010000101001000000", 
    588 => "00010101000010011011000110111111", 
    589 => "11110110000000010100000000000001", 
    590 => "10110000110110001011000000000000", 
    591 => "00001100001001010001101110111011", 
    592 => "01011110000001010100011111110000", 
    593 => "10100010010000100100100110100001", 
    594 => "01010010110111110001000010011011", 
    595 => "00010000001001011101101111110000", 
    596 => "11100001000001011111000011000001", 
    597 => "00111100110011100011010111011100", 
    598 => "00011111111000111011011111011001", 
    599 => "00010011000000000000101100100111", 
    600 => "00000100000011001111111110111101", 
    601 => "11101011000111010011110111100101", 
    602 => "00110100000101101111000100001010", 
    603 => "00000100110101110000101000001000", 
    604 => "11101001111101011110101111100011", 
    605 => "00000110111111111110100011100101", 
    606 => "00011110000000100100000011100101", 
    607 => "11111110000101100011010100000010", 
    608 => "11101010000010001100010100000010", 
    609 => "00010010111001001110000011000011", 
    610 => "00011100000111010000111011110111", 
    611 => "11110010000100110000100000101011", 
    612 => "11110011000110001111101000101000", 
    613 => "11110011001000110011001000101101", 
    614 => "11111110001100000001001111011110", 
    615 => "00010001001110110010100110101100", 
    616 => "01100110110110001110101011101001", 
    617 => "00011100110111010001011100010001", 
    618 => "00101001111111111110001011110110", 
    619 => "00010101101111010010001100000000", 
    620 => "11110110111001101111000111110101", 
    621 => "11101110000011100010100100010010", 
    622 => "11100110001101110010100000000110", 
    623 => "11101001000100111101111011101100", 
    624 => "11101010000001011101010100011101", 
    625 => "01010110001011100010000011110100", 
    626 => "00010000000011100000001111101000", 
    627 => "00000011001001001101111100110000", 
    628 => "00101111111000111111010000101110", 
    629 => "10111111001110101000010011100010", 
    630 => "00000010110101101100111011111011", 
    631 => "11010111001011101000110100100110", 
    632 => "11010111000011101111111000011110", 
    633 => "11001101110000101101001110111010", 
    634 => "00110011101010101101111000000000", 
    635 => "00101101000111101111011100101111", 
    636 => "11110010000110010001111011110011", 
    637 => "00000010110111010000001000000110", 
    638 => "00000011111111110011011000100000", 
    639 => "00011010001101101111110011111100", 
    640 => "00011011000011110001101000000001", 
    641 => "00101001111100010000110011111000", 
    642 => "00000100000000001110011011111100", 
    643 => "00100111000010011111000000101001", 
    644 => "00010110000011010001111100011110", 
    645 => "11100010101111101111010100011000", 
    646 => "00000111001101110000110011101001", 
    647 => "00101110111000010100011111111001", 
    648 => "11010110111111001110100100110011", 
    649 => "00001101001001101111000000001000", 
    650 => "00010110000001110001010100010011", 
    651 => "00001001000011100001100100000110", 
    652 => "11011110110101101100010000110010", 
    653 => "11110010000010000000010111111011", 
    654 => "00101100110101111111111100010011", 
    655 => "11010000111111111111110000000000", 
    656 => "11100010111001100010100011111000", 
    657 => "11111110111001011111001100010000", 
    658 => "00000000110101000001100011110000", 
    659 => "00000010111100101111000111000111", 
    660 => "00010101000110010001001111101001", 
    661 => "00110001111101010001001011111101", 
    662 => "11110111000001001101011111011111", 
    663 => "11111101010111001111010100100001", 
    664 => "00100100000001011101000100011110", 
    665 => "11001000011001000100000000011111", 
    666 => "11101110000100011101010100000110", 
    667 => "00010111000110001111000000001111", 
    668 => "11111010000000000000010100010000", 
    669 => "00101110111100101110001100000010", 
    670 => "01010011110110100001011011100010", 
    671 => "00000110000010010011001011001011", 
    672 => "00111001000101010000000000101010", 
    673 => "00101101000111000001100000010100", 
    674 => "11110000000010101111010011111100", 
    675 => "00000100111100001111111011111001", 
    676 => "11100010000110001100101100011010", 
    677 => "11111000001101100001001111110100", 
    678 => "00101100111100000001100111111111", 
    679 => "11110001111010110001101011001011", 
    680 => "11111001000110110000000000100000", 
    681 => "00010010110111100010011100010111", 
    682 => "00011011111100111101001100100001", 
    683 => "11111101111101110011000101001101", 
    684 => "00101101110111011111000000101001", 
    685 => "00010101000111000001010000011010", 
    686 => "00001011001111100001100000000101", 
    687 => "11110111111000110010110000000100", 
    688 => "11111000000010101011010111100011", 
    689 => "11111011000001011110111000001101", 
    690 => "00000011001010100001100011110101", 
    691 => "11011100111111000011011100100011", 
    692 => "11110101111110010000101011101100", 
    693 => "00001111000011011101111011011111", 
    694 => "00011000111001011011010100100110", 
    695 => "00000100110101010000110100011000", 
    696 => "00100100001111000001011100100101", 
    697 => "11110010111110100000100100000000", 
    698 => "11110001111010011110111000010000", 
    699 => "00010010000111111101101000000001", 
    700 => "00100010000111110010010111111110", 
    701 => "00000001110101010000101100100110", 
    702 => "11100010000011000000010011011010", 
    703 => "11011010000100000010000100000000", 
    704 => "00110011110010001111001000000000", 
    705 => "00101010000010010000111000000101", 
    706 => "00010001000101011111111010101110", 
    707 => "00100101111010110000100011111010", 
    708 => "11010100111111100000011100001111", 
    709 => "11110010000100100001110100010001", 
    710 => "11111100111010100010000011110001", 
    711 => "00001101001111100010100000100101", 
    712 => "00000111111110111111100011101111", 
    713 => "00010011111011000000100111111101", 
    714 => "00001001111010100011111100010100", 
    715 => "00110001111111010000100011011100", 
    716 => "00010100000111100010001011100111", 
    717 => "00010111111100100010001100001010", 
    718 => "11000001111010000000100011000001", 
    719 => "11101100001011010010011111011010", 
    720 => "11001010000001111100101100111111", 
    721 => "11001000001101000000101100001101", 
    722 => "00010111101010101110100000110101", 
    723 => "11001111110010010001011011100111", 
    724 => "00001011000001001101111011011010", 
    725 => "00100001000010111101011100010101", 
    726 => "00101000001111100100001011010110", 
    727 => "11100101111000010010010000101111", 
    728 => "00000010000110001111100111111010", 
    729 => "00011010000000011101101000001001", 
    730 => "11001110001001000001000000001010", 
    731 => "11111111110100001011110011001111", 
    732 => "00100110000100110010010100000011", 
    733 => "11100101000000010001100011111011", 
    734 => "00110101000000010000000000110101", 
    735 => "11000101111010101100011111011000", 
    736 => "11111110001000101111100011000110", 
    737 => "00000110000010001111110000101000", 
    738 => "00101001000110111110101001001000", 
    739 => "00010100110101011110011111100100", 
    740 => "00001011000101111111010011110100", 
    741 => "11011101111101111111100000000100", 
    742 => "11111011110010001111010000000100", 
    743 => "11100110000011101101110100000100", 
    744 => "11001111110101000001111000000101", 
    745 => "11110111010000010000101011110100", 
    746 => "00100000110111111110010111110011", 
    747 => "11110111000011110000000011010110", 
    748 => "00100111110101100010100000110111", 
    749 => "00010010001000111101011100000001", 
    750 => "11010011000101000000000111111111", 
    751 => "11101010001101111110111100011111", 
    752 => "10111000000101101110111100000110", 
    753 => "11001101111010011011000011110001", 
    754 => "00111011001000011101100111010101", 
    755 => "11010100000010101100011100101000", 
    756 => "11000100000111011101001111100001", 
    757 => "11011000110101001111100111010101", 
    758 => "00101001010000000001110110110110", 
    759 => "00011010000101100101000011110100", 
    760 => "00010010010011100010111101100011", 
    761 => "00001001000010111111001000000101", 
    762 => "00100010000111111110101000001010", 
    763 => "00010010000010000001001000010010", 
    764 => "00010100000101010011011110111101", 
    765 => "00001010111000010010001111010110", 
    766 => "00001110110101111110011011110110", 
    767 => "00000110110111000000000000001001" );

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

entity ReadA113128_weights_0_0_14 is
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

architecture arch of ReadA113128_weights_0_0_14 is
    component ReadA113128_weights_0_0_14_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ReadA113128_weights_0_0_14_rom_U :  component ReadA113128_weights_0_0_14_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

