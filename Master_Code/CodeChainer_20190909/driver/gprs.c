/*
  gprs采用透传的方式进行数据传输
  只要配置成透传模式，把AT+CIPMODE=1设置即可
*/
#include "gprs.h"
#include "string.h"
#include "stdio.h"
#include "delay.h"
#include "led.h"
#include "Data_Bus.h"
#include "gprs_handle.h"


IPCOM  IP_COM;

//串口1发送回车换行
#define UART2_SendLR() UART2_SendString("\r\n")
vu8 First_Int2 = 0;
#define Buf2_Max 250

u8  Uart2_Buf[Buf2_Max]={0};//串口1数据缓存区
vu8 Timer2_start=0,Times=0,timer2=0;	//定时器2延时启动计数器
/*************	本地常量声明	**************/

//全球公网IP地址及端口号："AT+CIPSTART=\"TCP\",\"195.34.89.241\",7"
//锅炉控制系统的IP地址及端口号  "AT+CIPSTART=\"TCP\",\"139.196.152.127\",12000"
//const char *string = "AT+QIOPEN=\"TCP\",\"139.196.152.127\",\"12000\"";//IP登录服务器,需要根据自己的IP和端口做修改,0x0d,0x0a
//const char *string = "AT+QIOPEN=\"TCP\",\"195.34.89.241\",\"7\"";//IP登录服务器,需要根据自己的IP和端口做修改,0x0d,0x0a
//const char *string = "AT+QIOPEN=\"UDP\",\"122.228.181.162\",\"8015\"";//IP登录服务器,需要根据自己的IP和端口做修改,0x0d,0x0a


void IPCOM_Init(void)
{
	memset(IP_COM.Gprsdwon_IP,0,60);
	memset(IP_COM.Orin_IP,0,60);
}
//PORkey功能开机 
void OpenGprs_PowKey(void)
{
	
	GPIO_InitTypeDef GPIO_InitStructure;
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &GPIO_InitStructure); 
  GPIO_ResetBits(GPIOC,GPIO_Pin_12);
	GPIO_SetBits(GPIOC,GPIO_Pin_12);
	delay_ms(1500);
	GPIO_ResetBits(GPIOC,GPIO_Pin_12);
}
/*******************************************************************************
* 函数名 : CLR_Buf1
* 描述   : 清除串口1缓存数据
* 输入   : 
* 输出   : 
* 返回   : 
* 注意   : 
*******************************************************************************/
void CLR_Buf2(u8 *p,u8 buf2)
{
	memset(p,0,buf2);
    First_Int2 = 0;              //接收字符串的起始存储位置
}
/*******************************************************************************
* 函数名 : Find
* 描述   : 判断缓存中是否含有指定的字符串
* 输入   : 
* 输出   : 
* 返回   : unsigned char:1 找到指定字符，0 未找到指定字符 
* 注意   : 
*******************************************************************************/

u8 Find(char *a)
{ 
  if(strstr((const char *)Uart2_Buf,a)!=NULL)
	    return 1;
	else
			return 0;
}
/*******************************************************************************
* 函数名  : UART1_Data
* 描述    : USART1发送一个字节
* 输入    : byte 一个字节
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_Data(char byte)
{
	while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
	USART_SendData(USART2,byte);//发送当前字符
}

/*******************************************************************************
* 函数名  : UART1_Data
* 描述    : USART1发送多个字节
* 输入    : byte 一个字节
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_Data_Len(u8 *a,u8 len)
{
	u8 i;
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	for(i=0;i<len;i++)
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,a[i]);//发送当前字符	
	}

}
/*******************************************************************************
* 函数名  : UART1_SendString
* 描述    : USART1发送字符串
* 输入    : *s字符串指针
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_SendString(char* s)
{

	while(*s)//检测字符串结束符
	{
		while(USART_GetFlagStatus(USART2,USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,(char)*s++);//发送当前字符
	}
}

/*******************************************************************************
* 函数名  : UART1_Send_Len
* 描述    : USART1发送一定长度的字符
* 输入    : *s字符串指针，len：字符长度
* 输出    : 无
* 返回    : 无 
* 说明    : 无
*******************************************************************************/
void UART2_Send_Len(char *s,u8 len)
{
	if(s!=0)
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	while(len)//检测字符串结束符
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,*s++);//发送当前字符
		len--;
	}
}	



/*******************************************************************************
* 函数名 : Second_AT_Command
* 描述   : 发送AT指令函数
* 输入   : 发送数据的指针、发送等待时间(单位：S)
* 输出   :  一直在发，直到接收的OK为止
* 返回   : 
* 注意   : 
*******************************************************************************/

void Second_AT_Command(char *b,char *a,u8 wait_time)         
{
	u8 i;
	char *c;
	c = b;										//保存字符串地址到c
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	i = 0;
	while(i == 0)                    
	{
		if(!Find(a)) 
		{
			if(Timer2_start == 0)
			{
				b = c;							//将字符串地址给b
				for (; *b!='\0';b++)
				{
					while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET);
					USART_SendData(USART2,*b);
				}

				Times = 0;
				timer2 = wait_time;
				Timer2_start = 1;
		   }
		}
		else
		{
			i = 1;
			Timer2_start = 0;
		}
	}
 
	CLR_Buf2(Uart2_Buf,Buf2_Max);
}

/*******************************************************************************
* 函数名 : GSM_send_cmd
* 描述   : 发送AT指令函数
* 输入   : 发送数据的指针、发送等待时间(单位：S)
* 输出   : 一直在延时中等待OK。
* 返回   : 0:正常  1:错误
* 注意   : 
*******************************************************************************/
u8 GSM_send_cmd(char *cmd,char *ack,u8 wait_time)         
{
	u8 res=1;
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	IWDG_Feed();// 喂狗
	for (; *cmd!='\0';cmd++)
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET);
		USART_SendData(USART2,*cmd);
	}
	UART2_SendLR();
	if(wait_time==0)return res;
	Times = 0;
	timer2 = wait_time;
	Timer2_start = 1;
	
	while(Timer2_start&res)                    
	{
		if((strstr((const char*)Uart2_Buf,(char*)ack)==ERROR)||(strstr((const char*)Uart2_Buf,(char*)ack)==NULL))//接受错误 ERROR
		{
			res=1;
		}	
		else
		{
			 res=0;
		}

	}
	return res;
}

/*******************************************************************************
* 函数名 : Set_ATE0
* 描述   : 取消回显
* 输入   : 
* 输出   : 
* 返回   : 
* 注意   : 
*******************************************************************************/
void Set_ATE0(void)
{
	GSM_send_cmd("ATE0","OK",3);								//取消回显		
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
	u8 Res=0;
	
	if(USART_GetITStatus(USART2, USART_IT_RXNE)!= RESET)              //接收到数据
	{
		//Res=USART1->SR;
		Res =USART_ReceiveData(USART2);
	  
		Uart2_Buf[First_Int2] = Res;  	  //将接收到的字符串存到缓存中

		First_Int2++;

		if(First_Int2 >= Buf2_Max)       		//如果缓存满,将缓存指针指向缓存的首地址
		{
			First_Int2 = 0;
		}  
		Write_RingBuff(Res);
		USART_ClearITPendingBit(USART2,USART_IT_RXNE);

	}
	
	if(USART_GetITStatus(USART2, USART_IT_IDLE)!= RESET)              //接收到数据
	{
		Res=USART1->SR;
		Res =USART_ReceiveData(USART2);
		ringBuff.g_gprs_uart=0x01;
		USART_ClearITPendingBit(USART2,USART_IT_IDLE);

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
		printf("串口中断溢出！！！\r\n");
		USART_ClearFlag(USART2,USART_FLAG_ORE);
	}
			
}


/*******************************************************************************
* 函数名 : Connect_Server
* 描述   : GPRS连接服务器函数
* 输入   : 
* 输出   : 
* 返回   : 
* 注意   : 
*******************************************************************************/
u8 Connect_Server(char* strIP)
{
	UART2_SendString("AT+QICLOSE=1");	//关闭连接
	UART2_SendLR();
	delay_ms(100);
	GSM_send_cmd("AT+QIDEACT","DEACT OK",3);		//关闭移动场景
	GSM_send_cmd("AT+QIACT","OK",3);//激活移动场景 
	GSM_send_cmd("AT+QIHEAD=0","OK",3);//设置GPRS移动台类别为B,支持包交换和数据交换 
	GSM_send_cmd("AT+CGATT=1","OK",2);//附着GPRS业务
	GSM_send_cmd("AT+QICSGP=1,\"CMNET\"","OK",5);//设置为GPRS连接模式
	//加入透传模式指令
	GSM_send_cmd("AT+QIMODE=1","OK",3);//打开透传功能
	GSM_send_cmd("AT+QITCFG=3,2,512,1","OK",3);//配置透传模式：单包重发次数:2,间隔1S发送一次,每次发送200的字节
	//MCU:"AT+QIDNSIP=0\r\n"（0：使用IP地址连接；1：使用域名连接）
	if(0==GSM_send_cmd((char*)strIP,"CONNECT",25))
	{
		//CLR_Buf2();	
		CLR_Buf2(Uart2_Buf,Buf2_Max);
		return 1;
	}
	delay_ms(1500);
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	return 0;
}



void Analysis_Server_Data(void) //分析服务器发过来的数据
{

	if((strstr((const char *)Uart2_Buf,"+PDP")!=NULL))   		//若缓存字符串中含有+PDP，表示服务器口关闭
	{


	}
	CLR_Buf2(Uart2_Buf,Buf2_Max);
}
//等待模块注册成功
u8 Wait_CREG(char* stringIP)
{
	u8 k;
	
	if(0==GSM_send_cmd("AT+CSQ","CSQ",2))		//打印信号质量
	{
		for(k=0;k<20;k++)
		{
			printf("%c",Uart2_Buf[k]);
		}
	}
	printf("\r\n");
	printf("GPRS开始连接服务器....\r\n");
	delay_ms(1500);
	if(1==Connect_Server(stringIP)) //表示已经连接上公网
	{
		
		return 1;
	}

	return 0;
}
u8 GPRS_Init(char* ipcom)
{
	u8 retry=0;
	printf("GPRS启动\r\n");
	printf("GPRS网络注册中...\r\n");
	delay_ns(2);
	while(1==GSM_send_cmd("AT","OK",2))		//测试AT指令
	{
		OpenGprs_PowKey();
		GSM_OFF;//灯灭
		delay_ns(4);

		retry++;
		if(retry>=3)
			return 1;
	}

	delay_ns(10);
	Set_ATE0();    //取消回显
	
	if(0==GSM_send_cmd("AT+CPIN?","+CPIN: READY",2))		//测试SIM卡是否在位指令
	{
		if(1==Wait_CREG(ipcom))
		{
			GSM_ON;//灯亮
			return 3;
		}
		else
		{
			return 4;//GPRS注册失败	
		}	
	}
	else
	{
		
		GSM_OFF;//灯灭
		return 2;//SIM卡未插	
	}
	
}



