   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               _SendBuffer:
  18  0000 00            	dc.b	0
  19  0001 0000000000    	ds.b	5
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
 303  003f 358b0002      	mov	_SendBuffer+2,#139
 304                     ; 72 		SendBuffer[3]=(Num_Ser%256);
 306  0043 35b70003      	mov	_SendBuffer+3,#183
 307                     ; 73 		SI446x_Send_Packet(SendBuffer, 6, 0, 3);
 309  0047 4b03          	push	#3
 310  0049 4b00          	push	#0
 311  004b 4b06          	push	#6
 312  004d ae0000        	ldw	x,#_SendBuffer
 313  0050 cd0000        	call	_SI446x_Send_Packet
 315  0053 5b03          	addw	sp,#3
 316                     ; 74 		CLR_DIR_1WIRE;
 318  0055 4b00          	push	#0
 319  0057 4b08          	push	#8
 320  0059 ae5000        	ldw	x,#20480
 321  005c cd0000        	call	_GPIO_Init
 323  005f 85            	popw	x
 326  0060               L75:
 327                     ; 75 		while(IRQ_READ()==0x01);
 329  0060 4b01          	push	#1
 330  0062 ae500a        	ldw	x,#20490
 331  0065 cd0000        	call	_GPIO_ReadInputDataBit
 333  0068 5b01          	addw	sp,#1
 334  006a a101          	cp	a,#1
 335  006c 27f2          	jreq	L75
 336                     ; 76 		GPIO_SetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	
 338  006e 4b10          	push	#16
 339  0070 ae5005        	ldw	x,#20485
 340  0073 cd0000        	call	_GPIO_SetBits
 342  0076 84            	pop	a
 343                     ; 77 		halt();	
 346  0077 8e            halt
 350  0078 20ae          	jra	L74
 375                     	xdef	_main
 376                     	xdef	_Low_IOinit
 377                     	xdef	_RTC_Config
 378                     	xdef	_SendBuffer
 379                     	xref	_gettemp
 380                     	xref	_init_1820
 381                     	xref	_SI446x_Init
 382                     	xref	_SI446x_Send_Packet
 383                     	xref	_drv_spi_init
 384                     	xref	_delay_ms
 385                     	xref	_RTC_ITConfig
 386                     	xref	_RTC_WakeUpCmd
 387                     	xref	_RTC_SetWakeUpCounter
 388                     	xref	_RTC_WakeUpClockConfig
 389                     	xref	_PWR_UltraLowPowerCmd
 390                     	xref	_PWR_FastWakeUpCmd
 391                     	xref	_GPIO_ReadInputDataBit
 392                     	xref	_GPIO_SetBits
 393                     	xref	_GPIO_Init
 394                     	xref	_CLK_GetFlagStatus
 395                     	xref	_CLK_PeripheralClockConfig
 396                     	xref	_CLK_RTCClockConfig
 397                     	xref	_CLK_SYSCLKDivConfig
 398                     	xref	_CLK_LSICmd
 417                     	end
