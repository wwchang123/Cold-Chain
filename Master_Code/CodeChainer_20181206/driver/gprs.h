#ifndef _GPRS_H
#define _GPRS_H


#include "stm32f10x.h"
#include "Usart.h"
void Set_ATE0(void);
u8 Connect_Server(void);

void Second_AT_Command(char *b,char *a,u8 wait_time);
void Analysis_Server_Data(void); //分析服务器发过来的数据
void UART2_Data(char byte);
void UART2_Data_Len(u8 *a,u8 len);
u8 GPRS_Init(void);
void CLR_Buf2(u8 *p,u8 buf2);
void OpenGprs_PowKey(void);
#endif
