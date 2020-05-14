#include "gprs_handle.h"
#include "Usart.h"
#include "Data_Bus.h"
#include "timer2.h"


RingBuff_t ringBuff;//����һ��ringBuff�Ļ�����



void RingBuff_Init(void)
{
   //��ʼ�������Ϣ
   ringBuff.Head = 0;
   ringBuff.Tail = 0;
   ringBuff.Lenght = 0;
	 ringBuff.g_gprs_start=0;
	 ringBuff.g_gprs_uart=0x00;
}


u8 Write_RingBuff(u8 data)
{
   if(ringBuff.Lenght >= RINGBUFF_LEN) //�жϻ������Ƿ�����
    {
      return FLASE;
    }
    ringBuff.Ring_Buff[ringBuff.Tail]=data;
   ringBuff.Tail = (ringBuff.Tail+1)%RINGBUFF_LEN;//��ֹԽ��Ƿ�����
    ringBuff.Lenght++;
    return TRUE;
}


u8 Read_RingBuff(u8 *rData)
{
   if(ringBuff.Lenght == 0)//�жϷǿ�
    {
       return FLASE;
    }
   *rData = ringBuff.Ring_Buff[ringBuff.Head];//�Ƚ��ȳ�FIFO���ӻ�����ͷ��
   ringBuff.Head = (ringBuff.Head+1)%RINGBUFF_LEN;//��ֹԽ��Ƿ�����
   ringBuff.Lenght--;
   return TRUE;
}
//GRPS���յ����ݳ�ʼ������
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

					if(temp==0xf3)  //�յ�β����Ϣ
					{ 

							ringBuff.g_gprs_start=0x01;//һ�����������
							CMD=(gprs_data[14]<<8) | gprs_data[15];
							switch(CMD)
							{
								case 0xFFFF:  //�յ�������������
									Timer.NoHeart_count=0x00;//���յ�������ʱ����δ������������������
									if(GPRSGET.NewIPOK==0x01)
										Timer.NewIP_count++;
								break;
								case 0x0083:   //�յ�����������������
									NVIC_SystemReset();
								break;
								case 0x0080:  //�յ�����ƽ̨�Ĵ������б�
									printf("�յ��������б�ָ��\r\n");
									GPRSGET.Sensor_num=gprs_data[16];
									if(GPRSGET.Sensor_num * 4 > 200)
										GPRSGET.Sensor_num=45;  //Ҳ����˵��һ�������������Է���45��������
									for(i=0;i<(GPRSGET.Sensor_num * 4);i++)
									{
										GPRSGET.Sensor_Data[i]=gprs_data[17+i];
									}
								break;
								case 0x0081:  //���ý�����GPS ��ѹ����ʱ����
									
								break;
								case 0x0082:  //�յ��µ������Ͷ˿ں�
									printf("�յ��������޸�IP��ַ�˿ں�ָ��\r\n");
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
								case 0x0084:  //�ϱ����ص�ʱ����
									printf("�ϱ�����ʱ����ָ��\r\n");
								break;
								case 0x0085:  //�ϱ��������б�
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

			printf("����һ��ƽ̨�ط�����Ϣ\r\n");
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


