#include "stm8l15x.h"//STM8L051/151��ϵ�й��ÿ⺯��
#include "drv_delay.h"
#include "drv_spi.h"
#include "drv_uart.h"
#include "drv_SI4438.h"
#include "drv_led.h"
#include "ds18b20.h"

#define Num_Ser 	101515	//���
//#define  _LOWPOWER_ENABLE_  //�͹��Ķ���   ifndef  �� ifdef�պ��෴

unsigned char SendBuffer[7] = {0x00}; 
//unsigned int temper=0;

void RTC_Config(void)
{
		//CLK_LSEConfig(CLK_LSE_ON);
		CLK_LSICmd(ENABLE);//ʹ��LSI
		CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTCʱ���ſ�ʹ��
		CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_32);//RTCʱ��ԴLSI��32��Ƶ=1.1875K
		while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//�ȴ�LSI����
		
		RTC_WakeUpCmd(DISABLE);
		
		RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=0.0742k=13.477ms
		RTC_ITConfig(RTC_IT_WUT, ENABLE);//�����ж�
		RTC_SetWakeUpCounter(22260);//22260*13.477 ms=300S����  13385*13.477 ms=180S����
		enableInterrupts();
}

void Low_IOinit(void)
{
	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);	
}
/*******************************************************************************
****����˵����������
****��ڲ���:��
****���ڲ���:��
****������ע:LED��һ��Ƶ����˸
********************************************************************************/
void main(void)
{

	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	delay_ms(2);
#ifndef _LOWPOWER_ENABLE_
	PWR_FastWakeUpCmd(ENABLE);  //���ٻ���ʹ��
	//CLK_HaltConfig(CLK_Halt_FastWakeup, ENABLE); 
	RTC_Config();
	//����IO����͵�ƽ
	Low_IOinit();
	PWR_UltraLowPowerCmd(ENABLE);//���͹���
	RTC_ITConfig(RTC_IT_WUT, ENABLE);//���Ѷ�ʱ���ж�ʹ��
	RTC_WakeUpCmd(ENABLE);//RTC����ʹ��
  while (1)
  {

		//SPI��ʼ��
		drv_spi_init( );
		//SI4463��ʼ��
		SI446x_Init( );
		if(init_1820())
		 {
				gettemp();
		 }
		SendBuffer[0]=0xEB; // ��ͷ
		SendBuffer[1]=(Num_Ser/256/256);
		SendBuffer[2]=(Num_Ser/256%256);
		SendBuffer[3]=(Num_Ser%256);
		SendBuffer[6]= (SendBuffer[1]+SendBuffer[2]+SendBuffer[3]+SendBuffer[4]+SendBuffer[5])%256;
		SI446x_Send_Packet(SendBuffer, 7, 0, 3);
		CLR_DIR_1WIRE;
		while(IRQ_READ()==0x01);
		GPIO_SetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	
		halt();	
  }
#else

	while(1)
	{
//		SI446x_Send_Packet( (uint8_t *)g_Ashining, 8, 0, 0 );
//		GPIO_ToggleBits(LED1_PORT,LED1_PINS);//��תLED�˿�
//		delay_ms(1000);
		if(init_1820())
		 {
				temper=gettemp();
		 }
	}
#endif

}








#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
