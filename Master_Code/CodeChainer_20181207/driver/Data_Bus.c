/*
	终端与平台间数据协议

*/
#include "Data_Bus.h"
#include "delay.h"
#include "gprs.h"
#include <stdlib.h>

#define MAX_DATA 200
#define Hail 0xF4
#define Tail 0xF3


POWER Power;
State state;
GPRS_DATA  GPRSGET;

u8 	YearTime_Buff[7];		//年月日小时分钟数据
u8	Longitude[3];				//经度
u8	Latitude[3];				//纬度
u8 	Send_Buff[MAX_DATA];				//发送数据(整体的数据包)
u8 	Local_IPadd[32];			//交换机本地的域名或者IP地址
u8 	Local_PORT[2];				//交换机本地的端口号
u8 	Batch[2]={0x01,0x00};							//产品批次
u8  Wireless_buffer[64]={0};		//缓存区
extern u8 Hardware_Num2[3];
/*******************************************************************************
* 函数名 : Sum_Check
* 描述   : 计算发送数组的校验位
* 输入   : 数组的长度
* 输出   : 校验位数据
* 返回   : Check_data
* 注意   : 数组总长度-2
*******************************************************************************/
u8 Sum_Check(u8 size)
{
	u8 i,Check_data;
	u16 Sum;
	for(i=1;i<(size-3);i++)
	{
		Sum+=Send_Buff[i];
	}
	Sum=Sum+Hail+Tail;
	Check_data=Sum%256;
	
	return Check_data;
}


void Data_Init(u16 cmd,u8 length)
{
	u8 i=0;
	Send_Buff[i]=Hail;
	Send_Buff[1]=(length>>8)&0xff;	//整个数据包长度(1 2) 27字节
	Send_Buff[2]=length & 0xff;
	for(i=0;i<7;i++)		//日期时间(3~9)
	{
		Send_Buff[3+i]=YearTime_Buff[i];
	}
	Send_Buff[10]=0x00;	//发送信号TYPE(10)
	for(i=0;i<3;i++)		//硬件序列号SN(11 12 13)交换机
	{
		Send_Buff[11+i]=Hardware_Num2[i];
	}
	Send_Buff[14]=(cmd>>8)&0xff;	//发送命令CMD(14 15)
	Send_Buff[15]=cmd & 0xff;	
	switch(cmd)
	{
		case 0x0001:
			for(i=0;i<5;i++)		//GPS数据(16~21)
			{
				Send_Buff[16+i]=0x00;
			}	
			for(i=0;i<2;i++)		//GPS经度(22 23 )
			{
				Send_Buff[21+i]=Longitude[i];
			}
			for(i=0;i<2;i++)		//GPS纬度(24 25 )
			{
				Send_Buff[23+i]=Latitude[i];
			}
			Send_Buff[25]=Sum_Check(length);//校验位
			Send_Buff[26]=Tail;			
		break;
		case 0x0002:
			Send_Buff[16]=Power.power_type;	//使用外接电源(16 17 18)
			Send_Buff[17]=Power.power_value;	//电压值
			Send_Buff[18]=Power.charge_state;	//充电状态
			Send_Buff[19]=Sum_Check(length);//校验位
			Send_Buff[20]=Tail;				
		break;
		case 0x0003:
		Send_Buff[16]=state.type;	//开启状态(16)
		Send_Buff[17]=Sum_Check(length);//校验位
		Send_Buff[18]=Tail;			
		break;
		case 0x0004:
			//IP地址(16~47)
			for(i=0;i<32;i++)			//交换机本地的域名或者IP地址(16~47)
			{
				Send_Buff[16+i]=Local_IPadd[i];
			}

			Send_Buff[48]=Local_PORT[0];	//交换机本地的端口号(50 51)
			Send_Buff[49]=Local_PORT[1];	
			
			Send_Buff[50]=Batch[0];	//BATCH硬件批次(50 51)
			Send_Buff[51]=Batch[1];
			Send_Buff[52]=Sum_Check(length);//校验位
			Send_Buff[53]=Tail;			
		break;
		case 0x0005:
			//交换机传感器列表数据(16~37)
			if(GPRSGET.Sensor_num==0  || GPRSGET.Sensor_num==0xff)
			{
				GPRSGET.Sensor_num=0;
				Send_Buff[16]=GPRSGET.Sensor_num;	//	传感器个数(16)
				for(i=0;i<GPRSGET.Sensor_num;i++)
				{
					//for(j=0;j<7;j++)
					{
						Send_Buff[7*i+17]=0;
						Send_Buff[7*i+18]=0;
						Send_Buff[7*i+19]=0;
						Send_Buff[7*i+20]=0;
						Send_Buff[7*i+21]=80;
						Send_Buff[7*i+22]=GPRSGET.Batch_version[0];
						Send_Buff[7*i+23]=GPRSGET.Batch_version[1];		
					}
				}
			}
			else
			{
				Send_Buff[16]=GPRSGET.Sensor_num;	//	传感器个数(16)
				
				for(i=0;i<GPRSGET.Sensor_num;i++)
				{
					//for(j=0;j<7;j++)
					{
						Send_Buff[7*i+17]=GPRSGET.Sensor_Data[3+4*i];
						Send_Buff[7*i+18]=GPRSGET.Sensor_Data[0+4*i];
						Send_Buff[7*i+19]=GPRSGET.Sensor_Data[1+4*i];
						Send_Buff[7*i+20]=GPRSGET.Sensor_Data[2+4*i];
						Send_Buff[7*i+21]=80;
						Send_Buff[7*i+22]=GPRSGET.Batch_version[0];
						Send_Buff[7*i+23]=GPRSGET.Batch_version[1];		
					}
				}	
			}

			
			Send_Buff[GPRSGET.Sensor_num*7+17]=Sum_Check(length);//校验位
			Send_Buff[GPRSGET.Sensor_num*7+18]=Tail;			
		break;
		case 0x0006:
			Send_Buff[16]=GPRSGET.VolUPTime/256;	
			Send_Buff[17]=GPRSGET.VolUPTime%256;	
			Send_Buff[18]=GPRSGET.GPSUPTime/256;	
			Send_Buff[19]=GPRSGET.GPSUPTime%256;	
			
			Send_Buff[20]=Sum_Check(length);//校验位
			Send_Buff[21]=Tail;		
		break;
		case 0x0103:
			Send_Buff[10]=Wireless_buffer[3];	//发送信号TYPE(10)  选择传感器类型
			for(i=0;i<3;i++)		//硬件序列号SN(4 5 6)传感器
			{
				Send_Buff[11+i]=Wireless_buffer[4+i];
			}
			Send_Buff[14]=Wireless_buffer[7];	//发送命令CMD(14 15)
			Send_Buff[15]=Wireless_buffer[8];	
			for(i=0;i<Wireless_buffer[2]-10;i++)		//主数据长度（16——16+i）   
			{
				Send_Buff[16+i]=Wireless_buffer[i+9];
			}
			Send_Buff[6+Wireless_buffer[2]]=Sum_Check(length);//校验位
			Send_Buff[7+Wireless_buffer[2]]=Tail;			
		break;
		case 0xffff:
			Send_Buff[14]=0xFF;	//发送命令CMD(14 15)
			Send_Buff[15]=0xFF;	
			Send_Buff[16]=Sum_Check(length);//校验位
			Send_Buff[17]=Tail;			
		break;
	}
	
	
}
//与服务器间的命令数据等传输
void Send_GPRS_DATA1(u16 cmd)
{
	
	switch(cmd)
	{
		case 0x0001:   //0x1B   得到GPS数据
			Data_Init(0x0001,0x1B);
			UART2_Data_Len(Send_Buff,0x1B);
		break;
		case 0x0002:   //得到电池的值
			Data_Init(0x0002,0x15);
			UART2_Data_Len(Send_Buff,0x15);
		break;
		case 0x0003:   //获取交换机状态
			Data_Init(0x0003,0x13);
			UART2_Data_Len(Send_Buff,0x13);			
		break;
		case 0x0004:  //得到交换机IP地址和端口号
			Data_Init(0x0004,0x36);
			UART2_Data_Len(Send_Buff,0x36);					
		break;
		case 0x0005:  //得到交换机传感器列表  
			Data_Init(0x0005,GPRSGET.Sensor_num*7+19);
			UART2_Data_Len(Send_Buff,GPRSGET.Sensor_num*7+19);					
		break;
		case 0x0006:  //得到交换机GPS和电压上报时间
			Data_Init(0x0006,0x16);
			UART2_Data_Len(Send_Buff,0x16);					
		break;
		case 0x0103:
			Data_Init(0x0103,8+Wireless_buffer[2]);
			UART2_Data_Len(Send_Buff,8+Wireless_buffer[2]);				
		break;
		case 0xFFFF:
			Data_Init(0xFFFF,0x12);
			UART2_Data_Len(Send_Buff,0x12);				
		break;
	}
	
}




