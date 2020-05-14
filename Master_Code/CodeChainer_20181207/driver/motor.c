#include "motor.h"


//		TIM4 CH1	PB6
//    TIM4 CH2 	PB7
//		TIM4 CH3	PB8
//		TIM4 CH4	PB9

void TIM4_PWM_Init(u16 arr,u16 psc)
{  
	GPIO_InitTypeDef GPIO_InitStructure;
	TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
	TIM_OCInitTypeDef  TIM_OCInitStructure;
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);	//ʹ�ܶ�ʱ��4ʱ��
 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB  | RCC_APB2Periph_AFIO, ENABLE);  //ʹ��GPIO�����AFIO���ù���ģ��ʱ��    
 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7| GPIO_Pin_8| GPIO_Pin_9; //TIM_CH3,4
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  //�����������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);//��ʼ��GPIO
	GPIO_SetBits(GPIOC,GPIO_Pin_6 | GPIO_Pin_7| GPIO_Pin_8| GPIO_Pin_9);

   //��ʼ��TIM4
	TIM_TimeBaseStructure.TIM_Period = arr; //��������һ�������¼�װ�����Զ���װ�ؼĴ������ڵ�ֵ
	TIM_TimeBaseStructure.TIM_Prescaler =psc; //����������ΪTIMxʱ��Ƶ�ʳ�����Ԥ��Ƶֵ 
	TIM_TimeBaseStructure.TIM_ClockDivision = 0; //����ʱ�ӷָ�:TDTS = Tck_tim
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Down;  //TIM���ϼ���ģʽ
	//TIM_TimeBaseStructure.TIM_RepetitionCounter=0x0000;
	TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure); //����TIM_TimeBaseInitStruct��ָ���Ĳ�����ʼ��TIMx��ʱ�������λ

	//��ʼ��TIM3 Channel2 PWMģʽ	 
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2; //ѡ��ʱ��ģʽ:TIM�����ȵ���ģʽ2
 	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable; //�Ƚ����ʹ��
	TIM_OCInitStructure.TIM_Pulse = 0;
	//TIM_OCInitStructure.TIM_OutputNState = TIM_OutputState_Disable;
//	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low; //�������:TIM����Ƚϼ��Ը� 
//	TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCPolarity_High;
//	TIM_OCInitStructure.TIM_OCIdleState=TIM_OCIdleState_Set;
//	TIM_OCInitStructure.TIM_OCNIdleState=TIM_OCIdleState_Reset;

	TIM_OC1Init(TIM4, &TIM_OCInitStructure);  //����Tָ���Ĳ�����ʼ������TIM4 OC1
	TIM_OC2Init(TIM4, &TIM_OCInitStructure);  //����Tָ���Ĳ�����ʼ������TIM4 OC2
	TIM_OC3Init(TIM4, &TIM_OCInitStructure);  //����Tָ���Ĳ�����ʼ������TIM4 OC3
	TIM_OC4Init(TIM4, &TIM_OCInitStructure);  //����Tָ���Ĳ�����ʼ������TIM4 OC4
	TIM_CtrlPWMOutputs (TIM4,ENABLE);
	TIM_OC1PreloadConfig(TIM4, TIM_OCPreload_Enable);  //ʹ��TIM4��CCR1�ϵ�Ԥװ�ؼĴ���
	TIM_OC2PreloadConfig(TIM4, TIM_OCPreload_Enable);  //ʹ��TIM4��CCR2�ϵ�Ԥװ�ؼĴ���
	TIM_OC3PreloadConfig(TIM4, TIM_OCPreload_Enable);  //ʹ��TIM4��CCR3�ϵ�Ԥװ�ؼĴ���
	TIM_OC4PreloadConfig(TIM4, TIM_OCPreload_Enable);  //ʹ��TIM4��CCR4�ϵ�Ԥװ�ؼĴ���
	TIM_ARRPreloadConfig(TIM4, ENABLE); //TIMxARR
//��ʼ���ߵ�ƽΪ1.5ms
//	TIM_SetCompare1(TIM4,2000); // ͨ��1ռ�ձ�
//	TIM_SetCompare2(TIM4,2000);	// ͨ��2ռ�ձ�
	//TIM_SetCompare3(TIM4,0); // ͨ��3ռ�ձ�
	//TIM_SetCompare4(TIM4,1100);	// ͨ��4ռ�ձ� 
	TIM_Cmd(TIM4, ENABLE);  //ʹ��TIM4
	TIM_SetCompare1(TIM4,1000); // ͨ��1ռ�ձ�
	TIM_SetCompare2(TIM4,1000);	// ͨ��2ռ�ձ�
	TIM_SetCompare3(TIM4,1000); // ͨ��3ռ�ձ�
	TIM_SetCompare4(TIM4,1000);	// ͨ��4ռ�ձ� 
}


void motorsign_init(void)
{
	GPIO_InitTypeDef GPIO_InitStructure; 
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_0;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IPU;
	GPIO_Init(GPIOB,&GPIO_InitStructure);
}

u8 get_motorsign(void)
{
	if(0==GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_0))
		return 1;
	else return 0;
}
