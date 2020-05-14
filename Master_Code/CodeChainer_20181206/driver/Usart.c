#include "Usart.h"
#include "Data_Bus.h"

extern u8 FlashData[9];


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
	
	USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);
	
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
	vu8 Res,i;
	
	
	if(USART_GetITStatus(USART1, USART_IT_RXNE)==SET)              //接收到数据
  {	


		USART_ClearITPendingBit(USART1,USART_IT_RXNE);
   }
	//溢出-如果发生溢出需要先读SR,再读DR寄存器则可清除不断入中断的问题[牛人说要这样]
	if(USART_GetFlagStatus(USART1,USART_FLAG_ORE)==SET)
	{
		Res =USART_ReceiveData(USART1);
			
		USART_ClearFlag(USART1,USART_FLAG_ORE);
	}
}






