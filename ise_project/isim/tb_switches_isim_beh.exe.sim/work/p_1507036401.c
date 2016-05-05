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
extern char *IEEE_P_1242562249;
static const char *ng1 = "Function to_reg_number ended without a return statement";
static const char *ng2 = "Function to_stdlogicvector ended without a return statement";
static const char *ng3 = "Function reg_size ended without a return statement";

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


char *work_p_1507036401_sub_1638043997_3868518172(char *t1, int t2)
{
    char t4[8];
    char t9[16];
    char *t0;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    unsigned int t12;
    char *t13;
    int t14;
    char *t15;
    int t16;
    char *t17;
    int t18;

LAB0:    t5 = (t4 + 4U);
    *((int *)t5) = t2;
    t7 = (t2 >= 0);
    if (t7 == 1)
        goto LAB5;

LAB6:    t6 = (unsigned char)0;

LAB7:    if (t6 != 0)
        goto LAB2;

LAB4:    if ((unsigned char)0 == 0)
        goto LAB9;

LAB10:    t10 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t9, 0, 4);
    t11 = (t9 + 12U);
    t12 = *((unsigned int *)t11);
    t12 = (t12 * 1U);
    t13 = (t9 + 0U);
    t14 = *((int *)t13);
    t15 = (t9 + 4U);
    t16 = *((int *)t15);
    t17 = (t9 + 8U);
    t18 = *((int *)t17);
    xsi_vhdl_check_range_of_slice(3, 0, -1, t14, t16, t18);
    t0 = xsi_get_transient_memory(t12);
    memcpy(t0, t10, t12);

LAB1:    return t0;
LAB2:    t10 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t9, t2, 4);
    t11 = (t9 + 12U);
    t12 = *((unsigned int *)t11);
    t12 = (t12 * 1U);
    t13 = (t9 + 0U);
    t14 = *((int *)t13);
    t15 = (t9 + 4U);
    t16 = *((int *)t15);
    t17 = (t9 + 8U);
    t18 = *((int *)t17);
    xsi_vhdl_check_range_of_slice(3, 0, -1, t14, t16, t18);
    t0 = xsi_get_transient_memory(t12);
    memcpy(t0, t10, t12);
    goto LAB1;

LAB3:    xsi_error(ng1);
    t0 = 0;
    goto LAB1;

LAB5:    t8 = (t2 <= 15);
    t6 = t8;
    goto LAB7;

LAB8:    goto LAB3;

LAB9:    t10 = (t1 + 15823);
    xsi_report(t10, 40U, (unsigned char)2);
    goto LAB10;

LAB11:    goto LAB3;

}

char *work_p_1507036401_sub_3761374831_3868518172(char *t1, char *t2, unsigned char t3)
{
    char t5[8];
    char *t0;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    static char *nl0[] = {&&LAB3, &&LAB4, &&LAB5};

LAB0:    t6 = (t5 + 4U);
    *((unsigned char *)t6) = t3;
    t7 = (char *)((nl0) + t3);
    goto **((char **)t7);

LAB2:    xsi_error(ng2);
    t0 = 0;

LAB1:    return t0;
LAB3:    t8 = (t1 + 15863);
    t0 = xsi_get_transient_memory(2U);
    memcpy(t0, t8, 2U);
    t10 = (t2 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 2;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (2 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    goto LAB1;

LAB4:    t7 = (t1 + 15865);
    t0 = xsi_get_transient_memory(2U);
    memcpy(t0, t7, 2U);
    t9 = (t2 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 1;
    t10 = (t9 + 4U);
    *((int *)t10) = 2;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t12 = (2 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t13;
    goto LAB1;

LAB5:    t7 = (t1 + 15867);
    t0 = xsi_get_transient_memory(2U);
    memcpy(t0, t7, 2U);
    t9 = (t2 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 1;
    t10 = (t9 + 4U);
    *((int *)t10) = 2;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t12 = (2 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t13;
    goto LAB1;

LAB6:    goto LAB2;

LAB7:    goto LAB2;

LAB8:    goto LAB2;

}

unsigned char work_p_1507036401_sub_1416130558_3868518172(char *t1)
{
    unsigned char t0;
    char *t4;
    char *t5;
    int t6;

LAB0:    t4 = (t1 + 740U);
    t5 = *((char **)t4);
    t6 = *((int *)t5);
    if (t6 == 8)
        goto LAB3;

LAB7:    if (t6 == 16)
        goto LAB4;

LAB8:    if (t6 == 32)
        goto LAB5;

LAB9:
LAB6:    t0 = (unsigned char)0;

LAB1:    return t0;
LAB2:    xsi_error(ng3);
    t0 = 0;
    goto LAB1;

LAB3:    t0 = (unsigned char)0;
    goto LAB1;

LAB4:    t0 = (unsigned char)1;
    goto LAB1;

LAB5:    t0 = (unsigned char)2;
    goto LAB1;

LAB10:;
LAB11:    goto LAB2;

LAB12:    goto LAB2;

LAB13:    goto LAB2;

LAB14:    goto LAB2;

}

char *work_p_1507036401_sub_1068650375_3868518172(char *t1)
{
    char t2[72];
    char t7[16];
    char *t0;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;

LAB0:    t4 = (t2 + 4U);
    t5 = (t1 + 7660);
    t6 = (t4 + 52U);
    *((char **)t6) = t5;
    t8 = (t4 + 36U);
    *((char **)t8) = t7;
    xsi_type_set_default_value(t5, t7, 0);
    t9 = (t4 + 48U);
    *((unsigned int *)t9) = 16U;
    t10 = work_p_1507036401_sub_1638043997_3868518172(t1, 0);
    t11 = (t4 + 36U);
    t12 = *((char **)t11);
    t13 = (0 + 0U);
    t11 = (t12 + t13);
    memcpy(t11, t10, 4U);
    t5 = work_p_1507036401_sub_1638043997_3868518172(t1, 0);
    t6 = (t4 + 36U);
    t8 = *((char **)t6);
    t13 = (0 + 4U);
    t6 = (t8 + t13);
    memcpy(t6, t5, 4U);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t13 = (0 + 8U);
    t5 = (t6 + t13);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t0 = xsi_get_transient_memory(16U);
    memcpy(t0, t6, 16U);

LAB1:    return t0;
LAB2:;
}

char *work_p_1507036401_sub_1068651497_3868518172(char *t1)
{
    char t2[72];
    char t7[16];
    char t10[16];
    char *t0;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned char t17;

LAB0:    t4 = (t2 + 4U);
    t5 = (t1 + 7724);
    t6 = (t4 + 52U);
    *((char **)t6) = t5;
    t8 = (t4 + 36U);
    *((char **)t8) = t7;
    xsi_type_set_default_value(t5, t7, 0);
    t9 = (t4 + 48U);
    *((unsigned int *)t9) = 16U;
    t11 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t10, 0, 8);
    t12 = (t4 + 36U);
    t13 = *((char **)t12);
    t14 = (0 + 0U);
    t12 = (t13 + t14);
    t15 = (t10 + 12U);
    t16 = *((unsigned int *)t15);
    t16 = (t16 * 1U);
    memcpy(t12, t11, t16);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 8U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 9U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 10U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)3;
    t17 = work_p_1507036401_sub_1416130558_3868518172(t1);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 11U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = t17;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 12U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)2;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 13U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 14U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t14 = (0 + 15U);
    t5 = (t6 + t14);
    *((unsigned char *)t5) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t0 = xsi_get_transient_memory(16U);
    memcpy(t0, t6, 16U);

LAB1:    return t0;
LAB2:;
}

char *work_p_1507036401_sub_1068652619_3868518172(char *t1)
{
    char t2[72];
    char t7[16];
    char *t0;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned char t13;

LAB0:    t4 = (t2 + 4U);
    t5 = (t1 + 7788);
    t6 = (t4 + 52U);
    *((char **)t6) = t5;
    t8 = (t4 + 36U);
    *((char **)t8) = t7;
    xsi_type_set_default_value(t5, t7, 0);
    t9 = (t4 + 48U);
    *((unsigned int *)t9) = 16U;
    t10 = (t4 + 36U);
    t11 = *((char **)t10);
    t12 = (0 + 0U);
    t10 = (t11 + t12);
    *((unsigned char *)t10) = (unsigned char)0;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 1U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)1;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 6U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t5 = work_p_1507036401_sub_1638043997_3868518172(t1, 0);
    t6 = (t4 + 36U);
    t8 = *((char **)t6);
    t12 = (0 + 2U);
    t6 = (t8 + t12);
    memcpy(t6, t5, 4U);
    t13 = work_p_1507036401_sub_1416130558_3868518172(t1);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 7U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = t13;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 9U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)1;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 8U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 10U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t13 = work_p_1507036401_sub_1416130558_3868518172(t1);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 11U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = t13;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t12 = (0 + 12U);
    t5 = (t6 + t12);
    *((unsigned char *)t5) = (unsigned char)2;
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t0 = xsi_get_transient_memory(16U);
    memcpy(t0, t6, 16U);

LAB1:    return t0;
LAB2:;
}


void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_p_1507036401_init()
{
	static char *se[] = {(void *)work_p_1507036401_sub_1638043997_3868518172,(void *)work_p_1507036401_sub_3761374831_3868518172,(void *)work_p_1507036401_sub_1416130558_3868518172,(void *)work_p_1507036401_sub_1068650375_3868518172,(void *)work_p_1507036401_sub_1068651497_3868518172,(void *)work_p_1507036401_sub_1068652619_3868518172};
	xsi_register_didat("work_p_1507036401", "isim/tb_switches_isim_beh.exe.sim/work/p_1507036401.didat");
	xsi_register_subprogram_executes(se);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 6);
}
