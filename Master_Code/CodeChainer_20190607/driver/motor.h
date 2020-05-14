#ifndef _MOTOR_H
#define _MOTOR_H

#include "stm32f10x.h"


void TIM4_PWM_Init(u16 arr,u16 psc);
void motorsign_init(void);
u8 get_motorsign(void);

#endif

