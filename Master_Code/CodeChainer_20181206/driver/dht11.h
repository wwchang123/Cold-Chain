#ifndef _DHT11_H
#define _DHT11_H

#include "stm32f10x.h"
#include "sys.h"

#define DHT11_Out PDout(2)
#define DHT11_In  PDin(2)



unsigned char StartDHT11(void);
void DHT11_PortIN(void);
void DHT11_PortOUT(void);
void ReadDHT11(void);
void com(void);

#endif

