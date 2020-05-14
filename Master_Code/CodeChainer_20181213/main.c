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



extern vu8 rssi_flag;
uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 };
char *string = "AT+QIOPEN=\"UDP\",\"122.228.181.162\",\"8015\"";//IP登录服务器,需要根据自己的IP和端口做修改,0x0d,0x0a
//char *string = "AT+QIOPEN=\"UDP\",\"115.218.10.226\",\"8092\"";

//u8 datadu[100]={0x01,0x02,0x03,0x04,0x05};

void Config_Init(void)
{
	Config.flash_flag=0x00;
	Config.NumOK_flag=0x00;
	Config.Rec_flag=0x40;
}
int main(void)
{
	u16 i,j;
	Config_Init(); //配置数据初始化
	GPRSData_Init();
	IPCOM_Init();
	SystemInit();   //系统初始化 72M
	delay_init(72);	//延时初始化
	NVIC_Configuration();//中断优先级设置 
	delay_ns(1); //延时2S，让GPRS模块更加稳定
	OpenGprs_PowKey();
	LED_Init();
	Usart1_Init(115200);
	Usart2_Init(115200);	
	BeepIO_Config();
	poweron_beep();
	printf("欢迎使用本公司产品，如有什么疑问请与管理员联系\r\n\r\n");
	printf("联系电话：18006700616\r\n\r\n");
	SPI_Flash_Init();  		//SPI FLASH 初始化 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//检测不到W25Q64
	{
		
		printf("存储 检测成功!\r\n\r\n");  
	}
	else
		printf("存储 检测失败!\r\n");

	SPI_Flash_Read(Config.read_flash,0x00,7); //序号放在第0扇区
	
	for(i=0;i<10;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=3)  //检测内存中是否含有@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //蜂鸣器叫三下表示内部啥也没有
	}
	GetSeri_Num(Config.read_flash);//获得序列号
	SPI_Flash_Read(Config.read_flash,0x1000,100);//IP地址放在第0扇区

	for(i=0;i<100;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=5)  //检测内存中是否含有@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //蜂鸣器叫三下表示内部啥也没有
	}
	for(j=0;j<i;j++)
	{
		IP_COM.Orin_IP[j]	= Config.read_flash[j+1];	
	}	

	printf("\r\n\r\n");

	//si4438 SPI初始化
	drv_spi_init( );
	//SI4463初始化	
	SI446x_Init( );
	if(Config.flash_flag!=0x01)
	{
		#ifdef  _GPRS_INIT_
			Timer2_Init_Config();//定时器2初始化，用于GPRS
			switch(GPRS_Init((char*)IP_COM.Orin_IP))		//GPRS注册
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
	}

	
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
//					SI446x_Change_Status( 6 );
//					while( 6 != SI446x_Get_Device_Status( ));
//					SI446x_Start_Rx(  0, 0, PACKET_LENGTH,0,0,3 );
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
		
		if(Config.flash_flag==0x01)  //内存为空的情况,直接进入设置模式
		{
			Uart_Config();		
		}
		else
		{
			#ifdef  _GPRS_INIT_
					if(Timer.Heart_count>=60)
					{
						Send_GPRS_DATA1(0xffff); 
						Timer.Heart_count=0x00;
					}
					GPRS_Handle();
					if(Timer.NoHeart_count>=240)//四分钟内没有收到心跳包
					{
						printf("未接收到服务器心跳包，断开与主机的通信，重新注册\r\n");
						NVIC_SystemReset();   //复位重新注册GPRS
					}
					if(Timer.NewIP_count>=3)//表示新的IP地址和端口号是能用的
					{
						GPRSGET.NewIPOK=0x00;//先清零，便于下一次的IP地址更新
						Timer.NewIP_count=0x00;
						printf("开始保存新的IP地址和端口号\r\n");
						SaveNewIP();
						delay_ms(50);
						NVIC_SystemReset();   //复位重新注册GPRS
					}
			#endif		
		}


	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
