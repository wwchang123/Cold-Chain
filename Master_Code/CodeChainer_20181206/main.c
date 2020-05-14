/*
  宁波孵化园E栋1404项目
//锅炉项目
//功能：用于交接机数据收发 gprs_rtu
//撰写人：王伟昌  18006700616
//20181206
//打印功能采用串口1，GSM功能采用串口2.

*/
#include "stm32f10x.h"
#include "led.h"
#include "delay.h"
#include "systick.h"
#include "sys.h"
#include "Usart.h"
#include "timer2.h"
#include "gprs.h"
#include "w25q64.h"	 
#include "spi.h"
#include "Data_Bus.h"
#include "user_lib.h"
#include "adc.h"
#include "drv_si4438.h"
#include "beep.h"


#define 	_GPRS_INIT_		

extern vu8 rssi_flag;
uint8_t g_SI4463ItStatus[ 9 ] = { 0xff,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08};
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 }; 
extern u8 Uart2_Buf[200];//串口1数据缓存区

u8 FlashData[9]={0x00};


int main(void)
{
	//u32 FLASH_SIZE; 
	u8 i;
	SystemInit();   //系统初始化 72M
	delay_init(72);	//延时初始化
	NVIC_Configuration();//中断优先级设置 

	Usart1_Init(115200);
	Usart2_Init(115200);	

	SPI_Flash_Init();  		//SPI FLASH 初始化 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//检测不到W25Q64
	{
		
		printf("存储 检测成功!\r\n\r\n");  
	}
	else
		printf("存储 检测失败!\r\n");

//  SPI_Flash_Write(g_SI4463ItStatus,0x00,9) ;
//	FLASH_SIZE=4*1024*1024;	//FLASH 大小为8M字节
	SPI_Flash_Read(FlashData,0,9);				//从第0个地址处开始,读出SIZE个字节
	for(i=0;i<9;i++)
	{
		printf("%x",FlashData[i]);
		printf(" ");
	}
	printf("\r\n\r\n");
	delay_ms(10);


	while (1)
	{		


	}
}

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
