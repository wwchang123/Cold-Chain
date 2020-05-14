/*
  gprs����͸���ķ�ʽ�������ݴ���
  ֻҪ���ó�͸��ģʽ����AT+CIPMODE=1���ü���
*/
#include "gprs.h"
#include "string.h"
#include "stdio.h"
#include "delay.h"
#include "led.h"
#include "Data_Bus.h"
#include "gprs_handle.h"


IPCOM  IP_COM;

//����1���ͻس�����
#define UART2_SendLR() UART2_SendString("\r\n")
vu8 First_Int2 = 0;
#define Buf2_Max 250

u8  Uart2_Buf[Buf2_Max]={0};//����1���ݻ�����
vu8 Timer2_start=0,Times=0,timer2=0;	//��ʱ��2��ʱ����������
/*************	���س�������	**************/

//ȫ����IP��ַ���˿ںţ�"AT+CIPSTART=\"TCP\",\"195.34.89.241\",7"
//��¯����ϵͳ��IP��ַ���˿ں�  "AT+CIPSTART=\"TCP\",\"139.196.152.127\",12000"
//const char *string = "AT+QIOPEN=\"TCP\",\"139.196.152.127\",\"12000\"";//IP��¼������,��Ҫ�����Լ���IP�Ͷ˿����޸�,0x0d,0x0a
//const char *string = "AT+QIOPEN=\"TCP\",\"195.34.89.241\",\"7\"";//IP��¼������,��Ҫ�����Լ���IP�Ͷ˿����޸�,0x0d,0x0a
//const char *string = "AT+QIOPEN=\"UDP\",\"122.228.181.162\",\"8015\"";//IP��¼������,��Ҫ�����Լ���IP�Ͷ˿����޸�,0x0d,0x0a


void IPCOM_Init(void)
{
	memset(IP_COM.Gprsdwon_IP,0,60);
	memset(IP_COM.Orin_IP,0,60);
}
//PORkey���ܿ��� 
void OpenGprs_PowKey(void)
{
	
	GPIO_InitTypeDef GPIO_InitStructure;
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC,ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOC, &GPIO_InitStructure); 
  GPIO_ResetBits(GPIOC,GPIO_Pin_12);
	GPIO_SetBits(GPIOC,GPIO_Pin_12);
	delay_ms(1500);
	GPIO_ResetBits(GPIOC,GPIO_Pin_12);
}
/*******************************************************************************
* ������ : CLR_Buf1
* ����   : �������1��������
* ����   : 
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
void CLR_Buf2(u8 *p,u8 buf2)
{
	memset(p,0,buf2);
    First_Int2 = 0;              //�����ַ�������ʼ�洢λ��
}
/*******************************************************************************
* ������ : Find
* ����   : �жϻ������Ƿ���ָ�����ַ���
* ����   : 
* ���   : 
* ����   : unsigned char:1 �ҵ�ָ���ַ���0 δ�ҵ�ָ���ַ� 
* ע��   : 
*******************************************************************************/

u8 Find(char *a)
{ 
  if(strstr((const char *)Uart2_Buf,a)!=NULL)
	    return 1;
	else
			return 0;
}
/*******************************************************************************
* ������  : UART1_Data
* ����    : USART1����һ���ֽ�
* ����    : byte һ���ֽ�
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_Data(char byte)
{
	while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
	USART_SendData(USART2,byte);//���͵�ǰ�ַ�
}

/*******************************************************************************
* ������  : UART1_Data
* ����    : USART1���Ͷ���ֽ�
* ����    : byte һ���ֽ�
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_Data_Len(u8 *a,u8 len)
{
	u8 i;
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	for(i=0;i<len;i++)
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,a[i]);//���͵�ǰ�ַ�	
	}

}
/*******************************************************************************
* ������  : UART1_SendString
* ����    : USART1�����ַ���
* ����    : *s�ַ���ָ��
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_SendString(char* s)
{

	while(*s)//����ַ���������
	{
		while(USART_GetFlagStatus(USART2,USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,(char)*s++);//���͵�ǰ�ַ�
	}
}

/*******************************************************************************
* ������  : UART1_Send_Len
* ����    : USART1����һ�����ȵ��ַ�
* ����    : *s�ַ���ָ�룬len���ַ�����
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_Send_Len(char *s,u8 len)
{
	if(s!=0)
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	while(len)//����ַ���������
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2,*s++);//���͵�ǰ�ַ�
		len--;
	}
}	



/*******************************************************************************
* ������ : Second_AT_Command
* ����   : ����ATָ���
* ����   : �������ݵ�ָ�롢���͵ȴ�ʱ��(��λ��S)
* ���   :  һֱ�ڷ���ֱ�����յ�OKΪֹ
* ����   : 
* ע��   : 
*******************************************************************************/

void Second_AT_Command(char *b,char *a,u8 wait_time)         
{
	u8 i;
	char *c;
	c = b;										//�����ַ�����ַ��c
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	i = 0;
	while(i == 0)                    
	{
		if(!Find(a)) 
		{
			if(Timer2_start == 0)
			{
				b = c;							//���ַ�����ַ��b
				for (; *b!='\0';b++)
				{
					while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET);
					USART_SendData(USART2,*b);
				}

				Times = 0;
				timer2 = wait_time;
				Timer2_start = 1;
		   }
		}
		else
		{
			i = 1;
			Timer2_start = 0;
		}
	}
 
	CLR_Buf2(Uart2_Buf,Buf2_Max);
}

/*******************************************************************************
* ������ : GSM_send_cmd
* ����   : ����ATָ���
* ����   : �������ݵ�ָ�롢���͵ȴ�ʱ��(��λ��S)
* ���   : һֱ����ʱ�еȴ�OK��
* ����   : 0:����  1:����
* ע��   : 
*******************************************************************************/
u8 GSM_send_cmd(char *cmd,char *ack,u8 wait_time)         
{
	u8 res=1;
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	IWDG_Feed();// ι��
	for (; *cmd!='\0';cmd++)
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET);
		USART_SendData(USART2,*cmd);
	}
	UART2_SendLR();
	if(wait_time==0)return res;
	Times = 0;
	timer2 = wait_time;
	Timer2_start = 1;
	
	while(Timer2_start&res)                    
	{
		if((strstr((const char*)Uart2_Buf,(char*)ack)==ERROR)||(strstr((const char*)Uart2_Buf,(char*)ack)==NULL))//���ܴ��� ERROR
		{
			res=1;
		}	
		else
		{
			 res=0;
		}

	}
	return res;
}

/*******************************************************************************
* ������ : Set_ATE0
* ����   : ȡ������
* ����   : 
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
void Set_ATE0(void)
{
	GSM_send_cmd("ATE0","OK",3);								//ȡ������		
}
/*******************************************************************************
* ������  : USART2_IRQHandler
* ����    : ����2�жϷ������
* ����    : ��
* ����    : �� 
* ˵��    : 
*******************************************************************************/
void USART2_IRQHandler(void)                	
{
	u8 Res=0;
	
	if(USART_GetITStatus(USART2, USART_IT_RXNE)!= RESET)              //���յ�����
	{
		//Res=USART1->SR;
		Res =USART_ReceiveData(USART2);
	  
		Uart2_Buf[First_Int2] = Res;  	  //�����յ����ַ����浽������

		First_Int2++;

		if(First_Int2 >= Buf2_Max)       		//���������,������ָ��ָ�򻺴���׵�ַ
		{
			First_Int2 = 0;
		}  
		Write_RingBuff(Res);
		USART_ClearITPendingBit(USART2,USART_IT_RXNE);

	}
	
	if(USART_GetITStatus(USART2, USART_IT_IDLE)!= RESET)              //���յ�����
	{
		Res=USART1->SR;
		Res =USART_ReceiveData(USART2);
		ringBuff.g_gprs_uart=0x01;
		USART_ClearITPendingBit(USART2,USART_IT_IDLE);

	}

	//���-������������Ҫ�ȶ�SR,�ٶ�DR�Ĵ����������������жϵ�����[ţ��˵Ҫ����]
	if(USART_GetFlagStatus(USART2,USART_FLAG_ORE)==SET)
	{
		Res =USART_ReceiveData(USART2);
		Uart2_Buf[First_Int2] = Res;  	  //�����յ����ַ����浽������
		First_Int2++;                			//����ָ������ƶ�
		if(First_Int2 > Buf2_Max)       		//���������,������ָ��ָ�򻺴���׵�ַ
		{
			First_Int2 = 0;
		}    	
		printf("�����ж����������\r\n");
		USART_ClearFlag(USART2,USART_FLAG_ORE);
	}
			
}


/*******************************************************************************
* ������ : Connect_Server
* ����   : GPRS���ӷ���������
* ����   : 
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
u8 Connect_Server(char* strIP)
{
	UART2_SendString("AT+QICLOSE=1");	//�ر�����
	UART2_SendLR();
	delay_ms(100);
	GSM_send_cmd("AT+QIDEACT","DEACT OK",3);		//�ر��ƶ�����
	GSM_send_cmd("AT+QIACT","OK",3);//�����ƶ����� 
	GSM_send_cmd("AT+QIHEAD=0","OK",3);//����GPRS�ƶ�̨���ΪB,֧�ְ����������ݽ��� 
	GSM_send_cmd("AT+CGATT=1","OK",2);//����GPRSҵ��
	GSM_send_cmd("AT+QICSGP=1,\"CMNET\"","OK",5);//����ΪGPRS����ģʽ
	//����͸��ģʽָ��
	GSM_send_cmd("AT+QIMODE=1","OK",3);//��͸������
	GSM_send_cmd("AT+QITCFG=3,2,512,1","OK",3);//����͸��ģʽ�������ط�����:2,���1S����һ��,ÿ�η���200���ֽ�
	//MCU:"AT+QIDNSIP=0\r\n"��0��ʹ��IP��ַ���ӣ�1��ʹ���������ӣ�
	if(0==GSM_send_cmd((char*)strIP,"CONNECT",25))
	{
		//CLR_Buf2();	
		CLR_Buf2(Uart2_Buf,Buf2_Max);
		return 1;
	}
	delay_ms(1500);
	CLR_Buf2(Uart2_Buf,Buf2_Max);
	return 0;
}



void Analysis_Server_Data(void) //����������������������
{

	if((strstr((const char *)Uart2_Buf,"+PDP")!=NULL))   		//�������ַ����к���+PDP����ʾ�������ڹر�
	{


	}
	CLR_Buf2(Uart2_Buf,Buf2_Max);
}
//�ȴ�ģ��ע��ɹ�
u8 Wait_CREG(char* stringIP)
{
	u8 k;
	
	if(0==GSM_send_cmd("AT+CSQ","CSQ",2))		//��ӡ�ź�����
	{
		for(k=0;k<20;k++)
		{
			printf("%c",Uart2_Buf[k]);
		}
	}
	printf("\r\n");
	printf("GPRS��ʼ���ӷ�����....\r\n");
	delay_ms(1500);
	if(1==Connect_Server(stringIP)) //��ʾ�Ѿ������Ϲ���
	{
		
		return 1;
	}

	return 0;
}
u8 GPRS_Init(char* ipcom)
{
	u8 retry=0;
	printf("GPRS����\r\n");
	printf("GPRS����ע����...\r\n");
	delay_ns(2);
	while(1==GSM_send_cmd("AT","OK",2))		//����ATָ��
	{
		OpenGprs_PowKey();
		GSM_OFF;//����
		delay_ns(4);

		retry++;
		if(retry>=3)
			return 1;
	}

	delay_ns(10);
	Set_ATE0();    //ȡ������
	
	if(0==GSM_send_cmd("AT+CPIN?","+CPIN: READY",2))		//����SIM���Ƿ���λָ��
	{
		if(1==Wait_CREG(ipcom))
		{
			GSM_ON;//����
			return 3;
		}
		else
		{
			return 4;//GPRSע��ʧ��	
		}	
	}
	else
	{
		
		GSM_OFF;//����
		return 2;//SIM��δ��	
	}
	
}



