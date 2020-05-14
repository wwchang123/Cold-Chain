#ifndef _DATA_BUS
#define _DATA_BUS

#include "stdio.h"
#include "stdlib.h"
#include "sys.h"
#include "user_lib.h"

//���ݽṹ��
typedef struct
{
  u8 power_type; //��Դ�����ֹ��緽ʽ
	u8 power_value; //��ѹ��ֵ
	u8 charge_state;
	
}POWER;


extern POWER Power;

typedef struct
{
  u8 type; //��������ǰ״̬
	
}State;

extern State state;

typedef struct
{
	u8 Sensor_num;		//����������
	u8 Sensor_Data[400];//�������������
	u8 Batch_version[2];				//�汾��  ���κ� ��������	
	u16 VolUPTime;		//��ѹ�ϴ�ʱ��(������)	
	u16 GPSUPTime;		//gps�ϱ�ʱ��(������)
	u8  GetIPadress[32];
	u8 GetCOMM[2];
	u16 CLPORT;   //�˿ںű������
	u8 NewIP[60];
	u8 NewIPOK;
}GPRS_DATA;


typedef struct
{
	u8 Senor_count;
	u8 SenorBuffer[125];
	u8 SenorSeri[3];
	u8 Tempurate[2];
	u8 reflag; //���յ���������־λ
}SENOR;

extern SENOR Rec;
extern GPRS_DATA  GPRSGET;


void Send_GPRS_DATA1(u16 cmd);
u8 Sum_Check(u8 size,u8* buffer);
void GetGprsIP_SIM(u8* getip,u8 length,u8* getcom);
void ReciveSenor_Data(u8* data,u8 length);
void Senor_StructInit(void);
void ReciveSenor_Data(u8* data,u8 length);
void SenorData_Handle(void);

#endif

