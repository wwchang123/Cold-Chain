/*
  ��������԰E��1404��Ŀ
//��¯��Ŀ
//���ܣ����ڽ��ӻ������շ� gprs_rtu
//׫д�ˣ���ΰ��  18006700616
//20181206
//��ӡ���ܲ��ô���1��GSM���ܲ��ô���2.

*/
#include "main.h"



extern vu8 rssi_flag;
uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 }; 
extern u8 Uart2_Buf[200];//����1���ݻ�����

u8	Hardware_Num2[3]={0};
u8 data[3]={0x01,0x02,0x03};

int main(void)
{
	//u32 FLASH_SIZE; 
	u8 i;
	Hardware_Num2[0]=Switch_Num/256/256;  //���������
	Hardware_Num2[1]=Switch_Num/256%256;
	Hardware_Num2[2]=Switch_Num%256;
	SystemInit();   //ϵͳ��ʼ�� 72M
	delay_init(72);	//��ʱ��ʼ��
	NVIC_Configuration();//�ж����ȼ����� 
	delay_ns(1); //��ʱ2S����GPRSģ������ȶ�
	OpenGprs_PowKey();
	LED_Init();
	BeepIO_Config();
	poweron_beep();
	Usart1_Init(9600);
	Usart2_Init(115200);	
	delay_ms(100);
	printf("��ӭʹ�ñ���˾��Ʒ������ʲô�����������Ա��ϵ\r\n\r\n");
	delay_ms(100);
	printf("��ϵ�绰��18006700616\r\n\r\n\r\n");
	SPI_Flash_Init();  		//SPI FLASH ��ʼ�� 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//��ⲻ��W25Q64
	{
		
		printf("�洢 ���ɹ�!\r\n\r\n");  
	}
	else
		printf("�洢 ���ʧ��!\r\n");
		//si4432 SPI��ʼ��
	drv_spi_init( );
	//SI4463��ʼ��	
	SI446x_Init( );

////	FLASH_SIZE=8*1024*1024;	//FLASH ��СΪ8M�ֽ�
//	SPI_Flash_Read(FlashData,0,9);				//�ӵ�0����ַ����ʼ,����SIZE���ֽ�
//	for(i=0;i<9;i++)
//	{
//		printf("%x",FlashData[i]);
//		printf(" ");
//	}
//	printf("\r\n\r\n");
//	delay_ms(10);
#ifndef  _GPRS_INIT_
	
		Timer2_Init_Config();//��ʱ��2��ʼ��������GPRS
		switch(GPRS_Init())		//GPRSע��
		{
			case 1:   printf("GSMģ����\r\n"); break;
			case 2:   printf("SIM��δ��\r\n"); break;
			case 3:   
				printf("GPRSע��ɹ�!\r\n"); 
				//Send_GPRS_DATA1(0x0003);  //������ɺ󣬷��Ϳ�������
			break;
			case 4:   
				printf("GPRSע��ʧ��....\r\n");
				delay_ms(50);
				NVIC_SystemReset();   //��λ����ע��GPRS
			break;
			default:   break;	
		}
		
#endif
//	for( i = 0; i < 3; i++ )		//ģ���ʼ����ɣ�LED����˸3������
//	{
//		GPIO_ResetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6);//ȫ����
//		delay_ms(200);
//		GPIO_SetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6);//Ĭ�ϵƶ�����
//		delay_ms(200);
//	}	 	

	while (1)
	{		
//		if(rssi_flag==0x01)
//		{
//			rssi_flag=0x00;
//			SI446x_Interrupt_Status( g_SI4463ItStatus );		//���ж�״̬
//			
//			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))
//					
//			{
//				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//��FIFO����
//				if( i != 0 )
//				{
//					GPIO_PinReverse(GPIOB, GPIO_Pin_6);
////					printf( g_SI4463RxBuffer,i );	//������յ����ֽ�
//				}
//			 //������SI4438�ص�����ģʽ
//				SI446x_Change_Status( 6 );
//				while( 6 != SI446x_Get_Device_Status( ));
//				SI446x_Start_Rx(  0, 0, PACKET_LENGTH,0,0,3 );
//				i=0;
//			}
//			else
//			{
//				if( 3000 == i++ )
//				{
//					i = 0;
//					SI446x_Init( );
//				}
//				delay_ms( 1 );
//			}		
//		}
		delay_ns(5);
		//Send_GPRS_DATA1(0xffff); 
		UART2_Data_Len(data,3);
	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
