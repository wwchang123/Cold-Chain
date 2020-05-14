#include "Usart.h"
#include "modbus_uart.h"
#include "Data_Bus.h"
#include "delay.h"
#include "main.h"


#define Buf11_Max  	100  	//定义最大接收字节数 200

u8 At_string[16]="AT+QIOPEN=\"UDP\",";
vu8 UART1_Receive_Size=0;
u8 Uart1_Buf[Buf11_Max];     //接收缓冲,最大USART_REC_LEN个字节.

#if 1
#pragma import(__use_no_semihosting)             
//标准库需要的支持函数                 
struct __FILE 
{ 
	int handle; 

}; 

FILE __stdout;       
//定义_sys_exit()以避免使用半主机模式    
_sys_exit(int x) 
{ 
	x = x; 
} 
//重定义fputc函数 
int fputc(int ch, FILE *f)
{      
	while((USART1->SR&0X40)==0);//循环发送,直到发送完毕   
    USART1->DR = (u8) ch;      
	return ch;
}
#endif 


/*******************************************************************************
* 函数名 : CLR_Buf1
* 描述   : 清除串口1缓存数据
* 输入   : 
* 输出   : 
* 返回   : 
* 注意   : 
*******************************************************************************/
void CLR_Buf1(u8 *p,u8 buf2)
{
	  memset(p,0,buf2);
    UART1_Receive_Size = 0;      
}
void Usart1_Init(u32 bound)
{
     GPIO_InitTypeDef GPIO_InitStructure;    
     USART_InitTypeDef USART_InitStructure;           
     /* config USART1 clock */   
     RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA, ENABLE);             
     /* USART1 GPIO config */   
     /* Configure USART1 Tx (PA.09) as alternate function push-pull */   
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;    
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;    
     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;    
     GPIO_Init(GPIOA, &GPIO_InitStructure);        
     /* Configure USART1 Rx (PA.10) as input floating */   
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;    
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;    
     GPIO_Init(GPIOA, &GPIO_InitStructure); 
	
     /* USART1 mode config */   
     USART_InitStructure.USART_BaudRate = bound;    //设置波特率
     USART_InitStructure.USART_WordLength = USART_WordLength_8b;    //8位数据格式
     USART_InitStructure.USART_StopBits = USART_StopBits_1;    //1个停止位
     USART_InitStructure.USART_Parity = USART_Parity_No ;    //无奇偶校验位
     USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; 	//无硬件数据流控制   
     USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;   //工作模式设置为收发模式
	 USART_Init(USART1, &USART_InitStructure); //使能串口1接收中断
		 
	 USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);  //使能串口   
		 
     USART_Cmd(USART1, ENABLE);    	//清除发送完成标志
	 USART_ClearFlag(USART1, USART_FLAG_TC);					    //清除发送完成标志

}


/*******************************************************************************
* 函数名  : Usart2_Init
* 描述    : USART2初始化配置
* 输入    : bound：波特率(常用：2400、4800、9600、19200、38400、115200等)
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void Usart2_Init(u32 bound)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	USART_InitTypeDef	USART_InitStructure;
	
	/*使能USART2外设时钟*/  
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
	
	/*复位串口2*/
 	USART_DeInit(USART2);  
	
	/*USART2_GPIO初始化设置*/ 
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_2;					//USART2_TXD(PA.2) 
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;		//复用推挽输出
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	//设置引脚输出最大速率为50MHz
	GPIO_Init(GPIOA,&GPIO_InitStructure);						//调用库函数中的GPIO初始化函数，初始化USART1_TXD(PA.9)  
  
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_3;					//USART2_RXD(PA.3)
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOA,&GPIO_InitStructure);


	/*USART2 初始化设置*/
	USART_InitStructure.USART_BaudRate = bound;											//设置波特率
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;			//8位数据格式
	USART_InitStructure.USART_StopBits = USART_StopBits_1;					//1个停止位
	USART_InitStructure.USART_Parity = USART_Parity_No;							//无奇偶校验位
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(USART2, &USART_InitStructure);		
	//USART_Init(USART2, &USART_InitStructure); //初始化串口
	USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);
	USART_ITConfig(USART2,USART_IT_IDLE,ENABLE);
	USART_Cmd(USART2,ENABLE);
	USART_ClearFlag(USART2,USART_FLAG_TC);//清除发送完成标志
	
	
}


/*******************************************************************************
* 函数名  : Usart3_Init
* 描述    : USART3初始化配置
* 输入    : bound：波特率(常用：2400、4800、9600、19200、38400、115200等)
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void Usart3_Init(uint32_t BaudRate)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;
	//   NVIC_InitTypeDef NVIC_InitStructure; 

	//使能串口的RCC时钟
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB , ENABLE); //使能UART3所在GPIOB的时钟
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);

	//串口使用的GPIO口配置
	// Configure USART2 Rx (PB.11) as input floating  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	// Configure USART2 Tx (PB.10) as alternate function push-pull
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	//配置串口
	USART_InitStructure.USART_BaudRate = BaudRate;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(USART3, &USART_InitStructure);//配置串口3

	USART_ITConfig(USART3, USART_IT_RXNE, ENABLE);// Enable USART1 Receive interrupts 使能串口接收中断

	USART_Cmd(USART3, ENABLE);// Enable the USART3 

	USART_ClearFlag(USART3,USART_FLAG_TC);//清除发送完成标志
}





/*******************************************************************************
* 函数名  : Uart3_Sendbyte
* 描述    : USART3发送一个字节
* 输入    : byte 一个字节
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void Uart3_Sendbyte(u8 byte)
{
    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
    USART_SendData(USART3, byte);
}


/*******************************************************************************
* 函数名  : UART3_SendString
* 描述    : USART3发送字符串
* 输入    : *s字符串指针
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART3_SendString(u8 * s)
{
	while(*s)//检测字符串结束符
	{
		//while(USART_GetFlagStatus(USART3, USART_FLAG_TXE)==RESET); 
		Uart3_Sendbyte(*s++);//发送当前字符
	}
}

/*******************************************************************************
* 函数名  : UART3_Send_Len
* 描述    : USART3发送一定长度的字符
* 输入    : *s字符串指针，len：字符长度
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART3_Send_Len(char *s,u8 len)
{
	if(s!=0)
	while(len)//检测字符串结束符
	{
		while(USART_GetFlagStatus(USART3, USART_FLAG_TC)==RESET); 
		USART_SendData(USART3 ,*s++);//发送当前字符
		len--;
	}
}	




/*******************************************************************************
* 函数名  : USART3_IRQHandler
* 描述    : 串口3中断服务程序
* 输入    : 无
* 返回    : 无 
* 说明    : 
*******************************************************************************/
void USART3_IRQHandler(void)//MODBUS接收中断 
{
	u8 Res;
	
	if(USART_GetITStatus(USART3, USART_IT_RXNE)==SET)              //接收到数据
	{
		Res =USART_ReceiveData(USART3);

		USART_ClearITPendingBit(USART3,USART_IT_RXNE);
	}
		//溢出-如果发生溢出需要先读SR,再读DR寄存器则可清除不断入中断的问题[牛人说要这样]
	if(USART_GetFlagStatus(USART3,USART_FLAG_ORE)==SET)
	{
		
		Res =USART_ReceiveData(USART3);

		USART_ClearFlag(USART3,USART_FLAG_ORE);
	}
}
/*******************************************************************************
* 函数名  : USART1_IRQHandler
* 描述    : 串口1中断服务程序
* 输入    : 无
* 返回    : 无 
* 说明    : 用于配置终端参数
*******************************************************************************/
void USART1_IRQHandler(void)//
{
	vu8 Res,i,j,k;
	
	
	if(USART_GetITStatus(USART1, USART_IT_RXNE)==SET)              //接收到数据
  {	
		Uart1_Buf[UART1_Receive_Size++]=USART_ReceiveData(USART1);
		
		if(strstr((const char*)Uart1_Buf,"\r\n")!=NULL) //判断有没有新行，也就是回车键有没有
		{
			if(UART1_Receive_Size>=4)
			{
				if(UART1_Receive_Size<10)
				{
					Config.Num_Flash[0]=Uart1_Buf[0];
					Config.Num_Flash[1]=Uart1_Buf[1];
					Config.Num_Flash[2]=Uart1_Buf[2];
					Config.Num_Flash[3]=Uart1_Buf[3];
					Config.Num_Flash[4]=Uart1_Buf[4];
					Config.Num_Flash[5]=Uart1_Buf[5];		
					Config.NumOK_flag=0x01;
					CLR_Buf1(Uart1_Buf,Buf11_Max);							
				}
			}
//			else
//			{
//				Config.Num_Flash[0]=Uart1_Buf[0];
//			}
		}

		if(UART1_Receive_Size>=100)
			UART1_Receive_Size=100;
		USART_ClearITPendingBit(USART1,USART_IT_RXNE);
   }
	//溢出-如果发生溢出需要先读SR,再读DR寄存器则可清除不断入中断的问题[牛人说要这样]
	if(USART_GetFlagStatus(USART1,USART_FLAG_ORE)==SET)
	{
		Res =USART_ReceiveData(USART1);
			
		USART_ClearFlag(USART1,USART_FLAG_ORE);
	}
}

//配置函数处理
u8 Do_config(void)
{
	u8 i=0,j,k;
		
	if(strstr((const char*)Uart1_Buf,"\r\n")!=NULL) //判断有没有新行，也就是回车键有没有
	{
		for(i=0;i<200;i++)
		{
			if(Uart1_Buf[i]=='"' && i<=3)
			{
				j=i;
			}
			if(Uart1_Buf[i]==0x0d)
			{
				k=i;
				break;
			}
				
		}
		for(i=0;i<16;i++)
		{
			Config.IpCom[i]=At_string[i];
		}
		for(i=j;i<k;i++)
		{
			Config.IpCom[i+16]=Uart1_Buf[i];
		}
		return 1;
	}
	else return 0;
}
//串口配置功能
void Uart_Config(u8 flag)
{
	if(flag==0x01)
	{
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
						SPI_Flash_Write(&Config.Rec_flag,0x1000,1);
						SPI_Flash_Write(Config.IpCom,0x1001,sizeof(Config.IpCom));
						printf("IP地址端口号配置完成！\r\n\r\n");
						NVIC_SystemReset();   //复位
						break;
					}
				}
				
			}
		}	
	}
	else
	{
		if(Uart1_Buf[0]=='1')
		{
			Config.flash_flag=0x01;
			SPI_Flash_Erase_Sector(0x00) ;
			SPI_Flash_Erase_Sector(0x01) ;
			SPI_Flash_Erase_Sector(0x02) ;
			printf("重新配置所有的信息:\r\n");
			CLR_Buf1(Uart1_Buf,Buf11_Max);
			
		}
	}
}



