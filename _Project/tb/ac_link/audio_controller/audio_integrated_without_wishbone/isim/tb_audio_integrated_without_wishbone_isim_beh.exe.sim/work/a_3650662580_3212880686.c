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
static const char *ng0 = "/import/lab/esylab/esylab_06/Trung/project/ac_link/audio_controller/VHDL/ac97_controller.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_1434214030532789707_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_3307759752501503797_1035706684(char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501539734_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3650662580_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6112);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 6000);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3650662580_3212880686_p_1(char *t0)
{
    char t11[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6016);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 6176);
    t7 = (t3 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(59, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t3 = t1;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 6240);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_fast(t4);
    goto LAB6;

LAB8:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 3752U);
    t4 = *((char **)t1);
    t1 = (t0 + 10992U);
    t7 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t11, t4, t1, 1);
    t8 = (t11 + 12U);
    t12 = *((unsigned int *)t8);
    t13 = (1U * t12);
    t6 = (8U != t13);
    if (t6 == 1)
        goto LAB11;

LAB12:    t9 = (t0 + 6240);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 3752U);
    t3 = *((char **)t1);
    t1 = (t0 + 10992U);
    t4 = (t0 + 11117);
    t8 = (t11 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 0;
    t9 = (t8 + 4U);
    *((int *)t9) = 7;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (7 - 0);
    t12 = (t17 * 1);
    t12 = (t12 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t12;
    t2 = ieee_p_1242562249_sub_1434214030532789707_1035706684(IEEE_P_1242562249, t3, t1, t4, t11);
    if (t2 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB9;

LAB11:    xsi_size_not_matching(8U, t13, 0);
    goto LAB12;

LAB13:    xsi_set_current_line(65, ng0);
    t9 = (t0 + 6176);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t9);
    goto LAB14;

}

static void work_a_3650662580_3212880686_p_2(char *t0)
{
    char t10[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    static char *nl0[] = {&&LAB16, &&LAB17, &&LAB18, &&LAB19};

LAB0:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1952U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 6032);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 6304);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(77, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 6368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(78, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t5 = (t0 + 6432);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 6496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(80, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 6560);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3912U);
    t5 = *((char **)t2);
    t2 = (t0 + 11008U);
    t6 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t10, t5, t2, 1);
    t7 = (t10 + 12U);
    t11 = *((unsigned int *)t7);
    t12 = (1U * t11);
    t4 = (8U != t12);
    if (t4 == 1)
        goto LAB7;

LAB8:    t8 = (t0 + 6560);
    t9 = (t8 + 56U);
    t13 = *((char **)t9);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 11008U);
    t4 = ieee_p_1242562249_sub_3307759752501539734_1035706684(IEEE_P_1242562249, t2, t1, 128);
    if (t4 == 1)
        goto LAB12;

LAB13:    t3 = (unsigned char)0;

LAB14:    if (t3 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 6624);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB10:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB7:    xsi_size_not_matching(8U, t12, 0);
    goto LAB8;

LAB9:    xsi_set_current_line(85, ng0);
    t7 = (t0 + 6624);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB10;

LAB12:    t5 = (t0 + 3912U);
    t6 = *((char **)t5);
    t5 = (t0 + 11008U);
    t16 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t6, t5, 255);
    t17 = (!(t16));
    t3 = t17;
    goto LAB14;

LAB15:    goto LAB3;

LAB16:    xsi_set_current_line(92, ng0);
    t5 = xsi_get_transient_memory(8U);
    memset(t5, 0, 8U);
    t6 = t5;
    memset(t6, (unsigned char)2, 8U);
    t7 = (t0 + 6560);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 11125);
    t5 = (t0 + 6368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 11133);
    t5 = (t0 + 6432);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 6496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 6304);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB15;

LAB17:    xsi_set_current_line(99, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 11008U);
    t3 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t2, t1, 255);
    if (t3 != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB15;

LAB18:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 11008U);
    t3 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t2, t1, 255);
    if (t3 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB15;

LAB19:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t1 = (t0 + 11008U);
    t3 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t2, t1, 255);
    if (t3 != 0)
        goto LAB26;

LAB28:
LAB27:    goto LAB15;

LAB20:    xsi_set_current_line(100, ng0);
    t5 = (t0 + 6304);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 11149);
    t5 = (t0 + 6368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 11157);
    t5 = (t0 + 6432);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 6496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB21;

LAB23:    xsi_set_current_line(108, ng0);
    t5 = (t0 + 6304);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 11173);
    t5 = (t0 + 6368);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 11181);
    t5 = (t0 + 6432);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 6496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB24;

LAB26:    goto LAB27;

}


extern void work_a_3650662580_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3650662580_3212880686_p_0,(void *)work_a_3650662580_3212880686_p_1,(void *)work_a_3650662580_3212880686_p_2};
	xsi_register_didat("work_a_3650662580_3212880686", "isim/tb_audio_integrated_without_wishbone_isim_beh.exe.sim/work/a_3650662580_3212880686.didat");
	xsi_register_executes(pe);
}
