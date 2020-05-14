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
    GPIO_ResetBits(GPIOD,GPIO_Pin_13);//Ĭ�ϵƵ͵�ƽ
}

// ����485ģ������жϣ��Ƿ���Ҫ�����������
//Ŀǰ�����õ���һ���Զ��ж� ����ģ� ���Բ���Ҫ�á�
/*
 ��Ϊ������Ϊ9600��1�����ݵ�ʱ��Ϊ 1000000/9600=104 us
 1���ֽ� 10λ  10*104=1040us
 3.5���ַ�  1040us*3.5 = 3.64ms >8ms

*/
void Modbus_Init(void)
{
	Usart3_Init(9600);
	master.State_flag=0x30;
	modbus.Recount=0; //�����������
	modbus.TimRun=0; //��ʱ����ʱ�ر�
	master.SlaverAddr=0x02; //Ĭ��Ϊ0x02�������ɴ���ȥ����
	RS485EN_Config();
}

//����modbus����
void Modbus_Event(void)
{
	u16 crc=0;
	u16 recrc=0;
	if(modbus.Recv_flag==0) //û���յ����ݰ�
	{

		return;
	}


	crc=CRC16_Modbus(modbus.RceBuf,modbus.Recount-2);//�����У����
	recrc=modbus.RceBuf[modbus.Recount-2]*256+modbus.RceBuf[modbus.Recount-1];//�յ���У����
	if(crc==recrc)//����յ���У����������������֤����ͬ
	{
		LED485_1ON;
		if(modbus.RceBuf[0]==master.SlaverAddr)//ȷ���ǲ������������ĵ�ַ�ظ�
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
		if(modbus.RceBuf[0]==0x01)//���յ��������ϵ�����
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

//485���ݵķ���

void Rs485_Send(u8 byte)
{
	Uart3_Sendbyte(byte);
	//
}


//Modbus������01������� ///////////////////////////////////////////////////////////��������֤OK
//�����������
void Master_01_Slove( u8 board_adr,u16 start_address, u16 lenth )
{
	u16 crc;
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_COIL;    //modbus ָ����01
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}
//Modbus������02�������//////////////////////////////////////////////
//�����뿪����
void Master_02_Slove(u8 board_adr,u16 start_address, u16 lenth)
{	
	u16 crc;
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_DI;    //modbus ָ����02
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;

}
//Modbus������03�������///////////////////////////////////////////////////////////////////////////////////////
//�����ּĴ���
void Master_03_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 crc;
    master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_HLD_REG;    //modbus ָ����03
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}
//Modbus������04�������/////////////////////////////////////////////////////////////////////////////////////// δʹ��
//������Ĵ���
void Master_04_Slove( u8 board_adr,u16 start_address,u16 lenth )
{ 
	u16 crc;
    master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = READ_AI;    //modbus ָ����04
    master.Rs485_Buf[2] = HI(start_address);  
    master.Rs485_Buf[3] = LOW(start_address); 
    master.Rs485_Buf[4] = HI(lenth);
    master.Rs485_Buf[5] = LOW(lenth);
    crc=CRC16_Modbus(master.Rs485_Buf,6);
    master.Rs485_Buf[6]=(crc>>8)&0xFF;
    master.Rs485_Buf[7]=(crc)&0xFF;
}

//Modbus������05�������   ///////////////////////////////////////////////////////��������֤OK
//д������������� ���ֻ����0XFF00->1 ON; 0X0000->0 OFF;
void Master_05_Slove(u8 board_adr,u16 start_address, u16 value)
{
	
	u16 i;
	u16 crc;
	if(value==1)
	{
		if(master.Master_Output[start_address]) i=0xff00;
		else  i=0x0000;
		master.Rs485_Buf[0] = board_adr;
		master.Rs485_Buf[1] = SET_COIL;   //modbus ָ����05
		master.Rs485_Buf[2] = HI(start_address);  
		master.Rs485_Buf[3] = LOW(start_address); 
		master.Rs485_Buf[4] = HI(i);
		master.Rs485_Buf[5] = LOW(i);
		crc=CRC16_Modbus(master.Rs485_Buf,6);
		master.Rs485_Buf[6]=(crc>>8)&0xFF;
		master.Rs485_Buf[7]=(crc)&0xFF;

	}

}


//Modbus������06�������   //////////////////////////////////////////////////////////////////////////////////
//д�������ּĴ���
void Master_06_Slove(u8 board_adr,u16 start_address, u16 value)
{
	u16 crc;
	if(value==1)
	{
		master.Rs485_Buf[0] = board_adr;
		master.Rs485_Buf[1] = SET_HLD_REG;   //modbus ָ����06
		master.Rs485_Buf[2] = HI(start_address);  
		master.Rs485_Buf[3] = LOW(start_address); 
		master.Rs485_Buf[4] = HI(master.Master_WriteReg[start_address]);
		master.Rs485_Buf[5] = LOW(master.Master_WriteReg[start_address]);
		crc=CRC16_Modbus(master.Rs485_Buf,6);
		master.Rs485_Buf[6]=(crc>>8)&0xFF;
		master.Rs485_Buf[7]=(crc)&0xFF;

	}		
	
}
//Modbus������15�������   //////////////////////////////////////////////////////��������֤OK
//д������������
void Master_15_Slove(u8 board_adr,u16 start_address, u16 lenth) 
{	
		u16 crc;
	    u16 ByteNum;
        u16 i;
        if((start_address+lenth)<100)//�Ĵ�����ַ+�����ڷ�Χ��
        {

                ByteNum=lenth/8;//�ֽ���
                if(lenth%8) ByteNum+=1;//���λ���������������ֽ���+1
                for(i=0;i<lenth;i++)
                {
                         if(i%8==0) master.Rs485_Buf[7+i/8]=0x00;
						 master.Rs485_Buf[7+i/8]=master.Rs485_Buf[7+i/8]>>1;
                         if(master.Master_Output[start_address+i]) master.Rs485_Buf[7+i/8]=master.Rs485_Buf[7+i/8]|0x80;//��λ�ȷ���
                         if(i==lenth-1)//���͵����һ��λ��
                         {
                                if(lenth%8) master.Rs485_Buf[7+i/8]>>=8-(lenth%8);//������һ���ֽڻ�����������ʣ��MSB���0
                         }
                }
				
			}	      
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = WRITE_COIL;   //modbus ָ����15
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
//Modbus������16������� /////////////////////////////////////////////////////////////////////////////////////////////////����֤����OK
//д������ּĴ���
void Master_16_Slove(u8 board_adr,u16 start_address, u16 lenth) ///
{
	u16 crc;
	u8 i;
	if((start_address+lenth)<1000)//�Ĵ�����ַ+�����ڷ�Χ��
	{
		for(i=0;i<lenth;i++)
		{
			  master.Rs485_Buf[7+i*2]= master.Master_WriteReg[start_address+i]>>8;  //���ֽ���ǰ               
			  master.Rs485_Buf[8+i*2]= master.Master_WriteReg[start_address+i]; //���ֽ��ں�
		}
	}       //
	master.Rs485_Buf[0] = board_adr;
    master.Rs485_Buf[1] = WRITE_HLD_REG;   //modbus ָ����16
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


//�������ʹ�����
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
		//ת�ɷ���״̬
	RS485_Send;
	for(i=0;i<sendlenght;i++)
	{
		Rs485_Send(master.Rs485_Buf[i]);	
	}
	 
	delay_ms(5);  //��ʱ����̫������Ȼ���ڽ���ģʽ���ˣ������ղ�����
	//ת�ɽ���״̬
	RS485_Recive;
		
}



//RS485���մ�����

void Receive_Fun3(void)
{
	u8 i=0;
	if(i+16<=modbus.RceBuf[i+3])
	{
		for(i=0;i<4;i++)//˲ʱ����ֵ
		{
			flow.FLOW_RATE[i]=modbus.RceBuf[i+3];
		}
		
		for(i=0;i<4;i++)//�ۻ�����ֵ
		{
			flow.FLOW_TOTAL[i]=modbus.RceBuf[i+7];
		}
		for(i=0;i<4;i++)//�����¶�
		{
			flow.TEMP_CASE[i]=modbus.RceBuf[i+11];
		}
		for(i=0;i<4;i++)//����ѹ��
		{
			flow.PRESS_CASE[i]=modbus.RceBuf[i+15];
		}	
		
		
	}
	Vort_Data();
	
}


//��¯���ƹ�����

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

