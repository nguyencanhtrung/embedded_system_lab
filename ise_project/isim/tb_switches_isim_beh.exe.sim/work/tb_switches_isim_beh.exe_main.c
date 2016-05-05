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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_3972351953;
char *WORK_P_3778902183;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *WORK_P_1537780098;
char *WORK_P_4054474977;
char *WORK_P_3004263874;
char *IEEE_P_3564397177;
char *WORK_P_1507036401;
char *WORK_P_1854613604;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3972351953_init();
    work_p_3778902183_init();
    work_p_1537780098_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_3004263874_init();
    work_p_4054474977_init();
    work_p_1507036401_init();
    work_p_1854613604_init();
    work_a_2508039466_3212880686_init();
    work_a_2202788229_2372691052_init();


    xsi_register_tops("work_a_2202788229_2372691052");

    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    WORK_P_3778902183 = xsi_get_engine_memory("work_p_3778902183");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    WORK_P_1537780098 = xsi_get_engine_memory("work_p_1537780098");
    WORK_P_4054474977 = xsi_get_engine_memory("work_p_4054474977");
    WORK_P_3004263874 = xsi_get_engine_memory("work_p_3004263874");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    WORK_P_1507036401 = xsi_get_engine_memory("work_p_1507036401");
    WORK_P_1854613604 = xsi_get_engine_memory("work_p_1854613604");

    return xsi_run_simulation(argc, argv);

}
