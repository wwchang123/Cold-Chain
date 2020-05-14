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
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);	//使能定时器4时钟
 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB  | RCC_APB2Periph_AFIO, ENABLE);  //使能GPIO外设和AFIO复用功能模块时钟    
 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7| GPIO_Pin_8| GPIO_Pin_9; //TIM_CH3,4
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  //复用推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);//初始化GPIO
	GPIO_SetBits(GPIOC,GPIO_Pin_6 | GPIO_Pin_7| GPIO_Pin_8| GPIO_Pin_9);

   //初始化TIM4
	TIM_TimeBaseStructure.TIM_Period = arr; //设置在下一个更新事件装入活动的自动重装载寄存器周期的值
	TIM_TimeBaseStructure.TIM_Prescaler =psc; //设置用来作为TIMx时钟频率除数的预分频值 
	TIM_TimeBaseStructure.TIM_ClockDivision = 0; //设置时钟分割:TDTS = Tck_tim
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Down;  //TIM向上计数模式
	//TIM_TimeBaseStructure.TIM_RepetitionCounter=0x0000;
	TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure); //根据TIM_TimeBaseInitStruct中指定的参数初始化TIMx的时间基数单位

	//初始化TIM3 Channel2 PWM模式	 
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2; //选择定时器模式:TIM脉冲宽度调制模式2
 	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable; //比较输出使能
	TIM_OCInitStructure.TIM_Pulse = 0;
	//TIM_OCInitStructure.TIM_OutputNState = TIM_OutputState_Disable;
//	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low; //输出极性:TIM输出比较极性高 
//	TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCPolarity_High;
//	TIM_OCInitStructure.TIM_OCIdleState=TIM_OCIdleState_Set;
//	TIM_OCInitStructure.TIM_OCNIdleState=TIM_OCIdleState_Reset;

	TIM_OC1Init(TIM4, &TIM_OCInitStructure);  //根据T指定的参数初始化外设TIM4 OC1
	TIM_OC2Init(TIM4, &TIM_OCInitStructure);  //根据T指定的参数初始化外设TIM4 OC2
	TIM_OC3Init(TIM4, &TIM_OCInitStructure);  //根据T指定的参数初始化外设TIM4 OC3
	TIM_OC4Init(TIM4, &TIM_OCInitStructure);  //根据T指定的参数初始化外设TIM4 OC4
	TIM_CtrlPWMOutputs (TIM4,ENABLE);
	TIM_OC1PreloadConfig(TIM4, TIM_OCPreload_Enable);  //使能TIM4在CCR1上的预装载寄存器
	TIM_OC2PreloadConfig(TIM4, TIM_OCPreload_Enable);  //使能TIM4在CCR2上的预装载寄存器
	TIM_OC3PreloadConfig(TIM4, TIM_OCPreload_Enable);  //使能TIM4在CCR3上的预装载寄存器
	TIM_OC4PreloadConfig(TIM4, TIM_OCPreload_Enable);  //使能TIM4在CCR4上的预装载寄存器
	TIM_ARRPreloadConfig(TIM4, ENABLE); //TIMxARR
//初始化高电平为1.5ms
//	TIM_SetCompare1(TIM4,2000); // 通道1占空比
//	TIM_SetCompare2(TIM4,2000);	// 通道2占空比
	//TIM_SetCompare3(TIM4,0); // 通道3占空比
	//TIM_SetCompare4(TIM4,1100);	// 通道4占空比 
	TIM_Cmd(TIM4, ENABLE);  //使能TIM4
	TIM_SetCompare1(TIM4,1000); // 通道1占空比
	TIM_SetCompare2(TIM4,1000);	// 通道2占空比
	TIM_SetCompare3(TIM4,1000); // 通道3占空比
	TIM_SetCompare4(TIM4,1000);	// 通道4占空比 
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
