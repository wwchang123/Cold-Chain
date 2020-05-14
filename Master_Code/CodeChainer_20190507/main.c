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

 uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
 uint8_t g_SI4463RxBuffer[ 64 ] = { 0 };


char *string = "AT+QIOPEN=\"UDP\",\"122.228.181.162\",\"8015\"";//IP登录服务器,需要根据自己的IP和端口做修改,0x0d,0x0a

void Config_Init(void)
{
	Config.flash_flag=0x00;
	Config.NumOK_flag=0x00;
	Config.Rec_flag=0x40;
}
int main(void)
{
	u16 i;
	
	Config_Init(); //配置数据初始化
	GPRSData_Init();
	IPCOM_Init();
	SystemInit();   //系统初始化 72M
	delay_init(72);	//延时初始化
	NVIC_Configuration();//中断优先级设置
	LED_Init();	
	Adc_Init();		//AD初始化
	power_check();  //检测外部电源有没有上电初始化
	Usart1_Init(115200);
	Usart2_Init(115200);		
	printf("欢迎使用本公司产品，如有什么疑问请与管理员联系\r\n\r\n");
	printf("联系电话：18006700616\r\n\r\n");
	delay_ns(1); //延时2S，让GPRS模块更加稳定+
	OpenGprs_PowKey();
	BeepIO_Config();
	poweron_beep();
	SPI_Flash_Init();  		//SPI FLASH 初始化 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//检测不到W25Q64
	{
		
		printf("存储 检测成功!\r\n\r\n");  
	}
	else
	{
		printf("存储 检测失败!\r\n");
		LED_LightOff();//表示存储芯片出错
	}	
	GetSeri_Num();//获得序列号
	GetIP_Com();
  GetSenior_num();
	printf("\r\n\r\n");

	//si4438 SPI初始化
	drv_spi_init( );
	//SI4463初始化	
	SI446x_Init( );
	Senor_StructInit();
	if(Config.flash_flag!=0x01)  //如果flash读取数据错误，则直接进行调试模式
	{
		#ifdef  _GPRS_INIT_
			Timer2_Init_Config();//定时器2初始化，用于GPRS
			switch(GPRS_Init((char*)IP_COM.Orin_IP))		//GPRS注册
			{
				case 1:   printf("GSM模块损坏\r\n"); break;
				case 2:   printf("SIM卡未插\r\n"); break;
				case 3:   
					printf("GPRS注册成功!\r\n"); 
				  GPIO_ResetBits(GPIOB,GPIO_Pin_7);
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

	IWDG_Init(6,4000);//看门狗初始化 25S发现没有喂狗则重启 确保程序的稳定性,重载数不能大于0xfff;
	while (1)
	{
		#ifdef _SI4438_EN_

				
			SI446x_Interrupt_Status( g_SI4463ItStatus );		//读中断状态
			
			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))		
			{
				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//读FIFO数据
				ReciveSenor_Data(g_SI4463RxBuffer,i);

			 //重新让SI4438回到发送模式
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
				if(Timer.Value_count>=5) //5分钟发送一次电压数据
				{
					Send_GPRS_DATA1(0x0002); //发送一次电压
					Timer.Value_count=0;
				}
				if(Timer.GpsVer_count==12)
				{
					if(Rec.reflag==0x00)
						NVIC_SystemReset();//如果12分钟内都没有传感器数据收到，则重启
					Send_GPRS_DATA1(0x0001); //发送一次GPS和版本号信息
					Timer.GpsVer_count=0;					
				}					
			}
			GPRS_Handle();
			if(Timer.NoHeart_count>=180)//三分钟内没有收到心跳包
			{
				GPIO_SetBits(GPIOB,GPIO_Pin_7);//网络灯灭
				if(Timer.NoHeart_count>=240)//四分钟内没有收到心跳包
				{
					printf("未接收到服务器心跳包，断开与主机的通信，重新注册\r\n");
					NVIC_SystemReset();   //复位重新注册GPRS
				}
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
			SenorData_Handle();
			GPIO_PinReverse(GPIOB, GPIO_Pin_6);  //指示灯闪烁
			delay_ms(20);
			IWDG_Feed();// 喂狗
	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
