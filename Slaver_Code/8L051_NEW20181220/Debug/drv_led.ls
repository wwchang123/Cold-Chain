   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 6 void drv_led_init(void)
  45                     ; 7 {
  47                     .text:	section	.text,new
  48  0000               _drv_led_init:
  52                     ; 8 	GPIO_Init(LED1_PORT,LED1_PINS,GPIO_Mode_Out_PP_Low_Slow);//³õÊ¼»¯LED¶Ë¿Ú
  54  0000 4bc0          	push	#192
  55  0002 4b01          	push	#1
  56  0004 ae500f        	ldw	x,#20495
  57  0007 cd0000        	call	_GPIO_Init
  59  000a 85            	popw	x
  60                     ; 9 }
  63  000b 81            	ret
  76                     	xdef	_drv_led_init
  77                     	xref	_GPIO_Init
  96                     	end
