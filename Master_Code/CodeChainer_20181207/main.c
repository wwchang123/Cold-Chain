/*
  宁波孵化园E栋1404项目
//锅炉项目
//功能：用于交接机数据收发 gprs_rtu
//撰写人：王伟昌  18006700616
//20181206
//打印功能采用串口1，GSM功能采用串口2.

*/
#include "main.h"



extern vu8 rssi_flag;
uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 }; 
extern u8 Uart2_Buf[200];//串口1数据缓存区

u8	Hardware_Num2[3]={0};
u8 data[3]={0x01,0x02,0x03};

int main(void)
{
	//u32 FLASH_SIZE; 
	u8 i;
	Hardware_Num2[0]=Switch_Num/256/256;  //交换机序号
	Hardware_Num2[1]=Switch_Num/256%256;
	Hardware_Num2[2]=Switch_Num%256;
	SystemInit();   //系统初始化 72M
	delay_init(72);	//延时初始化
	NVIC_Configuration();//中断优先级设置 
	delay_ns(1); //延时2S，让GPRS模块更加稳定
	OpenGprs_PowKey();
	LED_Init();
	BeepIO_Config();
	poweron_beep();
	Usart1_Init(9600);
	Usart2_Init(115200);	
	delay_ms(100);
	printf("欢迎使用本公司产品，如有什么疑问请与管理员联系\r\n\r\n");
	delay_ms(100);
	printf("联系电话：18006700616\r\n\r\n\r\n");
	SPI_Flash_Init();  		//SPI FLASH 初始化 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//检测不到W25Q64
	{
		
		printf("存储 检测成功!\r\n\r\n");  
	}
	else
		printf("存储 检测失败!\r\n");
		//si4432 SPI初始化
	drv_spi_init( );
	//SI4463初始化	
	SI446x_Init( );

////	FLASH_SIZE=8*1024*1024;	//FLASH 大小为8M字节
//	SPI_Flash_Read(FlashData,0,9);				//从第0个地址处开始,读出SIZE个字节
//	for(i=0;i<9;i++)
//	{
//		printf("%x",FlashData[i]);
//		printf(" ");
//	}
//	printf("\r\n\r\n");
//	delay_ms(10);
#ifndef  _GPRS_INIT_
	
		Timer2_Init_Config();//定时器2初始化，用于GPRS
		switch(GPRS_Init())		//GPRS注册
		{
			case 1:   printf("GSM模块损坏\r\n"); break;
			case 2:   printf("SIM卡未插\r\n"); break;
			case 3:   
				printf("GPRS注册成功!\r\n"); 
				//Send_GPRS_DATA1(0x0003);  //连接完成后，发送开机命令
			break;
			case 4:   
				printf("GPRS注册失败....\r\n");
				delay_ms(50);
				NVIC_SystemReset();   //复位重新注册GPRS
			break;
			default:   break;	
		}
		
#endif
//	for( i = 0; i < 3; i++ )		//模块初始化完成，LED灯闪烁3个周期
//	{
//		GPIO_ResetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6);//全部亮
//		delay_ms(200);
//		GPIO_SetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6);//默认灯都是灭
//		delay_ms(200);
//	}	 	

	while (1)
	{		
//		if(rssi_flag==0x01)
//		{
//			rssi_flag=0x00;
//			SI446x_Interrupt_Status( g_SI4463ItStatus );		//读中断状态
//			
//			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))
//					
//			{
//				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//读FIFO数据
//				if( i != 0 )
//				{
//					GPIO_PinReverse(GPIOB, GPIO_Pin_6);
////					printf( g_SI4463RxBuffer,i );	//输出接收到的字节
//				}
//			 //重新让SI4438回到发送模式
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
