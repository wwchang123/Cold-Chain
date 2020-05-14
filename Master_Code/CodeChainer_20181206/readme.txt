
//////////////////////系统总框架程序//////////////////////

 stm32与si4438的引脚接线说明：
 
 VCC(VDD)--3.3V   GND
 SPI： MISO(SDO)--PA6    MOSI(SDI)--PA7  SCLK--PA5   NSEL(CS)--- PA4
 
 SDN----  PB1
 NIRQ---  PC4
 
程序列表


1.led程序
2.key程序-扫描薄膜按键，进行各种模式选择
3.delay程序
4.systick滴答程序--用于各类延时
5.usart，串口1程序-gprs程序  串口2 --蓝牙程序  串口3 液晶显示程序
6.printf使用程序
7.加入modbus程序,进行寄存器的读写。
8.加入GPRS程序 。
9.加入w25q64的flash读写程序

