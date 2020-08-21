#include "compute_layer_0_0_0_1.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void compute_layer_0_0_0_1::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_pp0_stage0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter0_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read())) {
            ap_enable_reg_pp0_iter0_reg = ap_start.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter1 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && 
             esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage5_subdone.read()))) {
            ap_enable_reg_pp0_iter1 = ap_enable_reg_pp0_iter0.read();
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        ap_port_reg_data_V_offset1 = data_V_offset1.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0))) {
        data_V_offset1_read_reg_82838 = ap_port_reg_data_V_offset1.read();
        tmp100_reg_85233 = tmp100_fu_80627_p2.read();
        tmp10_reg_85188 = tmp10_fu_80487_p2.read();
        tmp120_reg_85238 = tmp120_fu_80639_p2.read();
        tmp130_reg_85243 = tmp130_fu_80655_p2.read();
        tmp140_reg_85248 = tmp140_fu_80671_p2.read();
        tmp150_reg_85253 = tmp150_fu_80683_p2.read();
        tmp20_reg_85193 = tmp20_fu_80503_p2.read();
        tmp30_reg_85198 = tmp30_fu_80515_p2.read();
        tmp40_reg_85203 = tmp40_fu_80531_p2.read();
        tmp50_reg_85208 = tmp50_fu_80547_p2.read();
        tmp60_reg_85213 = tmp60_fu_80563_p2.read();
        tmp70_reg_85218 = tmp70_fu_80579_p2.read();
        tmp80_reg_85223 = tmp80_fu_80595_p2.read();
        tmp90_reg_85228 = tmp90_fu_80611_p2.read();
        tmp_117_reg_85048 = grp_fu_3517_p2.read().range(40, 18);
        tmp_118_reg_85053 = grp_fu_3412_p2.read().range(43, 18);
        tmp_119_reg_85058 = grp_fu_3418_p2.read().range(40, 18);
        tmp_120_reg_85063 = grp_fu_3434_p2.read().range(41, 18);
        tmp_121_reg_85068 = grp_fu_3564_p2.read().range(41, 18);
        tmp_122_reg_85073 = grp_fu_3530_p2.read().range(40, 18);
        tmp_123_reg_85078 = grp_fu_3508_p2.read().range(43, 18);
        tmp_124_reg_85083 = grp_fu_3416_p2.read().range(39, 18);
        tmp_125_reg_85088 = grp_fu_3526_p2.read().range(40, 18);
        tmp_126_reg_85093 = grp_fu_3527_p2.read().range(41, 18);
        tmp_127_reg_85098 = grp_fu_3423_p2.read().range(42, 18);
        tmp_128_reg_85103 = grp_fu_3488_p2.read().range(43, 18);
        tmp_129_reg_85108 = grp_fu_3463_p2.read().range(43, 18);
        tmp_130_reg_85113 = grp_fu_3539_p2.read().range(42, 18);
        tmp_131_reg_85118 = grp_fu_3560_p2.read().range(42, 18);
        tmp_133_reg_85123 = grp_fu_3413_p2.read().range(42, 18);
        tmp_134_reg_85128 = grp_fu_3566_p2.read().range(40, 18);
        tmp_135_reg_85133 = grp_fu_3465_p2.read().range(43, 18);
        tmp_136_reg_85138 = grp_fu_3417_p2.read().range(43, 18);
        tmp_138_reg_85143 = grp_fu_3415_p2.read().range(42, 18);
        tmp_139_reg_85148 = grp_fu_3513_p2.read().range(43, 18);
        tmp_140_reg_85153 = grp_fu_3458_p2.read().range(40, 18);
        tmp_141_reg_85158 = grp_fu_3459_p2.read().range(41, 18);
        tmp_142_reg_85163 = grp_fu_3449_p2.read().range(43, 18);
        tmp_143_reg_85168 = grp_fu_3444_p2.read().range(43, 18);
        tmp_144_reg_85173 = grp_fu_3561_p2.read().range(43, 18);
        tmp_145_reg_85178 = grp_fu_3441_p2.read().range(40, 18);
        tmp_146_reg_85183 = grp_fu_3554_p2.read().range(43, 18);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0))) {
        mult_1_3_V_reg_84204 = grp_fu_3490_p2.read().range(49, 18);
        mult_2_0_V_reg_84264 = grp_fu_3542_p2.read().range(49, 18);
        mult_2_10_V_reg_84314 = grp_fu_3495_p2.read().range(49, 18);
        mult_2_11_V_reg_84319 = grp_fu_3543_p2.read().range(49, 18);
        mult_2_12_V_reg_84324 = grp_fu_3482_p2.read().range(49, 18);
        mult_2_13_V_reg_84329 = grp_fu_3462_p2.read().range(49, 18);
        mult_2_14_V_reg_84334 = grp_fu_3452_p2.read().range(49, 18);
        mult_2_1_V_reg_84269 = grp_fu_3529_p2.read().range(49, 18);
        mult_2_3_V_reg_84279 = grp_fu_3540_p2.read().range(49, 18);
        mult_2_4_V_reg_84284 = grp_fu_3437_p2.read().range(49, 18);
        mult_2_6_V_reg_84294 = grp_fu_3567_p2.read().range(49, 18);
        mult_2_8_V_reg_84304 = grp_fu_3524_p2.read().range(49, 18);
        mult_2_9_V_reg_84309 = grp_fu_3568_p2.read().range(49, 18);
        tmp_109_reg_84419 = p_Val2_6_8_fu_79163_p2.read().range(40, 18);
        tmp_10_reg_84199 = grp_fu_3468_p2.read().range(43, 18);
        tmp_11_reg_84214 = grp_fu_3435_p2.read().range(46, 18);
        tmp_12_reg_84224 = grp_fu_3565_p2.read().range(45, 18);
        tmp_37_reg_84189 = grp_fu_3443_p2.read().range(43, 18);
        tmp_38_reg_84194 = grp_fu_3476_p2.read().range(47, 18);
        tmp_39_reg_84209 = grp_fu_3569_p2.read().range(44, 18);
        tmp_40_reg_84219 = grp_fu_3483_p2.read().range(46, 18);
        tmp_41_reg_84229 = grp_fu_3456_p2.read().range(44, 18);
        tmp_42_reg_84234 = grp_fu_3571_p2.read().range(45, 18);
        tmp_43_reg_84239 = grp_fu_3502_p2.read().range(48, 18);
        tmp_44_reg_84244 = grp_fu_3510_p2.read().range(43, 18);
        tmp_45_reg_84249 = grp_fu_3421_p2.read().range(47, 18);
        tmp_46_reg_84254 = grp_fu_3572_p2.read().range(47, 18);
        tmp_47_reg_84259 = grp_fu_3553_p2.read().range(47, 18);
        tmp_49_reg_84274 = grp_fu_3457_p2.read().range(45, 18);
        tmp_50_reg_84289 = grp_fu_3491_p2.read().range(47, 18);
        tmp_51_reg_84299 = grp_fu_3493_p2.read().range(45, 18);
        tmp_95_reg_84369 = p_Val2_5_s_fu_79078_p2.read().range(39, 18);
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read())) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage1.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage1_11001.read(), ap_const_boolean_0)))) {
        reg_78167 = grp_fu_78035_p32.read();
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage5.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage5_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage2.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage2_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read())))) {
        reg_78171 = grp_fu_78101_p32.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage4.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage4_11001.read(), ap_const_boolean_0))) {
        tmp102_reg_85598 = tmp102_fu_81736_p2.read();
        tmp112_reg_85603 = tmp112_fu_81761_p2.read();
        tmp125_reg_85608 = tmp125_fu_81777_p2.read();
        tmp12_reg_85553 = tmp12_fu_81527_p2.read();
        tmp135_reg_85613 = tmp135_fu_81793_p2.read();
        tmp142_reg_85618 = tmp142_fu_81818_p2.read();
        tmp152_reg_85623 = tmp152_fu_81840_p2.read();
        tmp22_reg_85558 = tmp22_fu_81552_p2.read();
        tmp32_reg_85563 = tmp32_fu_81577_p2.read();
        tmp42_reg_85568 = tmp42_fu_81602_p2.read();
        tmp52_reg_85573 = tmp52_fu_81627_p2.read();
        tmp62_reg_85578 = tmp62_fu_81648_p2.read();
        tmp75_reg_85583 = tmp75_fu_81664_p2.read();
        tmp85_reg_85588 = tmp85_fu_81680_p2.read();
        tmp92_reg_85593 = tmp92_fu_81701_p2.read();
        tmp_110_reg_83884 = grp_fu_78035_p32.read().range(31, 17);
        tmp_14_reg_85478 = grp_fu_3489_p2.read().range(47, 18);
        tmp_15_reg_85483 = grp_fu_3432_p2.read().range(45, 18);
        tmp_26_reg_85493 = grp_fu_3419_p2.read().range(43, 18);
        tmp_27_reg_85498 = grp_fu_3547_p2.read().range(44, 18);
        tmp_28_reg_85508 = grp_fu_3477_p2.read().range(46, 18);
        tmp_29_reg_85518 = grp_fu_3478_p2.read().range(46, 18);
        tmp_30_reg_85523 = grp_fu_3498_p2.read().range(46, 18);
        tmp_31_reg_85528 = grp_fu_3446_p2.read().range(44, 18);
        tmp_32_reg_85533 = grp_fu_3533_p2.read().range(45, 18);
        tmp_33_reg_85538 = grp_fu_3511_p2.read().range(42, 18);
        tmp_34_reg_85543 = grp_fu_3520_p2.read().range(46, 18);
        tmp_35_reg_85548 = grp_fu_3518_p2.read().range(47, 18);
        tmp_7_reg_85488 = grp_fu_3549_p2.read().range(45, 18);
        tmp_8_reg_85503 = grp_fu_3544_p2.read().range(45, 18);
        tmp_9_reg_85513 = grp_fu_3535_p2.read().range(46, 18);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage3.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage3_11001.read(), ap_const_boolean_0))) {
        tmp106_reg_85443 = tmp106_fu_81198_p2.read();
        tmp113_reg_85448 = tmp113_fu_81210_p2.read();
        tmp124_reg_85453 = tmp124_fu_81216_p2.read();
        tmp133_reg_85458 = tmp133_fu_81232_p2.read();
        tmp13_reg_85398 = tmp13_fu_81098_p2.read();
        tmp143_reg_85463 = tmp143_fu_81244_p2.read();
        tmp153_reg_85468 = tmp153_fu_81256_p2.read();
        tmp156_reg_85473 = tmp156_fu_81262_p2.read();
        tmp23_reg_85403 = tmp23_fu_81110_p2.read();
        tmp33_reg_85408 = tmp33_fu_81122_p2.read();
        tmp43_reg_85413 = tmp43_fu_81134_p2.read();
        tmp53_reg_85418 = tmp53_fu_81146_p2.read();
        tmp63_reg_85423 = tmp63_fu_81158_p2.read();
        tmp74_reg_85428 = tmp74_fu_81164_p2.read();
        tmp83_reg_85433 = tmp83_fu_81176_p2.read();
        tmp93_reg_85438 = tmp93_fu_81192_p2.read();
        tmp_148_reg_85258 = grp_fu_3472_p2.read().range(42, 18);
        tmp_149_reg_85263 = grp_fu_3522_p2.read().range(42, 18);
        tmp_150_reg_85268 = grp_fu_3466_p2.read().range(43, 18);
        tmp_151_reg_85273 = grp_fu_3499_p2.read().range(42, 18);
        tmp_152_reg_85278 = grp_fu_3484_p2.read().range(43, 18);
        tmp_153_reg_85283 = grp_fu_3515_p2.read().range(42, 18);
        tmp_154_reg_85288 = grp_fu_3479_p2.read().range(41, 18);
        tmp_155_reg_85293 = grp_fu_3461_p2.read().range(42, 18);
        tmp_156_reg_85298 = grp_fu_3436_p2.read().range(39, 18);
        tmp_157_reg_85303 = grp_fu_3516_p2.read().range(43, 18);
        tmp_158_reg_85308 = grp_fu_3519_p2.read().range(43, 18);
        tmp_159_reg_85313 = grp_fu_3503_p2.read().range(44, 18);
        tmp_160_reg_85318 = grp_fu_3429_p2.read().range(43, 18);
        tmp_161_reg_85323 = grp_fu_3454_p2.read().range(43, 18);
        tmp_162_reg_85328 = grp_fu_3439_p2.read().range(43, 18);
        tmp_164_reg_85333 = grp_fu_3485_p2.read().range(43, 18);
        tmp_165_reg_85338 = grp_fu_3551_p2.read().range(43, 18);
        tmp_166_reg_85343 = grp_fu_3427_p2.read().range(43, 18);
        tmp_167_reg_85348 = grp_fu_3562_p2.read().range(43, 18);
        tmp_168_reg_85353 = grp_fu_3501_p2.read().range(43, 18);
        tmp_169_reg_85358 = grp_fu_3442_p2.read().range(43, 18);
        tmp_170_reg_85363 = grp_fu_3507_p2.read().range(41, 18);
        tmp_171_reg_85368 = grp_fu_3573_p2.read().range(43, 18);
        tmp_172_reg_85373 = grp_fu_3509_p2.read().range(43, 18);
        tmp_173_reg_85378 = grp_fu_3453_p2.read().range(43, 18);
        tmp_174_reg_85383 = grp_fu_3538_p2.read().range(41, 18);
        tmp_175_reg_85388 = grp_fu_3475_p2.read().range(43, 18);
        tmp_176_reg_85393 = grp_fu_3410_p2.read().range(43, 18);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage1.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage1_11001.read(), ap_const_boolean_0))) {
        tmp110_reg_85004 = tmp110_fu_80026_p2.read();
        tmp_101_reg_84878 = grp_fu_3428_p2.read().range(39, 18);
        tmp_102_reg_84883 = grp_fu_3450_p2.read().range(42, 18);
        tmp_103_reg_84888 = grp_fu_3496_p2.read().range(41, 18);
        tmp_104_reg_84893 = grp_fu_3558_p2.read().range(39, 18);
        tmp_105_reg_84898 = grp_fu_3460_p2.read().range(42, 18);
        tmp_106_reg_84903 = grp_fu_3470_p2.read().range(36, 18);
        tmp_107_reg_84908 = grp_fu_3500_p2.read().range(43, 18);
        tmp_108_reg_84913 = grp_fu_3523_p2.read().range(42, 18);
        tmp_111_reg_84918 = grp_fu_3531_p2.read().range(40, 18);
        tmp_112_reg_84923 = grp_fu_3494_p2.read().range(47, 18);
        tmp_113_reg_84928 = grp_fu_3464_p2.read().range(38, 18);
        tmp_114_reg_84933 = grp_fu_3541_p2.read().range(41, 18);
        tmp_115_reg_84938 = grp_fu_3473_p2.read().range(42, 18);
        tmp_177_reg_84999 = p_Val2_10_12_fu_80000_p2.read().range(42, 18);
        tmp_85_reg_84808 = grp_fu_3447_p2.read().range(41, 18);
        tmp_86_reg_84813 = grp_fu_3536_p2.read().range(43, 18);
        tmp_87_reg_84818 = grp_fu_3555_p2.read().range(42, 18);
        tmp_88_reg_84823 = grp_fu_3414_p2.read().range(43, 18);
        tmp_89_reg_84828 = grp_fu_3563_p2.read().range(43, 18);
        tmp_90_reg_84833 = grp_fu_3548_p2.read().range(43, 18);
        tmp_91_reg_84838 = grp_fu_3537_p2.read().range(42, 18);
        tmp_92_reg_84843 = grp_fu_3422_p2.read().range(43, 18);
        tmp_93_reg_84848 = grp_fu_3546_p2.read().range(41, 18);
        tmp_94_reg_84853 = grp_fu_3492_p2.read().range(43, 18);
        tmp_96_reg_84858 = grp_fu_3556_p2.read().range(46, 18);
        tmp_97_reg_84863 = grp_fu_3497_p2.read().range(41, 18);
        tmp_98_reg_84868 = grp_fu_3440_p2.read().range(43, 18);
        tmp_99_reg_84873 = grp_fu_3545_p2.read().range(43, 18);
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        tmp29_reg_84793 = tmp29_fu_79623_p2.read();
        tmp59_reg_84798 = tmp59_fu_79629_p2.read();
        tmp79_reg_84803 = tmp79_fu_79635_p2.read();
        tmp_137_reg_84788 = p_Val2_811_5_fu_79607_p2.read().range(39, 18);
        tmp_13_reg_4239 = tmp_13_fu_3550_p2.read();
        tmp_53_reg_84574 = grp_fu_3471_p2.read().range(43, 18);
        tmp_54_reg_84579 = grp_fu_3532_p2.read().range(43, 18);
        tmp_55_reg_84584 = grp_fu_3411_p2.read().range(39, 18);
        tmp_56_reg_84589 = grp_fu_3514_p2.read().range(42, 18);
        tmp_57_reg_84594 = grp_fu_3552_p2.read().range(43, 18);
        tmp_58_reg_84599 = grp_fu_3570_p2.read().range(44, 18);
        tmp_59_reg_84604 = grp_fu_3574_p2.read().range(43, 18);
        tmp_60_reg_84609 = grp_fu_3448_p2.read().range(43, 18);
        tmp_61_reg_84614 = grp_fu_3431_p2.read().range(43, 18);
        tmp_62_reg_84619 = grp_fu_3481_p2.read().range(43, 18);
        tmp_63_reg_84624 = grp_fu_3467_p2.read().range(43, 18);
        tmp_64_reg_84629 = grp_fu_3424_p2.read().range(44, 18);
        tmp_65_reg_84634 = grp_fu_3528_p2.read().range(41, 18);
        tmp_66_reg_84639 = grp_fu_3438_p2.read().range(43, 18);
        tmp_67_reg_84644 = grp_fu_3425_p2.read().range(38, 18);
        tmp_69_reg_84649 = grp_fu_3486_p2.read().range(42, 18);
        tmp_6_reg_82524 = tmp_6_fu_78180_p1.read();
        tmp_70_reg_84654 = grp_fu_3469_p2.read().range(41, 18);
        tmp_71_reg_84659 = grp_fu_3455_p2.read().range(43, 18);
        tmp_72_reg_84664 = grp_fu_3426_p2.read().range(43, 18);
        tmp_73_reg_84669 = grp_fu_3487_p2.read().range(42, 18);
        tmp_74_reg_84674 = grp_fu_3420_p2.read().range(41, 18);
        tmp_75_reg_84679 = grp_fu_3534_p2.read().range(43, 18);
        tmp_76_reg_84684 = grp_fu_3445_p2.read().range(42, 18);
        tmp_77_reg_84689 = grp_fu_3506_p2.read().range(43, 18);
        tmp_78_reg_84694 = grp_fu_3474_p2.read().range(43, 18);
        tmp_79_reg_84699 = grp_fu_3433_p2.read().range(43, 18);
        tmp_80_reg_84704 = grp_fu_3512_p2.read().range(43, 18);
        tmp_81_reg_84709 = grp_fu_3525_p2.read().range(40, 18);
        tmp_82_reg_84714 = grp_fu_3504_p2.read().range(43, 18);
        tmp_83_reg_84719 = grp_fu_3559_p2.read().range(42, 18);
    }
}

void compute_layer_0_0_0_1::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((!(esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0) && esl_seteq<1,1,1>(ap_idle_pp0_1to1.read(), ap_const_logic_1)) && esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage0_subdone.read()))) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            }
            break;
        case 2 : 
            if (esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage1_subdone.read())) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            }
            break;
        case 4 : 
            if (esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage2_subdone.read())) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            }
            break;
        case 8 : 
            if (esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage3_subdone.read())) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            }
            break;
        case 16 : 
            if (esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage4_subdone.read())) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            }
            break;
        case 32 : 
            if (((esl_seteq<1,1,1>(ap_reset_idle_pp0.read(), ap_const_logic_1) && 
  esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage5_subdone.read())) || (esl_seteq<1,1,1>(ap_reset_idle_pp0.read(), ap_const_logic_0) && 
  esl_seteq<1,1,1>(ap_const_boolean_0, ap_block_pp0_stage5_subdone.read())))) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            }
            break;
        default : 
            ap_NS_fsm =  (sc_lv<6>) ("XXXXXX");
            break;
    }
}

}

