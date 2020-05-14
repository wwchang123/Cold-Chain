   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  49                     ; 34 void drv_spi_init( void )
  49                     ; 35 {
  51                     .text:	section	.text,new
  52  0000               _drv_spi_init:
  56                     ; 37 	GPIO_Init( SPI_CLK_GPIO_PORT, SPI_CLK_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast  );
  58  0000 4be0          	push	#224
  59  0002 4b20          	push	#32
  60  0004 ae5005        	ldw	x,#20485
  61  0007 cd0000        	call	_GPIO_Init
  63  000a 85            	popw	x
  64                     ; 38 	GPIO_Init( SPI_MOSI_GPIO_PORT, SPI_MOSI_GPIO_PIN, GPIO_Mode_Out_PP_High_Slow  );
  66  000b 4bd0          	push	#208
  67  000d 4b40          	push	#64
  68  000f ae5005        	ldw	x,#20485
  69  0012 cd0000        	call	_GPIO_Init
  71  0015 85            	popw	x
  72                     ; 39 	GPIO_Init( SPI_NSS_GPIO_PORT, SPI_NSS_GPIO_PIN, GPIO_Mode_Out_PP_High_Slow  );
  74  0016 4bd0          	push	#208
  75  0018 4b02          	push	#2
  76  001a ae5005        	ldw	x,#20485
  77  001d cd0000        	call	_GPIO_Init
  79  0020 85            	popw	x
  80                     ; 40 	GPIO_Init( SPI_MISO_GPIO_PORT, SPI_MISO_GPIO_PIN, GPIO_Mode_In_PU_No_IT  );
  82  0021 4b40          	push	#64
  83  0023 4b80          	push	#128
  84  0025 ae5005        	ldw	x,#20485
  85  0028 cd0000        	call	_GPIO_Init
  87  002b 85            	popw	x
  88                     ; 43 	CLK_PeripheralClockConfig( CLK_Peripheral_SPI1,ENABLE );		//开SPI时钟
  90  002c ae0001        	ldw	x,#1
  91  002f a604          	ld	a,#4
  92  0031 95            	ld	xh,a
  93  0032 cd0000        	call	_CLK_PeripheralClockConfig
  95                     ; 44 	SPI_DeInit(SPI1);		//SPI复位
  97  0035 ae5200        	ldw	x,#20992
  98  0038 cd0000        	call	_SPI_DeInit
 100                     ; 46 	SPI_Init(SPI1,SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,\
 100                     ; 47 	   SPI_CPOL_Low, SPI_CPHA_1Edge, \
 100                     ; 48 	   SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft, 0x07);
 102  003b 4b07          	push	#7
 103  003d 4b02          	push	#2
 104  003f 4b00          	push	#0
 105  0041 4b00          	push	#0
 106  0043 4b00          	push	#0
 107  0045 4b04          	push	#4
 108  0047 4b08          	push	#8
 109  0049 4b00          	push	#0
 110  004b ae5200        	ldw	x,#20992
 111  004e cd0000        	call	_SPI_Init
 113  0051 5b08          	addw	sp,#8
 114                     ; 49 	SPI_Cmd(SPI1,ENABLE );	//SPI使能
 116  0053 4b01          	push	#1
 117  0055 ae5200        	ldw	x,#20992
 118  0058 cd0000        	call	_SPI_Cmd
 120  005b 84            	pop	a
 121                     ; 50 }
 124  005c 81            	ret
 180                     ; 59 uint8_t drv_spi_read_write_byte( uint8_t TxByte )
 180                     ; 60 {
 181                     .text:	section	.text,new
 182  0000               _drv_spi_read_write_byte:
 184  0000 88            	push	a
 185  0001 5203          	subw	sp,#3
 186       00000003      OFST:	set	3
 189                     ; 61 	uint8_t l_Data = 0;
 191                     ; 62 	uint16_t l_WaitTime = 0;
 193  0003 5f            	clrw	x
 194  0004 1f02          	ldw	(OFST-1,sp),x
 196  0006 201d          	jra	L35
 197  0008               L74:
 198                     ; 66 		if( SPI_WAIT_TIMEOUT == ++l_WaitTime )
 200  0008 1e02          	ldw	x,(OFST-1,sp)
 201  000a 1c0001        	addw	x,#1
 202  000d 1f02          	ldw	(OFST-1,sp),x
 203  000f a3ffff        	cpw	x,#65535
 204  0012 2611          	jrne	L35
 205                     ; 68 			break;			//等待超时
 206  0014               L55:
 207                     ; 71 	SPI_SendData(SPI1,TxByte );	//发送数据
 209  0014 7b04          	ld	a,(OFST+1,sp)
 210  0016 88            	push	a
 211  0017 ae5200        	ldw	x,#20992
 212  001a cd0000        	call	_SPI_SendData
 214  001d 84            	pop	a
 215                     ; 72 	l_WaitTime = SPI_WAIT_TIMEOUT / 2;
 217  001e ae7fff        	ldw	x,#32767
 218  0021 1f02          	ldw	(OFST-1,sp),x
 220  0023 2028          	jra	L56
 221  0025               L35:
 222                     ; 64 	while( RESET == SPI_GetFlagStatus(SPI1,SPI_FLAG_TXE ) )		//等待发送缓冲区空
 224  0025 4b02          	push	#2
 225  0027 ae5200        	ldw	x,#20992
 226  002a cd0000        	call	_SPI_GetFlagStatus
 228  002d 5b01          	addw	sp,#1
 229  002f 4d            	tnz	a
 230  0030 27d6          	jreq	L74
 231  0032 20e0          	jra	L55
 232  0034               L16:
 233                     ; 75 		if( SPI_WAIT_TIMEOUT == ++l_WaitTime )
 235  0034 1e02          	ldw	x,(OFST-1,sp)
 236  0036 1c0001        	addw	x,#1
 237  0039 1f02          	ldw	(OFST-1,sp),x
 238  003b a3ffff        	cpw	x,#65535
 239  003e 260d          	jrne	L56
 240                     ; 77 			break;			//等待超时
 241  0040               L76:
 242                     ; 81 	l_Data = SPI_ReceiveData(SPI1);
 244  0040 ae5200        	ldw	x,#20992
 245  0043 cd0000        	call	_SPI_ReceiveData
 247  0046 6b01          	ld	(OFST-2,sp),a
 248                     ; 82 	return l_Data;	//返回数据
 250  0048 7b01          	ld	a,(OFST-2,sp)
 253  004a 5b04          	addw	sp,#4
 254  004c 81            	ret
 255  004d               L56:
 256                     ; 73 	while( RESET == SPI_GetFlagStatus(SPI1,SPI_FLAG_RXNE ) )	//等待接收缓冲区非空
 258  004d 4b01          	push	#1
 259  004f ae5200        	ldw	x,#20992
 260  0052 cd0000        	call	_SPI_GetFlagStatus
 262  0055 5b01          	addw	sp,#1
 263  0057 4d            	tnz	a
 264  0058 27da          	jreq	L16
 265  005a 20e4          	jra	L76
 323                     ; 94 void drv_spi_read_write_string( uint8_t* ReadBuffer, uint8_t* WriteBuffer, uint16_t Length )
 323                     ; 95 {
 324                     .text:	section	.text,new
 325  0000               _drv_spi_read_write_string:
 327  0000 89            	pushw	x
 328       00000000      OFST:	set	0
 331                     ; 96 	GPIO_ResetBits( SPI_NSS_GPIO_PORT, SPI_NSS_GPIO_PIN);			//片选
 333  0001 4b02          	push	#2
 334  0003 ae5005        	ldw	x,#20485
 335  0006 cd0000        	call	_GPIO_ResetBits
 337  0009 84            	pop	a
 339  000a 2017          	jra	L321
 340  000c               L121:
 341                     ; 99 		*ReadBuffer = drv_spi_read_write_byte( *WriteBuffer );		//一个字节的数据收发
 343  000c 1e05          	ldw	x,(OFST+5,sp)
 344  000e f6            	ld	a,(x)
 345  000f cd0000        	call	_drv_spi_read_write_byte
 347  0012 1e01          	ldw	x,(OFST+1,sp)
 348  0014 f7            	ld	(x),a
 349                     ; 100 		ReadBuffer++;
 351  0015 1e01          	ldw	x,(OFST+1,sp)
 352  0017 1c0001        	addw	x,#1
 353  001a 1f01          	ldw	(OFST+1,sp),x
 354                     ; 101 		WriteBuffer++;				//地址加1
 356  001c 1e05          	ldw	x,(OFST+5,sp)
 357  001e 1c0001        	addw	x,#1
 358  0021 1f05          	ldw	(OFST+5,sp),x
 359  0023               L321:
 360                     ; 97 	while( Length-- )
 362  0023 1e07          	ldw	x,(OFST+7,sp)
 363  0025 1d0001        	subw	x,#1
 364  0028 1f07          	ldw	(OFST+7,sp),x
 365  002a 1c0001        	addw	x,#1
 366  002d a30000        	cpw	x,#0
 367  0030 26da          	jrne	L121
 368                     ; 103 	GPIO_SetBits( SPI_NSS_GPIO_PORT, SPI_NSS_GPIO_PIN);				//取消片选
 370  0032 4b02          	push	#2
 371  0034 ae5005        	ldw	x,#20485
 372  0037 cd0000        	call	_GPIO_SetBits
 374  003a 84            	pop	a
 375                     ; 104 }
 378  003b 85            	popw	x
 379  003c 81            	ret
 392                     	xdef	_drv_spi_read_write_string
 393                     	xdef	_drv_spi_read_write_byte
 394                     	xdef	_drv_spi_init
 395                     	xref	_CLK_PeripheralClockConfig
 396                     	xref	_SPI_GetFlagStatus
 397                     	xref	_SPI_ReceiveData
 398                     	xref	_SPI_SendData
 399                     	xref	_SPI_Cmd
 400                     	xref	_SPI_Init
 401                     	xref	_SPI_DeInit
 402                     	xref	_GPIO_ResetBits
 403                     	xref	_GPIO_SetBits
 404                     	xref	_GPIO_Init
 423                     	end
