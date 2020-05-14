   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               _g_SI4463ItStatus:
  18  0000 00            	dc.b	0
  19  0001 000000000000  	ds.b	8
  20  0009               _SendBuffer:
  21  0009 00            	dc.b	0
  22  000a 000000000000  	ds.b	6
  60                     ; 15 void RTC_Config(void)
  60                     ; 16 {
  62                     .text:	section	.text,new
  63  0000               _RTC_Config:
  67                     ; 18 		CLK_LSICmd(ENABLE);//使能LSI
  69  0000 a601          	ld	a,#1
  70  0002 cd0000        	call	_CLK_LSICmd
  72                     ; 19 		CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);//RTC时钟门控使能
  74  0005 ae0001        	ldw	x,#1
  75  0008 a612          	ld	a,#18
  76  000a 95            	ld	xh,a
  77  000b cd0000        	call	_CLK_PeripheralClockConfig
  79                     ; 20 		CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_32);//RTC时钟源LSI，32分频=1.1875K
  81  000e ae00a0        	ldw	x,#160
  82  0011 a604          	ld	a,#4
  83  0013 95            	ld	xh,a
  84  0014 cd0000        	call	_CLK_RTCClockConfig
  87  0017               L32:
  88                     ; 21 		while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET);//等待LSI就绪
  90  0017 a613          	ld	a,#19
  91  0019 cd0000        	call	_CLK_GetFlagStatus
  93  001c 4d            	tnz	a
  94  001d 27f8          	jreq	L32
  95                     ; 23 		RTC_WakeUpCmd(DISABLE);
  97  001f 4f            	clr	a
  98  0020 cd0000        	call	_RTC_WakeUpCmd
 100                     ; 25 		RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);//38K/16=0.0742k=13.477ms
 102  0023 4f            	clr	a
 103  0024 cd0000        	call	_RTC_WakeUpClockConfig
 105                     ; 26 		RTC_ITConfig(RTC_IT_WUT, ENABLE);//开启中断
 107  0027 4b01          	push	#1
 108  0029 ae0040        	ldw	x,#64
 109  002c cd0000        	call	_RTC_ITConfig
 111  002f 84            	pop	a
 112                     ; 27 		RTC_SetWakeUpCounter(22260);//22260*13.477 ms=300S左右  13385*13.477 ms=180S左右
 114  0030 ae56f4        	ldw	x,#22260
 115  0033 cd0000        	call	_RTC_SetWakeUpCounter
 117                     ; 28 		enableInterrupts();
 120  0036 9a            rim
 122                     ; 29 }
 126  0037 81            	ret
 150                     ; 31 void Low_IOinit(void)
 150                     ; 32 {
 151                     .text:	section	.text,new
 152  0000               _Low_IOinit:
 156                     ; 33 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 158  0000 4bc0          	push	#192
 159  0002 4bff          	push	#255
 160  0004 ae5000        	ldw	x,#20480
 161  0007 cd0000        	call	_GPIO_Init
 163  000a 85            	popw	x
 164                     ; 34 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 166  000b 4bc0          	push	#192
 167  000d 4bff          	push	#255
 168  000f ae5005        	ldw	x,#20485
 169  0012 cd0000        	call	_GPIO_Init
 171  0015 85            	popw	x
 172                     ; 35 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);
 174  0016 4bc0          	push	#192
 175  0018 4bff          	push	#255
 176  001a ae500a        	ldw	x,#20490
 177  001d cd0000        	call	_GPIO_Init
 179  0020 85            	popw	x
 180                     ; 36 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_Out_PP_Low_Slow);	
 182  0021 4bc0          	push	#192
 183  0023 4bff          	push	#255
 184  0025 ae500f        	ldw	x,#20495
 185  0028 cd0000        	call	_GPIO_Init
 187  002b 85            	popw	x
 188                     ; 37 }
 191  002c 81            	ret
 245                     .const:	section	.text
 246  0000               L41:
 247  0000 0000ea60      	dc.l	60000
 248                     ; 44 void main(void)
 248                     ; 45 {
 249                     .text:	section	.text,new
 250  0000               _main:
 252  0000 89            	pushw	x
 253       00000002      OFST:	set	2
 256                     ; 46 	u16 i=0;
 258                     ; 47 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 260  0001 4f            	clr	a
 261  0002 cd0000        	call	_CLK_SYSCLKDivConfig
 263                     ; 48 	delay_ms(2);
 265  0005 ae0002        	ldw	x,#2
 266  0008 cd0000        	call	_delay_ms
 268                     ; 50 	PWR_FastWakeUpCmd(ENABLE);  //快速唤醒使能
 270  000b a601          	ld	a,#1
 271  000d cd0000        	call	_PWR_FastWakeUpCmd
 273                     ; 52 	RTC_Config();
 275  0010 cd0000        	call	_RTC_Config
 277                     ; 54 	Low_IOinit();
 279  0013 cd0000        	call	_Low_IOinit
 281                     ; 55 	PWR_UltraLowPowerCmd(ENABLE);//超低功耗
 283  0016 a601          	ld	a,#1
 284  0018 cd0000        	call	_PWR_UltraLowPowerCmd
 286                     ; 56 	RTC_ITConfig(RTC_IT_WUT, ENABLE);//唤醒定时器中断使能
 288  001b 4b01          	push	#1
 289  001d ae0040        	ldw	x,#64
 290  0020 cd0000        	call	_RTC_ITConfig
 292  0023 84            	pop	a
 293                     ; 57 	RTC_WakeUpCmd(ENABLE);//RTC唤醒使能
 295  0024 a601          	ld	a,#1
 296  0026 cd0000        	call	_RTC_WakeUpCmd
 298  0029               L55:
 299                     ; 60 		i=0;
 301  0029 5f            	clrw	x
 302  002a 1f01          	ldw	(OFST-1,sp),x
 303                     ; 62 		drv_spi_init( );
 305  002c cd0000        	call	_drv_spi_init
 307                     ; 64 		SI446x_Init( );
 309  002f cd0000        	call	_SI446x_Init
 311                     ; 65 		if(init_1820())
 313  0032 cd0000        	call	_init_1820
 315  0035 4d            	tnz	a
 316  0036 2703          	jreq	L16
 317                     ; 67 				gettemp();
 319  0038 cd0000        	call	_gettemp
 321  003b               L16:
 322                     ; 69 		SendBuffer[0]=0xEB; // 包头
 324  003b 35eb0009      	mov	_SendBuffer,#235
 325                     ; 70 		SendBuffer[1]=(Num_Ser/256/256);
 327  003f 3501000a      	mov	_SendBuffer+1,#1
 328                     ; 71 		SendBuffer[2]=(Num_Ser/256%256);
 330  0043 358b000b      	mov	_SendBuffer+2,#139
 331                     ; 72 		SendBuffer[3]=(Num_Ser%256);
 333  0047 3585000c      	mov	_SendBuffer+3,#133
 334                     ; 73 		SendBuffer[6]= (SendBuffer[1]+SendBuffer[2]+SendBuffer[3]+SendBuffer[4]+SendBuffer[5])%256;
 336  004b b60d          	ld	a,_SendBuffer+4
 337  004d 5f            	clrw	x
 338  004e bb0e          	add	a,_SendBuffer+5
 339  0050 2401          	jrnc	L21
 340  0052 5c            	incw	x
 341  0053               L21:
 342  0053 02            	rlwa	x,a
 343  0054 1c0111        	addw	x,#273
 344  0057 90ae0100      	ldw	y,#256
 345  005b cd0000        	call	c_idiv
 347  005e 51            	exgw	x,y
 348  005f 01            	rrwa	x,a
 349  0060 b70f          	ld	_SendBuffer+6,a
 350  0062 02            	rlwa	x,a
 351                     ; 74 		SI446x_Send_Packet(SendBuffer, 7, 0, 3);
 353  0063 4b03          	push	#3
 354  0065 4b00          	push	#0
 355  0067 4b07          	push	#7
 356  0069 ae0009        	ldw	x,#_SendBuffer
 357  006c cd0000        	call	_SI446x_Send_Packet
 359  006f 5b03          	addw	sp,#3
 360                     ; 75 		CLR_DIR_1WIRE;
 362  0071 4b00          	push	#0
 363  0073 4b08          	push	#8
 364  0075 ae5000        	ldw	x,#20480
 365  0078 cd0000        	call	_GPIO_Init
 367  007b 85            	popw	x
 370  007c 2027          	jra	L56
 371  007e               L36:
 372                     ; 78 			i++;
 374  007e 1e01          	ldw	x,(OFST-1,sp)
 375  0080 1c0001        	addw	x,#1
 376  0083 1f01          	ldw	(OFST-1,sp),x
 377                     ; 79 			if(i >= 60000)
 379  0085 9c            	rvf
 380  0086 1e01          	ldw	x,(OFST-1,sp)
 381  0088 cd0000        	call	c_uitolx
 383  008b ae0000        	ldw	x,#L41
 384  008e cd0000        	call	c_lcmp
 386  0091 2f12          	jrslt	L56
 387                     ; 80 				break;
 388  0093               L76:
 389                     ; 82 		SI446x_Interrupt_Status( g_SI4463ItStatus );		//查询中断状态,标志位清0
 391  0093 ae0000        	ldw	x,#_g_SI4463ItStatus
 392  0096 cd0000        	call	_SI446x_Interrupt_Status
 394                     ; 83 		GPIO_SetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	
 396  0099 4b10          	push	#16
 397  009b ae5005        	ldw	x,#20485
 398  009e cd0000        	call	_GPIO_SetBits
 400  00a1 84            	pop	a
 401                     ; 84 		halt();	
 404  00a2 8e            halt
 408  00a3 2084          	jra	L55
 409  00a5               L56:
 410                     ; 76 		while(IRQ_READ()==0x01)
 412  00a5 4b01          	push	#1
 413  00a7 ae500a        	ldw	x,#20490
 414  00aa cd0000        	call	_GPIO_ReadInputDataBit
 416  00ad 5b01          	addw	sp,#1
 417  00af a101          	cp	a,#1
 418  00b1 27cb          	jreq	L36
 419  00b3 20de          	jra	L76
 454                     	xdef	_main
 455                     	xdef	_Low_IOinit
 456                     	xdef	_RTC_Config
 457                     	xdef	_SendBuffer
 458                     	xdef	_g_SI4463ItStatus
 459                     	xref	_gettemp
 460                     	xref	_init_1820
 461                     	xref	_SI446x_Init
 462                     	xref	_SI446x_Send_Packet
 463                     	xref	_SI446x_Interrupt_Status
 464                     	xref	_drv_spi_init
 465                     	xref	_delay_ms
 466                     	xref	_RTC_ITConfig
 467                     	xref	_RTC_WakeUpCmd
 468                     	xref	_RTC_SetWakeUpCounter
 469                     	xref	_RTC_WakeUpClockConfig
 470                     	xref	_PWR_UltraLowPowerCmd
 471                     	xref	_PWR_FastWakeUpCmd
 472                     	xref	_GPIO_ReadInputDataBit
 473                     	xref	_GPIO_SetBits
 474                     	xref	_GPIO_Init
 475                     	xref	_CLK_GetFlagStatus
 476                     	xref	_CLK_PeripheralClockConfig
 477                     	xref	_CLK_RTCClockConfig
 478                     	xref	_CLK_SYSCLKDivConfig
 479                     	xref	_CLK_LSICmd
 498                     	xref	c_lcmp
 499                     	xref	c_uitolx
 500                     	xref	c_idiv
 501                     	end
