/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xb4d1ced7 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/import/lab/esylab/esylab_06/Trung/project/ac_link/audio_controller/VHDL/ac_link.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_1242562249_sub_3307759752501503797_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501539734_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307766492664532561_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307766492666904403_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_2513437305_3212880686_p_0(char *t0)
{
    char t12[16];
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned char t25;
    unsigned char t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned char t31;
    char *t32;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 2112U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t5 = t1;
    memset(t5, (unsigned char)2, 8U);
    t6 = (t0 + 3528U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 8U);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 5168);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3528U);
    t5 = *((char **)t2);
    t2 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t5, t2, 15);
    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 5168);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB8:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t3 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t2, t1, 255);
    if (t3 != 0)
        goto LAB10;

LAB12:
LAB11:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307766492666904403_1035706684(IEEE_P_1242562249, t2, t1, 0);
    if (t4 == 1)
        goto LAB24;

LAB25:    t3 = (unsigned char)0;

LAB26:    if (t3 != 0)
        goto LAB21;

LAB23:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307766492666904403_1035706684(IEEE_P_1242562249, t2, t1, 16);
    if (t4 == 1)
        goto LAB29;

LAB30:    t3 = (unsigned char)0;

LAB31:    if (t3 != 0)
        goto LAB27;

LAB28:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307766492666904403_1035706684(IEEE_P_1242562249, t2, t1, 36);
    if (t4 == 1)
        goto LAB37;

LAB38:    t3 = (unsigned char)0;

LAB39:    if (t3 != 0)
        goto LAB35;

LAB36:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307766492666904403_1035706684(IEEE_P_1242562249, t2, t1, 56);
    if (t4 == 1)
        goto LAB45;

LAB46:    t3 = (unsigned char)0;

LAB47:    if (t3 != 0)
        goto LAB43;

LAB44:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t4 = ieee_p_1242562249_sub_3307766492666904403_1035706684(IEEE_P_1242562249, t2, t1, 76);
    if (t4 == 1)
        goto LAB53;

LAB54:    t3 = (unsigned char)0;

LAB55:    if (t3 != 0)
        goto LAB51;

LAB52:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 5360);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB22:    xsi_set_current_line(125, ng0);
    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    t1 = (t0 + 8968U);
    t5 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t12, t2, t1, 1);
    t6 = (t0 + 3528U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    t8 = (t12 + 12U);
    t15 = *((unsigned int *)t8);
    t23 = (1U * t15);
    memcpy(t6, t5, t23);
    goto LAB3;

LAB7:    xsi_set_current_line(63, ng0);
    t6 = (t0 + 5168);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB8;

LAB10:    xsi_set_current_line(71, ng0);
    t5 = (t0 + 9321);
    t7 = (t0 + 5232);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t5, 16U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 9337);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t0 + 1680U);
    t9 = *((char **)t8);
    t10 = (t13 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 11;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t14 = (11 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t15;
    t6 = xsi_base_array_concat(t6, t12, t7, (char)97, t2, t9, (char)97, t1, t13, (char)101);
    t15 = (8U + 12U);
    t3 = (20U != t15);
    if (t3 == 1)
        goto LAB13;

LAB14:    t11 = (t0 + 5296);
    t16 = (t11 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t6, 20U);
    xsi_driver_first_trans_delta(t11, 0U, 20U, 0LL);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 9349);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t0 + 1840U);
    t9 = *((char **)t8);
    t10 = (t13 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 0;
    t11 = (t10 + 4U);
    *((int *)t11) = 3;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t15;
    t6 = xsi_base_array_concat(t6, t12, t7, (char)97, t2, t9, (char)97, t1, t13, (char)101);
    t15 = (16U + 4U);
    t3 = (20U != t15);
    if (t3 == 1)
        goto LAB15;

LAB16:    t11 = (t0 + 5296);
    t16 = (t11 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t6, 20U);
    xsi_driver_first_trans_delta(t11, 20U, 20U, 0LL);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 9353);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t0 + 8920U);
    t9 = (t13 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 3;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t15;
    t6 = xsi_base_array_concat(t6, t12, t7, (char)97, t2, t8, (char)97, t1, t13, (char)101);
    t15 = (16U + 4U);
    t3 = (20U != t15);
    if (t3 == 1)
        goto LAB17;

LAB18:    t10 = (t0 + 5296);
    t11 = (t10 + 56U);
    t16 = *((char **)t11);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 20U);
    xsi_driver_first_trans_delta(t10, 40U, 20U, 0LL);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 9357);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t0 + 8936U);
    t9 = (t13 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 3;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t14 = (3 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t15;
    t6 = xsi_base_array_concat(t6, t12, t7, (char)97, t2, t8, (char)97, t1, t13, (char)101);
    t15 = (16U + 4U);
    t3 = (20U != t15);
    if (t3 == 1)
        goto LAB19;

LAB20:    t10 = (t0 + 5296);
    t11 = (t10 + 56U);
    t16 = *((char **)t11);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 20U);
    xsi_driver_first_trans_delta(t10, 60U, 20U, 0LL);
    xsi_set_current_line(77, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 80U, 20U, 0LL);
    xsi_set_current_line(78, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 100U, 20U, 0LL);
    xsi_set_current_line(79, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 120U, 20U, 0LL);
    xsi_set_current_line(80, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 140U, 20U, 0LL);
    xsi_set_current_line(81, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 160U, 20U, 0LL);
    xsi_set_current_line(82, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 180U, 20U, 0LL);
    xsi_set_current_line(83, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 200U, 20U, 0LL);
    xsi_set_current_line(84, ng0);
    t1 = xsi_get_transient_memory(20U);
    memset(t1, 0, 20U);
    t2 = t1;
    memset(t2, (unsigned char)2, 20U);
    t5 = (t0 + 5296);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 20U);
    xsi_driver_first_trans_delta(t5, 220U, 20U, 0LL);
    goto LAB11;

LAB13:    xsi_size_not_matching(20U, t15, 0);
    goto LAB14;

LAB15:    xsi_size_not_matching(20U, t15, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(20U, t15, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(20U, t15, 0);
    goto LAB20;

LAB21:    xsi_set_current_line(90, ng0);
    t7 = (t0 + 3112U);
    t8 = *((char **)t7);
    t7 = (t0 + 3528U);
    t9 = *((char **)t7);
    t7 = (t0 + 8968U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t9, t7);
    t21 = (15 - t14);
    t22 = (t21 - 15);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t21);
    t23 = (1U * t15);
    t24 = (0 + t23);
    t10 = (t8 + t24);
    t25 = *((unsigned char *)t10);
    t11 = (t0 + 5360);
    t16 = (t11 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t25;
    xsi_driver_first_trans_fast_port(t11);
    goto LAB22;

LAB24:    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 8968U);
    t20 = ieee_p_1242562249_sub_3307766492664532561_1035706684(IEEE_P_1242562249, t6, t5, 15);
    t3 = t20;
    goto LAB26;

LAB27:    xsi_set_current_line(92, ng0);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t25 = *((unsigned char *)t8);
    t26 = (t25 == (unsigned char)3);
    if (t26 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 5360);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB33:    goto LAB22;

LAB29:    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 8968U);
    t20 = ieee_p_1242562249_sub_3307766492664532561_1035706684(IEEE_P_1242562249, t6, t5, 35);
    t3 = t20;
    goto LAB31;

LAB32:    xsi_set_current_line(93, ng0);
    t7 = (t0 + 2952U);
    t9 = *((char **)t7);
    t7 = (t0 + 3528U);
    t10 = *((char **)t7);
    t7 = (t0 + 8968U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t7);
    t21 = (35 - t14);
    t22 = (t21 - 19);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(19, 0, -1, t21);
    t23 = (1U * t15);
    t27 = (0 - 0);
    t24 = (t27 * 1);
    t28 = (20U * t24);
    t29 = (0 + t28);
    t30 = (t29 + t23);
    t11 = (t9 + t30);
    t31 = *((unsigned char *)t11);
    t16 = (t0 + 5360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t32 = *((char **)t19);
    *((unsigned char *)t32) = t31;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB33;

LAB35:    xsi_set_current_line(98, ng0);
    t7 = (t0 + 1992U);
    t8 = *((char **)t7);
    t25 = *((unsigned char *)t8);
    t26 = (t25 == (unsigned char)3);
    if (t26 != 0)
        goto LAB40;

LAB42:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 5360);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB41:    goto LAB22;

LAB37:    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 8968U);
    t20 = ieee_p_1242562249_sub_3307766492664532561_1035706684(IEEE_P_1242562249, t6, t5, 55);
    t3 = t20;
    goto LAB39;

LAB40:    xsi_set_current_line(99, ng0);
    t7 = (t0 + 2952U);
    t9 = *((char **)t7);
    t7 = (t0 + 3528U);
    t10 = *((char **)t7);
    t7 = (t0 + 8968U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t7);
    t21 = (55 - t14);
    t22 = (t21 - 19);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(19, 0, -1, t21);
    t23 = (1U * t15);
    t27 = (1 - 0);
    t24 = (t27 * 1);
    t28 = (20U * t24);
    t29 = (0 + t28);
    t30 = (t29 + t23);
    t11 = (t9 + t30);
    t31 = *((unsigned char *)t11);
    t16 = (t0 + 5360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t32 = *((char **)t19);
    *((unsigned char *)t32) = t31;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB41;

LAB43:    xsi_set_current_line(104, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t25 = *((unsigned char *)t8);
    t26 = (t25 == (unsigned char)3);
    if (t26 != 0)
        goto LAB48;

LAB50:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 5360);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB49:    goto LAB22;

LAB45:    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 8968U);
    t20 = ieee_p_1242562249_sub_3307766492664532561_1035706684(IEEE_P_1242562249, t6, t5, 75);
    t3 = t20;
    goto LAB47;

LAB48:    xsi_set_current_line(105, ng0);
    t7 = (t0 + 2952U);
    t9 = *((char **)t7);
    t7 = (t0 + 3528U);
    t10 = *((char **)t7);
    t7 = (t0 + 8968U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t7);
    t21 = (75 - t14);
    t22 = (t21 - 19);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(19, 0, -1, t21);
    t23 = (1U * t15);
    t27 = (2 - 0);
    t24 = (t27 * 1);
    t28 = (20U * t24);
    t29 = (0 + t28);
    t30 = (t29 + t23);
    t11 = (t9 + t30);
    t31 = *((unsigned char *)t11);
    t16 = (t0 + 5360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t32 = *((char **)t19);
    *((unsigned char *)t32) = t31;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB49;

LAB51:    xsi_set_current_line(110, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t25 = *((unsigned char *)t8);
    t26 = (t25 == (unsigned char)3);
    if (t26 != 0)
        goto LAB56;

LAB58:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 5360);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB57:    goto LAB22;

LAB53:    t5 = (t0 + 3528U);
    t6 = *((char **)t5);
    t5 = (t0 + 8968U);
    t20 = ieee_p_1242562249_sub_3307766492664532561_1035706684(IEEE_P_1242562249, t6, t5, 95);
    t3 = t20;
    goto LAB55;

LAB56:    xsi_set_current_line(111, ng0);
    t7 = (t0 + 2952U);
    t9 = *((char **)t7);
    t7 = (t0 + 3528U);
    t10 = *((char **)t7);
    t7 = (t0 + 8968U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t10, t7);
    t21 = (95 - t14);
    t22 = (t21 - 19);
    t15 = (t22 * -1);
    xsi_vhdl_check_range_of_index(19, 0, -1, t21);
    t23 = (1U * t15);
    t27 = (3 - 0);
    t24 = (t27 * 1);
    t28 = (20U * t24);
    t29 = (0 + t28);
    t30 = (t29 + t23);
    t11 = (t9 + t30);
    t31 = *((unsigned char *)t11);
    t16 = (t0 + 5360);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t32 = *((char **)t19);
    *((unsigned char *)t32) = t31;
    xsi_driver_first_trans_fast_port(t16);
    goto LAB57;

}

static void work_a_2513437305_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(129, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 5424);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t9 = (t0 + 5088);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2513437305_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2513437305_3212880686_p_0,(void *)work_a_2513437305_3212880686_p_1};
	xsi_register_didat("work_a_2513437305_3212880686", "isim/tb_audio_integrated_without_wishbone_isim_beh.exe.sim/work/a_2513437305_3212880686.didat");
	xsi_register_executes(pe);
}
