/*
  宁波孵化园E栋1404项目
//锅炉项目
//功能：用于交接机数据收发 gprs_rtu
//撰写人：王伟昌  18006700616
//20181208
  打印功能采用串口1，GSM功能采用串口2.

*/
#include "main.h"

CONFIG Config;


u32 Switch_Num=900988;  //序列号
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
	Config_Init(); //配置数据初始化
	SystemInit();   //系统初始化 72M
	delay_init(72);	//延时初始化
	NVIC_Configuration();//中断优先级设置 
	delay_ns(1); //延时2S，让GPRS模块更加稳定
	OpenGprs_PowKey();
	LED_Init();
	Usart1_Init(115200);
	Usart2_Init(115200);	
	BeepIO_Config();
	//poweron_beep();
	printf("欢迎使用本公司产品，如有什么疑问请与管理员联系\r\n\r\n");
	printf("联系电话：18006700616\r\n\r\n");
	SPI_Flash_Init();  		//SPI FLASH 初始化 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//检测不到W25Q64
	{
		
		printf("存储 检测成功!\r\n\r\n");  
	}
	else
		printf("存储 检测失败!\r\n");
	SPI_Flash_Read(Config.read_flash,0x00,10);
	if(Config.read_flash[0]!=0x40 || Config.read_flash[7]!=0x40)  //检测内存中是否含有@
	{
		Config.flash_flag=0x01;		
//		Flash_Seri();  //蜂鸣器叫三下表示内部啥也没有
		#define _UART_CONFIG_
	}

	
//	SPI_Flash_Write(Hardware_Num2,0x00,3);
//	SPI_Flash_Write(string1,0x03,42);
//	SPI_Flash_Read(datadu,0x00,45);
//	printf(datadu,45);
	//si4438 SPI初始化
	drv_spi_init( );
	//SI4463初始化	
	SI446x_Init( );
	
#ifdef  _GPRS_INIT_
	Timer2_Init_Config();//定时器2初始化，用于GPRS
	switch(GPRS_Init())		//GPRS注册
	{
		case 1:   printf("GSM模块损坏\r\n"); break;
		case 2:   printf("SIM卡未插\r\n"); break;
		case 3:   
			printf("GPRS注册成功!\r\n"); 
			Send_GPRS_DATA1(0x0003);  //连接完成后，发送开机命令
		break;
		case 4:   
			printf("GPRS注册失败....\r\n");
			delay_ms(50);
			NVIC_SystemReset();   //复位重新注册GPRS
		break;
		default:   break;	
	}
	RingBuff_Init(); //模块初始化结束，清零
	Timer4_Init_Config();
  TimerStruct_Init();
#endif
	
	while (1)
	{
	#ifdef _SI4438_EN_
		if(rssi_flag==0x01)
		{
			rssi_flag=0x00;
			SI446x_Interrupt_Status( g_SI4463ItStatus );		//读中断状态
			
			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))
					
			{
				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//读FIFO数据
				if( i != 0 )
				{
					GPIO_PinReverse(GPIOB, GPIO_Pin_6);
//					printf( g_SI4463RxBuffer,i );	//输出接收到的字节
				}
			 //重新让SI4438回到发送模式
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
		if(Config.flash_flag==0x01)//表示要重新配置序列号和IP地址、端口号
		{
			printf("先输入序列号（序列号必须为6位数）：\r\n");
			while(1)
			{
				if(Config.NumOK_flag==0x01)
				{
					SPI_Flash_Write(&Config.Rec_flag,0x00,1);
					SPI_Flash_Write(Config.Num_Flash,0x01,6);
//					SPI_Flash_Read(Config.read_flash,0x00,10);
					Config.flash_flag=0x02;
					printf("序列号配置完成！\r\n\r\n");
					break;
				}
			}
		}
		if(Config.flash_flag==0x02)
		{
			while(1)
			{
				printf("欢迎进入串口IP地址和端口号配置模式:\r\n");
				printf("\r\n\r\n");
				printf("域名设置如下：\"218.71.143.80\",8028\r\n");
				printf("或者如下：\"www.rusinge.com\",8028");
				printf("\r\n\r\n");	
				while(1)
				{
					if(1==Do_config())
					{
						SPI_Flash_Write(&Config.Rec_flag,0x07,1);
						SPI_Flash_Write(Config.IpCom,0x08,sizeof(Config.IpCom));
						printf("IP地址端口号配置完成！\r\n\r\n");
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
