#include "modbus_uart5.h"
#include "Usart.h"
#include "user_lib.h"
#include "delay.h"
#include "led.h"

#define RS485_Send5  GPIO_SetBits(GPIOD,GPIO_Pin_13)
#define RS485_Recive5  GPIO_ResetBits(GPIOD,GPIO_Pin_13)

extern u8 Modbus_mode;

u16 Reg[200]=
{
	0x0000,   //���豸�Ĵ�����ֵ PLC���� ����Ƭ������RAM
	0x0001,
	0x0002,
	0x0003,
	0x0004,
	0x0005,
	0x0006,	
	0x0007,
	0x0008,
	0x0009,	
	0x000A
};


MODBUS2 modbus2;

void Modbus2_Init(void)
{
	Uart5_Init(9600);
//	master.State_flag=0x30;
	modbus2.Recount=0; //�����������
	modbus2.TimRun=0; //��ʱ����ʱ�ر�
	modbus2.MyAdd=0x02;//Ϊ�ӻ�ʱ��ID��
//	master.SlaverAddr=0x02;
	RS485_Recive5;
}

//485���ݵķ���

void Rs485_Send2(u8 byte)
{
	Uart5_Sendbyte(byte);
	//
}

//3�Ź�����  �������Ĵ���
void Modbus_Fun3(void)
{
	u16 RegAdd;//�Ĵ����ĵ�ַ
	u16 RegLen;//�Ĵ����ĳ���
	u16 len;//Ҫ�������ݵĳ���
	u16 i,j;
	u16 crc;
	RegAdd=modbus2.RceBuf[2]*256+modbus2.RceBuf[3];//�õ��Ĵ����׵�ַ
	RegLen=modbus2.RceBuf[4]*256+modbus2.RceBuf[5];//�õ��Ĵ����ĸ���
	i=0;
	modbus2.SendBuf[i++]=modbus2.MyAdd;//������ַ
	modbus2.SendBuf[i++]=0x03;//������
	len=RegLen*2;//������Ҫ�ļĴ����*2 =�ֽ�
	modbus2.SendBuf[i++]=len%256;
	for(j=0;j<RegLen;j++)
	{
		modbus2.SendBuf[i++]=Reg[RegAdd+j]/256;
		modbus2.SendBuf[i++]=Reg[RegAdd+j]%256;
	}
	crc=CRC16_Modbus(modbus2.SendBuf,i);//�����У����
	modbus2.SendBuf[i++]=crc/256;
	modbus2.SendBuf[i++]=crc%256;
	//ת�ɷ���״̬
	RS485_Send5;
	for(j=0;j<i;j++)
	{
		Rs485_Send2(modbus2.SendBuf[j]);	
	}
    delay_ms(10);
	//ת�ɽ���״̬
	RS485_Recive5;
}
//6�Ź����� ����д��Ĵ���
void Modbus_Fun6(void)
{
	u16 RegAdd;//�Ĵ����ĵ�ַ
	u16 vol;
	u16 i,j;
	u16 crc;
	RegAdd=modbus2.RceBuf[2]*256+modbus2.RceBuf[3];//�õ�Ҫ�޸ļĴ����׵�ַ
	vol=modbus2.RceBuf[4]*256+modbus2.RceBuf[5];//�޸ĺ��ֵ 
	Reg[RegAdd]=vol;
	//����Ϊ��Ӧ����
	i=0;
//	
//	len=2*RegLen;//������Ҫ�ļĴ����*2 =�ֽ�
	
	
	//modbus.SendBuf[i++]=len%256;
	modbus2.SendBuf[i++]=modbus2.MyAdd;
	modbus2.SendBuf[i++]=0x06;
	modbus2.SendBuf[i++]=RegAdd/256;
	modbus2.SendBuf[i++]=RegAdd%256;
	modbus2.SendBuf[i++]=vol/256;
	modbus2.SendBuf[i++]=vol%256;
	crc=CRC16_Modbus(modbus2.SendBuf,i);//�����У����

	modbus2.SendBuf[i++]=crc/256;
	modbus2.SendBuf[i++]=crc%256;
	//ת�ɷ���״̬
	RS485_Send5;
	for(j=0;j<i;j++)
	{
		Rs485_Send2(modbus2.SendBuf[j]);	
	}
	
	delay_ms(10);
	//ת�ɽ���״̬
	RS485_Recive5;

}


//����modbus����
void Modbus2_Event(void)
{
	u16 crc=0;
	u16 recrc=0;
	if(modbus2.Recv_flag==0) //û���յ����ݰ�
	{

		return;
	}

	Modbus_mode=0;//��������ɡ�
	crc=CRC16_Modbus(modbus2.RceBuf,modbus2.Recount-2);//�����У����
	recrc=modbus2.RceBuf[modbus2.Recount-2]*256+modbus2.RceBuf[modbus2.Recount-1];//�յ���У����
	if(crc==recrc)//����յ���У����������������֤����ͬ
	{
		LED485_2ON;
		if(modbus2.RceBuf[0]==modbus2.MyAdd)//ȷ�����ݰ��ǲ��Ƿ������豸��
		{
			switch(modbus2.RceBuf[1])
			{
				case 1: break;
				case 2: break;
				case 3: Modbus_Fun3(); break;
				case 4: break;
				case 5: break;
				case 6: Modbus_Fun6(); break;
				case 15: break;
				case 16: break;
				
			}
			
		}
		else if(modbus2.RceBuf[0]==0)//�㲥��ַ
		{
			
		}			
		

	}	
	


	modbus2.Recv_flag=0;
	modbus2.Recount=0;	
	
}

