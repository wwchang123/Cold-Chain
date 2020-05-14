   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               _SendBuffer:
  18  0000 00            	dc.b	0
  19  0001 000000000000  	ds.b	6
  57                     ; 15 void RTC_Config(void)
  57                     ; 16 {
  59                     .text:	section	.text,new
  60  0000               _RTC_Config:
  64                     ; 18 		CLK_LSICmd(ENABLE);//使能LSI
  66  0000 a601          	ld	a,#1
  67  0002 cd0000        	call	_CLK_LSICmd
  69                     ; 19 		CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTC时钟门控使能
  71  0005 ae0001        	ldw	x,#1
  72  0008 a612          	ld	a,#18
  73  000a 95            	ld	xh,a
  74  000b cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 20 		CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_32);//RTC时钟源LSI，32分频=1.1875K
  78  000e ae00a0        	ldw	x,#160
  79  0011 a604          	ld	a,#4
  80  0013 95            	ld	xh,a
  81  0014 cd0000        	call	_CLK_RTCClockConfig
  84  0017               L32:
  85                     ; 21 		while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//等待LSI就绪
  87  0017 a613          	ld	a,#19
  88  0019 cd0000        	call	_CLK_GetFlagStatus
  90  001c 4d            	tnz	a
  91  001d 27f8          	jreq	L32
  92                     ; 23 		RTC_WakeUpCmd(DISABLE);
  94  001f 4f            	clr	a
  95  0020 cd0000        	call	_RTC_WakeUpCmd
  97                     ; 25 		RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=0.0742k=13.477ms
  99  0023 4f            	clr	a
 100  0024 cd0000        	call	_RTC_WakeUpClockConfig
 102                     ; 26 		RTC_ITConfig(RTC_IT_WUT, ENABLE);//开启中断
 104  0027 4b01          	push	#1
 105  0029 ae0040        	ldw	x,#64
 106  002c cd0000        	call	_RTC_ITConfig
 108  002f 84            	pop	a
 109                     ; 27 		RTC_SetWakeUpCounter(22260);//22260*13.477 ms=300S左右  13385*13.477 ms=180S左右
 111  0030 ae56f4        	ldw	x,#22260
 112  0033 cd0000        	call	_RTC_SetWakeUpCounter
 114                     ; 28 		enableInterrupts();
 117  0036 9a            rim
 119                     ; 29 }
 123  0037 81            	ret
 147                     ; 31 void Low_IOinit(void)
 147                     ; 32 {
 148                     .text:	section	.text,new
 149  0000               _Low_IOinit:
 153                     ; 33 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 155  0000 4bc0          	push	#192
 156  0002 4bff          	push	#255
 157  0004 ae5000        	ldw	x,#20480
 158  0007 cd0000        	call	_GPIO_Init
 160  000a 85            	popw	x
 161                     ; 34 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 163  000b 4bc0          	push	#192
 164  000d 4bff          	push	#255
 165  000f ae5005        	ldw	x,#20485
 166  0012 cd0000        	call	_GPIO_Init
 168  0015 85            	popw	x
 169                     ; 35 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 171  0016 4bc0          	push	#192
 172  0018 4bff          	push	#255
 173  001a ae500a        	ldw	x,#20490
 174  001d cd0000        	call	_GPIO_Init
 176  0020 85            	popw	x
 177                     ; 36 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);	
 179  0021 4bc0          	push	#192
 180  0023 4bff          	push	#255
 181  0025 ae500f        	ldw	x,#20495
 182  0028 cd0000        	call	_GPIO_Init
 184  002b 85            	popw	x
 185                     ; 37 }
 188  002c 81            	ret
 229                     ; 44 void main(void)
 229                     ; 45 {
 230                     .text:	section	.text,new
 231  0000               _main:
 235                     ; 47 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 237  0000 4f            	clr	a
 238  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 240                     ; 48 	delay_ms(2);
 242  0004 ae0002        	ldw	x,#2
 243  0007 cd0000        	call	_delay_ms
 245                     ; 50 	PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
 247  000a a601          	ld	a,#1
 248  000c cd0000        	call	_PWR_FastWakeUpCmd
 250                     ; 52 	RTC_Config();
 252  000f cd0000        	call	_RTC_Config
 254                     ; 54 	Low_IOinit();
 256  0012 cd0000        	call	_Low_IOinit
 258                     ; 55 	PWR_UltraLowPowerCmd(ENABLE);//超低功耗
 260  0015 a601          	ld	a,#1
 261  0017 cd0000        	call	_PWR_UltraLowPowerCmd
 263                     ; 56 	RTC_ITConfig(RTC_IT_WUT, ENABLE);//唤醒定时器中断使能
 265  001a 4b01          	push	#1
 266  001c ae0040        	ldw	x,#64
 267  001f cd0000        	call	_RTC_ITConfig
 269  0022 84            	pop	a
 270                     ; 57 	RTC_WakeUpCmd(ENABLE);//RTC唤醒使能
 272  0023 a601          	ld	a,#1
 273  0025 cd0000        	call	_RTC_WakeUpCmd
 275  0028               L74:
 276                     ; 62 		drv_spi_init( );
 278  0028 cd0000        	call	_drv_spi_init
 280                     ; 64 		SI446x_Init( );
 282  002b cd0000        	call	_SI446x_Init
 284                     ; 65 		if(init_1820())
 286  002e cd0000        	call	_init_1820
 288  0031 4d            	tnz	a
 289  0032 2703          	jreq	L35
 290                     ; 67 				gettemp();
 292  0034 cd0000        	call	_gettemp
 294  0037               L35:
 295                     ; 69 		SendBuffer[0]=0xEB; // 包头
 297  0037 35eb0000      	mov	_SendBuffer,#235
 298                     ; 70 		SendBuffer[1]=(Num_Ser/256/256);
 300  003b 35010001      	mov	_SendBuffer+1,#1
 301                     ; 71 		SendBuffer[2]=(Num_Ser/256%256);
 303  003f 358c0002      	mov	_SendBuffer+2,#140
 304                     ; 72 		SendBuffer[3]=(Num_Ser%256);
 306  0043 358b0003      	mov	_SendBuffer+3,#139
 307                     ; 73 		SendBuffer[6]= (SendBuffer[1]+SendBuffer[2]+SendBuffer[3]+SendBuffer[4]+SendBuffer[5])%256;
 309  0047 b604          	ld	a,_SendBuffer+4
 310  0049 5f            	clrw	x
 311  004a bb05          	add	a,_SendBuffer+5
 312  004c 2401          	jrnc	L21
 313  004e 5c            	incw	x
 314  004f               L21:
 315  004f 02            	rlwa	x,a
 316  0050 1c0118        	addw	x,#280
 317  0053 90ae0100      	ldw	y,#256
 318  0057 cd0000        	call	c_idiv
 320  005a 51            	exgw	x,y
 321  005b 01            	rrwa	x,a
 322  005c b706          	ld	_SendBuffer+6,a
 323  005e 02            	rlwa	x,a
 324                     ; 74 		SI446x_Send_Packet(SendBuffer, 7, 0, 3);
 326  005f 4b03          	push	#3
 327  0061 4b00          	push	#0
 328  0063 4b07          	push	#7
 329  0065 ae0000        	ldw	x,#_SendBuffer
 330  0068 cd0000        	call	_SI446x_Send_Packet
 332  006b 5b03          	addw	sp,#3
 333                     ; 75 		CLR_DIR_1WIRE;
 335  006d 4b00          	push	#0
 336  006f 4b08          	push	#8
 337  0071 ae5000        	ldw	x,#20480
 338  0074 cd0000        	call	_GPIO_Init
 340  0077 85            	popw	x
 343  0078               L75:
 344                     ; 76 		while(IRQ_READ()==0x01);
 346  0078 4b01          	push	#1
 347  007a ae500a        	ldw	x,#20490
 348  007d cd0000        	call	_GPIO_ReadInputDataBit
 350  0080 5b01          	addw	sp,#1
 351  0082 a101          	cp	a,#1
 352  0084 27f2          	jreq	L75
 353                     ; 77 		GPIO_SetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	
 355  0086 4b10          	push	#16
 356  0088 ae5005        	ldw	x,#20485
 357  008b cd0000        	call	_GPIO_SetBits
 359  008e 84            	pop	a
 360                     ; 78 		halt();	
 363  008f 8e            halt
 367  0090 2096          	jra	L74
 392                     	xdef	_main
 393                     	xdef	_Low_IOinit
 394                     	xdef	_RTC_Config
 395                     	xdef	_SendBuffer
 396                     	xref	_gettemp
 397                     	xref	_init_1820
 398                     	xref	_SI446x_Init
 399                     	xref	_SI446x_Send_Packet
 400                     	xref	_drv_spi_init
 401                     	xref	_delay_ms
 402                     	xref	_RTC_ITConfig
 403                     	xref	_RTC_WakeUpCmd
 404                     	xref	_RTC_SetWakeUpCounter
 405                     	xref	_RTC_WakeUpClockConfig
 406                     	xref	_PWR_UltraLowPowerCmd
 407                     	xref	_PWR_FastWakeUpCmd
 408                     	xref	_GPIO_ReadInputDataBit
 409                     	xref	_GPIO_SetBits
 410                     	xref	_GPIO_Init
 411                     	xref	_CLK_GetFlagStatus
 412                     	xref	_CLK_PeripheralClockConfig
 413                     	xref	_CLK_RTCClockConfig
 414                     	xref	_CLK_SYSCLKDivConfig
 415                     	xref	_CLK_LSICmd
 434                     	xref	c_idiv
 435                     	end
