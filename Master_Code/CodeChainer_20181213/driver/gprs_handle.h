#ifndef  _GPRS_HANDLE_H
#define  _GPRS_HANDLE_H

#include "stm32f10x.h"
#define  RINGBUFF_LEN          512  
#define  FLASE   1 
#define  TRUE    0 
typedef struct
{
	u16 Head;           
	u16 Tail;
	u16 Lenght;
	u8 Ring_Buff[RINGBUFF_LEN];
	u8 g_gprs_start;
	u8 g_gprs_uart;
}RingBuff_t;

extern RingBuff_t ringBuff;//创建一个ringBuff的缓冲区

void RingBuff_Init(void);
u8 Write_RingBuff(u8 data);
u8 Read_RingBuff(u8 *rData);
void GPRS_Handle(void);
void GPRSData_Init(void);

#endif


