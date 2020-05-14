#include "led.h"
#include "delay.h"
//#include"systick.h"

extern void Delay_tick(__IO u32 nTime);
void LED_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure); 
	GPIO_ResetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5);//Ĭ�ϵƶ�����
	delay_ms(1500);
	GPIO_SetBits(GPIOB,GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5);//Ĭ�ϵƶ�����
}


//�������Ϊ��˸��ʽ

void LED_LightOff(void)
{
	while(1)
	{
		GPIO_PinReverse(GPIOB,GPIO_Pin_7|GPIO_Pin_6|GPIO_Pin_5);
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

void power_check(void)  //����ⲿ��Դ��û���ϵ�
{ 
	GPIO_InitTypeDef GPIO_InitStructure; 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;    
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPD;    
	GPIO_Init(GPIOB, &GPIO_InitStructure);
}

u8 get_power(void)  //�õ��ⲿ��ԴΪ 1  ��Ϊ 0
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

//��ʼ���������Ź�
//prer:��Ƶ��:0~7(ֻ�е�3λ��Ч!)
//��Ƶ����=4*2^prer.�����ֵֻ����256!
//rlr:��װ�ؼĴ���ֵ:��11λ��Ч.
//ʱ�����(���):Tout=((4*2^prer)*rlr)/40 (ms).
void IWDG_Init(u8 prer,u16 rlr)
{
	IWDG->KR=0X5555;//ʹ�ܶ�IWDG->PR��IWDG->RLR��д		 										  
  	IWDG->PR=prer;  //���÷�Ƶϵ��   
  	IWDG->RLR=rlr;  //�Ӽ��ؼĴ��� IWDG->RLR  
	IWDG->KR=0XAAAA;//reload											   
  	IWDG->KR=0XCCCC;//ʹ�ܿ��Ź�	
}

//ι��
void IWDG_Feed(void)
{
	IWDG->KR=0XAAAA;//reload		
}


