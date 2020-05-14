#ifndef _LED_H_
#define _LED_H_
#include "stm32f10x.h" 
#include "stm32f10x_gpio.h"
#include "delay.h"
#include "sys.h"
void LED_Init(void);

//#define LED1 PEout(2)// PC9
//����485-2�ŵ�����
#define LED485_2ON GPIO_ResetBits(GPIOE,GPIO_Pin_6)
#define LED485_2OFF GPIO_SetBits(GPIOE,GPIO_Pin_6)

//����485-1�ŵ�����
#define LED485_1ON GPIO_ResetBits(GPIOE,GPIO_Pin_4)
#define LED485_1OFF GPIO_SetBits(GPIOE,GPIO_Pin_4)

//485���ݲɼ�������
#define DataConnect_ON GPIO_ResetBits(GPIOE,GPIO_Pin_3)
#define DataConnect_OFF GPIO_SetBits(GPIOE,GPIO_Pin_3)

//GSMͨ��ָʾ������
#define GSM_ON GPIO_ResetBits(GPIOE,GPIO_Pin_2)
#define GSM_OFF GPIO_SetBits(GPIOE,GPIO_Pin_2)


void GPIO_PinReverse(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void SP706_Init(void);

void LED_LightOff(void);
void power_check(void);  //����ⲿ��Դ��û���ϵ�
u8 get_power(void) ;

void IWDG_Init(u8 prer,u16 rlr);
void IWDG_Feed(void);
#endif
