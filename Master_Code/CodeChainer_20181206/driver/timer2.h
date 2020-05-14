#ifndef _TIMER2_H
#define _TIMER2_H

#include "stm32f10x.h"
void Timer2_Init_Config(void);
void Time3_Init_Config(void);


typedef struct
{
	u8 Report_flag;
	u8 Reset_flag;
	u8 Report_flag1;
	
}Wake_Time;


#endif
