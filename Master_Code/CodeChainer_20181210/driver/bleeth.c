#include "bleeth.h"

#define Buf2_Max 64
u8 Uart2_Buf[Buf2_Max]={0};//串口2数据缓存区
vu8 First_Int2 = 0;
/*******************************************************************************
* 函数名  : UART2_Data
* 描述    : USART2发送一个字节
* 输入    : byte 一个字节
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_Data(char byte)
{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2 ,byte);//发送当前字符
}

/*******************************************************************************
* 函数名  : UART2_SendString
* 描述    : USART2发送字符串
* 输入    : *s字符串指针
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_SendString(char* s)
{
	while(*s != '\0')//检测字符串结束符
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2 ,*s++);//发送当前字符
	}
}

void bleeth_send(char data)
{
	UART2_Data(data);
}

/*******************************************************************************
* 函数名  : USART2_IRQHandler
* 描述    : 串口2中断服务程序
* 输入    : 无
* 返回    : 无 
* 说明    : 
*******************************************************************************/
void USART2_IRQHandler(void)                	
{
	char Res=0;
	
	if(USART_GetITStatus(USART2, USART_IT_RXNE)==SET)              //接收到数据
  {
		Res =USART_ReceiveData(USART2);
		Uart2_Buf[First_Int2] = Res;  	  //将接收到的字符串存到缓存中
		First_Int2++;                			//缓存指针向后移动
		if(First_Int2 > Buf2_Max)       		//如果缓存满,将缓存指针指向缓存的首地址
		{
			First_Int2 = 0;
		}   
		USART_ClearITPendingBit(USART2,USART_IT_RXNE);
   }

	//溢出-如果发生溢出需要先读SR,再读DR寄存器则可清除不断入中断的问题[牛人说要这样]
	if(USART_GetFlagStatus(USART2,USART_FLAG_ORE)==SET)
	{
			Res =USART_ReceiveData(USART2);
			Uart2_Buf[First_Int2] = Res;  	  //将接收到的字符串存到缓存中
			First_Int2++;                			//缓存指针向后移动
			if(First_Int2 > Buf2_Max)       		//如果缓存满,将缓存指针指向缓存的首地址
			{
				First_Int2 = 0;
			}    	

		USART_ClearFlag(USART2,USART_FLAG_ORE);
	}
			
	if(Res==0x15)
	{
		bleeth_send(0x55);
	}
} 
