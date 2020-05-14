/*
  ��������԰E��1404��Ŀ
//��¯��Ŀ
//���ܣ����ڽ��ӻ������շ� gprs_rtu
//׫д�ˣ���ΰ��  18006700616
//20181208
  ��ӡ���ܲ��ô���1��GSM���ܲ��ô���2.

*/
#include "main.h"

CONFIG Config;


u32 Switch_Num=900988;  //���к�
extern vu8 rssi_flag;
uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 };
u8	Hardware_Num2[3]={0};

u8 datadu[100]={0x00};

void Config_Init(void)
{
	Config.flash_flag=0x00;
	Config.NumOK_flag=0x00;
	Config.Rec_flag=0x40;
}
int main(void)
{
	u16 i;
	Hardware_Num2[0]=Switch_Num/256/256;
	Hardware_Num2[1]=Switch_Num/256%256;
	Hardware_Num2[2]=Switch_Num%256;
	Config_Init(); //�������ݳ�ʼ��
	SystemInit();   //ϵͳ��ʼ�� 72M
	delay_init(72);	//��ʱ��ʼ��
	NVIC_Configuration();//�ж����ȼ����� 
	delay_ns(1); //��ʱ2S����GPRSģ������ȶ�
	OpenGprs_PowKey();
	LED_Init();
	Usart1_Init(115200);
	Usart2_Init(115200);	
	BeepIO_Config();
	//poweron_beep();
	printf("��ӭʹ�ñ���˾��Ʒ������ʲô�����������Ա��ϵ\r\n\r\n");
	printf("��ϵ�绰��18006700616\r\n\r\n");
	SPI_Flash_Init();  		//SPI FLASH ��ʼ�� 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//��ⲻ��W25Q64
	{
		
		printf("�洢 ���ɹ�!\r\n\r\n");  
	}
	else
		printf("�洢 ���ʧ��!\r\n");
	SPI_Flash_Read(Config.read_flash,0x00,10);
	if(Config.read_flash[0]!=0x40 || Config.read_flash[7]!=0x40)  //����ڴ����Ƿ���@
	{
		Config.flash_flag=0x01;		
//		Flash_Seri();  //�����������±�ʾ�ڲ�ɶҲû��
		#define _UART_CONFIG_
	}

	
//	SPI_Flash_Write(Hardware_Num2,0x00,3);
//	SPI_Flash_Write(string1,0x03,42);
//	SPI_Flash_Read(datadu,0x00,45);
//	printf(datadu,45);
	//si4438 SPI��ʼ��
	drv_spi_init( );
	//SI4463��ʼ��	
	SI446x_Init( );
	
#ifdef  _GPRS_INIT_
	Timer2_Init_Config();//��ʱ��2��ʼ��������GPRS
	switch(GPRS_Init())		//GPRSע��
	{
		case 1:   printf("GSMģ����\r\n"); break;
		case 2:   printf("SIM��δ��\r\n"); break;
		case 3:   
			printf("GPRSע��ɹ�!\r\n"); 
			Send_GPRS_DATA1(0x0003);  //������ɺ󣬷��Ϳ�������
		break;
		case 4:   
			printf("GPRSע��ʧ��....\r\n");
			delay_ms(50);
			NVIC_SystemReset();   //��λ����ע��GPRS
		break;
		default:   break;	
	}
	RingBuff_Init(); //ģ���ʼ������������
	Timer4_Init_Config();
  TimerStruct_Init();
#endif
	
	while (1)
	{
	#ifdef _SI4438_EN_
		if(rssi_flag==0x01)
		{
			rssi_flag=0x00;
			SI446x_Interrupt_Status( g_SI4463ItStatus );		//���ж�״̬
			
			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))
					
			{
				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//��FIFO����
				if( i != 0 )
				{
					GPIO_PinReverse(GPIOB, GPIO_Pin_6);
//					printf( g_SI4463RxBuffer,i );	//������յ����ֽ�
				}
			 //������SI4438�ص�����ģʽ
				SI446x_Change_Status( 6 );
				while( 6 != SI446x_Get_Device_Status( ));
				SI446x_Start_Rx(  0, 0, PACKET_LENGTH,0,0,3 );
				i=0;
			}
			else
			{
				if( 3000 == i++ )
				{
					i = 0;
					SI446x_Init( );
				}
				delay_ms( 1 );
			}		
		}		

	#endif
#ifdef  _GPRS_INIT_
		if(Timer.Heart_count>=60)
		{
			Send_GPRS_DATA1(0xffff); 
			Timer.Heart_count=0x00;
		}
		GPRS_Handle();
#endif
#ifdef _UART_CONFIG_
		if(Config.flash_flag==0x01)//��ʾҪ�����������кź�IP��ַ���˿ں�
		{
			printf("���������кţ����кű���Ϊ6λ������\r\n");
			while(1)
			{
				if(Config.NumOK_flag==0x01)
				{
					SPI_Flash_Write(&Config.Rec_flag,0x00,1);
					SPI_Flash_Write(Config.Num_Flash,0x01,6);
//					SPI_Flash_Read(Config.read_flash,0x00,10);
					Config.flash_flag=0x02;
					printf("���к�������ɣ�\r\n\r\n");
					break;
				}
			}
		}
		if(Config.flash_flag==0x02)
		{
			while(1)
			{
				printf("��ӭ���봮��IP��ַ�Ͷ˿ں�����ģʽ:\r\n");
				printf("\r\n\r\n");
				printf("�����������£�\"218.71.143.80\",8028\r\n");
				printf("�������£�\"www.rusinge.com\",8028");
				printf("\r\n\r\n");	
				while(1)
				{
					if(1==Do_config())
					{
						SPI_Flash_Write(&Config.Rec_flag,0x07,1);
						SPI_Flash_Write(Config.IpCom,0x08,sizeof(Config.IpCom));
						printf("IP��ַ�˿ں�������ɣ�\r\n\r\n");
						SPI_Flash_Read(datadu,0x00,sizeof(Config.IpCom)+8);
						for(i=0;i<(sizeof(Config.IpCom)+8);i++)
						{
							printf("%d",datadu[i]);
						}
						break;
					}
				}
				
			}
		}
#else
		
#endif
	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
