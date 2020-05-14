#include "get_belt.h"
#include "gprs.h"


extern u8 Unique_ID[8];

//胶带量发送函数
void sendbelt_data(void)
{
	u8 i=0;
	u16 sum=0;
	u8 belt_data[13]={0};
	belt_data[0]=0xa1;
	for(i=0;i<8;i++)
	{
		belt_data[i+1]=Unique_ID[i];
	}
	belt_data[9]=0x00;
	belt_data[10]=0x00;
	belt_data[11]=0x00;
	for(i=0;i<13;i++)
		sum=sum+belt_data[i];
	
	belt_data[12]=sum%256;
	//GSM_send_cmd("AT+CIPSEND=\"13\"",">",1);
	Second_AT_Command("AT+CIPSEND=\"13\"",">",1);	
	DATA_send((u8*)belt_data,"SEND OK",1,13);			//回复OK 
	
}

//包装箱量发送函数
void sendbox_data(void)
{
	u8 i=0;
	u16 sum=0;
	u8 box_data[13]={0};
	box_data[0]=0xb1;
	for(i=0;i<8;i++)
	{
		box_data[i+1]=Unique_ID[i];
	}
	box_data[9]=0x00;
	box_data[10]=0x00;
	box_data[11]=0x00;
	for(i=0;i<13;i++)
		sum=sum+box_data[i];
	
	box_data[12]=sum%256;
//	GSM_send_cmd("AT+CIPSEND=\"13\"",">",1);
	Second_AT_Command("AT+CIPSEND=\"13\"",">",1);	
	DATA_send((u8*)box_data,"SEND OK",1,13);			//回复OK 
	
}

//切刀的次数发送函数
void sendcut_count(void)
{
	u8 i=0;
	u16 sum=0;
	u8 cut_count[13]={0};
	cut_count[0]=0xb1;
	for(i=0;i<8;i++)
	{
		cut_count[i+1]=Unique_ID[i];
	}
	cut_count[9]=0x00;
	cut_count[10]=0x00;
	cut_count[11]=0x00;
	for(i=0;i<13;i++)
		sum=sum+cut_count[i];
	
	cut_count[12]=sum%256;
//	GSM_send_cmd("AT+CIPSEND=\"13\"",">",1);
	Second_AT_Command("AT+CIPSEND=\"13\"",">",1);	
	DATA_send((u8*)cut_count,"SEND OK",1,13);			//回复OK 
}
