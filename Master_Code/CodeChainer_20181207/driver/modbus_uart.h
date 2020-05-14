#ifndef _MODBUS_UART_H
#define _MODBUS_UART_H

#include "stm32f10x.h"

typedef struct
{
	u8 MyAdd;//���豸�ĵ�ַ
	u8 RceBuf[200];//modbus�Ľ��ջ���
	u8 TimeOut;//�ж�modbus�����ݶ���ʱ��
	u8 Recount;//MODBUS�˿��Ѿ����յ��ĸ���
	u8 TimRun;//MODBUS��ʱ��ʱ�Ƿ�ʼ
	u8 Recv_flag;//�յ�һ֡����
	u8 SendBuf[80];//MODBUS���ͻ�����
}MODBUS;


typedef struct 
{
	u8 State_flag;  //�ж��Ƿ�������ģʽ��0x30Ϊ����ģʽ��0x31Ϊ�ӻ�ģʽ
	u8 SlaverAddr;  //�ӻ���ַ
	u8 StartAddr;  //��ȡ��ʼ��ַ
	u8 ValueLength;//��ȡ����
	u8 Rs485_Buf[200]; //����Ҫ���͵�����
	u8 Master_Output[100];//����������Ĵ���
	u8 Master_WriteReg[100]; //д�Ĵ���
}Master;
	

//��ȡ���������� �������¶ȣ�ѹ��
typedef struct
{
	u8 FLOW_RATE[4];//˲ʱ����
	u8 FLOW_TOTAL[4];//�ۻ�����
	u8 TEMP_CASE[4];//�����¶�
	u8 PRESS_CASE[4];//����ѹ��
}Flow;
	
	
#define READ_COIL     01  //������1 �����������
#define READ_DI       02 //������2 �����뿪����
#define READ_HLD_REG  03  //������3�������ּĴ���
#define READ_AI       04  //������4��������Ĵ���
#define SET_COIL      05  //������5��д��������
#define SET_HLD_REG   06
#define WRITE_COIL    15
#define WRITE_HLD_REG 16

#define HI(n) ((n)>>8)  //�ֽڸ�λ
#define LOW(n) ((n)&0xff)  //�ֽڵ�λ

extern MODBUS modbus;
extern Master master;
extern Flow flow;

void Modbus_Init(void);
void Modbus_Event(void);
void Modbus_Fun3(void);
void Modbus_Fun6(void);
void Master_Service(u8 SlaverAddr,u8 Fuction,u16 StartAddr,u16 ValueOrLenth);


#endif 

