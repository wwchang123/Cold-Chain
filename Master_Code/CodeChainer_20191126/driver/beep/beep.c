#include "beep.h"
#include "delay.h"

//PC8
void BeepIO_Config(void)
{
	GPIO_InitTypeDef GPIO_InitStructure; 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;    
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;    
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;    
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	GPIO_ResetBits(GPIOC,GPIO_Pin_8);
}
void poweron_beep(void)
{
	GPIO_SetBits(GPIOC,GPIO_Pin_8);
	delay_ms(400);
	GPIO_ResetBits(GPIOC,GPIO_Pin_8);
}

//����ڴ�����û��IP��ַ����ô��200ms����һ�� �ܹ�����5��
void Flash_Fault(void)
{
	u8 i=0;
	for(i=0;i<=5;i++)
	{
		GPIO_SetBits(GPIOC,GPIO_Pin_8);
		delay_ms(150);
		GPIO_ResetBits(GPIOC,GPIO_Pin_8);
		delay_ms(150);
	}
}

//����ڴ�����û�����кţ���ô��200ms����һ�� �ܹ�����3��
void Flash_Seri(void)
{
	u8 i=0;
	for(i=0;i<=3;i++)
	{
		GPIO_SetBits(GPIOC,GPIO_Pin_8);
		delay_ms(150);
		GPIO_ResetBits(GPIOC,GPIO_Pin_8);
		delay_ms(150);
	}
}
