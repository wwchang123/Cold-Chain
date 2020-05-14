#include "flash_handle.h"
#include "w25q64.h"
#include "gprs.h"
#include "main.h"

extern u8 zf_count;
u8	Hardware_Num2[3]={0};

u8  GetData_Rstart(void)
{
	u8 data;
	SPI_Flash_Read(&data,0x3000,1);//IP��ַ��
	switch(data)
	{
		case 0x01:
			
		break;
		case 0x02:
			
		break;
		case 0x03:
			
		break;
		case 0x04:
			
		break;
		case 0x05:
			
		break;
		case 0x06:
			
		break;
		case 0x07:
			
		break;
		case 0x08:
			
		break;
		case 0x09:
			
		break;
	}
}
//ͨ��flash��������к�
void GetSeri_Num()
{
	u32 num=0;
	u8 i;
	SPI_Flash_Read(Config.read_flash,0x00,7); //��ŷ��ڵ�0����
	
	for(i=0;i<10;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=5)  //����ڴ����Ƿ���@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //�����������±�ʾ�ڲ�ɶҲû��
	}
	num=(Config.read_flash[1]-0x30)*100000+(Config.read_flash[2]-0x30)*10000+(Config.read_flash[3]-0x30)*1000+(Config.read_flash[4]-0x30)*100+(Config.read_flash[5]-0x30)*10+(Config.read_flash[6]-0x30);
	Hardware_Num2[0]=num/256/256;
	Hardware_Num2[1]=num/256%256;
	Hardware_Num2[2]=num%256;	
	memset(Config.read_flash,0x00,500);
}
//�õ�IP��ַ�Ͷ˿ں�
void GetIP_Com(void)
{
	u8 i,j;
	SPI_Flash_Read(Config.read_flash,0x1000,100);//IP��ַ���ڵ�0����
	for(i=0;i<100;i++)
	{
		if(Config.read_flash[i]==0x00 || Config.read_flash[i]==0xFF)
			break;
		printf("%c",Config.read_flash[i]);
	}
	if(Config.read_flash[0]!=0x40 || i<=20)  //����ڴ����Ƿ���@
	{
		Config.flash_flag=0x01;		
		Flash_Seri();  //�����������±�ʾ�ڲ�ɶҲû��
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
	SPI_Flash_Read(Config.read_flash,0x2000,500);//IP��ַ���ڵ�0����
	GPRSGET.Sensor_num=Config.read_flash[0];
	for(i=0;i<GPRSGET.Sensor_num;i++)
	{
		GPRSGET.Sensor_Data[i]=Config.read_flash[i+1];
	}
	memset(Config.read_flash,0x00,500);
}
//����������·���IP��ַ�Ͷ˿ں�
void SaveNewIP(void)
{
	IWDG_Feed();// ι��
	zf_count=0;
	zf_count=Get_Num(IP_COM.Gprsdwon_IP,'.');
	if(zf_count==3)
	{
		CLI();
		SPI_Flash_Erase_Sector(0x01) ;//�ѵ�һ������ȫ�����
		SPI_Flash_Write(&Config.Rec_flag,0x1000,1);
		SPI_Flash_Write(IP_COM.Gprsdwon_IP,0x1001,60);
		SPI_FLASH_Write_Disable(); //����д��ֹ���ܣ�ֻ��д��ʱ��Ŵ�
		SEI();
		printf("IP��ַ�˿ں�������ɣ�\r\n\r\n");			
	}
	else
		printf("�����������\r\n\r\n");	
	IPCOM_Init();
}
//���洫���������͸���
void SaveSensor(u8 length)
{
	IWDG_Feed();// ι��
	CLI();
	SPI_Flash_Erase_Sector(0x02) ;//�ѵڶ�������ȫ�����
	SPI_Flash_Write(&length,0x2000,1);
	SPI_Flash_Write(GPRSGET.Sensor_Data,0x2001,length);
	SPI_FLASH_Write_Disable(); //����д��ֹ���ܣ�ֻ��д��ʱ��Ŵ�
	SEI();
}

