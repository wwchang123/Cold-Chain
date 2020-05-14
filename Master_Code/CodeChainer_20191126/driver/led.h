#ifndef _LED_H_
#define _LED_H_
#include "stm32f10x.h" 
#include "stm32f10x_gpio.h"
#include "delay.h"
#include "sys.h"
void LED_Init(void);

//#define LED1 PEout(2)// PC9
//开关485-2号灯亮灭
#define LED485_2ON GPIO_ResetBits(GPIOE,GPIO_Pin_6)
#define LED485_2OFF GPIO_SetBits(GPIOE,GPIO_Pin_6)

//开关485-1号灯亮灭
#define LED485_1ON GPIO_ResetBits(GPIOE,GPIO_Pin_4)
#define LED485_1OFF GPIO_SetBits(GPIOE,GPIO_Pin_4)

//485数据采集灯亮灭
#define DataConnect_ON GPIO_ResetBits(GPIOE,GPIO_Pin_3)
#define DataConnect_OFF GPIO_SetBits(GPIOE,GPIO_Pin_3)

//GSM通信指示灯亮灭
#define GSM_ON GPIO_ResetBits(GPIOE,GPIO_Pin_2)
#define GSM_OFF GPIO_SetBits(GPIOE,GPIO_Pin_2)


void GPIO_PinReverse(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void SP706_Init(void);

void LED_LightOff(void);
void power_check(void);  //检测外部电源有没有上电
u8 get_power(void) ;

void IWDG_Init(u8 prer,u16 rlr);
void IWDG_Feed(void);
#endif
