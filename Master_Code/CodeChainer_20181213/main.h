#ifndef _MAIN_H_

#define _MAIN_H_


#include "stm32f10x.h"
#include "led.h"
#include "delay.h"
#include "systick.h"
#include "sys.h"
#include "Usart.h"
#include "timer2.h"
#include "gprs.h"
#include "w25q64.h"	 
#include "spi.h"
#include "Data_Bus.h"
#include "user_lib.h"
#include "adc.h"
#include "drv_si4438.h"
#include "beep.h"
#include "gprs_handle.h"
#include "flash_handle.h"



#define 	_GPRS_INIT_		
//#define _SI4438_EN_




typedef struct
{
	u8 read_flash[100];
	u8 flash_flag;
	u8 Num_Flash[6];
	u8 NumOK_flag;
	u8 Rec_flag;
	u8 IpCom[60];
}CONFIG;

extern CONFIG Config;
#endif

