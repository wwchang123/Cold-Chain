#ifndef _DATA_BUS
#define _DATA_BUS

#include "stdio.h"
#include "stdlib.h"
#include "sys.h"
#include "user_lib.h"


/*===================================================================

           包头   有效字节长度    有效数据  CRC校验   包尾
	                              /    \
                                 /	    \
	                            /        \
                               /          \
                           流水号       指令内容
                       <-------------------------->
                                有效数据构成

=====================================================================*/





void SendData_Handle(u8 Data);

//需要发送的数据
typedef struct
{
	u8 Send_Head[2];  //发送到平台包头
	u8 Send_DataLen[2];//有效数据长度
	u8 Send_Count[2];//流水号
	u8 Send_State;//状态消息码
	u8 Send_Recgnize[6];//身份识别码
	u8 Send_Imform[200]; //要发送数据内容
	u8 Send_Crc[2];//CRC检验
	u8 Send_Rail[2];//发送到平台包尾
	
}SendTplate;

//SendTplate  SendData;  //终端发到平台 

//接收的数据
typedef struct
{
	u8 Rece_Head[2];  //发送到平台包头
	u8 Rece_DataLen[2];//有效数据长度
	u8 Rece_Count[2];//流水号
	u8 Rece_State;//状态消息码
	u8 Rece_Imform[200]; //要发送数据内容
	u8 Rece_Crc[2];//CRC检验
	u8 Rece_Rail[2];//发送到平台包尾
	u8 Receive_count;
	
}ReceTplate;

//ReceTplate  ReceData;  //平台发到终端
//配置的数据
typedef struct
{
	u8 Login_Password[2]; //登录密码
	u8 Recgnize_Data[6]; //身份识别码
	u8 Bolier_Num[2];  //锅炉编号
	u8 Time_Data[14]; //时间参数
	u8 Temper_Channel[12][2]; //温度通道
	u8 Analog_Channel[12][2]; //模拟通道
	u8 Input_Channel[4]; //开关输入通道
	u8 Output_Channel[2];//开关输出通道
	u8 Calcu_Data[12][2];//计算参数
	u8 Reserve_Data[4][2];//保留字节
	
}Setting;

//能效配置的数据
typedef struct
{
	u8 Energy_Data[23][2];//能效参数配置
	u8 Energy_Rese[6][2]; //配置预留 
	u8 Alarm_Data[8][2];//报警
	u8 Reserve_Data[4][2];//保留字节
	
}Energy_Set;
//流量表数据
typedef struct
{
	float Flow;  //瞬时流量
	float Total_Flow;  //累积流量 
	float Tepmer;
	float Pressure;
	u8 Minnute[2];
	u8 Second[2];
}VORTEX;


extern  Setting     Config;    //配置的参数
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

