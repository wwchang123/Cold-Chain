#ifndef _MODBUS_UART_H
#define _MODBUS_UART_H

#include "stm32f10x.h"

typedef struct
{
	u8 MyAdd;//本设备的地址
	u8 RceBuf[200];//modbus的接收缓冲
	u8 TimeOut;//判断modbus的数据断续时间
	u8 Recount;//MODBUS端口已经接收到的个数
	u8 TimRun;//MODBUS定时计时是否开始
	u8 Recv_flag;//收到一帧数据
	u8 SendBuf[80];//MODBUS发送缓存区
}MODBUS;


typedef struct 
{
	u8 State_flag;  //判断是否是主机模式，0x30为主机模式，0x31为从机模式
	u8 SlaverAddr;  //从机地址
	u8 StartAddr;  //读取起始地址
	u8 ValueLength;//读取长度
	u8 Rs485_Buf[200]; //主机要发送的数据
	u8 Master_Output[100];//主机读输出寄存器
	u8 Master_WriteReg[100]; //写寄存器
}Master;
	

//读取流量计数据 流量，温度，压力
typedef struct
{
	u8 FLOW_RATE[4];//瞬时流量
	u8 FLOW_TOTAL[4];//累积流量
	u8 TEMP_CASE[4];//工况温度
	u8 PRESS_CASE[4];//工况压力
}Flow;
	
	
#define READ_COIL     01  //功能码1 读输出开关量
#define READ_DI       02 //功能码2 读输入开关量
#define READ_HLD_REG  03  //功能码3，读保持寄存器
#define READ_AI       04  //功能码4，读输入寄存器
#define SET_COIL      05  //功能码5，写单个开关
#define SET_HLD_REG   06
#define WRITE_COIL    15
#define WRITE_HLD_REG 16

#define HI(n) ((n)>>8)  //字节高位
#define LOW(n) ((n)&0xff)  //字节低位

extern MODBUS modbus;
extern Master master;
extern Flow flow;

void Modbus_Init(void);
void Modbus_Event(void);
void Modbus_Fun3(void);
void Modbus_Fun6(void);
void Master_Service(u8 SlaverAddr,u8 Fuction,u16 StartAddr,u16 ValueOrLenth);


#endif 

