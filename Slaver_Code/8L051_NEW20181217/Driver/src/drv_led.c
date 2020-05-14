#include "drv_led.h"




void drv_led_init(void)
{
	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//³õÊ¼»¯LED¶Ë¿Ú
}