/*******************************************************************************
****文件描述：DS18B20 STM8L下的驱动
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
#include "stm8l15x.h"
#include "ds18b20.h"
#include "drv_delay.h"

extern unsigned char   SendBuffer[6];
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：DS18B20初始化函数
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
unsigned char init_1820(void)  
{  
  unsigned char time=0;  
    SET_DIR_1WIRE; //输出 
    SET_OP_1WIRE;//H   
    CLR_OP_1WIRE;//L  
    delay_10us(50);    //480us以上 
    SET_OP_1WIRE;//H  
    CLR_DIR_1WIRE;//输入  
    delay_10us(3);     //15~60us    
    while(CHECK_IP_1WIRE&&time++)
    {
      if(time==0XFE)
        return 0;
    }
    //while(CHECK_IP_1WIRE);
    SET_DIR_1WIRE;  
    SET_OP_1WIRE;  
    delay_10us(12);   //60~240us
    return 1;
} 
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：写DS18B20函数
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
void write_1820(unsigned char x)  
{     
     unsigned char m;  
    for(m=0;m<8;m++)  
    {  
       CLR_OP_1WIRE;  
       if(x&(1<<m))    //写数据了，先写低位的！ 
       SET_OP_1WIRE;  
       else  
       {CLR_OP_1WIRE;}  
       delay_10us(4);   //15~60us 
       SET_OP_1WIRE;  
    }  
     SET_OP_1WIRE;  
} 
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：读DS18B20函数
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
unsigned char read_1820(void)  
{      
    unsigned char temp,k,n;  
    temp=0;  
    for(n=0;n<8;n++)  
       {  
      CLR_OP_1WIRE;  
      SET_OP_1WIRE;  
      CLR_DIR_1WIRE;  
      k=(CHECK_IP_1WIRE);    //读数据,从低位开始  
      if(k)  
      temp|=(1<<n);  
      else  
      temp&=~(1<<n);  
      delay_10us(8); //60~120us     
      SET_DIR_1WIRE;  
   }  
   return (temp);  
}   
/*******************************************************************************
****入口参数：无
****出口参数：无
****函数备注：获取DS18B20温度数据函数
****版权信息：蓝旗嵌入式系统
*******************************************************************************/
void gettemp(void)    //读取温度值 
{  
     unsigned char temh,teml;  
    // unsigned int temp;
     //float value;
     init_1820();        //复位18b20  
     write_1820(0xcc);   // 发出转换命令  
     write_1820(0x44); 
     //delay_ms(800);     //不延时也好使，不知道怎么回事！ 
     init_1820();  
     write_1820(0xcc);  //发出读命令  
     write_1820(0xbe);  
     teml=read_1820();  //读数据  
     temh=read_1820();
		 SendBuffer[4]=temh;
		 SendBuffer[5]=teml;
    // temp=temh;
   // temp<<=8;
   // temp|=teml;
   // temp*=6;
    //value=temp*0.0625;
  //  return temp; 
}  