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
	0x0000,   //本设备寄存器的值 PLC概念 ，单片机就是RAM
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
	modbus2.Recount=0; //缓存个数清零
	modbus2.TimRun=0; //定时器计时关闭
	modbus2.MyAdd=0x02;//为从机时的ID号
//	master.SlaverAddr=0x02;
	RS485_Recive5;
}

//485数据的发送

void Rs485_Send2(u8 byte)
{
	Uart5_Sendbyte(byte);
	//
}

//3号功能码  主机读寄存器
void Modbus_Fun3(void)
{
	u16 RegAdd;//寄存器的地址
	u16 RegLen;//寄存器的长度
	u16 len;//要返回数据的长度
	u16 i,j;
	u16 crc;
	RegAdd=modbus2.RceBuf[2]*256+modbus2.RceBuf[3];//得到寄存器首地址
	RegLen=modbus2.RceBuf[4]*256+modbus2.RceBuf[5];//得到寄存器的个数
	i=0;
	modbus2.SendBuf[i++]=modbus2.MyAdd;//本机地址
	modbus2.SendBuf[i++]=0x03;//功能码
	len=RegLen*2;//主机需要的寄存个数*2 =字节
	modbus2.SendBuf[i++]=len%256;
	for(j=0;j<RegLen;j++)
	{
		modbus2.SendBuf[i++]=Reg[RegAdd+j]/256;
		modbus2.SendBuf[i++]=Reg[RegAdd+j]%256;
	}
	crc=CRC16_Modbus(modbus2.SendBuf,i);//计算出校验码
	modbus2.SendBuf[i++]=crc/256;
	modbus2.SendBuf[i++]=crc%256;
	//转成发送状态
	RS485_Send5;
	for(j=0;j<i;j++)
	{
		Rs485_Send2(modbus2.SendBuf[j]);	
	}
    delay_ms(10);
	//转成接收状态
	RS485_Recive5;
}
//6号功能码 主机写入寄存器
void Modbus_Fun6(void)
{
	u16 RegAdd;//寄存器的地址
	u16 vol;
	u16 i,j;
	u16 crc;
	RegAdd=modbus2.RceBuf[2]*256+modbus2.RceBuf[3];//得到要修改寄存器首地址
	vol=modbus2.RceBuf[4]*256+modbus2.RceBuf[5];//修改后的值 
	Reg[RegAdd]=vol;
	//以下为回应主机
	i=0;
//	
//	len=2*RegLen;//主机需要的寄存个数*2 =字节
	
	
	//modbus.SendBuf[i++]=len%256;
	modbus2.SendBuf[i++]=modbus2.MyAdd;
	modbus2.SendBuf[i++]=0x06;
	modbus2.SendBuf[i++]=RegAdd/256;
	modbus2.SendBuf[i++]=RegAdd%256;
	modbus2.SendBuf[i++]=vol/256;
	modbus2.SendBuf[i++]=vol%256;
	crc=CRC16_Modbus(modbus2.SendBuf,i);//计算出校验码

	modbus2.SendBuf[i++]=crc/256;
	modbus2.SendBuf[i++]=crc%256;
	//转成发送状态
	RS485_Send5;
	for(j=0;j<i;j++)
	{
		Rs485_Send2(modbus2.SendBuf[j]);	
	}
	
	delay_ms(10);
	//转成接收状态
	RS485_Recive5;

}


//处理modbus数据
void Modbus2_Event(void)
{
	u16 crc=0;
	u16 recrc=0;
	if(modbus2.Recv_flag==0) //没有收到数据包
	{

		return;
	}

	Modbus_mode=0;//包接受完成。
	crc=CRC16_Modbus(modbus2.RceBuf,modbus2.Recount-2);//计算出校验码
	recrc=modbus2.RceBuf[modbus2.Recount-2]*256+modbus2.RceBuf[modbus2.Recount-1];//收到的校验码
	if(crc==recrc)//如果收到的校验码与计算出来的验证码相同
	{
		LED485_2ON;
		if(modbus2.RceBuf[0]==modbus2.MyAdd)//确定数据包是不是发到本设备的
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
		else if(modbus2.RceBuf[0]==0)//广播地址
		{
			
		}			
		

	}	
	


	modbus2.Recv_flag=0;
	modbus2.Recount=0;	
	
}

