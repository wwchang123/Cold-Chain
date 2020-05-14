#include "Usart.h"
#include "modbus_uart.h"
#include "Data_Bus.h"
#include "delay.h"
#include "main.h"


#define Buf11_Max  	100  	//�����������ֽ��� 200

u8 At_string[16]="AT+QIOPEN=\"UDP\",";
vu8 UART1_Receive_Size=0;
u8 Uart1_Buf[Buf11_Max];     //���ջ���,���USART_REC_LEN���ֽ�.

#if 1
#pragma import(__use_no_semihosting)             
//��׼����Ҫ��֧�ֺ���                 
struct __FILE 
{ 
	int handle; 

}; 

FILE __stdout;       
//����_sys_exit()�Ա���ʹ�ð�����ģʽ    
_sys_exit(int x) 
{ 
	x = x; 
} 
//�ض���fputc���� 
int fputc(int ch, FILE *f)
{      
	while((USART1->SR&0X40)==0);//ѭ������,ֱ���������   
    USART1->DR = (u8) ch;      
	return ch;
}
#endif 


/*******************************************************************************
* ������ : CLR_Buf1
* ����   : �������1��������
* ����   : 
* ���   : 
* ����   : 
* ע��   : 
*******************************************************************************/
void CLR_Buf1(u8 *p,u8 buf2)
{
	  memset(p,0,buf2);
    UART1_Receive_Size = 0;      
}
void Usart1_Init(u32 bound)
{
     GPIO_InitTypeDef GPIO_InitStructure;    
     USART_InitTypeDef USART_InitStructure;           
     /* config USART1 clock */   
     RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA, ENABLE);             
     /* USART1 GPIO config */   
     /* Configure USART1 Tx (PA.09) as alternate function push-pull */   
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;    
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;    
     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;    
     GPIO_Init(GPIOA, &GPIO_InitStructure);        
     /* Configure USART1 Rx (PA.10) as input floating */   
     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;    
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;    
     GPIO_Init(GPIOA, &GPIO_InitStructure); 
	
     /* USART1 mode config */   
     USART_InitStructure.USART_BaudRate = bound;    //���ò�����
     USART_InitStructure.USART_WordLength = USART_WordLength_8b;    //8λ���ݸ�ʽ
     USART_InitStructure.USART_StopBits = USART_StopBits_1;    //1��ֹͣλ
     USART_InitStructure.USART_Parity = USART_Parity_No ;    //����żУ��λ
     USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None; 	//��Ӳ������������   
     USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;   //����ģʽ����Ϊ�շ�ģʽ
	 USART_Init(USART1, &USART_InitStructure); //ʹ�ܴ���1�����ж�
		 
	 USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);  //ʹ�ܴ���   
		 
     USART_Cmd(USART1, ENABLE);    	//���������ɱ�־
	 USART_ClearFlag(USART1, USART_FLAG_TC);					    //���������ɱ�־

}


/*******************************************************************************
* ������  : Usart2_Init
* ����    : USART2��ʼ������
* ����    : bound��������(���ã�2400��4800��9600��19200��38400��115200��)
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void Usart2_Init(u32 bound)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	USART_InitTypeDef	USART_InitStructure;
	
	/*ʹ��USART2����ʱ��*/  
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2,ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA,ENABLE);
	
	/*��λ����2*/
 	USART_DeInit(USART2);  
	
	/*USART2_GPIO��ʼ������*/ 
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_2;					//USART2_TXD(PA.2) 
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_AF_PP;		//�����������
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;	//������������������Ϊ50MHz
	GPIO_Init(GPIOA,&GPIO_InitStructure);						//���ÿ⺯���е�GPIO��ʼ����������ʼ��USART1_TXD(PA.9)  
  
	GPIO_InitStructure.GPIO_Pin=GPIO_Pin_3;					//USART2_RXD(PA.3)
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOA,&GPIO_InitStructure);


	/*USART2 ��ʼ������*/
	USART_InitStructure.USART_BaudRate = bound;											//���ò�����
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;			//8λ���ݸ�ʽ
	USART_InitStructure.USART_StopBits = USART_StopBits_1;					//1��ֹͣλ
	USART_InitStructure.USART_Parity = USART_Parity_No;							//����żУ��λ
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(USART2, &USART_InitStructure);		
	//USART_Init(USART2, &USART_InitStructure); //��ʼ������
	USART_ITConfig(USART2,USART_IT_RXNE,ENABLE);
	USART_ITConfig(USART2,USART_IT_IDLE,ENABLE);
	USART_Cmd(USART2,ENABLE);
	USART_ClearFlag(USART2,USART_FLAG_TC);//���������ɱ�־
	
	
}


/*******************************************************************************
* ������  : Usart3_Init
* ����    : USART3��ʼ������
* ����    : bound��������(���ã�2400��4800��9600��19200��38400��115200��)
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void Usart3_Init(uint32_t BaudRate)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;
	//   NVIC_InitTypeDef NVIC_InitStructure; 

	//ʹ�ܴ��ڵ�RCCʱ��
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB , ENABLE); //ʹ��UART3����GPIOB��ʱ��
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE);

	//����ʹ�õ�GPIO������
	// Configure USART2 Rx (PB.11) as input floating  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	// Configure USART2 Tx (PB.10) as alternate function push-pull
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	//���ô���
	USART_InitStructure.USART_BaudRate = BaudRate;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(USART3, &USART_InitStructure);//���ô���3

	USART_ITConfig(USART3, USART_IT_RXNE, ENABLE);// Enable USART1 Receive interrupts ʹ�ܴ��ڽ����ж�

	USART_Cmd(USART3, ENABLE);// Enable the USART3 

	USART_ClearFlag(USART3,USART_FLAG_TC);//���������ɱ�־
}





/*******************************************************************************
* ������  : Uart3_Sendbyte
* ����    : USART3����һ���ֽ�
* ����    : byte һ���ֽ�
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void Uart3_Sendbyte(u8 byte)
{
    while(USART_GetFlagStatus(USART3, USART_FLAG_TXE) == RESET);
    USART_SendData(USART3, byte);
}


/*******************************************************************************
* ������  : UART3_SendString
* ����    : USART3�����ַ���
* ����    : *s�ַ���ָ��
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART3_SendString(u8 * s)
{
	while(*s)//����ַ���������
	{
		//while(USART_GetFlagStatus(USART3, USART_FLAG_TXE)==RESET); 
		Uart3_Sendbyte(*s++);//���͵�ǰ�ַ�
	}
}

/*******************************************************************************
* ������  : UART3_Send_Len
* ����    : USART3����һ�����ȵ��ַ�
* ����    : *s�ַ���ָ�룬len���ַ�����
* ���    : ��
* ����    : �� 
* ˵��    : ��
*******************************************************************************/
void UART3_Send_Len(char *s,u8 len)
{
	if(s!=0)
	while(len)//����ַ���������
	{
		while(USART_GetFlagStatus(USART3, USART_FLAG_TC)==RESET); 
		USART_SendData(USART3 ,*s++);//���͵�ǰ�ַ�
		len--;
	}
}	




/*******************************************************************************
* ������  : USART3_IRQHandler
* ����    : ����3�жϷ������
* ����    : ��
* ����    : �� 
* ˵��    : 
*******************************************************************************/
void USART3_IRQHandler(void)//MODBUS�����ж� 
{
	u8 Res;
	
	if(USART_GetITStatus(USART3, USART_IT_RXNE)==SET)              //���յ�����
	{
		Res =USART_ReceiveData(USART3);

		USART_ClearITPendingBit(USART3,USART_IT_RXNE);
	}
		//���-������������Ҫ�ȶ�SR,�ٶ�DR�Ĵ����������������жϵ�����[ţ��˵Ҫ����]
	if(USART_GetFlagStatus(USART3,USART_FLAG_ORE)==SET)
	{
		
		Res =USART_ReceiveData(USART3);

		USART_ClearFlag(USART3,USART_FLAG_ORE);
	}
}
/*******************************************************************************
* ������  : USART1_IRQHandler
* ����    : ����1�жϷ������
* ����    : ��
* ����    : �� 
* ˵��    : ���������ն˲���
*******************************************************************************/
void USART1_IRQHandler(void)//
{
	vu8 Res,i,j,k;
	
	
	if(USART_GetITStatus(USART1, USART_IT_RXNE)==SET)              //���յ�����
  {	
		Uart1_Buf[UART1_Receive_Size++]=USART_ReceiveData(USART1);
		
		if(strstr((const char*)Uart1_Buf,"\r\n")!=NULL) //�ж���û�����У�Ҳ���ǻس�����û��
		{
			if(UART1_Receive_Size>=4)
			{
				if(UART1_Receive_Size<10)
				{
					Config.Num_Flash[0]=Uart1_Buf[0];
					Config.Num_Flash[1]=Uart1_Buf[1];
					Config.Num_Flash[2]=Uart1_Buf[2];
					Config.Num_Flash[3]=Uart1_Buf[3];
					Config.Num_Flash[4]=Uart1_Buf[4];
					Config.Num_Flash[5]=Uart1_Buf[5];		
					Config.NumOK_flag=0x01;
					CLR_Buf1(Uart1_Buf,Buf11_Max);							
				}
			}
//			else
//			{
//				Config.Num_Flash[0]=Uart1_Buf[0];
//			}
		}

		if(UART1_Receive_Size>=100)
			UART1_Receive_Size=100;
		USART_ClearITPendingBit(USART1,USART_IT_RXNE);
   }
	//���-������������Ҫ�ȶ�SR,�ٶ�DR�Ĵ����������������жϵ�����[ţ��˵Ҫ����]
	if(USART_GetFlagStatus(USART1,USART_FLAG_ORE)==SET)
	{
		Res =USART_ReceiveData(USART1);
			
		USART_ClearFlag(USART1,USART_FLAG_ORE);
	}
}

//���ú�������
u8 Do_config(void)
{
	u8 i=0,j,k;
		
	if(strstr((const char*)Uart1_Buf,"\r\n")!=NULL) //�ж���û�����У�Ҳ���ǻس�����û��
	{
		for(i=0;i<200;i++)
		{
			if(Uart1_Buf[i]=='"' && i<=3)
			{
				j=i;
			}
			if(Uart1_Buf[i]==0x0d)
			{
				k=i;
				break;
			}
				
		}
		for(i=0;i<16;i++)
		{
			Config.IpCom[i]=At_string[i];
		}
		for(i=j;i<k;i++)
		{
			Config.IpCom[i+16]=Uart1_Buf[i];
		}
		return 1;
	}
	else return 0;
}
//�������ù���
void Uart_Config(u8 flag)
{
	if(flag==0x01)
	{
		if(Config.flash_flag==0x01)//��ʾҪ�����������кź�IP��ַ���˿ں�
		{
			printf("���������кţ����кű���Ϊ6λ������\r\n");
			while(1)
			{
				if(Config.NumOK_flag==0x01)
				{
					SPI_Flash_Write(&Config.Rec_flag,0x00,1);
					SPI_Flash_Write(Config.Num_Flash,0x01,6);
//					SPI_Flash_Read(Config.read_flash,0x00,10);
					Config.flash_flag=0x02;
					printf("���к�������ɣ�\r\n\r\n");
					break;
				}
			}
		}
		if(Config.flash_flag==0x02)
		{
			while(1)
			{
				printf("��ӭ���봮��IP��ַ�Ͷ˿ں�����ģʽ:\r\n");
				printf("\r\n\r\n");
				printf("�����������£�\"218.71.143.80\",8028\r\n");
				printf("�������£�\"www.rusinge.com\",8028");
				printf("\r\n\r\n");	
				while(1)
				{
					if(1==Do_config())
					{
						SPI_Flash_Write(&Config.Rec_flag,0x1000,1);
						SPI_Flash_Write(Config.IpCom,0x1001,sizeof(Config.IpCom));
						printf("IP��ַ�˿ں�������ɣ�\r\n\r\n");
						NVIC_SystemReset();   //��λ
						break;
					}
				}
				
			}
		}	
	}
	else
	{
		if(Uart1_Buf[0]=='1')
		{
			Config.flash_flag=0x01;
			SPI_Flash_Erase_Sector(0x00) ;
			SPI_Flash_Erase_Sector(0x01) ;
			SPI_Flash_Erase_Sector(0x02) ;
			printf("�����������е���Ϣ:\r\n");
			CLR_Buf1(Uart1_Buf,Buf11_Max);
			
		}
	}
}



