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
	u8 Sensor_Data[200];//�������������
	u8 Batch_version[2];				//�汾��  ���κ� ��������	
	u16 VolUPTime;		//��ѹ�ϴ�ʱ��(������)	
	u16 GPSUPTime;		//gps�ϱ�ʱ��(������)
}GPRS_DATA;

extern GPRS_DATA  GPRSGET;

void Send_GPRS_DATA1(u16 cmd);

#endif

