#include "bleeth.h"

#define Buf2_Max 64
u8 Uart2_Buf[Buf2_Max]={0};//����2���ݻ�����
vu8 First_Int2 = 0;
/*******************************************************************************
* ������  : UART2_Data
* ����    : USART2����һ���ֽ�
* ����    : byte һ���ֽ�
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_Data(char byte)
{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2 ,byte);//���͵�ǰ�ַ�
}

/*******************************************************************************
* ������  : UART2_SendString
* ����    : USART2�����ַ���
* ����    : *s�ַ���ָ��
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART2_SendString(char* s)
{
	while(*s != '\0')//����ַ���������
	{
		while(USART_GetFlagStatus(USART2, USART_FLAG_TC)==RESET); 
		USART_SendData(USART2 ,*s++);//���͵�ǰ�ַ�
	}
}

void bleeth_send(char data)
{
	UART2_Data(data);
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
	char Res=0;
	
	if(USART_GetITStatus(USART2, USART_IT_RXNE)==SET)              //���յ�����
  {
		Res =USART_ReceiveData(USART2);
		Uart2_Buf[First_Int2] = Res;  	  //�����յ����ַ����浽������
		First_Int2++;                			//����ָ������ƶ�
		if(First_Int2 > Buf2_Max)       		//���������,������ָ��ָ�򻺴���׵�ַ
		{
			First_Int2 = 0;
		}   
		USART_ClearITPendingBit(USART2,USART_IT_RXNE);
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

		USART_ClearFlag(USART2,USART_FLAG_ORE);
	}
			
	if(Res==0x15)
	{
		bleeth_send(0x55);
	}
} 
