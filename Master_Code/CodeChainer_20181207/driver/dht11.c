#include "dht11.h"
#include "delay.h"
#include "Data_Bus.h"

u8 sbuf,check;

void DHT11_PortIN(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD ,ENABLE);
	//Configure pin as input 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 ;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING; 	//��������
	GPIO_Init(GPIOD,&GPIO_InitStructure);
}

void DHT11_PortOUT(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD ,ENABLE);
	//Configure pin as input 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 ;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 	//�������
	GPIO_Init(GPIOD,&GPIO_InitStructure);
}

unsigned char StartDHT11(void)
{
   u8 i=0;

   DHT11_PortOUT();
   DHT11_Out = 0;
   delay_ms(18);  //������ʼ,��������Ҫ����18ms
  
   DHT11_Out = 1;	//�ͷ�����
   delay_us(25);  //wait 20-40uS �ȴ�DHT11�ĵ͵�ƽ��Ӧ�ź�
   DHT11_PortIN();//��Ϊ����
   if(!DHT11_In)
   {
	   while(!DHT11_In)//�͵�ƽ����Ӧ�źţ�80us
	   {
			i++;
		   if(i>=255)
			   break;
	   }
	   i=0;
	   while(DHT11_In)//��������80us�ĸߵ�ƽ����׼���ź�
	   {
			i++;
		   if(i>=255)
			   break;
	   }
	   //���ͺ�DHT11����������80us,���ŻῪʼ������	
	   return 1;
   }

	return 0;
}

void com(void)
{
	u8 i,tt;
	u8 j = 0;
	tt = 0;
	for(i = 0;i<8;i++)
	{
		sbuf <<= 1;
		delay_us(20);//���յ���Ӧ������50us�ĵ͵�ƽ��ʾ�������ݵĿ�ʼ����������С��ʱһ��
		while(!DHT11_In)//�ȵ��ߵ�ƽ�ĳ��֣��ߵ�ƽ��ʱ���ʾ��������λ��0��1
		{
			j++;
			if(j>=255)
				break;
		}
		delay_us(25);//����Ϊ0���ź�ʱ��Ϊ26-28us��1��Ϊ70us�����ﳬʱ���
		tt = 100;
		while(tt++);
		if(DHT11_In)//�����Ϊ��
		{
			 sbuf |= 0x01;
			 delay_us(30);//�������ʱ�㹻�ˣ�40+10+30>70��
		}
		else //������
		{
			sbuf &= 0xfe;
		}
	}
}
void ReadDHT11(void)
{
	u8 sum;
	u8 tdata[4]={0x00,0x00,0x00,0x00};
	if(StartDHT11())	//�ж��Ƿ��Ѿ���Ӧ
	{
		com();
		tdata[0]=sbuf;
		com();
		tdata[1]=sbuf;
		com();
		tdata[2]=sbuf;		
		com();
		tdata[3]=sbuf;
		com();
		check = sbuf;
		sum = (tdata[0]+tdata[1]+tdata[2]+tdata[3]);
		if(check == sum)
		{
			Config.Temper_Channel[8][0]=tdata[0]*10/256;
			Config.Temper_Channel[8][1]=tdata[0]*10%256;
			Config.Temper_Channel[11][0]=tdata[2]*10/256;
			Config.Temper_Channel[11][1]=tdata[2]*10%256;
		}
	}

}
