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
static const char *ng0 = "/import/lab/esylab/esylab_06/Trung/project/ac_link/ac_link/tb_ac_link.vhd";



static void work_a_0404347185_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4064U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 6184);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 6184);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 3088U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3872);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_0404347185_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    int64 t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(106, ng0);

LAB3:    t1 = (t0 + 6248);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    t6 = (t0 + 3088U);
    t7 = *((char **)t6);
    t8 = *((int64 *)t7);
    t9 = (t8 * 10);
    t6 = (t0 + 6248);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t6, 0U, 1, t9);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_2(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(107, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 10176);
    t6 = (t0 + 6312);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 8U);
    xsi_driver_first_trans_delta(t6, 0U, 8U, t4);
    t11 = (t0 + 6312);
    xsi_driver_intertial_reject(t11, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_3(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(108, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 10184);
    t6 = (t0 + 6376);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_delta(t6, 0U, 16U, t4);
    t11 = (t0 + 6376);
    xsi_driver_intertial_reject(t11, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_4(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(109, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 6440);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t4);
    t9 = (t0 + 6440);
    xsi_driver_intertial_reject(t9, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_5(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(111, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 10200);
    t6 = (t0 + 6504);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_delta(t6, 0U, 16U, t4);
    t11 = (t0 + 6504);
    xsi_driver_intertial_reject(t11, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_6(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(112, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 10216);
    t6 = (t0 + 6568);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_delta(t6, 0U, 16U, t4);
    t11 = (t0 + 6568);
    xsi_driver_intertial_reject(t11, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0404347185_2372691052_p_7(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(113, ng0);

LAB3:    t1 = (t0 + 3088U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 * 10);
    t1 = (t0 + 6632);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, t4);
    t9 = (t0 + 6632);
    xsi_driver_intertial_reject(t9, t4, t4);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0404347185_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0404347185_2372691052_p_0,(void *)work_a_0404347185_2372691052_p_1,(void *)work_a_0404347185_2372691052_p_2,(void *)work_a_0404347185_2372691052_p_3,(void *)work_a_0404347185_2372691052_p_4,(void *)work_a_0404347185_2372691052_p_5,(void *)work_a_0404347185_2372691052_p_6,(void *)work_a_0404347185_2372691052_p_7};
	xsi_register_didat("work_a_0404347185_2372691052", "isim/tb_ac_link_isim_beh.exe.sim/work/a_0404347185_2372691052.didat");
	xsi_register_executes(pe);
}
