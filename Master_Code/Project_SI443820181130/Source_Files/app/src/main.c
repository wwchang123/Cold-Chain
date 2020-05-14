/**
 stm32与si4438的引脚接线说明：
 
 VCC(VDD)--3.3V   GND
 SPI： MISO(SDO)--PA6    MOSI(SDI)--PA7  SCLK--PA5   NSEL(CS)--- PA4
 
 SDN----  PB1
 NIRQ---  PC4
  */



#include "main.h"				//main.h 中含有TX/RX、软件SPI/硬件SPI选择配置选项


const char *g_Ashining = "ashining";
uint8_t g_TxMode = 0, g_UartRxFlag = 0;
uint8_t g_UartRxBuffer[ 64 ] = { 0 };
uint8_t g_SI4463ItStatus[ 9 ] = { 0 };
uint8_t g_SI4463RxBuffer[ 64 ] = { 0 }; 

extern vu8 rssi_flag;

/**
  * @brief :主函数 
  * @param :无
  * @note  :无
  * @retval:无
  */ 
int main( void )
{	
	uint16_t i = 0;

	//串口初始化波特率 9600
	drv_uart_init( 9600 );
	
	//延时初始化
	drv_delay_init( );
	
	//LED初始化
	drv_led_init( );
	
	//SPI初始化
	drv_spi_init( );
	
	//SI4463初始化	
	SI446x_Init( );
	
	led_red_off( );
	led_green_off( );
	for( i = 0; i < 6; i++ )		//模块初始化完成，LED灯闪烁3个周期
	{
		led_red_flashing( );
		led_green_flashing( );
		drv_delay_500Ms( 1 );
	}
		
	
#ifdef	__SI4438_TX_TEST__		
//=========================================================================================//	
//*****************************************************************************************//
//************************************* 发送 **********************************************//
//*****************************************************************************************//
//=========================================================================================//	
	
	//按键初始化
	drv_button_init( );				//Demo程序中 只有在发送时才会使用按键
	
	while( 1 )	
	{
		//模式切换
		if( BUTOTN_PRESS_DOWN == drv_button_check( ))	//检查按键动作
		{
			g_TxMode = 1 - g_TxMode;		//模式会在 TX_MODE_1( 0 ),TX_MODE_2( 1 )之间切换
			
			//状态显示清零
			led_green_off( );
			led_red_off( );
			
			if( TX_MODE_1 == g_TxMode )
			{
				for( i = 0; i < 6; i++ )		//固定发送模式，红灯闪烁3次
				{
					led_red_flashing( );	
					drv_delay_500Ms( 1 );		
				}
			}
			else
			{
				for( i = 0; i < 6; i++ )		//串口发送模式，绿灯闪烁3次
				{
					led_green_flashing( );	
					drv_delay_500Ms( 1 );
				}
			}
		}
		
		//发送固定字符串
		if( TX_MODE_1 == g_TxMode )
		{
			//发送数据
			#if PACKET_LENGTH == 0
				SI446x_Send_Packet( (uint8_t *)g_Ashining, 8, 0, 0 );
			#else
				SI446x_Send_Packet( (uint8_t *)g_Ashining, PACKET_LENGTH, 0, 0 );
			#endif
			drv_delay_500Ms( 1 );	
			led_red_flashing( );			//1S左右发送一包 每发送一包红灯闪烁一次
			drv_delay_500Ms( 1 );	
		}
		else	//发送串口接收到的字符串
		{	
			//查询串口数据
			i = drv_uart_rx_bytes( g_UartRxBuffer );
			
			if( 0 != i )
			{
				if( 16 < i )
				{
					i = 0;
				}
				#if PACKET_LENGTH == 0
					SI446x_Send_Packet( (uint8_t *)g_UartRxBuffer, i, 0, 0 );
				#else
					SI446x_Send_Packet( (uint8_t *)g_UartRxBuffer, PACKET_LENGTH, 0, 0 );
				#endif
				led_red_flashing( );
			}
		}
	}
	
#else		
//=========================================================================================//	
//*****************************************************************************************//
//************************************* 接收 **********************************************//
//*****************************************************************************************//
//=========================================================================================//	
	
	while( 1 )
	{
		if(rssi_flag==0x01)
		{
			rssi_flag=0x00;
			SI446x_Interrupt_Status( g_SI4463ItStatus );		//读中断状态
			
			if( g_SI4463ItStatus[ 3 ] & ( 0x01 << 4 ))
					
			{
				i = SI446x_Read_Packet( g_SI4463RxBuffer );		//读FIFO数据
				if( i != 0 )
				{
					led_green_flashing( );
					drv_uart_tx_bytes( g_SI4463RxBuffer,i );	//输出接收到的字节
				}
			
//				SI446x_Change_Status( 6 );
//				while( 6 != SI446x_Get_Device_Status( ));
//				SI446x_Start_Rx(  0, 0, PACKET_LENGTH,0,0,3 );
			}
			else
			{
				if( 3000 == i++ )
				{
					i = 0;
					SI446x_Init( );
				}
				drv_delay_ms( 1 );
			}		
		}

	}
		
#endif
	
}

