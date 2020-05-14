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

 uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
 uint8_t g_SI4463RxBuffer[ 64 ] = { 0 };


char *string = "AT+QIOPEN=\"UDP\",\"122.228.181.162\",\"8015\"";//IP��¼������,��Ҫ�����Լ���IP�Ͷ˿����޸�,0x0d,0x0a

void Config_Init(void)
{
	Config.flash_flag=0x00;
	Config.NumOK_flag=0x00;
	Config.Rec_flag=0x40;
}
int main(void)
{
	u16 i;
	
	Config_Init(); //�������ݳ�ʼ��
	GPRSData_Init();
	IPCOM_Init();
	SystemInit();   //ϵͳ��ʼ�� 72M
	delay_init(72);	//��ʱ��ʼ��
	NVIC_Configuration();//�ж����ȼ�����
	LED_Init();	
	Adc_Init();		//AD��ʼ��
	power_check();  //����ⲿ��Դ��û���ϵ��ʼ��
	Usart1_Init(115200);
	Usart2_Init(115200);		
	printf("��ӭʹ�ñ���˾��Ʒ������ʲô�����������Ա��ϵ\r\n\r\n");
	printf("��ϵ�绰��18006700616\r\n\r\n");
	delay_ns(1); //��ʱ2S����GPRSģ������ȶ�+
	OpenGprs_PowKey();
	BeepIO_Config();
	poweron_beep();
	SPI_Flash_Init();  		//SPI FLASH ��ʼ�� 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//��ⲻ��W25Q64
	{
		
		printf("�洢 ���ɹ�!\r\n\r\n");  
	}
	else
	{
		printf("�洢 ���ʧ��!\r\n");
		LED_LightOff();//��ʾ�洢оƬ����
	}	
	GetSeri_Num();//������к�
	GetIP_Com();
  GetSenior_num();
	printf("\r\n\r\n");

	//si4438 SPI��ʼ��
	drv_spi_init( );
	//SI4463��ʼ��	
	SI446x_Init( );
	Senor_StructInit();
	if(Config.flash_flag!=0x01)  //���flash��ȡ���ݴ�����ֱ�ӽ��е���ģʽ
	{
		#ifdef  _GPRS_INIT_
			Timer2_Init_Config();//��ʱ��2��ʼ��������GPRS
			switch(GPRS_Init((char*)IP_COM.Orin_IP))		//GPRSע��
			{
				case 1:   printf("GSMģ����\r\n"); break;
				case 2:   printf("SIM��δ��\r\n"); break;
				case 3:   
					printf("GPRSע��ɹ�!\r\n"); 
				  GPIO_ResetBits(GPIOB,GPIO_Pin_7);
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
	}

	IWDG_Init(6,4000);//���Ź���ʼ�� 25S����û��ι�������� ȷ��������ȶ���,���������ܴ���0xfff;
	while (1)
	{
		#ifdef _SI4438_EN_

				
			SI446x_Interrupt_Status( g_SI4463ItStatus );		//���ж�״̬
			
			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))		
			{
				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//��FIFO����
				ReciveSenor_Data(g_SI4463RxBuffer,i);

			 //������SI4438�ص�����ģʽ
				SI446x_Change_Status( 6 );
				while( 6 != SI446x_Get_Device_Status( ));
				SI446x_Start_Rx(  0, 0, PACKET_LENGTH,0,0,3 );
				i=0;
			}
			else
			{
				if( 60000 == i++ )
				{
					i = 0;
					SI446x_Init( );
				}
			}		
	
		#endif
			Uart_Config(Config.flash_flag);		
		
			if(Timer.Heart_count>=60)
			{
				Send_GPRS_DATA1(0xffff); 
				Timer.Heart_count=0x00;
				Timer.Value_count++;
				Timer.GpsVer_count++;
				if(Timer.Value_count>=5) //5���ӷ���һ�ε�ѹ����
				{
					Send_GPRS_DATA1(0x0002); //����һ�ε�ѹ
					Timer.Value_count=0;
				}
				if(Timer.GpsVer_count==12)
				{
					if(Rec.reflag==0x00)
						NVIC_SystemReset();//���12�����ڶ�û�д����������յ���������
					Send_GPRS_DATA1(0x0001); //����һ��GPS�Ͱ汾����Ϣ
					Timer.GpsVer_count=0;					
				}					
			}
			GPRS_Handle();
			if(Timer.NoHeart_count>=180)//��������û���յ�������
			{
				GPIO_SetBits(GPIOB,GPIO_Pin_7);//�������
				if(Timer.NoHeart_count>=240)//�ķ�����û���յ�������
				{
					printf("δ���յ����������������Ͽ���������ͨ�ţ�����ע��\r\n");
					NVIC_SystemReset();   //��λ����ע��GPRS
				}
			}
			if(Timer.NewIP_count>=3)//��ʾ�µ�IP��ַ�Ͷ˿ں������õ�
			{
				GPRSGET.NewIPOK=0x00;//�����㣬������һ�ε�IP��ַ����
				Timer.NewIP_count=0x00;
				printf("��ʼ�����µ�IP��ַ�Ͷ˿ں�\r\n");
				SaveNewIP();
				delay_ms(50);
				NVIC_SystemReset();   //��λ����ע��GPRS
			}
			SenorData_Handle();
			GPIO_PinReverse(GPIOB, GPIO_Pin_6);  //ָʾ����˸
			delay_ms(20);
			IWDG_Feed();// ι��
	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
