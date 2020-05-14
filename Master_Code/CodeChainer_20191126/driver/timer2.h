#ifndef _TIMER2_H
#define _TIMER2_H

#include "stm32f10x.h"
void Timer2_Init_Config(void);
void Time3_Init_Config(void);
void Timer4_Init_Config(void);
void TimerStruct_Init(void);
typedef struct
{
	u8 Heart_count; //һ���ӵ�������
	u16 NoHeart_count;//�ķ�����û��������
	u8 NewIP_count;
	u8 Value_count; //��ѹ���ݵĲɼ� 5����һ��
	u8 GpsVer_count; //GPS�Ͱ汾�Ųɼ� 10����һ��
}TIMER;

extern TIMER Timer;
void TimerStruct_Init(void);

#endif
