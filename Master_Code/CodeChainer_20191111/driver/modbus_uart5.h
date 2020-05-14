#ifndef _MODBUS_UART5_H_
#define _MODBUS_UART5_H_

#include "stm32f10x.h"
void Modbus2_Init(void);


typedef struct
{
	u8 MyAdd;//���豸�ĵ�ַ
	u8 RceBuf[200];//modbus�Ľ��ջ���
	u8 TimeOut;//�ж�modbus�����ݶ���ʱ��
	u8 Recount;//MODBUS�˿��Ѿ����յ��ĸ���
	u8 TimRun;//MODBUS��ʱ��ʱ�Ƿ�ʼ
	u8 Recv_flag;//�յ�һ֡����
	u8 SendBuf[200];//MODBUS���ͻ�����
}MODBUS2;


extern MODBUS2 modbus2;


void Modbus2_Event(void);

#endif

