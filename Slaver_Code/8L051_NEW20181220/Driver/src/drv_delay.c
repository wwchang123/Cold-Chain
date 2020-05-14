/**
  ******************************************************************************
  * @author  ÔóÒ«¿Æ¼¼ ASHINING
  * @version V3.0
  * @date    2016-10-08
  * @brief   DELAYÅäÖÃCÎÄ¼þ
  ******************************************************************************
  * @attention
  *
  * ¹ÙÍø	:	http://www.ashining.com
  * ÌÔ±¦	:	https://shop105912646.taobao.com
  * °¢Àï°Í°Í:	https://cdzeyao.1688.com
  ******************************************************************************
  */



#include "drv_delay.h"


void delay_ms(u16 n_ms)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 /* HSI div by 1 --> Auto-Reload value: 16M / 64 = 1/4M, 1/4M / 1k = 250*/ 
  TIM4_TimeBaseInit(TIM4_Prescaler_64,250);
  TIM4_SetCounter(0);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_Cmd(ENABLE);
  while(n_ms--)
  {
    while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
    TIM4_ClearFlag(TIM4_FLAG_Update);
  }
  TIM4_Cmd(DISABLE);
}

/**
  * @brief  delay for some time in 10us unit(partial accurate)
  * @caller auto_test
  * @param n_10us is how many 10us of time to delay
  * @retval None
  */
void delay_10us(u16 n_10us)
{
/* Init TIMER 4 */
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
/* SYS_CLK_HSI_DIV1 Auto-Reload value: 16M / 1 = 16M, 16M / 100k = 160 */
  TIM4_TimeBaseInit(TIM4_Prescaler_1,160);
  TIM4_SetCounter(0);
  TIM4_ClearFlag(TIM4_FLAG_Update);
  TIM4_Cmd(ENABLE);
  while(n_10us--)
  {
    while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
    TIM4_ClearFlag(TIM4_FLAG_Update);
  }
  TIM4_Cmd(DISABLE);
 CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);

}

