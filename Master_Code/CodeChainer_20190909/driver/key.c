#include "key.h"
#include "delay.h"
#include "math.h"

extern void NVIC_Initon(void);


//“ª∞„ ‰»Î
void Key_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStructure; 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_Init(GPIOC,&GPIO_InitStructure); 
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7|GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IPD;
	GPIO_Init(GPIOC,&GPIO_InitStructure); 
	GPIO_SetBits(GPIOC,GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3);
	GPIO_ResetBits(GPIOC,GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7|GPIO_Pin_9);
}

uint16_t Get_key(void)
{

	vu16 keyvalue=0;

	if((GPIO_ReadInputData(GPIOC)&0x2ff)!=0x00f)
	{
		delay_ms(10);
		if((GPIO_ReadInputData(GPIOC)&0x2ff)!=0x00f)
		{
			GPIO_SetBits(GPIOC,GPIO_Pin_0);
			GPIO_ResetBits(GPIOC,GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3);
			switch(GPIO_ReadInputData(GPIOC)&0x2ff)
			{
				case 0x11:keyvalue=1;break;  // ^
				case 0x21:keyvalue=2;break;  // v
				case 0x41:keyvalue=0;break;  
				case 0x81:keyvalue=3;break;  // 24
				case 0x201:keyvalue=4;break; // 4
			}
			GPIO_SetBits(GPIOC,GPIO_Pin_1);
			GPIO_ResetBits(GPIOC,GPIO_Pin_0|GPIO_Pin_2|GPIO_Pin_3);
			switch(GPIO_ReadInputData(GPIOC)&0x2ff)
			{
				case 0x12:keyvalue=5;break;  // -
				case 0x22:keyvalue=6;break;  // o
				case 0x42:keyvalue=0;break;
				case 0x82:keyvalue=7;break;  // 28
				case 0x202:keyvalue=8;break; // 16
			}
			GPIO_SetBits(GPIOC,GPIO_Pin_2);
			GPIO_ResetBits(GPIOC,GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_3);
			switch(GPIO_ReadInputData(GPIOC)&0x2ff)
			{
				case 0x14:keyvalue=9;break;  // *2
				case 0x24:keyvalue=10;break;  // App
				case 0x44:keyvalue=11;break;  // 32
				case 0x84:keyvalue=12;break;  // 20
				case 0x204:keyvalue=13;break; // 8
			}
			GPIO_SetBits(GPIOC,GPIO_Pin_3);
			GPIO_ResetBits(GPIOC,GPIO_Pin_0|GPIO_Pin_2|GPIO_Pin_1);
			switch(GPIO_ReadInputData(GPIOC)&0x2ff)
			{
				case 0x18:keyvalue=14;break;  // +2
				case 0x28:keyvalue=15;break;  // 12
				case 0x48:keyvalue=16;break;  // 36
				case 0x88:keyvalue=17;break;  // 10
				case 0x208:keyvalue=18;break; // START
			}
			GPIO_SetBits(GPIOC,GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3);
			GPIO_ResetBits(GPIOC,GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7|GPIO_Pin_9);
			while((GPIO_ReadInputData(GPIOC)&0x2ff)!=0x00f);
				return keyvalue;
		}
	}
	
	return 0;
}


