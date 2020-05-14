#ifndef _TIMER2_H
#define _TIMER2_H

#include "stm32f10x.h"
void Timer2_Init_Config(void);
void Time3_Init_Config(void);
void Timer4_Init_Config(void);
void TimerStruct_Init(void);
typedef struct
{
	u8 Heart_count;
}TIMER;

extern TIMER Timer;
void TimerStruct_Init(void);

#endif
