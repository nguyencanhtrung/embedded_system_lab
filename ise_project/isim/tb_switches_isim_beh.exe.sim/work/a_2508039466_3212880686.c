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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ctnguyen/Works/ESY/Assignment2/switches.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_1537780098;

char *work_p_1537780098_sub_3096033564_3209126847(char *, char *, int , int );
char *work_p_1537780098_sub_3712368508_3209126847(char *, char *, char *, char *, char *);


static void work_a_2508039466_3212880686_p_0(char *t0)
{
    char t19[16];
    char t25[16];
    char t27[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned int t24;
    int t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 568U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 2744);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t4 = (t0 + 684U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 960U);
    t4 = *((char **)t2);
    t15 = (0 + 67U);
    t2 = (t4 + t15);
    t3 = *((unsigned char *)t2);
    t6 = (t3 == (unsigned char)3);
    if (t6 == 1)
        goto LAB14;

LAB15:    t1 = (unsigned char)0;

LAB16:    if (t1 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2804);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(62, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)8, 32U);
    t5 = (t0 + 2840);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 592U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 2804);
    t11 = (t4 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(47, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)2, 8U);
    t5 = (t0 + 1612U);
    t8 = *((char **)t5);
    t5 = (t8 + 0);
    memcpy(t5, t2, 8U);
    xsi_set_current_line(48, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)2, 8U);
    t5 = (t0 + 1544U);
    t8 = *((char **)t5);
    t5 = (t8 + 0);
    memcpy(t5, t2, 8U);
    xsi_set_current_line(49, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t4 = t2;
    memset(t4, (unsigned char)8, 32U);
    t5 = (t0 + 2840);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    goto LAB9;

LAB11:    xsi_set_current_line(52, ng0);
    t11 = (t0 + 960U);
    t12 = *((char **)t11);
    t17 = (0 + 62U);
    t11 = (t12 + t17);
    t10 = *((unsigned char *)t11);
    t18 = (t10 == (unsigned char)2);
    if (t18 != 0)
        goto LAB17;

LAB19:
LAB18:    goto LAB12;

LAB14:    t5 = (t0 + 960U);
    t8 = *((char **)t5);
    t16 = (0 + 68U);
    t5 = (t8 + t16);
    t7 = *((unsigned char *)t5);
    t9 = (t7 == (unsigned char)3);
    t1 = t9;
    goto LAB16;

LAB17:    xsi_set_current_line(53, ng0);
    t13 = (t0 + 868U);
    t14 = *((char **)t13);
    t20 = ((IEEE_P_2592010699) + 2312);
    t21 = (t0 + 4896U);
    t13 = xsi_base_array_concat(t13, t19, t20, (char)99, (unsigned char)2, (char)97, t14, t21, (char)101);
    t22 = (t0 + 1612U);
    t23 = *((char **)t22);
    t22 = (t23 + 0);
    t24 = (1U + 7U);
    memcpy(t22, t13, t24);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 776U);
    t4 = *((char **)t2);
    t2 = (t0 + 1544U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    memcpy(t2, t4, 8U);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 5129);
    t5 = (t0 + 1612U);
    t8 = *((char **)t5);
    t11 = ((IEEE_P_2592010699) + 2312);
    t12 = (t25 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 15;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t26 = (15 - 0);
    t15 = (t26 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t0 + 4944U);
    t5 = xsi_base_array_concat(t5, t19, t11, (char)97, t2, t25, (char)97, t8, t13, (char)101);
    t14 = (t0 + 1544U);
    t20 = *((char **)t14);
    t21 = ((IEEE_P_2592010699) + 2312);
    t22 = (t0 + 4928U);
    t14 = xsi_base_array_concat(t14, t27, t21, (char)97, t5, t19, (char)97, t20, t22, (char)101);
    t15 = (16U + 8U);
    t16 = (t15 + 8U);
    t1 = (32U != t16);
    if (t1 == 1)
        goto LAB20;

LAB21:    t23 = (t0 + 2840);
    t28 = (t23 + 32U);
    t29 = *((char **)t28);
    t30 = (t29 + 32U);
    t31 = *((char **)t30);
    memcpy(t31, t14, 32U);
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2804);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB18;

LAB20:    xsi_size_not_matching(32U, t16, 0);
    goto LAB21;

}

static void work_a_2508039466_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(89, ng0);

LAB3:    t2 = (t0 + 5145);
    t4 = (t0 + 5147);
    t6 = (t0 + 1236U);
    t7 = *((char **)t6);
    t6 = work_p_1537780098_sub_3712368508_3209126847(WORK_P_1537780098, t1, t2, t4, t7);
    t8 = (t1 + 12U);
    t9 = *((unsigned int *)t8);
    t9 = (t9 * 1U);
    t10 = (32U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 2876);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_delta(t11, 0U, 32U, 0LL);

LAB2:    t16 = (t0 + 2752);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t9, 0);
    goto LAB6;

}

static void work_a_2508039466_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(94, ng0);

LAB3:    t1 = (t0 + 1144U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2912);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_delta(t1, 32U, 1, 0LL);

LAB2:    t8 = (t0 + 2760);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2508039466_3212880686_p_3(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(95, ng0);

LAB3:    t2 = work_p_1537780098_sub_3096033564_3209126847(WORK_P_1537780098, t1, 983044, 4194303);
    t3 = (t1 + 12U);
    t4 = *((unsigned int *)t3);
    t4 = (t4 * 1U);
    t5 = (64U != t4);
    if (t5 == 1)
        goto LAB5;

LAB6:    t6 = (t0 + 2948);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 64U);
    xsi_driver_first_trans_delta(t6, 33U, 64U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(64U, t4, 0);
    goto LAB6;

}


extern void work_a_2508039466_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2508039466_3212880686_p_0,(void *)work_a_2508039466_3212880686_p_1,(void *)work_a_2508039466_3212880686_p_2,(void *)work_a_2508039466_3212880686_p_3};
	xsi_register_didat("work_a_2508039466_3212880686", "isim/tb_switches_isim_beh.exe.sim/work/a_2508039466_3212880686.didat");
	xsi_register_executes(pe);
}
