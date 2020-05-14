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

typedef struct
{
	u8 Uart1_Buf[30];
	u8 UART1_Receive_Size;
	u8 Jump_flag;
}Uart1_Rev;


extern Uart1_Rev uart1rev;

#endif
