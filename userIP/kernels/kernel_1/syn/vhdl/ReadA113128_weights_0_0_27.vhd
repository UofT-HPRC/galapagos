-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ReadA113128_weights_0_0_27_rom is 
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


architecture rtl of ReadA113128_weights_0_0_27_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "01000010000111011100011100001101", 
    1 => "11100101000000000000010101001001", 
    2 => "11100001111101010011100000010011", 
    3 => "11110001111110100001101000000111", 
    4 => "11111110001100001101011000011111", 
    5 => "00111111111001010010010011100010", 
    6 => "00000010000000101101111000100000", 
    7 => "11100111111111100000000011111110", 
    8 => "11110011000011001100001111111110", 
    9 => "00001000101101100000101011010111", 
    10 => "11011111111100001111000000010101", 
    11 => "00010110000100111110000011001010", 
    12 => "00111001110101111111100111111111", 
    13 => "11111010111111000001101000000010", 
    14 => "10111110010111010011000000010111", 
    15 => "00100101111110101110001111100011", 
    16 => "00110101000011100011111011011110", 
    17 => "00010110000000101101110000111101", 
    18 => "00100010000000001100110111111100", 
    19 => "11011100111101101110010000001011", 
    20 => "11110000000001100011110100110010", 
    21 => "11100100111110000011011011001101", 
    22 => "11011001001000101100100111111010", 
    23 => "10111110000001011101011010110011", 
    24 => "00000111110111110001001000101111", 
    25 => "11000101000001000100010100111011", 
    26 => "00000100111111000001010001101000", 
    27 => "00011001111101111110110111100111", 
    28 => "00001011111101011110110000010000", 
    29 => "00011101110110000000011100011110", 
    30 => "11110111000010011111101100011111", 
    31 => "00010010000000001100100101001001", 
    32 => "00111000111011000001100000010101", 
    33 => "00000100000010000000100011011110", 
    34 => "00011001111111011110100111100111", 
    35 => "11110001111111010000000011111111", 
    36 => "11011101111000101111100100000111", 
    37 => "00000001111111100011100011100011", 
    38 => "00001000111100110000100100100000", 
    39 => "11100101000000010101000100101000", 
    40 => "11010011001011110010000100001001", 
    41 => "11101010111110111110000111101010", 
    42 => "00000101000010110011110100101010", 
    43 => "00001111000000000010110101101001", 
    44 => "00100110000100100001000011100010", 
    45 => "10111010111110000100010100100111", 
    46 => "11100000110110111111011111111010", 
    47 => "11110100111110001110101011100011", 
    48 => "11111011110111110000001111111100", 
    49 => "00011001000001101110011011101001", 
    50 => "00111110001000010011100011111101", 
    51 => "00010110000100000001110100100011", 
    52 => "10111000110101011111010111010100", 
    53 => "00010010000001111101001000000010", 
    54 => "11110001111101101111010100001000", 
    55 => "00000011000000011101010100011100", 
    56 => "10110100111100111110100011111110", 
    57 => "11101101111111101001100000000101", 
    58 => "00000111111110000000001011110100", 
    59 => "00000010111110100101110111110011", 
    60 => "01010110000100010001001000101001", 
    61 => "11111001111110101111011111110101", 
    62 => "11101110000000000000001111001111", 
    63 => "11111110111111001101101111001010", 
    64 => "11111111111011010001111011110010", 
    65 => "11110100111111100001000100010110", 
    66 => "11011100110111000000111011101001", 
    67 => "00000100111110111111011111011100", 
    68 => "11101111111010010010110100011001", 
    69 => "11100011000010101001001011001000", 
    70 => "00011100111100000010011000001010", 
    71 => "00000011000010011110101111011101", 
    72 => "00000001111111101100110100010011", 
    73 => "00010100000100000000110000011110", 
    74 => "00010100001000000010101111100010", 
    75 => "00011011000010100000110000010101", 
    76 => "11111001111001111101101000100001", 
    77 => "00001001000101101111110111101010", 
    78 => "00000011110101001110000111100011", 
    79 => "11011111000000000010100011111011", 
    80 => "11001001111110101111111011110111", 
    81 => "11000111111100110011011111110011", 
    82 => "00001111001110110001001000000110", 
    83 => "00000001000000100111110011111000", 
    84 => "11101001111011011110001100010010", 
    85 => "00101100000000100001101100000111", 
    86 => "00001101111110101101010011001100", 
    87 => "11110011111101111101111011000101", 
    88 => "00000010000011010011010000011111", 
    89 => "00000010000011110000111011011010", 
    90 => "11100101111100011100110001000000", 
    91 => "11011011000000111110000111000111", 
    92 => "00011101000110101110101000001001", 
    93 => "11101100000001011101011111101101", 
    94 => "11101111001001110011110000001011", 
    95 => "11110101111011010010110100011000", 
    96 => "00010010111100000000000100001100", 
    97 => "11110110111101111100111100001101", 
    98 => "11110111000100001010110010101111", 
    99 => "00001011111100100010010111101011", 
    100 => "00100010111101101111010000010100", 
    101 => "00100000000100101110101100110111", 
    102 => "11010100000100000001110100010111", 
    103 => "00001110001000001111100100010001", 
    104 => "00000001000001000000101111110010", 
    105 => "00001010000011100010011000010110", 
    106 => "00010110111100101110110000010110", 
    107 => "00000100111110011011101000011001", 
    108 => "00000100111011000010000000000110", 
    109 => "11100001111111111011011111110110", 
    110 => "11110110000111010000011111000010", 
    111 => "11100011000010000001010110111100", 
    112 => "11011011001111110000000011110011", 
    113 => "00000100000001000000111011000010", 
    114 => "00000001111110110001010000000011", 
    115 => "11110010000001110001001000001010", 
    116 => "00000011111110000001001100100000", 
    117 => "11110001000010001011111100110010", 
    118 => "00000100110011010001100100001000", 
    119 => "00010001000010111110001001001011", 
    120 => "00011011000000001100001000001111", 
    121 => "11100110000001101111001100001000", 
    122 => "11100011000001001110100011111010", 
    123 => "00000000111100110100100111010011", 
    124 => "11011111000000001101010100110111", 
    125 => "00010100000001001111110011110011", 
    126 => "00000100000010100000011100001101", 
    127 => "00000000000101110001100111010000", 
    128 => "11000111110101101111011111010010", 
    129 => "11100101111101010100000011111000", 
    130 => "00010001111101111111101111000111", 
    131 => "11100011000000111110000000000001", 
    132 => "00011111000001001100101100001111", 
    133 => "00011010110101110010000100001010", 
    134 => "11111001010100101110100111111010", 
    135 => "10111001101110001110100011110111", 
    136 => "11110111000101100000001111111001", 
    137 => "00011010111111001100011000111100", 
    138 => "11100111111010100010010000010101", 
    139 => "11111101010111010010011000000101", 
    140 => "00010100101111110001000101001000", 
    141 => "00010010110100110011100100010110", 
    142 => "11101011111100000010001011100011", 
    143 => "00001000000101110001111100010001", 
    144 => "10110111101011011100011111011010", 
    145 => "11111010111110000010101011001001", 
    146 => "11111110111100010001010011100101", 
    147 => "00110101111000001110010000000100", 
    148 => "00011011001010001101011111110100", 
    149 => "11010101111010110000011111110110", 
    150 => "00001111110100000001101111110000", 
    151 => "11000110101110011111001100111110", 
    152 => "01001100001011011110110010011111", 
    153 => "11111001111111101111001100001101", 
    154 => "11100101000011100000000111010001", 
    155 => "11010010000110101101010100000111", 
    156 => "00000101110110111101000111110110", 
    157 => "11110101010010110000110000000111", 
    158 => "00011011000011100010010011110100", 
    159 => "11100010000000010000110100000000", 
    160 => "11111000111111001101111110110110", 
    161 => "00000000101100010001101100000110", 
    162 => "00011000000110010010110011001101", 
    163 => "11111111011010100100011010101111", 
    164 => "01010101111101110010011011111011", 
    165 => "00011110101001110001001100100001", 
    166 => "11110011000001111110001100011111", 
    167 => "11110101000011010100000011101011", 
    168 => "00011011000010010000100111101110", 
    169 => "11100101011111100010110011111010", 
    170 => "00010010010001000010001100000011", 
    171 => "01010000111010111110011000010001", 
    172 => "00100010000010111110110011101001", 
    173 => "11001111011010100011110010110110", 
    174 => "11110000111010100001011100010101", 
    175 => "11111111000110001111101011101111", 
    176 => "01000001001100101110101111011111", 
    177 => "00111010001000101011111100011101", 
    178 => "11111101111011000010001011111011", 
    179 => "11110100000010100001010000110100", 
    180 => "00010011111100000001001111111111", 
    181 => "11111101110111011110111000010101", 
    182 => "00000101000001001111101111111001", 
    183 => "01000010101001011110001111100111", 
    184 => "11000100000111011111101100101110", 
    185 => "00001010010001000001001100001110", 
    186 => "11101110001000110000111000001000", 
    187 => "00000101111011011110011011111111", 
    188 => "11101110111000110000011100000111", 
    189 => "00010001110100111110111011100011", 
    190 => "00000011110101110001011100010001", 
    191 => "11111001111001100000001000001000", 
    192 => "00000010111010111111101001000001", 
    193 => "00100110010100011010101000000000", 
    194 => "11111011000001100011110101000011", 
    195 => "11111100001000010000000011110000", 
    196 => "00010101111011111111011011100111", 
    197 => "11100101001110110011010111000101", 
    198 => "10110110111111110001010111010011", 
    199 => "11110010111000111100110100110111", 
    200 => "11100011000000011110001011100111", 
    201 => "00100011000110111101011111110011", 
    202 => "11100011101111001111110100001011", 
    203 => "11111001110010000001011101000110", 
    204 => "00011111111000001101001111111101", 
    205 => "11100011000101101111011100100101", 
    206 => "10100011110101100000010000001001", 
    207 => "11001100111000111110110000001100", 
    208 => "11100011000011101111000011010100", 
    209 => "00010000000111001111101001000111", 
    210 => "11110010000000011110100111011000", 
    211 => "00000110101100110001111011101110", 
    212 => "11111111000010101011011111011111", 
    213 => "00111111111010010010111001011001", 
    214 => "11100100111101100000011000000000", 
    215 => "11101111000001100001110100011011", 
    216 => "11101011001000111111100101001110", 
    217 => "11101110110100110010110011100101", 
    218 => "11110000111101111101110111110110", 
    219 => "00010111111011110101010000100010", 
    220 => "00001000000010111110010000010100", 
    221 => "00001100111110110000111100110101", 
    222 => "00010011001110101101000111110000", 
    223 => "11010010011000110000101111111001", 
    224 => "00110110000111110101100010111111", 
    225 => "00101010000001111101101111000110", 
    226 => "11001110000011101101110100010010", 
    227 => "00001100110001000010001000110010", 
    228 => "00010100001000010000011111001101", 
    229 => "00000110001000000001110110010110", 
    230 => "11101010001010010001101011101100", 
    231 => "11010111111010111111110100001110", 
    232 => "00100010001001110001111100001010", 
    233 => "11100111000011110001111011010100", 
    234 => "11111001111111010010001100010001", 
    235 => "00000011110110001111011011001100", 
    236 => "11000101000011111110010111100010", 
    237 => "00010010100111000001010001010110", 
    238 => "11000010000001100000001000001000", 
    239 => "00000100110010001110111000001010", 
    240 => "00011010001000100001111010101000", 
    241 => "11110011011010011101100101010010", 
    242 => "00100110111110000010001100110000", 
    243 => "11000011010100111110101100111110", 
    244 => "01000110001100110100000011100110", 
    245 => "11011011111100010011110111110000", 
    246 => "00100001111100011100111011010101", 
    247 => "11110001000101010001001000000100", 
    248 => "11110100111001110011011011110011", 
    249 => "00111001111011001110100000100010", 
    250 => "00001000110110000000011111100111", 
    251 => "00010011111000000000000100111001", 
    252 => "11110010111011111100101111100101", 
    253 => "00000000000011000011011100010111", 
    254 => "11100000101001101110111100011110", 
    255 => "11111111000101001110000001001000", 
    256 => "11100101111011100000100100011001", 
    257 => "00010010000000100001000101101110", 
    258 => "00011001110111111111000100001101", 
    259 => "11111101111101101111100010010101", 
    260 => "11101111111101010001011110111000", 
    261 => "00001000000000110001010000011111", 
    262 => "00000101001011100001100100000100", 
    263 => "00010101000001010010110000010000", 
    264 => "11101001111011111100110110111110", 
    265 => "11111111000000111111111011100110", 
    266 => "11111001000101111111111111101101", 
    267 => "11111110000010010010111011100010", 
    268 => "00001100111111100000011000000011", 
    269 => "00110111000000101110011100001111", 
    270 => "11010000111100010011100011111111", 
    271 => "00000000000000111101111101111011", 
    272 => "00000101000101111101101111101101", 
    273 => "00001000000000010010100010000001", 
    274 => "11010000111000001111001000101001", 
    275 => "11110011111110101111110010101011", 
    276 => "00000001000001101111000011110001", 
    277 => "00000010000001011101100100110111", 
    278 => "00100010000100000000001011010100", 
    279 => "11101100111111000000111111110001", 
    280 => "11101100001000010000110011101010", 
    281 => "11111010000001100011010010101001", 
    282 => "11101110110110010000010011011101", 
    283 => "00000000111111111110001110000001", 
    284 => "00000001000110001110110011011101", 
    285 => "00100110000001000011000111000111", 
    286 => "00001111000100111111000011111110", 
    287 => "00010000000001100000100101011000", 
    288 => "11111000001000101101100000101111", 
    289 => "11111000111111101111010110001011", 
    290 => "11100001111011010000110111100010", 
    291 => "00001110000000011111110101101010", 
    292 => "11110111000000110001000000010000", 
    293 => "00001110000000111111011111000010", 
    294 => "00011011111110011101101111101111", 
    295 => "11110001111110000000110011011100", 
    296 => "11111010111010101110110111110010", 
    297 => "00000001111111111111111111110010", 
    298 => "00011000000000111110111000111100", 
    299 => "11101110111111101101101011111101", 
    300 => "11111000000000111111001011100010", 
    301 => "00001101000010011101001110111100", 
    302 => "11100100000001001100101011011010", 
    303 => "00010011111110111101111110111000", 
    304 => "11101001000011101111110011111110", 
    305 => "11110001111111011110110101011101", 
    306 => "00000111001000000010010000001100", 
    307 => "00001101111111110010100100111000", 
    308 => "00110110000001000001101011100111", 
    309 => "00000010000000100001000111101000", 
    310 => "00001101110100110011001001110110", 
    311 => "11011101000000110000011100000110", 
    312 => "11100100001000101100101000010011", 
    313 => "11010111000000110000111011010101", 
    314 => "00101001000001001110111100010101", 
    315 => "00001100000000100011110100101110", 
    316 => "00000111000111011101101100001111", 
    317 => "00010100111111000000001000011110", 
    318 => "11001100111110001110010011100000", 
    319 => "11100101111101110010001000000010", 
    320 => "11000001111000010010000001000110", 
    321 => "00101010000001100100110000100011", 
    322 => "00011110010111101110001000101001", 
    323 => "11000110000100010000010001000011", 
    324 => "00100001000111010001000001011101", 
    325 => "11110011111001100000001000111010", 
    326 => "00000110110111001100110011100011", 
    327 => "11011010111110100011001100001100", 
    328 => "11111110000110110001001111010110", 
    329 => "11110011010101011101001111110100", 
    330 => "11010010001011111100111011011011", 
    331 => "11101101111111001111100010000001", 
    332 => "00011001110001111110010011110110", 
    333 => "00010110000010000010001011100011", 
    334 => "00001100110001110010100111110111", 
    335 => "00101110111100111101110101101111", 
    336 => "00000111000111110000101111101000", 
    337 => "00000010111101010000010000000110", 
    338 => "00010110001100110001000100000000", 
    339 => "11110001111101011111110011000001", 
    340 => "00000110000101101111100100101010", 
    341 => "11111101111111110000110010110110", 
    342 => "10101100001101101111110100110000", 
    343 => "11111110000010101101001110100110", 
    344 => "10101011000010000001001000011001", 
    345 => "00110110000100000101001100101010", 
    346 => "00011011001011110010100010101000", 
    347 => "11111100000010111110110011101111", 
    348 => "00000110101001100011000100011111", 
    349 => "00011010000000001110011010101000", 
    350 => "00000011110111111101111011010100", 
    351 => "11011000111101111111101111110011", 
    352 => "00000010000100000000110000011101", 
    353 => "00010010111111100001010100101110", 
    354 => "00000100000111101101001000011100", 
    355 => "00001101111101111111100011110101", 
    356 => "11001010001101110000011000100001", 
    357 => "11101001111100000000010110010011", 
    358 => "00001011110111000000101000000111", 
    359 => "00100001000101101100111000001110", 
    360 => "10110101011110110000000100010010", 
    361 => "00010110111110101111010010000010", 
    362 => "10110110001110001110110000100110", 
    363 => "11111011111000010000110110101001", 
    364 => "11010001001111000000010100000111", 
    365 => "00001000111101010000010111111011", 
    366 => "00001001111101001111111111101011", 
    367 => "00000010111110001111010010110011", 
    368 => "00011110111000010011000100101110", 
    369 => "00010001000010100001111000001100", 
    370 => "00111001001100111101110001000100", 
    371 => "00010001111101000010001100011110", 
    372 => "01011101110110101111001011011001", 
    373 => "11001111111111001110010100101110", 
    374 => "11000110000101011100010011011001", 
    375 => "11110101110110110001101100110111", 
    376 => "11101001001111100010111000000011", 
    377 => "11101111000100111110111010111100", 
    378 => "11010001000110011111110011101111", 
    379 => "11011011111111101111111111001100", 
    380 => "00011001001001000000000100000100", 
    381 => "11110111000001100011011100010011", 
    382 => "11110100000110001101111100101101", 
    383 => "11111100111110101101000101011001", 
    384 => "11010110111110101110110010100001", 
    385 => "11011110000011001110100000110110", 
    386 => "11010101111001001101000111101001", 
    387 => "11000100111101000010111111110100", 
    388 => "11110011001001011101000111101001", 
    389 => "11111111111001001111011011011000", 
    390 => "00001011111110111111010100100001", 
    391 => "00100000111111101111101100011010", 
    392 => "00100001111110001101000000111100", 
    393 => "00000000111110101101101011111001", 
    394 => "11111111111111010011011100001110", 
    395 => "00010101000000101110110100011001", 
    396 => "00001000000000111111100111101011", 
    397 => "00010101111101001101000011111000", 
    398 => "00010010000010011111011011011011", 
    399 => "11101110000001100000101100101101", 
    400 => "11101101111100110010110011010101", 
    401 => "00001011000110111111011111110001", 
    402 => "00110000111011000001011010111011", 
    403 => "00110010000010011100110010011101", 
    404 => "00101000111101011111111100000010", 
    405 => "00101111111010100001110111101011", 
    406 => "11101110001001000000001000011010", 
    407 => "11100111000000010010000111010101", 
    408 => "11111100000110010010110011011010", 
    409 => "00101011111101100010000000010111", 
    410 => "00101000111111001100100011101000", 
    411 => "11110100000000011111001000011110", 
    412 => "00000000111000000001110000001010", 
    413 => "11111000000101000010010111000100", 
    414 => "00011010111110011100100000001101", 
    415 => "11000101000100010010011111001000", 
    416 => "11111000000111010000001000011100", 
    417 => "11101011111101010010000111101101", 
    418 => "11101000000101110011001011111101", 
    419 => "10000001000001010001010000000100", 
    420 => "00001010000101111101111100001010", 
    421 => "10110001111111111100000111101001", 
    422 => "00110110000101000010000011101111", 
    423 => "00101111000000100010010100100000", 
    424 => "00101001001001000011001011101100", 
    425 => "00010100111101000000000000101111", 
    426 => "00100101000000001111101100000001", 
    427 => "11010110000010000011001011001001", 
    428 => "11000100111000111111110000101100", 
    429 => "00011001111110000001110100000011", 
    430 => "11111101000000010011000111100011", 
    431 => "00110101111110101100001000000101", 
    432 => "00011100000001100010011100001100", 
    433 => "00011100000001110101100001000111", 
    434 => "10110010111100110000100011010110", 
    435 => "00011110111110001101111000110111", 
    436 => "00110011001010010010000000101100", 
    437 => "00110111000110000010100000010101", 
    438 => "00000100111111101101111100011110", 
    439 => "11100001111111010000000000110101", 
    440 => "11000001101110111110110100000110", 
    441 => "00010111000000110000000100001011", 
    442 => "00011000010110010001000011100111", 
    443 => "11011011000010010001000111101101", 
    444 => "00011110111101110001011000001001", 
    445 => "11110010111011011111111111111001", 
    446 => "11111000111110101100101111110000", 
    447 => "11110111000001100000111000110010", 
    448 => "11100100001001110010111111001011", 
    449 => "11101011001110001101010111101100", 
    450 => "11110101000000010001011000001100", 
    451 => "11101001000011100010110000111101", 
    452 => "00101001000000010011010000100110", 
    453 => "00011100001100001100011100000100", 
    454 => "11110010000010110000110000111111", 
    455 => "11100010100000011111010111111101", 
    456 => "00101101111100100000111100100011", 
    457 => "00011110001001101101101100010100", 
    458 => "11101100111011111101011100101000", 
    459 => "00010110111010100001000100001010", 
    460 => "00011101111000110101000100110011", 
    461 => "11011011000111001111110100010111", 
    462 => "00000101000000000001110111111100", 
    463 => "11011111011011010000110011111010", 
    464 => "00000111000100000001010011011111", 
    465 => "00000100000010101110100011110010", 
    466 => "11110010000101111111110011001101", 
    467 => "00001101101111000010010011101011", 
    468 => "00100000001111111111111111100011", 
    469 => "00001111101000011111000000010101", 
    470 => "11100001111101010000001100010101", 
    471 => "00001110001000000000001111001111", 
    472 => "11101000111000110001110100000101", 
    473 => "00010001011110100001100000010000", 
    474 => "11101000111101010000101111100110", 
    475 => "11110010110011110000110100010101", 
    476 => "11111110111011000000001000010111", 
    477 => "11101111111101011111111111111010", 
    478 => "00001101000111010011010100011100", 
    479 => "11111101000100001110111100010010", 
    480 => "00001001000001010000101111111110", 
    481 => "11101111110110100011101100001111", 
    482 => "11101010111111100000011111110100", 
    483 => "00000111101110110010001100000000", 
    484 => "11110100111111000000001011000100", 
    485 => "11111001000101011111111011110010", 
    486 => "11011001111111010000001011010110", 
    487 => "11010101101111010000111100110100", 
    488 => "01010110001001000010001000101110", 
    489 => "00010001101000001011100010111011", 
    490 => "11110101110001001111110000010000", 
    491 => "00011110001001000000101011111001", 
    492 => "00000000000101011110011011100000", 
    493 => "00000111110100100000010111110110", 
    494 => "00000001111101110001010111010000", 
    495 => "11101111000100011110110011000100", 
    496 => "11110110001000111110100011111110", 
    497 => "00001001000001110000011100001101", 
    498 => "00111000000011111111001100010111", 
    499 => "00100001111010101101010010111100", 
    500 => "11110111111111111111001100000010", 
    501 => "11101110110110101111111111011111", 
    502 => "11001001111110100010000010101011", 
    503 => "11111001001000011111010011000011", 
    504 => "11101010111110001110100000000100", 
    505 => "00100011001010011111110111111001", 
    506 => "00000101111011110000011111111010", 
    507 => "00100011010001101111001000000011", 
    508 => "00001001001001010010000011110101", 
    509 => "11100001000010101111110000001001", 
    510 => "11011001110110110001011111001110", 
    511 => "00010110100111010001010111110110", 
    512 => "00100011111110111111100011101011", 
    513 => "00010110000001000010101010101011", 
    514 => "00001100000111001111001011100000", 
    515 => "11100110111100110101000100011010", 
    516 => "11111011001011011111110111110000", 
    517 => "00001110000000011101000111001100", 
    518 => "00100000110101001101011100100000", 
    519 => "11101111111101011111100111000100", 
    520 => "11110011000010101101001011010010", 
    521 => "11111110000000110110001111100111", 
    522 => "11110000111111100001000100101110", 
    523 => "00011001000011100000000011101100", 
    524 => "00100111001011110010011111101000", 
    525 => "00010101000000100001000000001111", 
    526 => "11111111000100110000000000101011", 
    527 => "00101111000001101101011000011110", 
    528 => "00110100110100101101001100101000", 
    529 => "11001110111110100000001001100000", 
    530 => "11111110000101110001001011011011", 
    531 => "00011000000011011111111001000101", 
    532 => "00001001000100000000100011101110", 
    533 => "00001101111111101111110111011010", 
    534 => "11100011000010100000011111110101", 
    535 => "11110010111111100001011000110000", 
    536 => "00100111000000000001100111001100", 
    537 => "00100100000001000100001010111100", 
    538 => "11110111001000111000111000101011", 
    539 => "00000000000101010001000100100100", 
    540 => "00100110000110001111110011110111", 
    541 => "11100000000000000001011100110101", 
    542 => "11111010111100001011101100101000", 
    543 => "00100010111111110000101111100001", 
    544 => "00001011000000011111010111111010", 
    545 => "00001110111111011101111001000110", 
    546 => "00000101111111101101010100000100", 
    547 => "11011001111111011101000000000011", 
    548 => "00000101000001010100111011000011", 
    549 => "00010010000000011111110111100000", 
    550 => "11011101000100001110101100100111", 
    551 => "00011010111111001110110100101010", 
    552 => "11101000001010110010000010001011", 
    553 => "11000110111011001110000011111100", 
    554 => "11110010000101110001010011100101", 
    555 => "11110011111110001111111011100001", 
    556 => "00010000110101111110000011111111", 
    557 => "11111001111110101111100101100000", 
    558 => "11011001110011010001001101000100", 
    559 => "10111111000000101110011110111000", 
    560 => "00010010111101010011110011110111", 
    561 => "00011101111111110001110011001111", 
    562 => "00001110000100011101001000100111", 
    563 => "11110011000000000001111100000110", 
    564 => "11110100000010000000101100000111", 
    565 => "11111000111111110010100011101100", 
    566 => "00001110111010001100111011101100", 
    567 => "00010111111111111010010011111000", 
    568 => "00011101000001101011001111100001", 
    569 => "11110101000011100011101000011001", 
    570 => "11001110111110101111110111111101", 
    571 => "00001110000001111001110000110001", 
    572 => "00001101000110001011000011110101", 
    573 => "00000101111110100010100011010110", 
    574 => "00010000110110000010010100000101", 
    575 => "00000100000000101111100000100001", 
    576 => "11101001001010011110110011111001", 
    577 => "00010001111101000011101000000010", 
    578 => "11010110111110000011000011101111", 
    579 => "00011101111110011110110111110010", 
    580 => "11011110001011001101010000010000", 
    581 => "00101010000011010001001111011111", 
    582 => "00100000111101100001101110101101", 
    583 => "00011010111100000000100111111011", 
    584 => "00000001000110000000101000100110", 
    585 => "00101010000011100000110011100111", 
    586 => "00110110110111011111101011110111", 
    587 => "11100110000000010011101100100000", 
    588 => "11001001010000101110101011010111", 
    589 => "00010110111110110011100000010010", 
    590 => "10110010101011010001111011010101", 
    591 => "00101110000011000000000110110110", 
    592 => "00001101111000001110101100010101", 
    593 => "11000011000000111010111011100111", 
    594 => "01000001111111110000000000101101", 
    595 => "00000110000011000011000100001010", 
    596 => "11101110001010011111000111011110", 
    597 => "11111100111110101110000111110011", 
    598 => "01001010001000101111101011101110", 
    599 => "00010111111011010000001011101001", 
    600 => "00010010000010101101110011011010", 
    601 => "00111011000011101011111111011001", 
    602 => "11101011001000000011000000100011", 
    603 => "00000100001011101110000111001100", 
    604 => "11111001001011011110011000000111", 
    605 => "00110111111100100010110011101101", 
    606 => "00001101000110011101000111100100", 
    607 => "00100000110011110010010100000111", 
    608 => "11100111110100111110010111111011", 
    609 => "11111110000000101011111111000100", 
    610 => "11000000111010111110011111001101", 
    611 => "11111001111100110011001100100001", 
    612 => "00111110001101010010000001001011", 
    613 => "00010110000100101101001011010101", 
    614 => "11110101110011111101111111111101", 
    615 => "00111111000100000011111100001101", 
    616 => "11111111000011110000010100011001", 
    617 => "00100010111111100001111100001001", 
    618 => "00110100001001111111001000101101", 
    619 => "00110010111000001110001111111101", 
    620 => "00100100000101010000001000000000", 
    621 => "11001111000001011100010000000010", 
    622 => "01000001110011000000001110110011", 
    623 => "11011001000000101110010100100111", 
    624 => "11001111000000100001100000000101", 
    625 => "00001111000011100010101111010111", 
    626 => "10110010010000101111100000011111", 
    627 => "11111001111110111111110111111100", 
    628 => "00010110001001000001111000001101", 
    629 => "11011010000010010001010011110110", 
    630 => "11111101000110101111011011101000", 
    631 => "11001000000100010001000011111100", 
    632 => "11001010101111101011110000111100", 
    633 => "00111011111100101111111111101111", 
    634 => "11100011001010010101111010111101", 
    635 => "00101000111110010001101100111010", 
    636 => "00000110110011011111101000000111", 
    637 => "00010101000001011100110000000110", 
    638 => "11111101110110101101101000001001", 
    639 => "00001111000001110000001111111111", 
    640 => "11001001110001010100011000101100", 
    641 => "11101011110001100010010011100000", 
    642 => "11110111111100100000001100010110", 
    643 => "11111010111110101110111100001001", 
    644 => "11010001111100110000110000011010", 
    645 => "00100100111110000001000000010001", 
    646 => "00010001000010000011100100110010", 
    647 => "00011011001001001101011111110010", 
    648 => "00010110111101110000001100000001", 
    649 => "00000100000011111111001011101000", 
    650 => "00001110000100110000000001000000", 
    651 => "00001010111110000011111111110111", 
    652 => "00000100000000000001010111010101", 
    653 => "11111001111100101101000100010111", 
    654 => "00010110000101011111010100000100", 
    655 => "11110001001000100011010111110101", 
    656 => "00010011111100000000000000001101", 
    657 => "11111001000100001111111100010000", 
    658 => "00011001000011010001101000010110", 
    659 => "11011001111011111110110011001111", 
    660 => "11100101111011101111001011111111", 
    661 => "00010110000000010001010100101101", 
    662 => "10110010001001010011101000010011", 
    663 => "11101000110111010000000000010011", 
    664 => "00100101111101011011111011101010", 
    665 => "11111010011111100000111000100101", 
    666 => "11011000111110101111111111010100", 
    667 => "11100000110001101110101000001011", 
    668 => "11110001110100011111100011110000", 
    669 => "00011100000111101011101100000110", 
    670 => "11110101110011100000000100001000", 
    671 => "00011101001001110001101011111001", 
    672 => "00100111000100001110101111001010", 
    673 => "11110110000011111111010000000000", 
    674 => "00100100001010100001000011100010", 
    675 => "11111100010000101101110000000010", 
    676 => "11111000000100010010101011101100", 
    677 => "00001011000010000100001111101011", 
    678 => "00110011111101111111111000011001", 
    679 => "11100000111000010000111011011010", 
    680 => "11110101000001011011010000000111", 
    681 => "11101011001001101110000100001110", 
    682 => "11000000000010001101110111110110", 
    683 => "11101110101011001101100100111000", 
    684 => "11000110001000101110100000000010", 
    685 => "11110100111111000111110100101000", 
    686 => "00000011001010010000110011101001", 
    687 => "11111011001011011110100000011010", 
    688 => "11001111111111001110111000001010", 
    689 => "00010001110110011110100111111011", 
    690 => "11110010111101101111011111110001", 
    691 => "11010110110000011110010000001010", 
    692 => "00001111111010001111100000000001", 
    693 => "01000110000000110101101011010100", 
    694 => "11011110111101100000101100001101", 
    695 => "00100110010100100100001100100000", 
    696 => "11101010111101011110111100000110", 
    697 => "11111010111111001111011011011011", 
    698 => "11101100111100110001011100001001", 
    699 => "11101100101110111110101011100110", 
    700 => "00001000000011010000100111100010", 
    701 => "00011110110110010011001111101101", 
    702 => "10011000111111101100111100000001", 
    703 => "00010111110001010011111011110111", 
    704 => "11100110000000100001011011100011", 
    705 => "11100011110111111111111101010001", 
    706 => "11100010110000000000101011000001", 
    707 => "00010000000001101101011011111100", 
    708 => "00111101110110011111110111010110", 
    709 => "11110101000111111111000000000001", 
    710 => "11111000111000111101110111011011", 
    711 => "00001110111111001101111011101100", 
    712 => "11111110111111001100011100001001", 
    713 => "00010001000011000001110011100000", 
    714 => "11100011000110011110101111111011", 
    715 => "00001001110011001101110111000111", 
    716 => "11100010111100000000000000110111", 
    717 => "11010010111101101111111100100100", 
    718 => "00000110111100101111110011101111", 
    719 => "00100101000101001111101100010111", 
    720 => "00011100110100010001100011000110", 
    721 => "00011001000110100010011100011110", 
    722 => "11000110000010010001110011010111", 
    723 => "00110101000011001111001011101110", 
    724 => "00000100000111100010001111101111", 
    725 => "00001100000111100000111000111110", 
    726 => "01000001111011100010010100100011", 
    727 => "11110010110111100000101000111100", 
    728 => "11100001111011100001111111100000", 
    729 => "11101011001000001100101011111111", 
    730 => "11110100111101000000011011011110", 
    731 => "11111011111110111111110000011101", 
    732 => "00100000000110011110111111100011", 
    733 => "00101000110100000010110111110110", 
    734 => "11010001001010001101111100100110", 
    735 => "11101111110100100011010101001010", 
    736 => "11001101000000000000110011010010", 
    737 => "11100010110100111011001000000000", 
    738 => "11011100111001111111100000001000", 
    739 => "00010111111001110010001011111110", 
    740 => "11010001111000011110100000000100", 
    741 => "11100101000010111011011011110000", 
    742 => "11111010000001101111011111110000", 
    743 => "00010100111111000000000110101101", 
    744 => "00010011000111101110001100101100", 
    745 => "01001110000100001101101100010110", 
    746 => "00100110000100101111011100100111", 
    747 => "11101101110010010011110011100110", 
    748 => "00001010111011111100101100101101", 
    749 => "11111101111101010001110011110001", 
    750 => "00000101111101110000100000011001", 
    751 => "11110001000010010001100000001100", 
    752 => "11100111111101001111010000000110", 
    753 => "00010110111011111011100111101100", 
    754 => "11111011000000100011101111111101", 
    755 => "00001000000101100001011100011000", 
    756 => "11110001111011000001101111101111", 
    757 => "00100010000100100000111111100000", 
    758 => "11011000000110101101101111111101", 
    759 => "00001111110111010001111000011010", 
    760 => "11100011000011010001010011111100", 
    761 => "11010101000011001101111000010110", 
    762 => "00011010001010110000110111101100", 
    763 => "11110001110111010010000111101110", 
    764 => "00000100000101000000011000000110", 
    765 => "11011111111011000001100100010001", 
    766 => "01000001001101000100010000010001", 
    767 => "00010000111100100000010000111111" );

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

entity ReadA113128_weights_0_0_27 is
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

architecture arch of ReadA113128_weights_0_0_27 is
    component ReadA113128_weights_0_0_27_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ReadA113128_weights_0_0_27_rom_U :  component ReadA113128_weights_0_0_27_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

