#ifndef _DATA_BUS
#define _DATA_BUS

#include "stdio.h"
#include "stdlib.h"
#include "sys.h"
#include "user_lib.h"


/*===================================================================

           ��ͷ   ��Ч�ֽڳ���    ��Ч����  CRCУ��   ��β
	                              /    \
                                 /	    \
	                            /        \
                               /          \
                           ��ˮ��       ָ������
                       <-------------------------->
                                ��Ч���ݹ���

=====================================================================*/





void SendData_Handle(u8 Data);

//��Ҫ���͵�����
typedef struct
{
	u8 Send_Head[2];  //���͵�ƽ̨��ͷ
	u8 Send_DataLen[2];//��Ч���ݳ���
	u8 Send_Count[2];//��ˮ��
	u8 Send_State;//״̬��Ϣ��
	u8 Send_Recgnize[6];//���ʶ����
	u8 Send_Imform[200]; //Ҫ������������
	u8 Send_Crc[2];//CRC����
	u8 Send_Rail[2];//���͵�ƽ̨��β
	
}SendTplate;

//SendTplate  SendData;  //�ն˷���ƽ̨ 

//���յ�����
typedef struct
{
	u8 Rece_Head[2];  //���͵�ƽ̨��ͷ
	u8 Rece_DataLen[2];//��Ч���ݳ���
	u8 Rece_Count[2];//��ˮ��
	u8 Rece_State;//״̬��Ϣ��
	u8 Rece_Imform[200]; //Ҫ������������
	u8 Rece_Crc[2];//CRC����
	u8 Rece_Rail[2];//���͵�ƽ̨��β
	u8 Receive_count;
	
}ReceTplate;

//ReceTplate  ReceData;  //ƽ̨�����ն�
//���õ�����
typedef struct
{
	u8 Login_Password[2]; //��¼����
	u8 Recgnize_Data[6]; //���ʶ����
	u8 Bolier_Num[2];  //��¯���
	u8 Time_Data[14]; //ʱ�����
	u8 Temper_Channel[12][2]; //�¶�ͨ��
	u8 Analog_Channel[12][2]; //ģ��ͨ��
	u8 Input_Channel[4]; //��������ͨ��
	u8 Output_Channel[2];//�������ͨ��
	u8 Calcu_Data[12][2];//�������
	u8 Reserve_Data[4][2];//�����ֽ�
	
}Setting;

//��Ч���õ�����
typedef struct
{
	u8 Energy_Data[23][2];//��Ч��������
	u8 Energy_Rese[6][2]; //����Ԥ�� 
	u8 Alarm_Data[8][2];//����
	u8 Reserve_Data[4][2];//�����ֽ�
	
}Energy_Set;
//����������
typedef struct
{
	float Flow;  //˲ʱ����
	float Total_Flow;  //�ۻ����� 
	float Tepmer;
	float Pressure;
	u8 Minnute[2];
	u8 Second[2];
}VORTEX;


extern  Setting     Config;    //���õĲ���
extern  VORTEX Vortex;
void Data_Init(void);
u8 ReceData_Handle(void);
void GetRate_Data(void);

void GetContol_Data(void);

void Updata_Timer(void);

void PrintfTimer(void);

void Vort_Data(void);
void Clear_Data(void);

#endif

