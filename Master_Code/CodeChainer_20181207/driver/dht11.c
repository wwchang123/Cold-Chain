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
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING; 	//浮动输入
	GPIO_Init(GPIOD,&GPIO_InitStructure);
}

void DHT11_PortOUT(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOD ,ENABLE);
	//Configure pin as input 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 ;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 	//推挽输出
	GPIO_Init(GPIOD,&GPIO_InitStructure);
}

unsigned char StartDHT11(void)
{
   u8 i=0;

   DHT11_PortOUT();
   DHT11_Out = 0;
   delay_ms(18);  //触发开始,总线拉低要大于18ms
  
   DHT11_Out = 1;	//释放总线
   delay_us(25);  //wait 20-40uS 等待DHT11的低电平响应信号
   DHT11_PortIN();//改为输入
   if(!DHT11_In)
   {
	   while(!DHT11_In)//低电平的响应信号，80us
	   {
			i++;
		   if(i>=255)
			   break;
	   }
	   i=0;
	   while(DHT11_In)//紧接着是80us的高电平数据准备信号
	   {
			i++;
		   if(i>=255)
			   break;
	   }
	   //拉低后DHT11会拉高总线80us,接着会开始传数据	
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
		delay_us(20);//接收到响应后会出现50us的低电平表示发送数据的开始，所以这里小延时一下
		while(!DHT11_In)//等到高电平的出现，高电平的时间表示的是数据位的0和1
		{
			j++;
			if(j>=255)
				break;
		}
		delay_us(25);//数据为0的信号时间为26-28us，1则为70us，这里超时检测
		tt = 100;
		while(tt++);
		if(DHT11_In)//如果还为高
		{
			 sbuf |= 0x01;
			 delay_us(30);//这里的延时足够了，40+10+30>70了
		}
		else //如果变低
		{
			sbuf &= 0xfe;
		}
	}
}
void ReadDHT11(void)
{
	u8 sum;
	u8 tdata[4]={0x00,0x00,0x00,0x00};
	if(StartDHT11())	//判断是否已经响应
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
