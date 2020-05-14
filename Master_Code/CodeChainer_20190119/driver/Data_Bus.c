/*
	�ն���ƽ̨������Э��

*/
#include "Data_Bus.h"
#include "delay.h"
#include "gprs.h"
#include <stdlib.h>
#include <time.h>
#include "gprs_handle.h"
#include "timer2.h"
#include "main.h"


#define MAX_DATA 200
#define Hail 0xF4
#define Tail 0xF3

SENOR Rec;
POWER Power;
State state;
GPRS_DATA  GPRSGET;

u8 	YearTime_Buff[7];		//������Сʱ��������
u8	Longitude[3];				//����
u8	Latitude[3];				//γ��
u8 	Send_Buff[MAX_DATA];				//��������(��������ݰ�)
u8 	Local_IPadd[32];			//���������ص���������IP��ַ
u8 	Local_PORT[2];				//���������صĶ˿ں�
u8 	Batch[2]={0x01,0x00};							//��Ʒ����
//u8  Wireless_buffer[64]={0};		//������
extern u8 Hardware_Num2[3];
extern u8 At_string[16];
/*******************************************************************************
* ������ : Sum_Check
* ����   : ���㷢�������У��λ
* ����   : ����ĳ���
* ���   : У��λ����
* ����   : Check_data
* ע��   : �����ܳ���-2
*******************************************************************************/
u8 Sum_Check(u8 size,u8* buffer)
{
	u8 i,Check_data;
	u16 Sum;
 	for(i=1;i<(size-3);i++)
	{
		Sum+=buffer[i];
	}
	Sum=Sum+Hail+Tail;
	Check_data=Sum%256;
	
	return Check_data;
}


void Data_Init(u16 cmd,u8 length)
{
	u8 i=0;

	Send_Buff[i]=Hail;
	Send_Buff[1]=(length>>8)&0xff;	//�������ݰ�����(1 2) 27�ֽ�
	Send_Buff[2]=length & 0xff;
	for(i=0;i<7;i++)		//����ʱ��(3~9)
	{
		Send_Buff[3+i]=YearTime_Buff[i];
	}
	Send_Buff[10]=0x00;	//�����ź�TYPE(10)
	for(i=0;i<3;i++)		//Ӳ�����к�SN(11 12 13)������
	{
		Send_Buff[11+i]=Hardware_Num2[i];
	}
	Send_Buff[14]=(cmd>>8)&0xff;	//��������CMD(14 15)
	Send_Buff[15]=cmd & 0xff;	
	switch(cmd)
	{
		case 0x0001:
			for(i=0;i<5;i++)		//GPS����(16~21)
			{
				Send_Buff[16+i]=0x00;
			}	
			for(i=0;i<2;i++)		//GPS����(22 23 )
			{
				Send_Buff[21+i]=Longitude[i];
			}
			for(i=0;i<2;i++)		//GPSγ��(24 25 )
			{
				Send_Buff[23+i]=Latitude[i];
			}
			Send_Buff[25]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[26]=Tail;			
		break;
		case 0x0002:
			Power.power_type=get_power();//����Ƿ�ʹ����ӵ�Դ
			Power.power_value=(Get_Adc_Average(10,12)*13/1000);
			Power.charge_state=0x0A;//�°汾��ɰ汾������
			Send_Buff[16]=Power.power_type;	//ʹ����ӵ�Դ(16 17 18)
			Send_Buff[17]=Power.power_value;	//��ѹֵ
			Send_Buff[18]=Power.charge_state;	//���״̬
			Send_Buff[19]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[20]=Tail;				
		break;
		case 0x0003:
		Send_Buff[16]=state.type;	//����״̬(16)
		Send_Buff[17]=Sum_Check(length,Send_Buff);//У��λ
		Send_Buff[18]=Tail;			
		break;
		case 0x0004:
			//IP��ַ(16~47)
			for(i=0;i<32;i++)			//���������ص���������IP��ַ(16~47)
			{
				Send_Buff[16+i]=Local_IPadd[i];
			}

			Send_Buff[48]=Local_PORT[0];	//���������صĶ˿ں�(50 51)
			Send_Buff[49]=Local_PORT[1];	
			
			Send_Buff[50]=Batch[0];	//BATCHӲ������(50 51)
			Send_Buff[51]=Batch[1];
			Send_Buff[52]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[53]=Tail;			
		break;
		case 0x0005:
			//�������������б�����(16~37)
			if(GPRSGET.Sensor_num==0  || GPRSGET.Sensor_num==0xff)
			{
				GPRSGET.Sensor_num=0;
				Send_Buff[16]=GPRSGET.Sensor_num;	//	����������(16)
				for(i=0;i<GPRSGET.Sensor_num;i++)
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
			else
			{
				Send_Buff[16]=GPRSGET.Sensor_num;	//	����������(16)
				
				for(i=0;i<GPRSGET.Sensor_num;i++)
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

			
			Send_Buff[GPRSGET.Sensor_num*7+17]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[GPRSGET.Sensor_num*7+18]=Tail;			
		break;
		case 0x0006:
			Send_Buff[16]=GPRSGET.VolUPTime/256;	
			Send_Buff[17]=GPRSGET.VolUPTime%256;	
			Send_Buff[18]=GPRSGET.GPSUPTime/256;	
			Send_Buff[19]=GPRSGET.GPSUPTime%256;	
			
			Send_Buff[20]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[21]=Tail;		
		break;
		case 0x0103:
			Send_Buff[10]=0x01;	//�����ź�TYPE(10)  ѡ�񴫸�������  �¶�
			for(i=0;i<3;i++)		//Ӳ�����к�SN(4 5 6)������
			{
				Send_Buff[11+i]=Rec.SenorSeri[i];
			}
			Send_Buff[14]=0x01;	//��������CMD(14 15)
			Send_Buff[15]=0x01;	
//			for(i=0;i<Wireless_buffer[2]-10;i++)		//�����ݳ��ȣ�16����16+i��   
//			{
//				Send_Buff[16+i]=Wireless_buffer[i+9];
//			}
			Send_Buff[16]=0x0FF;	
			Send_Buff[17]=Rec.Tempurate[0];	
			Send_Buff[18]=Rec.Tempurate[1];	
			Send_Buff[19]=0x05;	
			Send_Buff[20]=0x01;	
			Send_Buff[21]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[22]=Tail;			
		break;
		case 0xffff:
			Send_Buff[14]=0xFF;	//��������CMD(14 15)
			Send_Buff[15]=0xFF;	
			Send_Buff[16]=Sum_Check(length,Send_Buff);//У��λ
			Send_Buff[17]=Tail;			
		break;
	}
	
	
}
//�����������������ݵȴ���
void Send_GPRS_DATA1(u16 cmd)
{
	
	switch(cmd)
	{
		case 0x0001:   //0x1B   �õ�GPS����
			Data_Init(0x0001,0x1B);
			UART2_Data_Len(Send_Buff,0x1B);
		break;
		case 0x0002:   //�õ���ص�ֵ
			Data_Init(0x0002,0x15);
			UART2_Data_Len(Send_Buff,0x15);
		break;
		case 0x0003:   //��ȡ������״̬
			Data_Init(0x0003,0x13);
			UART2_Data_Len(Send_Buff,0x13);			
		break;
		case 0x0004:  //�õ�������IP��ַ�Ͷ˿ں�
			Data_Init(0x0004,0x36);
			UART2_Data_Len(Send_Buff,0x36);					
		break;
		case 0x0005:  //�õ��������������б�  
			Data_Init(0x0005,GPRSGET.Sensor_num*7+19);
			UART2_Data_Len(Send_Buff,GPRSGET.Sensor_num*7+19);					
		break;
		case 0x0006:  //�õ�������GPS�͵�ѹ�ϱ�ʱ��
			Data_Init(0x0006,0x16);
			UART2_Data_Len(Send_Buff,0x16);					
		break;
		case 0x0103:
			Data_Init(0x0103,0x17);
			UART2_Data_Len(Send_Buff,0x17);				
		break;
		case 0xFFFF:
			Data_Init(0xFFFF,0x12);
			UART2_Data_Len(Send_Buff,0x12);				
		break;
	}
//	ringBuff.Lenght=0x00;//���������ݣ��ȴ����գ�����
}

/*******************************************************************************
* ������ : Swap
* ����   : ����
* ����   : 
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
void Swap(char *ch1, char *ch2)
{
	char tmp = *ch1;
	*ch1 = *ch2;
	*ch2 = tmp;
}
/*******************************************************************************
* ������ : Convert
* ����   : ת��������
* ����   : n:Ҫת������������ ,str:������ַ�
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
void change_Data_str(int n, u8 str[])
{
	int i, len;
	for(i = 0; n != 0; ++i)
	{
		str[i] = n % 10 + '0';
		n /= 10;
	}
	str[i] = '\0';
	len = i;
	/* ��ת */
	for(i = 0; i < len/2; ++i)
		Swap((char *)str+i, (char *)str+len-i-1);
	str[len] = '\0';
}


//���ݵõ���IP��ַ�Ͷ˿ںţ��������������ַ���飬�����ӷ������ж��Ƿ�ɹ�
//����ɹ�����IP��ַ�Ͷ˿ںŵ�FLASHԭ�е�IP��ַ��λ��
void GetGprsIP_SIM(u8* getip,u8 length,u8* getcom)
{
	u8 i,port[4]={0x00};
	GPRSGET.CLPORT=getcom[0]<<8 | getcom[1];//ת������
	change_Data_str(GPRSGET.CLPORT, port);
	for(i=0;i<16;i++)
	{
		IP_COM.Gprsdwon_IP[i]=At_string[i];
	}
	IP_COM.Gprsdwon_IP[16]=0x22; //��ʾһ�� "
	for(i=0;i<length;i++)
	{
		IP_COM.Gprsdwon_IP[i+17]=getip[i];
	}
	IP_COM.Gprsdwon_IP[i+17]=0x22; //��ʾһ�� "
	IP_COM.Gprsdwon_IP[i+18]=0x2C; //��ʾһ�� (,)
	IP_COM.Gprsdwon_IP[i+19]=port[0]; 
	IP_COM.Gprsdwon_IP[i+20]=port[1]; 
	IP_COM.Gprsdwon_IP[i+21]=port[2]; 
	IP_COM.Gprsdwon_IP[i+22]=port[3]; 
//===============	���³�ʼ��GPRS==================
	OpenGprs_PowKey(); //���³�ʼ��GPRS
	switch(GPRS_Init((char*)IP_COM.Gprsdwon_IP))		//GPRSע��
	{
		case 1:   
			printf("GSMģ����\r\n");
			NVIC_SystemReset();   //��λ����ע��GPRS		
		break;
		case 2:   
			printf("SIM��δ��\r\n"); 
			NVIC_SystemReset();   //��λ����ע��GPRS		
		break;
		case 3:   
			printf("GPRSע��ɹ�!\r\n"); 
			Send_GPRS_DATA1(0x0003);  //������ɺ󣬷��Ϳ�������
			GPRSGET.NewIPOK=0x01;
		break;
		case 4:   
			printf("GPRSע��ʧ��....\r\n");
			delay_ms(50);
			NVIC_SystemReset();   //��λ����ע��GPRS
		break;
		default:   break;	
	}	
	
	TimerStruct_Init();//����
	
}

void Senor_StructInit(void)
{
	Rec.Senor_count=0;
	memset(Rec.SenorBuffer,0,128);
}

//���ʹ��������ݵ�������
void SenorDate_Send(u32 senornum,u8 Data_H,u8 Data_L)
{
	u8 i;
	u32 temp_num;
	for(i=0;i<GPRSGET.Sensor_num;i++)
	{
		temp_num=GPRSGET.Sensor_Data[4*i]*256*256+GPRSGET.Sensor_Data[4*i+1]*256+GPRSGET.Sensor_Data[4*i+2];
		if(senornum==temp_num)
		{
			Send_GPRS_DATA1(0x0103);	//����������ʹ���������
		}
	}
}

void ReciveSenor_Data(u8* data,u8 length)
{
	u8 i;
//	u8 Sdata[8]={0x00};
//	u32 Senor_num;
	for(i=0;i<length;i++)
	{
		Rec.SenorBuffer[Rec.Senor_count++]=data[i];

		if(Rec.Senor_count>=125)
			Rec.Senor_count=0x00;
	}
}

//���������ݴ���
void SenorData_Handle(void)
{
	u8 data[8]={0x00};
	u8 i=0;
	u32 Senor_num;
	while(Rec.Senor_count>6)
	{
		if(Rec.SenorBuffer[i]==0xEB)
		{
			data[0]=Rec.SenorBuffer[i++]; //��ͷ
			data[1]=Rec.SenorBuffer[i++]; //���к�1
			data[2]=Rec.SenorBuffer[i++];//���к�2
			data[3]=Rec.SenorBuffer[i++];//���к�3
			data[4]=Rec.SenorBuffer[i++];//�¶ȸ�
			data[5]=Rec.SenorBuffer[i++];//�¶ȵ�
			data[6]=Rec.SenorBuffer[i++];
			Rec.Senor_count=Rec.Senor_count-i;
			if(data[6]==((data[1]+data[2]+data[3]+data[4]+data[5])%256))
			{
				GPIO_PinReverse(GPIOB, GPIO_Pin_5);
				Senor_num=data[1]*256*256+data[2]*256+data[3]; //�����������к�
				Rec.SenorSeri[0]=data[1];
				Rec.SenorSeri[1]=data[2];
				Rec.SenorSeri[2]=data[3];
				Rec.Tempurate[0]=data[4];
				Rec.Tempurate[1]=data[5];
				SenorDate_Send(Senor_num,data[4],data[5]);			
			}

		}
		else
		{
			i++;
			Rec.Senor_count=Rec.Senor_count-1;
		}
	}
	memset(Rec.SenorBuffer,0x00,125);
	Rec.Senor_count=0;
}
