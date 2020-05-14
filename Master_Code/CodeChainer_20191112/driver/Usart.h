#ifndef _USART_H
#define _USART_H

#include "stm32f10x.h"
#include "stm32f10x_usart.h"
#include "string.h"
#include "stdio.h"
#include "stdint.h"

void Usart1_Init(u32 bound);
void Usart2_Init(u32 bound);
void Usart3_Init(uint32_t BaudRate);
void Uart5_Init(uint32_t BaudRate);

void UART1_Data(char byte);
void UART1_SendString(char* s);
void UART1_Send_Len(char *s,u8 len);

void Uart3_Sendbyte(u8 byte);
void UART3_SendString(u8 * s);
void UART3_Send_Len(char *s,u8 len);
void Uart5_Sendbyte(u8 byte);



void CLR_Buf1(u8 *p,u8 buf2);
u8 Do_config(void);
void Uart_Config(u8 flag);

void NoData_Flash(u8 flag);

#endif
