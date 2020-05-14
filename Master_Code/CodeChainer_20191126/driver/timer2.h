#ifndef _TIMER2_H
#define _TIMER2_H

#include "stm32f10x.h"
void Timer2_Init_Config(void);
void Time3_Init_Config(void);
void Timer4_Init_Config(void);
void TimerStruct_Init(void);
typedef struct
{
	u8 Heart_count; //一分钟的心跳包
	u16 NoHeart_count;//四分钟内没有心跳包
	u8 NewIP_count;
	u8 Value_count; //电压数据的采集 5分钟一次
	u8 GpsVer_count; //GPS和版本号采集 10分钟一次
}TIMER;

extern TIMER Timer;
void TimerStruct_Init(void);

#endif
