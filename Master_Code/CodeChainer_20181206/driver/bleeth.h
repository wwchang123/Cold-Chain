#ifndef _BLEETH_H
#define _BLEETH_H

#include "stm32f10x.h"

void UART2_Data(char byte);
void UART2_SendString(char* s);
void bleeth_send(char data);

#endif

