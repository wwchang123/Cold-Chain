/*
  ��������԰E��1404��Ŀ
//��¯��Ŀ
//���ܣ����ڽ��ӻ������շ� gprs_rtu
//׫д�ˣ���ΰ��  18006700616
//20181206
//��ӡ���ܲ��ô���1��GSM���ܲ��ô���2.

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
extern u8 Uart2_Buf[200];//����1���ݻ�����

u8 FlashData[9]={0x00};


int main(void)
{
	//u32 FLASH_SIZE; 
	u8 i;
	SystemInit();   //ϵͳ��ʼ�� 72M
	delay_init(72);	//��ʱ��ʼ��
	NVIC_Configuration();//�ж����ȼ����� 

	Usart1_Init(115200);
	Usart2_Init(115200);	

	SPI_Flash_Init();  		//SPI FLASH ��ʼ�� 	 
	if(SPI_Flash_ReadID()==W25Q32 || SPI_Flash_ReadID()==W25Q64)								//��ⲻ��W25Q64
	{
		
		printf("�洢 ���ɹ�!\r\n\r\n");  
	}
	else
		printf("�洢 ���ʧ��!\r\n");

//  SPI_Flash_Write(g_SI4463ItStatus,0x00,9) ;
//	FLASH_SIZE=4*1024*1024;	//FLASH ��СΪ8M�ֽ�
	SPI_Flash_Read(FlashData,0,9);				//�ӵ�0����ַ����ʼ,����SIZE���ֽ�
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
