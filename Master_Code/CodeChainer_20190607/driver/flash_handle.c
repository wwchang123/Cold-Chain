#include "flash_handle.h"
#include "w25q64.h"
#include "gprs.h"
#include "main.h"


//u32 Switch_Num=900000;  //序列号
u8	Hardware_Num2[3]={0};

//通过flash来获得序列号
void GetSeri_Num()
{
	u32 num=0;
	u8 i;
	SPI_Flash_Read(Config.read_flash,0x00,7); //序号放在第0扇区
	
	for(i=0;i<10;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=5)  //检测内存中是否含有@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //蜂鸣器叫三下表示内部啥也没有
	}
	num=(Config.read_flash[1]-0x30)*100000+(Config.read_flash[2]-0x30)*10000+(Config.read_flash[3]-0x30)*1000+(Config.read_flash[4]-0x30)*100+(Config.read_flash[5]-0x30)*10+(Config.read_flash[6]-0x30);
	Hardware_Num2[0]=num/256/256;
	Hardware_Num2[1]=num/256%256;
	Hardware_Num2[2]=num%256;	
	memset(Config.read_flash,0x00,500);
}
//得到IP地址和端口号
void GetIP_Com(void)
{
	u8 i,j;
	SPI_Flash_Read(Config.read_flash,0x1000,100);//IP地址放在第0扇区
	for(i=0;i<100;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=20)  //检测内存中是否含有@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //蜂鸣器叫三下表示内部啥也没有
	}
	for(j=0;j<i;j++)
	{
		IP_COM.Orin_IP[j]	= Config.read_flash[j+1];	
	}
	memset(Config.read_flash,0x00,500);
}

void GetSenior_num(void)
{
	u16 i;
	SPI_Flash_Read(Config.read_flash,0x2000,500);//IP地址放在第0扇区
	GPRSGET.Sensor_num=Config.read_flash[0];
	for(i=0;i<GPRSGET.Sensor_num;i++)
	{
		GPRSGET.Sensor_Data[i]=Config.read_flash[i+1];
	}
	memset(Config.read_flash,0x00,500);
}
//保存服务器下发的IP地址和端口号
void SaveNewIP(void)
{
	SPI_Flash_Erase_Sector(0x01) ;//把第一个扇区全部清掉
	SPI_Flash_Write(&Config.Rec_flag,0x1000,1);
	SPI_Flash_Write(IP_COM.Gprsdwon_IP,0x1001,60);
	IPCOM_Init();
}
//保存传感器数量和个数
void SaveSensor(u8 length)
{
	SPI_Flash_Erase_Sector(0x02) ;//把第二个扇区全部清掉
	SPI_Flash_Write(&length,0x2000,1);
	SPI_Flash_Write(GPRSGET.Sensor_Data,0x2001,length);
}

