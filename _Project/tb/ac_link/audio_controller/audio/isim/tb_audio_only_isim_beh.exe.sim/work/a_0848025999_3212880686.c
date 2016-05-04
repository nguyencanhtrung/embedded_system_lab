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
static const char *ng0 = "/import/lab/esylab/esylab_06/Trung/project/ac_link/audio_controller/VHDL/audio.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_1434214030532753770_1035706684(char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_875668032861425848_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0848025999_3212880686_p_0(char *t0)
{
    char t17[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    int t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1472U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4552);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(76, ng0);
    t11 = (t0 + 2648U);
    t12 = *((char **)t11);
    t11 = (t0 + 1352U);
    t13 = *((char **)t11);
    t14 = (7 - 7);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t11 = (t13 + t16);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 7;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 7);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t22 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t11, t17);
    t23 = (t22 - 40);
    t24 = (t23 - 0);
    t21 = (t24 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t23);
    t25 = (8U * t21);
    t26 = (0 + t25);
    t19 = (t12 + t26);
    t27 = (t0 + 4648);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t19, 8U);
    xsi_driver_first_trans_fast(t27);
    goto LAB3;

LAB5:    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 8392);
    t7 = 1;
    if (8U == 8U)
        goto LAB8;

LAB9:    t7 = 0;

LAB10:    t1 = (!(t7));
    goto LAB7;

LAB8:    t8 = 0;

LAB11:    if (t8 < 8U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t9 = (t5 + t8);
    t10 = (t4 + t8);
    if (*((unsigned char *)t9) != *((unsigned char *)t10))
        goto LAB9;

LAB13:    t8 = (t8 + 1);
    goto LAB11;

}

static void work_a_0848025999_3212880686_p_1(char *t0)
{
    char t11[16];
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
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(109, ng0);

LAB3:    t1 = (t0 + 4568);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(86, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t5 = t1;
    memset(t5, (unsigned char)2, 16U);
    t6 = (t0 + 4712);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 8400);
    t5 = (t0 + 2768U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 8U);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t2 = (t0 + 3008U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    memcpy(t2, t5, 8U);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 8104U);
    t5 = ieee_p_1242562249_sub_875668032861425848_1035706684(IEEE_P_1242562249, t11, t2, t1, 1);
    t6 = (t0 + 2888U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    t8 = (t11 + 12U);
    t12 = *((unsigned int *)t8);
    t13 = (1U * t12);
    memcpy(t6, t5, t13);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 8408);
    t3 = 1;
    if (8U == 8U)
        goto LAB10;

LAB11:    t3 = 0;

LAB12:    if (t3 != 0)
        goto LAB7;

LAB9:    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    t1 = (t0 + 8152U);
    t5 = (t0 + 2888U);
    t6 = *((char **)t5);
    t5 = (t0 + 8168U);
    t3 = ieee_p_1242562249_sub_1434214030532753770_1035706684(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB16;

LAB17:    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    t1 = (t0 + 8152U);
    t5 = (t0 + 3008U);
    t6 = *((char **)t5);
    t5 = (t0 + 8184U);
    t3 = ieee_p_1242562249_sub_1434214030532753770_1035706684(IEEE_P_1242562249, t2, t1, t6, t5);
    if (t3 != 0)
        goto LAB18;

LAB19:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 8416);
    t5 = (t0 + 2768U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 8U);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(94, ng0);
    t8 = xsi_get_transient_memory(16U);
    memset(t8, 0, 16U);
    t9 = t8;
    memset(t9, (unsigned char)2, 16U);
    t10 = (t0 + 4712);
    t14 = (t10 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 16U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB8;

LAB10:    t12 = 0;

LAB13:    if (t12 < 8U)
        goto LAB14;
    else
        goto LAB12;

LAB14:    t6 = (t2 + t12);
    t7 = (t1 + t12);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB11;

LAB15:    t12 = (t12 + 1);
    goto LAB13;

LAB16:    xsi_set_current_line(98, ng0);
    t7 = xsi_get_transient_memory(16U);
    memset(t7, 0, 16U);
    t8 = t7;
    memset(t8, (unsigned char)3, 16U);
    t9 = (t0 + 4712);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    t1 = (t0 + 8152U);
    t5 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t11, t2, t1, 1);
    t6 = (t0 + 2768U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    t8 = (t11 + 12U);
    t12 = *((unsigned int *)t8);
    t13 = (1U * t12);
    memcpy(t6, t5, t13);
    goto LAB8;

LAB18:    xsi_set_current_line(102, ng0);
    t7 = xsi_get_transient_memory(16U);
    memset(t7, 0, 16U);
    t8 = t7;
    memset(t8, (unsigned char)2, 16U);
    t9 = (t0 + 4712);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 4776);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 2768U);
    t2 = *((char **)t1);
    t1 = (t0 + 8152U);
    t5 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t11, t2, t1, 1);
    t6 = (t0 + 2768U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    t8 = (t11 + 12U);
    t12 = *((unsigned int *)t8);
    t13 = (1U * t12);
    memcpy(t6, t5, t13);
    goto LAB8;

}


extern void work_a_0848025999_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0848025999_3212880686_p_0,(void *)work_a_0848025999_3212880686_p_1};
	xsi_register_didat("work_a_0848025999_3212880686", "isim/tb_audio_only_isim_beh.exe.sim/work/a_0848025999_3212880686.didat");
	xsi_register_executes(pe);
}
