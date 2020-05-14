#include "led.h"
#include "delay.h"
//#include"systick.h"

extern void Delay_tick(__IO u32 nTime);
void LED_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_6;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure); 
	GPIO_SetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6);//默认灯都是灭
}


//程序进入为闪烁形式

void LED_LightOff(void)
{
	while(1)
	{
		GPIO_PinReverse(GPIOB,GPIO_Pin_7|GPIO_Pin_6);
		delay_ms(500);
	}
}
void SP706_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);	 
	GPIO_InitStructure.GPIO_Pin =GPIO_Pin_1;				 
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		 
	GPIO_Init(GPIOA, &GPIO_InitStructure);					 
	PAout(1)=1;	
}


void GPIO_PinReverse(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  
  GPIOx->ODR ^=  GPIO_Pin;
}

void power_check(void)  //检测外部电源有没有上电
{ 
	GPIO_InitTypeDef GPIO_InitStructure; 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;    
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;    
	GPIO_Init(GPIOB, &GPIO_InitStructure);
}

u8 get_power(void)  //得到外部电源为 1  否为 0
{   
	if(0==GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_9))
	{
		
		return 0;
		
	}
	else
	{
		
		return 1;
	}
		
}

