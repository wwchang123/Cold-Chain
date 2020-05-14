#include "modbus_uart.h"
#include "usart.h"
#include "user_lib.h"
#include "delay.h"
#include "Data_Bus.h"
#include "led.h"

MODBUS modbus;

Master master;
Flow flow;

void Control_FUN3(void);

void Receive_Fun3(void);

u8 RS485_Sendcount=0;

extern u8 Modbus_mode;

#define RS485_Send  GPIO_SetBits(GPIOD,GPIO_Pin_13)
#define RS485_Recive  GPIO_ResetBits(GPIOD,GPIO_Pin_13)



void RS485EN_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD,ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOD, &GPIO_InitStructure); 
    GPIO_ResetBits(GPIOD,GPIO_Pin_13);//默认灯低电平
}

// 根据485模块进行判断，是否需要加入控制引脚
//目前我们用的是一个自动判断 方向的， 所以不需要用。
/*
 因为波特率为9600，1个数据的时间为 1000000/9600=104 us
 1个字节 10位  10*104=1040us
 3.5个字符  1040us*3.5 = 3.64ms >8ms

*/
void Modbus_Init(void)
{
	Usart3_Init(9600);
	master.State_flag=0x30;
	modbus.Recount=0; //缓存个数清零
	modbus.TimRun=0; //定时器计时关闭
	master.SlaverAddr=0x02; //默认为0x02，可以由串口去配置
	RS485EN_Config();
}

//处理modbus数据
void Modbus_Event(void)
{
	u16 crc=0;
	u16 recrc=0;
	if(modbus.Recv_flag==0) //没有收到数据包
	{

		return;
	}


	crc=CRC16_Modbus(modbus.RceBuf,modbus.Recount-2);//计算出校验码
	recrc=modbus.RceBuf[modbus.Recount-2]*256+modbus.RceBuf[modbus.Recount-1];//收到的校验码
	if(crc==recrc)//如果收到的校验码与计算出来的验证码相同
	{
		LED485_1ON;
		if(modbus.RceBuf[0]==master.SlaverAddr)//确定是不是主机发出的地址回复
		{
			
			switch(modbus.RceBuf[1])
			{
				case 1: break;
				case 2: break;
				case 3: 
					
					 Control_FUN3();
				break;
				case 4: break;
				case 5: break;
				case 6: 
					//Modbus_Fun6(); 
				break;
				case 15: break;
				case 16: break;
				
			}
			
		}
		if(modbus.RceBuf[0]==0x01)//接收到流量表上的数据
		{
			switch(modbus.RceBuf[1])
			{
				case 1: break;
				case 2: break;
				case 3: 

					Receive_Fun3(); 
				break;
				case 4: break;
				case 5: break;
				case 6: 
					//Modbus_Fun6(); 
				break;
				case 15: break;
				case 16: break;
				
			}
			
		}
				

	}	
	


	modbus.Recv_flag=0;
	modbus.Recount=0;	
	
}

//485数据的发送

void Rs485_Send(u8 byte)
{
	Uart3_Sendbyte(byte);
	//
}


//Modbus功能码01处理程序 ///////////////////////////////////////////////////////////程序已验证OK
//读输出开关量
void Master_01_Slove( u8 board_adr,u16 start_address, u16 lenth )
{
	u16 crc;
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_COIL;    //modbus 指令码01
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}
//Modbus功能码02处理程序//////////////////////////////////////////////
//读输入开关量
void Master_02_Slove(u8 board_adr,u16 start_address, u16 lenth)
{	
	u16 crc;
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_DI;    //modbus 指令码02
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;

}
//Modbus功能码03处理程序///////////////////////////////////////////////////////////////////////////////////////
//读保持寄存器
void Master_03_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 crc;
    master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_HLD_REG;    //modbus 指令码03
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}
//Modbus功能码04处理程序/////////////////////////////////////////////////////////////////////////////////////// 未使用
//读输入寄存器
void Master_04_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 crc;
    master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_AI;    //modbus 指令码04
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}

//Modbus功能码05处理程序   ///////////////////////////////////////////////////////程序已验证OK
//写单个输出开关量 输出只能是0XFF00->1 ON; 0X0000->0 OFF;
void Master_05_Slove(u8 board_adr,u16 start_address, u16 value)
{
	
	u16 i;
	u16 crc;
	if(value==1)
	{
		if(master.Master_Output[start_address]) i=0xff00;
		else  i=0x0000;
		master.Rs485_Buf[0] = board_adr;
		master.Rs485_Buf[1] = SET_COIL;   //modbus 指令码05
		master.Rs485_Buf[2] = HI(start_address);  
		master.Rs485_Buf[3] = LOW(start_address); 
		master.Rs485_Buf[4] = HI(i);
		master.Rs485_Buf[5] = LOW(i);
		crc=CRC16_Modbus(master.Rs485_Buf,6);
		master.Rs485_Buf[6]=(crc>>8)&0xFF;
		master.Rs485_Buf[7]=(crc)&0xFF;

	}

}


//Modbus功能码06处理程序   //////////////////////////////////////////////////////////////////////////////////
//写单个保持寄存器
void Master_06_Slove(u8 board_adr,u16 start_address, u16 value)
{
	u16 crc;
	if(value==1)
	{
		master.Rs485_Buf[0] = board_adr;
		master.Rs485_Buf[1] = SET_HLD_REG;   //modbus 指令码06
		master.Rs485_Buf[2] = HI(start_address);  
		master.Rs485_Buf[3] = LOW(start_address); 
		master.Rs485_Buf[4] = HI(master.Master_WriteReg[start_address]);
		master.Rs485_Buf[5] = LOW(master.Master_WriteReg[start_address]);
		crc=CRC16_Modbus(master.Rs485_Buf,6);
		master.Rs485_Buf[6]=(crc>>8)&0xFF;
		master.Rs485_Buf[7]=(crc)&0xFF;

	}		
	
}
//Modbus功能码15处理程序   //////////////////////////////////////////////////////程序已验证OK
//写多个输出开关量
void Master_15_Slove(u8 board_adr,u16 start_address, u16 lenth) 
{	
		u16 crc;
	    u16 ByteNum;
        u16 i;
        if((start_address+lenth)<100)//寄存器地址+数量在范围内
        {

                ByteNum=lenth/8;//字节数
                if(lenth%8) ByteNum+=1;//如果位数还有余数，则字节数+1
                for(i=0;i<lenth;i++)
                {
                         if(i%8==0) master.Rs485_Buf[7+i/8]=0x00;
						 master.Rs485_Buf[7+i/8]=master.Rs485_Buf[7+i/8]>>1;
                         if(master.Master_Output[start_address+i]) master.Rs485_Buf[7+i/8]=master.Rs485_Buf[7+i/8]|0x80;//低位先发送
                         if(i==lenth-1)//发送到最后一个位了
                         {
                                if(lenth%8) master.Rs485_Buf[7+i/8]>>=8-(lenth%8);//如果最后一个字节还有余数，则剩余MSB填充0
                         }
                }
				
			}	      
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = WRITE_COIL;   //modbus 指令码15
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);	
	master.Rs485_Buf[6] = ByteNum;
    crc=CRC16_Modbus(master.Rs485_Buf,7+ByteNum);
	master.Rs485_Buf[7+ByteNum]=(crc>>8)&0xFF; 
    master.Rs485_Buf[8+ByteNum]=(crc)&0xFF;

	RS485_Sendcount=9+ByteNum;		

}
//Modbus功能码16处理程序 /////////////////////////////////////////////////////////////////////////////////////////////////已验证程序OK
//写多个保持寄存器
void Master_16_Slove(u8 board_adr,u16 start_address, u16 lenth) ///
{
	u16 crc;
	u8 i;
	if((start_address+lenth)<1000)//寄存器地址+数量在范围内
	{
		for(i=0;i<lenth;i++)
		{
			  master.Rs485_Buf[7+i*2]= master.Master_WriteReg[start_address+i]>>8;  //高字节在前               
			  master.Rs485_Buf[8+i*2]= master.Master_WriteReg[start_address+i]; //低字节在后
		}
	}       //
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = WRITE_HLD_REG;   //modbus 指令码16
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
	master.Rs485_Buf[6] = 2*lenth;
    crc=CRC16_Modbus(master.Rs485_Buf,7+2*lenth);
	master.Rs485_Buf[7+2*lenth]=(crc>>8)&0xFF; 
    master.Rs485_Buf[8+2*lenth]=(crc)&0xFF;
	RS485_Sendcount=9+2*lenth;
}


//主机发送处理函数
void Master_Service(u8 SlaverAddr,u8 Fuction,u16 StartAddr,u16 ValueOrLenth)
{    
	u8 i,sendlenght=0;
	
	switch(Fuction)
	{
		case 01:
				Master_01_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=8;
				break;
		case 02:
				Master_02_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=8;
				break;
		case 03:
				Master_03_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=8;
				break;
		case 05:
				Master_05_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=8;
				break;
		case 06:
				Master_06_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=8;
				break;
		case 15:
				Master_15_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=RS485_Sendcount;
				break;
		case 16:
				Master_16_Slove(SlaverAddr,StartAddr,ValueOrLenth);
				sendlenght=RS485_Sendcount;
				break;

	}
		//转成发送状态
	RS485_Send;
	for(i=0;i<sendlenght;i++)
	{
		Rs485_Send(master.Rs485_Buf[i]);	
	}
	 
	delay_ms(5);  //延时不能太长，不然串口接收模式慢了，数据收不到。
	//转成接收状态
	RS485_Recive;
		
}



//RS485接收处理函数

void Receive_Fun3(void)
{
	u8 i=0;
	if(i+16<=modbus.RceBuf[i+3])
	{
		for(i=0;i<4;i++)//瞬时流量值
		{
			flow.FLOW_RATE[i]=modbus.RceBuf[i+3];
		}
		
		for(i=0;i<4;i++)//累积流量值
		{
			flow.FLOW_TOTAL[i]=modbus.RceBuf[i+7];
		}
		for(i=0;i<4;i++)//工况温度
		{
			flow.TEMP_CASE[i]=modbus.RceBuf[i+11];
		}
		for(i=0;i<4;i++)//工况压力
		{
			flow.PRESS_CASE[i]=modbus.RceBuf[i+15];
		}	
		
		
	}
	Vort_Data();
	
}


//锅炉控制柜处理函数

void Control_FUN3(void)
{
	u8 i=0;
	for(i=0;i<16;i++)
	{
		Config.Temper_Channel[i/2][i%2]=modbus.RceBuf[i+3];
	}
	for(i=0;i<18;i++)
	{
		Config.Analog_Channel[i/2][i%2]=modbus.RceBuf[i+27];
	}
	Config.Input_Channel[0]=modbus.RceBuf[51];
	Config.Input_Channel[1]=modbus.RceBuf[52];
	Config.Output_Channel[0]=modbus.RceBuf[53];
	Config.Output_Channel[1]=modbus.RceBuf[54];
}

