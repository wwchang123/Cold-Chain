#ifndef _MODBUS_UART5_H_
#define _MODBUS_UART5_H_

#include "stm32f10x.h"
void Modbus2_Init(void);


typedef struct
{
	u8 MyAdd;//本设备的地址
	u8 RceBuf[200];//modbus的接收缓冲
	u8 TimeOut;//判断modbus的数据断续时间
	u8 Recount;//MODBUS端口已经接收到的个数
	u8 TimRun;//MODBUS定时计时是否开始
	u8 Recv_flag;//收到一帧数据
	u8 SendBuf[200];//MODBUS发送缓存区
}MODBUS2;


extern MODBUS2 modbus2;


void Modbus2_Event(void);

#endif

