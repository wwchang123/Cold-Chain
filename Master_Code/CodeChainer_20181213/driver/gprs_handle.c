#include "gprs_handle.h"
#include "Usart.h"
#include "Data_Bus.h"
#include "timer2.h"


RingBuff_t ringBuff;//创建一个ringBuff的缓冲区



void RingBuff_Init(void)
{
   //初始化相关信息
   ringBuff.Head = 0;
   ringBuff.Tail = 0;
   ringBuff.Lenght = 0;
	 ringBuff.g_gprs_start=0;
	 ringBuff.g_gprs_uart=0x00;
}


u8 Write_RingBuff(u8 data)
{
   if(ringBuff.Lenght >= RINGBUFF_LEN) //判断缓冲区是否已满
    {
      return FLASE;
    }
    ringBuff.Ring_Buff[ringBuff.Tail]=data;
   ringBuff.Tail = (ringBuff.Tail+1)%RINGBUFF_LEN;//防止越界非法访问
    ringBuff.Lenght++;
    return TRUE;
}


u8 Read_RingBuff(u8 *rData)
{
   if(ringBuff.Lenght == 0)//判断非空
    {
       return FLASE;
    }
   *rData = ringBuff.Ring_Buff[ringBuff.Head];//先进先出FIFO，从缓冲区头出
   ringBuff.Head = (ringBuff.Head+1)%RINGBUFF_LEN;//防止越界非法访问
   ringBuff.Lenght--;
   return TRUE;
}
//GRPS接收的数据初始化清零
void GPRSData_Init(void)
{
	GPRSGET.Sensor_num=0x00;
	GPRSGET.VolUPTime=0x00;
	GPRSGET.GPSUPTime=0x00;
	GPRSGET.CLPORT=0x00;
	GPRSGET.NewIPOK=0x00;
	memset(GPRSGET.Sensor_Data,0,200);
	memset(GPRSGET.Batch_version,0,2);
	memset(GPRSGET.GetIPadress,0,20);
	memset(GPRSGET.GetCOMM,0,2);
	memset(GPRSGET.NewIP,0,60);
}
void GPRS_Handle(void)
{
	u8 gprs_data[RINGBUFF_LEN]={0x00},temp=0x00;
	u16 i=0,CMD=0x0000;
	if(ringBuff.g_gprs_uart==0x01)
	{
		if(Read_RingBuff(&temp)==0 && temp==0xf4)
		{
			gprs_data[0]=temp;
			for(i=0;i<RINGBUFF_LEN;i++)
			{
				if(Read_RingBuff(&temp)==0)
				{
					gprs_data[i+1]=	temp;

					if(temp==0xf3)  //收到尾的信息
					{ 

							ringBuff.g_gprs_start=0x01;//一个包接收完成
							CMD=(gprs_data[14]<<8) | gprs_data[15];
							switch(CMD)
							{
								case 0xFFFF:  //收到交换机心跳包
									Timer.NoHeart_count=0x00;//当收到心跳包时，把未接收心跳包计数清零
									if(GPRSGET.NewIPOK==0x01)
										Timer.NewIP_count++;
								break;
								case 0x0083:   //收到交换机重启的命令
									NVIC_SystemReset();
								break;
								case 0x0080:  //收到交换平台的传感器列表
									printf("收到传感器列表指令\r\n");
									GPRSGET.Sensor_num=gprs_data[16];
									if(GPRSGET.Sensor_num * 4 > 200)
										GPRSGET.Sensor_num=45;  //也就是说，一个交换机最多可以放下45个传感器
									for(i=0;i<(GPRSGET.Sensor_num * 4);i++)
									{
										GPRSGET.Sensor_Data[i]=gprs_data[17+i];
									}
								break;
								case 0x0081:  //设置交换机GPS 电压发送时间间隔
									
								break;
								case 0x0082:  //收到新的域名和端口号
									printf("收到服务器修改IP地址端口号指令\r\n");
									for(i=0;i<32;i++)
									{
										GPRSGET.GetIPadress[i]=gprs_data[i+16];
										if(GPRSGET.GetIPadress[i]==0x00)
										{
											break;
										}
											
									}
									GPRSGET.GetCOMM[0]=gprs_data[48];
									GPRSGET.GetCOMM[1]=gprs_data[49];		
									GetGprsIP_SIM(GPRSGET.GetIPadress,i,GPRSGET.GetCOMM);
								break;
								case 0x0084:  //上报网关的时间间隔
									printf("上报网关时间间隔指令\r\n");
								break;
								case 0x0085:  //上报传感器列表
									Send_GPRS_DATA1(0x0005); 
								break;
							}							
					}
						
				}

			}
		}	
	}
	else
	{
		;
	}
	
	if(ringBuff.g_gprs_start==0x01)
	{
		ringBuff.g_gprs_start=0x00;

			printf("处理一次平台回发的信息\r\n");
	}
	else
	{
		;
	}
	if(ringBuff.Lenght==0x00)
	{
		ringBuff.g_gprs_uart=0x00;
	}
	

}


