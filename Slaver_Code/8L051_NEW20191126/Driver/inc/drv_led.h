
#ifndef __DRV_LED_H__
#define __DRV_LED_H__

//¶¨ÒåLED¶Ë¿Ú
#define LED1_PORT  GPIOD
#define LED1_PINS  GPIO_Pin_0

#include "stm8l15x.h"

void drv_led_init(void);

#endif