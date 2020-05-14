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
	u8 Sensor_Data[200];//传感器编号数组
	u8 Batch_version[2];				//版本号  批次号 传感器的	
	u16 VolUPTime;		//电压上传时间(交换机)	
	u16 GPSUPTime;		//gps上报时间(交换机)
}GPRS_DATA;

extern GPRS_DATA  GPRSGET;

void Send_GPRS_DATA1(u16 cmd);

#endif

