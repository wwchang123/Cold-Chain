#include "id.h"

u8 Unique_Device_ID[13];
u8 Unique_ID[8];
int64_t SeriNum=0;//���к�

//�õ�ȫ��ΨһID
void get_unique_id(void)
{
	u32 Dev_Serial0,Dev_Serial1,Dev_Serial2;
		//��ȡоƬID
	Dev_Serial0=*(vu32*)(0x1ffff7e8);
	Dev_Serial1=*(vu32*)(0x1ffff7ec);
	Dev_Serial2=*(vu32*)(0x1ffff7f0);
	
	Unique_Device_ID[0] = (u8)Dev_Serial0; //��ȡ��һ���ֽ�
	Unique_Device_ID[1] = (u8)( Dev_Serial0 >> 8 ); //��ȡ�ڶ����ֽ�
	Unique_Device_ID[2] = (u8)( Dev_Serial0 >> 16 ); //��ȡ�������ֽ�
	Unique_Device_ID[3] = (u8)( Dev_Serial0 >> 24 ); //��ȡ���ĸ��ֽ�
	Unique_Device_ID[4] = (u8)Dev_Serial1; //��ȡ������ֽ�
	Unique_Device_ID[5] = (u8)( Dev_Serial1 >> 8 ); //��ȡ�������ֽ�
	Unique_Device_ID[6] = (u8)( Dev_Serial1 >> 16 ); //��ȡ���߸��ֽ�
	Unique_Device_ID[7] = (u8)( Dev_Serial1 >> 24 ); //��ȡ�ڰ˸��ֽ�
	Unique_Device_ID[8] = (u8)Dev_Serial2; //��ȡ�ھŸ��ֽ�
	Unique_Device_ID[9] = (u8)( Dev_Serial2 >> 8 ); //��ȡ��ʮ���ֽ�
	Unique_Device_ID[10] = (u8)( Dev_Serial2 >> 16 ); //��ȡ��ʮһ���ֽ�
	Unique_Device_ID[11] = (u8)( Dev_Serial2 >> 24 ); //��ȡ��ʮ�����ֽ�
}

//��12�ֽڱ��8���ֽ�
void get_eight_id(void)
{
	get_unique_id();
	Unique_ID[0] = (u8)(Unique_Device_ID[0]+Unique_Device_ID[1])/2;
	Unique_ID[1] = (u8)(Unique_Device_ID[2]+Unique_Device_ID[3])/2;
	Unique_ID[2] = (u8)(Unique_Device_ID[4]+Unique_Device_ID[5])/2;
	Unique_ID[3] = (u8)(Unique_Device_ID[6]+Unique_Device_ID[7])/2;
	Unique_ID[4] = (u8)(Unique_Device_ID[8]+Unique_Device_ID[9])/2;
	Unique_ID[5] = (u8)(Unique_Device_ID[10]+Unique_Device_ID[11])/2;
	Unique_ID[6] = (u8)(Unique_Device_ID[0]);
	Unique_ID[7] = (u8)(Unique_Device_ID[11]);
	SeriNum = (int64_t)(Unique_ID[7])+(int64_t)(Unique_ID[6])*256+(int64_t)(Unique_ID[5])*256*256+(int64_t)(Unique_ID[4])*256*256*256
	+(int64_t)(Unique_ID[3])*256*256*256*256+(int64_t)(Unique_ID[2])*256*256*256*256*256+(int64_t)(Unique_ID[1])*256*256*256*256*256*256+(int64_t)(Unique_ID[0])*256*256*256*256*256*256*256;
}

