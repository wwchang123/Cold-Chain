#include "flash_handle.h"
#include "w25q64.h"
#include "gprs.h"
#include "main.h"


//u32 Switch_Num=900000;  //序列号
u8	Hardware_Num2[3]={0};

//通过flash来获得序列号
void GetSeri_Num(u8* flashbuffer)
{
	u32 num=0;
	num=(flashbuffer[1]-0x30)*100000+(flashbuffer[2]-0x30)*10000+(flashbuffer[3]-0x30)*1000+(flashbuffer[4]-0x30)*100+(flashbuffer[5]-0x30)*10+(flashbuffer[6]-0x30);
	Hardware_Num2[0]=num/256/256;
	Hardware_Num2[1]=num/256%256;
	Hardware_Num2[2]=num%256;	

}

void SaveNewIP(void)
{
	SPI_Flash_Erase_Sector(0x01) ;//把第一个扇区全部清掉
	SPI_Flash_Write(&Config.Rec_flag,0x1000,1);
	SPI_Flash_Write(IP_COM.Gprsdwon_IP,0x1001,60);
	IPCOM_Init();
}
