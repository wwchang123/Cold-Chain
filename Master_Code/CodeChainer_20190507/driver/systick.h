#ifndef _SYSTICK_H
#define _SYSTICK_H

#include"stm32f10x.h"
#include"core_cm3.h"


void SysTick_Init(void);
void Delay_tick(__IO u32 nTime);

#endif
