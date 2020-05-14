#ifndef _DATA_BUS
#define _DATA_BUS

#include "stdio.h"
#include "stdlib.h"
#include "sys.h"
#include "user_lib.h"

//数据结构体
typedef struct
{
  u8 power_type; //电源是哪种供电方式
	u8 power_value; //电压的值
	u8 charge_state;
	
}POWER;


extern POWER Power;

typedef struct
{
  u8 type; //交换机当前状态
	
}State;

extern State state;

typedef struct
{
	u8 Sensor_num;		//传感器个数
	u8 Sensor_Data[400];//传感器编号数组
	u8 Batch_version[2];				//版本号  批次号 传感器的	
	u16 VolUPTime;		//电压上传时间(交换机)	
	u16 GPSUPTime;		//gps上报时间(交换机)
	u8  GetIPadress[32];
	u8 GetCOMM[2];
	u16 CLPORT;   //端口号变成整形
	u8 NewIP[60];
	u8 NewIPOK;
}GPRS_DATA;


typedef struct
{
	u8 Senor_count;
	u8 SenorBuffer[125];
	u8 SenorSeri[3];
	u8 Tempurate[2];
	u8 reflag; //接收到传感器标志位
}SENOR;

extern SENOR Rec;
extern GPRS_DATA  GPRSGET;


void Send_GPRS_DATA1(u16 cmd);
u8 Sum_Check(u8 size,u8* buffer);
void GetGprsIP_SIM(u8* getip,u8 length,u8* getcom);
void ReciveSenor_Data(u8* data,u8 length);
void Senor_StructInit(void);
void ReciveSenor_Data(u8* data,u8 length);
void SenorData_Handle(void);

#endif

