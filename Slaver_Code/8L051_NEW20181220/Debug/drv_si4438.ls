   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     .const:	section	.text
  17  0000               L3_config_table:
  18  0000 07            	dc.b	7
  19  0001 02            	dc.b	2
  20  0002 01            	dc.b	1
  21  0003 00            	dc.b	0
  22  0004 01            	dc.b	1
  23  0005 8c            	dc.b	140
  24  0006 ba            	dc.b	186
  25  0007 80            	dc.b	128
  26  0008 08            	dc.b	8
  27  0009 13            	dc.b	19
  28  000a 00            	dc.b	0
  29  000b 00            	dc.b	0
  30  000c 00            	dc.b	0
  31  000d 00            	dc.b	0
  32  000e 00            	dc.b	0
  33  000f 00            	dc.b	0
  34  0010 00            	dc.b	0
  35  0011 06            	dc.b	6
  36  0012 11            	dc.b	17
  37  0013 00            	dc.b	0
  38  0014 02            	dc.b	2
  39  0015 00            	dc.b	0
  40  0016 52            	dc.b	82
  41  0017 00            	dc.b	0
  42  0018 05            	dc.b	5
  43  0019 11            	dc.b	17
  44  001a 00            	dc.b	0
  45  001b 01            	dc.b	1
  46  001c 03            	dc.b	3
  47  001d 60            	dc.b	96
  48  001e 08            	dc.b	8
  49  001f 11            	dc.b	17
  50  0020 01            	dc.b	1
  51  0021 04            	dc.b	4
  52  0022 00            	dc.b	0
  53  0023 07            	dc.b	7
  54  0024 38            	dc.b	56
  55  0025 00            	dc.b	0
  56  0026 00            	dc.b	0
  57  0027 08            	dc.b	8
  58  0028 11            	dc.b	17
  59  0029 02            	dc.b	2
  60  002a 04            	dc.b	4
  61  002b 00            	dc.b	0
  62  002c 00            	dc.b	0
  63  002d 00            	dc.b	0
  64  002e 00            	dc.b	0
  65  002f 00            	dc.b	0
  66  0030 0d            	dc.b	13
  67  0031 11            	dc.b	17
  68  0032 10            	dc.b	16
  69  0033 09            	dc.b	9
  70  0034 00            	dc.b	0
  71  0035 08            	dc.b	8
  72  0036 14            	dc.b	20
  73  0037 00            	dc.b	0
  74  0038 0f            	dc.b	15
  75  0039 31            	dc.b	49
  76  003a 00            	dc.b	0
  77  003b 00            	dc.b	0
  78  003c 00            	dc.b	0
  79  003d 00            	dc.b	0
  80  003e 09            	dc.b	9
  81  003f 11            	dc.b	17
  82  0040 11            	dc.b	17
  83  0041 05            	dc.b	5
  84  0042 00            	dc.b	0
  85  0043 01            	dc.b	1
  86  0044 b4            	dc.b	180
  87  0045 2b            	dc.b	43
  88  0046 00            	dc.b	0
  89  0047 00            	dc.b	0
  90  0048 0b            	dc.b	11
  91  0049 11            	dc.b	17
  92  004a 12            	dc.b	18
  93  004b 07            	dc.b	7
  94  004c 00            	dc.b	0
  95  004d 84            	dc.b	132
  96  004e 01            	dc.b	1
  97  004f 08            	dc.b	8
  98  0050 ff            	dc.b	255
  99  0051 ff            	dc.b	255
 100  0052 00            	dc.b	0
 101  0053 02            	dc.b	2
 102  0054 10            	dc.b	16
 103  0055 11            	dc.b	17
 104  0056 12            	dc.b	18
 105  0057 0c            	dc.b	12
 106  0058 08            	dc.b	8
 107  0059 2a            	dc.b	42
 108  005a 01            	dc.b	1
 109  005b 02            	dc.b	2
 110  005c 30            	dc.b	48
 111  005d 30            	dc.b	48
 112  005e 00            	dc.b	0
 113  005f 01            	dc.b	1
 114  0060 04            	dc.b	4
 115  0061 80            	dc.b	128
 116  0062 00            	dc.b	0
 117  0063 07            	dc.b	7
 118  0064 00            	dc.b	0
 119  0065 10            	dc.b	16
 120  0066 11            	dc.b	17
 121  0067 12            	dc.b	18
 122  0068 0c            	dc.b	12
 123  0069 14            	dc.b	20
 124  006a 00            	dc.b	0
 125  006b 00            	dc.b	0
 126  006c 00            	dc.b	0
 127  006d 00            	dc.b	0
 128  006e 00            	dc.b	0
 129  006f 00            	dc.b	0
 130  0070 00            	dc.b	0
 131  0071 00            	dc.b	0
 132  0072 00            	dc.b	0
 133  0073 00            	dc.b	0
 134  0074 00            	dc.b	0
 135  0075 00            	dc.b	0
 136  0076 10            	dc.b	16
 137  0077 11            	dc.b	17
 138  0078 12            	dc.b	18
 139  0079 0c            	dc.b	12
 140  007a 20            	dc.b	32
 141  007b 00            	dc.b	0
 142  007c 00            	dc.b	0
 143  007d 00            	dc.b	0
 144  007e 00            	dc.b	0
 145  007f 00            	dc.b	0
 146  0080 00            	dc.b	0
 147  0081 00            	dc.b	0
 148  0082 00            	dc.b	0
 149  0083 00            	dc.b	0
 150  0084 00            	dc.b	0
 151  0085 00            	dc.b	0
 152  0086 00            	dc.b	0
 153  0087 0d            	dc.b	13
 154  0088 11            	dc.b	17
 155  0089 12            	dc.b	18
 156  008a 09            	dc.b	9
 157  008b 2c            	dc.b	44
 158  008c 00            	dc.b	0
 159  008d 00            	dc.b	0
 160  008e 00            	dc.b	0
 161  008f 00            	dc.b	0
 162  0090 00            	dc.b	0
 163  0091 00            	dc.b	0
 164  0092 00            	dc.b	0
 165  0093 00            	dc.b	0
 166  0094 00            	dc.b	0
 167  0095 10            	dc.b	16
 168  0096 11            	dc.b	17
 169  0097 20            	dc.b	32
 170  0098 0c            	dc.b	12
 171  0099 00            	dc.b	0
 172  009a 03            	dc.b	3
 173  009b 00            	dc.b	0
 174  009c 07            	dc.b	7
 175  009d 03            	dc.b	3
 176  009e 0d            	dc.b	13
 177  009f 40            	dc.b	64
 178  00a0 05            	dc.b	5
 179  00a1 8c            	dc.b	140
 180  00a2 ba            	dc.b	186
 181  00a3 80            	dc.b	128
 182  00a4 00            	dc.b	0
 183  00a5 09            	dc.b	9
 184  00a6 05            	dc.b	5
 185  00a7 11            	dc.b	17
 186  00a8 20            	dc.b	32
 187  00a9 01            	dc.b	1
 188  00aa 0c            	dc.b	12
 189  00ab 74            	dc.b	116
 190  00ac 0c            	dc.b	12
 191  00ad 11            	dc.b	17
 192  00ae 20            	dc.b	32
 193  00af 08            	dc.b	8
 194  00b0 18            	dc.b	24
 195  00b1 01            	dc.b	1
 196  00b2 80            	dc.b	128
 197  00b3 08            	dc.b	8
 198  00b4 03            	dc.b	3
 199  00b5 80            	dc.b	128
 200  00b6 00            	dc.b	0
 201  00b7 20            	dc.b	32
 202  00b8 20            	dc.b	32
 203  00b9 0d            	dc.b	13
 204  00ba 11            	dc.b	17
 205  00bb 20            	dc.b	32
 206  00bc 09            	dc.b	9
 207  00bd 22            	dc.b	34
 208  00be 02            	dc.b	2
 209  00bf 8a            	dc.b	138
 210  00c0 00            	dc.b	0
 211  00c1 c9            	dc.b	201
 212  00c2 a6            	dc.b	166
 213  00c3 00            	dc.b	0
 214  00c4 65            	dc.b	101
 215  00c5 02            	dc.b	2
 216  00c6 c2            	dc.b	194
 217  00c7 0b            	dc.b	11
 218  00c8 11            	dc.b	17
 219  00c9 20            	dc.b	32
 220  00ca 07            	dc.b	7
 221  00cb 2c            	dc.b	44
 222  00cc 04            	dc.b	4
 223  00cd 36            	dc.b	54
 224  00ce 80            	dc.b	128
 225  00cf 11            	dc.b	17
 226  00d0 1e            	dc.b	30
 227  00d1 a1            	dc.b	161
 228  00d2 80            	dc.b	128
 229  00d3 05            	dc.b	5
 230  00d4 11            	dc.b	17
 231  00d5 20            	dc.b	32
 232  00d6 01            	dc.b	1
 233  00d7 35            	dc.b	53
 234  00d8 e2            	dc.b	226
 235  00d9 07            	dc.b	7
 236  00da 11            	dc.b	17
 237  00db 20            	dc.b	32
 238  00dc 03            	dc.b	3
 239  00dd 38            	dc.b	56
 240  00de 11            	dc.b	17
 241  00df 8e            	dc.b	142
 242  00e0 8e            	dc.b	142
 243  00e1 05            	dc.b	5
 244  00e2 11            	dc.b	17
 245  00e3 20            	dc.b	32
 246  00e4 01            	dc.b	1
 247  00e5 40            	dc.b	64
 248  00e6 2b            	dc.b	43
 249  00e7 0d            	dc.b	13
 250  00e8 11            	dc.b	17
 251  00e9 20            	dc.b	32
 252  00ea 09            	dc.b	9
 253  00eb 42            	dc.b	66
 254  00ec a4            	dc.b	164
 255  00ed 02            	dc.b	2
 256  00ee d6            	dc.b	214
 257  00ef 83            	dc.b	131
 258  00f0 01            	dc.b	1
 259  00f1 62            	dc.b	98
 260  00f2 01            	dc.b	1
 261  00f3 80            	dc.b	128
 262  00f4 ff            	dc.b	255
 263  00f5 05            	dc.b	5
 264  00f6 11            	dc.b	17
 265  00f7 20            	dc.b	32
 266  00f8 01            	dc.b	1
 267  00f9 4c            	dc.b	76
 268  00fa 00            	dc.b	0
 269  00fb 05            	dc.b	5
 270  00fc 11            	dc.b	17
 271  00fd 20            	dc.b	32
 272  00fe 01            	dc.b	1
 273  00ff 4e            	dc.b	78
 274  0100 40            	dc.b	64
 275  0101 05            	dc.b	5
 276  0102 11            	dc.b	17
 277  0103 20            	dc.b	32
 278  0104 01            	dc.b	1
 279  0105 51            	dc.b	81
 280  0106 0a            	dc.b	10
 281  0107 10            	dc.b	16
 282  0108 11            	dc.b	17
 283  0109 21            	dc.b	33
 284  010a 0c            	dc.b	12
 285  010b 00            	dc.b	0
 286  010c cc            	dc.b	204
 287  010d a1            	dc.b	161
 288  010e 30            	dc.b	48
 289  010f a0            	dc.b	160
 290  0110 21            	dc.b	33
 291  0111 d1            	dc.b	209
 292  0112 b9            	dc.b	185
 293  0113 c9            	dc.b	201
 294  0114 ea            	dc.b	234
 295  0115 05            	dc.b	5
 296  0116 12            	dc.b	18
 297  0117 11            	dc.b	17
 298  0118 10            	dc.b	16
 299  0119 11            	dc.b	17
 300  011a 21            	dc.b	33
 301  011b 0c            	dc.b	12
 302  011c 0c            	dc.b	12
 303  011d 0a            	dc.b	10
 304  011e 04            	dc.b	4
 305  011f 15            	dc.b	21
 306  0120 fc            	dc.b	252
 307  0121 03            	dc.b	3
 308  0122 00            	dc.b	0
 309  0123 cc            	dc.b	204
 310  0124 a1            	dc.b	161
 311  0125 30            	dc.b	48
 312  0126 a0            	dc.b	160
 313  0127 21            	dc.b	33
 314  0128 d1            	dc.b	209
 315  0129 10            	dc.b	16
 316  012a 11            	dc.b	17
 317  012b 21            	dc.b	33
 318  012c 0c            	dc.b	12
 319  012d 18            	dc.b	24
 320  012e b9            	dc.b	185
 321  012f c9            	dc.b	201
 322  0130 ea            	dc.b	234
 323  0131 05            	dc.b	5
 324  0132 12            	dc.b	18
 325  0133 11            	dc.b	17
 326  0134 0a            	dc.b	10
 327  0135 04            	dc.b	4
 328  0136 15            	dc.b	21
 329  0137 fc            	dc.b	252
 330  0138 03            	dc.b	3
 331  0139 00            	dc.b	0
 332  013a 08            	dc.b	8
 333  013b 11            	dc.b	17
 334  013c 22            	dc.b	34
 335  013d 04            	dc.b	4
 336  013e 00            	dc.b	0
 337  013f 08            	dc.b	8
 338  0140 7f            	dc.b	127
 339  0141 00            	dc.b	0
 340  0142 3d            	dc.b	61
 341  0143 0b            	dc.b	11
 342  0144 11            	dc.b	17
 343  0145 23            	dc.b	35
 344  0146 07            	dc.b	7
 345  0147 00            	dc.b	0
 346  0148 2c            	dc.b	44
 347  0149 0e            	dc.b	14
 348  014a 0b            	dc.b	11
 349  014b 04            	dc.b	4
 350  014c 0c            	dc.b	12
 351  014d 73            	dc.b	115
 352  014e 03            	dc.b	3
 353  014f 10            	dc.b	16
 354  0150 11            	dc.b	17
 355  0151 30            	dc.b	48
 356  0152 0c            	dc.b	12
 357  0153 00            	dc.b	0
 358  0154 00            	dc.b	0
 359  0155 00            	dc.b	0
 360  0156 00            	dc.b	0
 361  0157 00            	dc.b	0
 362  0158 00            	dc.b	0
 363  0159 00            	dc.b	0
 364  015a 00            	dc.b	0
 365  015b 00            	dc.b	0
 366  015c 00            	dc.b	0
 367  015d 00            	dc.b	0
 368  015e 00            	dc.b	0
 369  015f 00            	dc.b	0
 370  0160 0c            	dc.b	12
 371  0161 11            	dc.b	17
 372  0162 40            	dc.b	64
 373  0163 08            	dc.b	8
 374  0164 00            	dc.b	0
 375  0165 41            	dc.b	65
 376  0166 0c            	dc.b	12
 377  0167 ec            	dc.b	236
 378  0168 4e            	dc.b	78
 379  0169 4e            	dc.b	78
 380  016a c5            	dc.b	197
 381  016b 20            	dc.b	32
 382  016c fe            	dc.b	254
 383  016d 00            	dc.b	0
 436                     ; 30 void SI446x_Wait_Cts( void )
 436                     ; 31 {
 438                     .text:	section	.text,new
 439  0000               _SI446x_Wait_Cts:
 441  0000 5203          	subw	sp,#3
 442       00000003      OFST:	set	3
 445                     ; 33 	uint16_t l_ReadCtsTimes = 0;
 447  0002 5f            	clrw	x
 448  0003 1f01          	ldw	(OFST-2,sp),x
 449  0005               L53:
 450                     ; 37         SI_SET_CSN_LOW( );		//SPI片选
 452  0005 4b02          	push	#2
 453  0007 ae5005        	ldw	x,#20485
 454  000a cd0000        	call	_GPIO_ResetBits
 456  000d 84            	pop	a
 457                     ; 40         drv_spi_read_write_byte( READ_CMD_BUFF );
 459  000e a644          	ld	a,#68
 460  0010 cd0000        	call	_drv_spi_read_write_byte
 462                     ; 41         l_Cts = drv_spi_read_write_byte( 0xFF );		
 464  0013 a6ff          	ld	a,#255
 465  0015 cd0000        	call	_drv_spi_read_write_byte
 467  0018 6b03          	ld	(OFST+0,sp),a
 468                     ; 43         SI_SET_CSN_HIGH( );		//取消SPI片选
 470  001a 4b02          	push	#2
 471  001c ae5005        	ldw	x,#20485
 472  001f cd0000        	call	_GPIO_SetBits
 474  0022 84            	pop	a
 475                     ; 45 		if( 1000 == l_ReadCtsTimes++ )
 477  0023 1e01          	ldw	x,(OFST-2,sp)
 478  0025 1c0001        	addw	x,#1
 479  0028 1f01          	ldw	(OFST-2,sp),x
 480  002a 1d0001        	subw	x,#1
 481  002d a303e8        	cpw	x,#1000
 482  0030 2605          	jrne	L73
 483                     ; 47 			SI446x_Init( );
 485  0032 cd0000        	call	_SI446x_Init
 487                     ; 48 			break;
 489  0035 2006          	jra	L14
 490  0037               L73:
 491                     ; 51 	}while( l_Cts != 0xFF );	//直到读CTS的返回值等于0xFF
 493  0037 7b03          	ld	a,(OFST+0,sp)
 494  0039 a1ff          	cp	a,#255
 495  003b 26c8          	jrne	L53
 496  003d               L14:
 497                     ; 52 }
 500  003d 5b03          	addw	sp,#3
 501  003f 81            	ret
 549                     ; 62 void SI446x_Write_Cmds( uint8_t *pCmd, uint8_t CmdNumber )
 549                     ; 63 {
 550                     .text:	section	.text,new
 551  0000               _SI446x_Write_Cmds:
 553  0000 89            	pushw	x
 554       00000000      OFST:	set	0
 557                     ; 64     SI446x_Wait_Cts( );			//查询CTS状态
 559  0001 cd0000        	call	_SI446x_Wait_Cts
 561                     ; 66     SI_SET_CSN_LOW( );			//SPI片选
 563  0004 4b02          	push	#2
 564  0006 ae5005        	ldw	x,#20485
 565  0009 cd0000        	call	_GPIO_ResetBits
 567  000c 84            	pop	a
 569  000d 200d          	jra	L17
 570  000f               L76:
 571                     ; 70         drv_spi_read_write_byte( *pCmd );	//发送命令
 573  000f 1e01          	ldw	x,(OFST+1,sp)
 574  0011 f6            	ld	a,(x)
 575  0012 cd0000        	call	_drv_spi_read_write_byte
 577                     ; 71 		pCmd++;
 579  0015 1e01          	ldw	x,(OFST+1,sp)
 580  0017 1c0001        	addw	x,#1
 581  001a 1f01          	ldw	(OFST+1,sp),x
 582  001c               L17:
 583                     ; 68     while( CmdNumber -- )
 585  001c 7b05          	ld	a,(OFST+5,sp)
 586  001e 0a05          	dec	(OFST+5,sp)
 587  0020 4d            	tnz	a
 588  0021 26ec          	jrne	L76
 589                     ; 74     SI_SET_CSN_HIGH( );			//取消SPI片选
 591  0023 4b02          	push	#2
 592  0025 ae5005        	ldw	x,#20485
 593  0028 cd0000        	call	_GPIO_SetBits
 595  002b 84            	pop	a
 596                     ; 75 }
 599  002c 85            	popw	x
 600  002d 81            	ret
 603                     	switch	.const
 604  016e               L57_l_Cmd:
 605  016e 00            	dc.b	0
 606  016f 000000000000  	ds.b	6
 649                     ; 84 void SI446x_Power_Up( uint32_t Xo_Freq )
 649                     ; 85 {
 650                     .text:	section	.text,new
 651  0000               _SI446x_Power_Up:
 653  0000 5207          	subw	sp,#7
 654       00000007      OFST:	set	7
 657                     ; 86     uint8_t l_Cmd[7] = { 0 };
 659  0002 96            	ldw	x,sp
 660  0003 1c0001        	addw	x,#OFST-6
 661  0006 90ae016e      	ldw	y,#L57_l_Cmd
 662  000a a607          	ld	a,#7
 663  000c cd0000        	call	c_xymvx
 665                     ; 88     l_Cmd[0] = POWER_UP;		//Power_Up命令
 667  000f a602          	ld	a,#2
 668  0011 6b01          	ld	(OFST-6,sp),a
 669                     ; 89     l_Cmd[1] = 0x01;
 671  0013 a601          	ld	a,#1
 672  0015 6b02          	ld	(OFST-5,sp),a
 673                     ; 90     l_Cmd[2] = 0x00;
 675  0017 0f03          	clr	(OFST-4,sp)
 676                     ; 91     l_Cmd[3] = Xo_Freq >> 24;
 678  0019 7b0a          	ld	a,(OFST+3,sp)
 679  001b 6b04          	ld	(OFST-3,sp),a
 680                     ; 92     l_Cmd[4] = Xo_Freq >> 16;
 682  001d 7b0b          	ld	a,(OFST+4,sp)
 683  001f 6b05          	ld	(OFST-2,sp),a
 684                     ; 93     l_Cmd[5] = Xo_Freq >> 8;
 686  0021 7b0c          	ld	a,(OFST+5,sp)
 687  0023 6b06          	ld	(OFST-1,sp),a
 688                     ; 94     l_Cmd[6] = Xo_Freq;
 690  0025 7b0d          	ld	a,(OFST+6,sp)
 691  0027 6b07          	ld	(OFST+0,sp),a
 692                     ; 95     SI446x_Write_Cmds( l_Cmd, 7 );	//写命令
 694  0029 4b07          	push	#7
 695  002b 96            	ldw	x,sp
 696  002c 1c0002        	addw	x,#OFST-5
 697  002f cd0000        	call	_SI446x_Write_Cmds
 699  0032 84            	pop	a
 700                     ; 96 }
 703  0033 5b07          	addw	sp,#7
 704  0035 81            	ret
 753                     ; 106 void SI446x_Read_Response( uint8_t *pRead, uint8_t Length )
 753                     ; 107 {
 754                     .text:	section	.text,new
 755  0000               _SI446x_Read_Response:
 757  0000 89            	pushw	x
 758       00000000      OFST:	set	0
 761                     ; 108     SI446x_Wait_Cts( );		//查询CTS状态
 763  0001 cd0000        	call	_SI446x_Wait_Cts
 765                     ; 109     SI_SET_CSN_LOW( );		//SPI片选
 767  0004 4b02          	push	#2
 768  0006 ae5005        	ldw	x,#20485
 769  0009 cd0000        	call	_GPIO_ResetBits
 771  000c 84            	pop	a
 772                     ; 111 	drv_spi_read_write_byte( READ_CMD_BUFF );	//发送读命令
 774  000d a644          	ld	a,#68
 775  000f cd0000        	call	_drv_spi_read_write_byte
 778  0012 200f          	jra	L541
 779  0014               L341:
 780                     ; 114         *pRead = drv_spi_read_write_byte( 0xFF );	//交换数据
 782  0014 a6ff          	ld	a,#255
 783  0016 cd0000        	call	_drv_spi_read_write_byte
 785  0019 1e01          	ldw	x,(OFST+1,sp)
 786  001b f7            	ld	(x),a
 787                     ; 115 		pRead++;
 789  001c 1e01          	ldw	x,(OFST+1,sp)
 790  001e 1c0001        	addw	x,#1
 791  0021 1f01          	ldw	(OFST+1,sp),x
 792  0023               L541:
 793                     ; 112 	while( Length-- )
 795  0023 7b05          	ld	a,(OFST+5,sp)
 796  0025 0a05          	dec	(OFST+5,sp)
 797  0027 4d            	tnz	a
 798  0028 26ea          	jrne	L341
 799                     ; 118     SI_SET_CSN_HIGH( );		//SPI取消片选
 801  002a 4b02          	push	#2
 802  002c ae5005        	ldw	x,#20485
 803  002f cd0000        	call	_GPIO_SetBits
 805  0032 84            	pop	a
 806                     ; 120 }
 809  0033 85            	popw	x
 810  0034 81            	ret
 847                     ; 128 uint8_t SI446x_Nop( void )
 847                     ; 129 {
 848                     .text:	section	.text,new
 849  0000               _SI446x_Nop:
 851  0000 88            	push	a
 852       00000001      OFST:	set	1
 855                     ; 132     SI_SET_CSN_LOW( );		//SPI片选
 857  0001 4b02          	push	#2
 858  0003 ae5005        	ldw	x,#20485
 859  0006 cd0000        	call	_GPIO_ResetBits
 861  0009 84            	pop	a
 862                     ; 134     l_Cts = drv_spi_read_write_byte( NOP );	//空操作命令
 864  000a 4f            	clr	a
 865  000b cd0000        	call	_drv_spi_read_write_byte
 867  000e 6b01          	ld	(OFST+0,sp),a
 868                     ; 136     SI_SET_CSN_HIGH( );		//SPI取消片选
 870  0010 4b02          	push	#2
 871  0012 ae5005        	ldw	x,#20485
 872  0015 cd0000        	call	_GPIO_SetBits
 874  0018 84            	pop	a
 875                     ; 138 	return l_Cts;
 877  0019 7b01          	ld	a,(OFST+0,sp)
 880  001b 5b01          	addw	sp,#1
 881  001d 81            	ret
 928                     ; 148 void SI446x_Get_Part_Informatoin( uint8_t *pRead )
 928                     ; 149 {
 929                     .text:	section	.text,new
 930  0000               _SI446x_Get_Part_Informatoin:
 932  0000 89            	pushw	x
 933  0001 88            	push	a
 934       00000001      OFST:	set	1
 937                     ; 150     uint8_t l_Cmd = PART_INFO;
 939  0002 a601          	ld	a,#1
 940  0004 6b01          	ld	(OFST+0,sp),a
 941                     ; 152     SI446x_Write_Cmds( &l_Cmd, 1 );		//命令
 943  0006 4b01          	push	#1
 944  0008 96            	ldw	x,sp
 945  0009 1c0002        	addw	x,#OFST+1
 946  000c cd0000        	call	_SI446x_Write_Cmds
 948  000f 84            	pop	a
 949                     ; 153     SI446x_Read_Response( pRead, 8 );	//读设备基本信息
 951  0010 4b08          	push	#8
 952  0012 1e03          	ldw	x,(OFST+2,sp)
 953  0014 cd0000        	call	_SI446x_Read_Response
 955  0017 84            	pop	a
 956                     ; 155 }
 959  0018 5b03          	addw	sp,#3
 960  001a 81            	ret
1007                     ; 164 void SI446x_Get_Fun_Informatoin( uint8_t *pRead )
1007                     ; 165 {
1008                     .text:	section	.text,new
1009  0000               _SI446x_Get_Fun_Informatoin:
1011  0000 89            	pushw	x
1012  0001 88            	push	a
1013       00000001      OFST:	set	1
1016                     ; 166     uint8_t l_Cmd = FUNC_INFO;
1018  0002 a610          	ld	a,#16
1019  0004 6b01          	ld	(OFST+0,sp),a
1020                     ; 168     SI446x_Write_Cmds( &l_Cmd, 1 );		//命令
1022  0006 4b01          	push	#1
1023  0008 96            	ldw	x,sp
1024  0009 1c0002        	addw	x,#OFST+1
1025  000c cd0000        	call	_SI446x_Write_Cmds
1027  000f 84            	pop	a
1028                     ; 169     SI446x_Read_Response( pRead, 7 );	//读设备功能版本信息
1030  0010 4b07          	push	#7
1031  0012 1e03          	ldw	x,(OFST+2,sp)
1032  0014 cd0000        	call	_SI446x_Read_Response
1034  0017 84            	pop	a
1035                     ; 170 }
1038  0018 5b03          	addw	sp,#3
1039  001a 81            	ret
1042                     	switch	.const
1043  0175               L332_l_Cmd:
1044  0175 00            	dc.b	0
1045  0176 000000        	ds.b	3
1091                     ; 179 void SI446x_Interrupt_Status( uint8_t *pRead )
1091                     ; 180 {
1092                     .text:	section	.text,new
1093  0000               _SI446x_Interrupt_Status:
1095  0000 89            	pushw	x
1096  0001 5204          	subw	sp,#4
1097       00000004      OFST:	set	4
1100                     ; 181     uint8_t l_Cmd[ 4 ] = { 0 };
1102  0003 96            	ldw	x,sp
1103  0004 1c0001        	addw	x,#OFST-3
1104  0007 90ae0175      	ldw	y,#L332_l_Cmd
1105  000b a604          	ld	a,#4
1106  000d cd0000        	call	c_xymvx
1108                     ; 183     l_Cmd[0] = GET_INT_STATUS;		
1110  0010 a620          	ld	a,#32
1111  0012 6b01          	ld	(OFST-3,sp),a
1112                     ; 184     l_Cmd[1] = 0;
1114  0014 0f02          	clr	(OFST-2,sp)
1115                     ; 185     l_Cmd[2] = 0;
1117  0016 0f03          	clr	(OFST-1,sp)
1118                     ; 186     l_Cmd[3] = 0;
1120  0018 0f04          	clr	(OFST+0,sp)
1121                     ; 188     SI446x_Write_Cmds( l_Cmd, 4 );		//发送中断读取命令
1123  001a 4b04          	push	#4
1124  001c 96            	ldw	x,sp
1125  001d 1c0002        	addw	x,#OFST-2
1126  0020 cd0000        	call	_SI446x_Write_Cmds
1128  0023 84            	pop	a
1129                     ; 189     SI446x_Read_Response( pRead, 9 );	//读取状态
1131  0024 4b09          	push	#9
1132  0026 1e06          	ldw	x,(OFST+2,sp)
1133  0028 cd0000        	call	_SI446x_Read_Response
1135  002b 84            	pop	a
1136                     ; 190 }
1139  002c 5b06          	addw	sp,#6
1140  002e 81            	ret
1143                     	switch	.const
1144  0179               L752_l_Cmd:
1145  0179 00            	dc.b	0
1146  017a 000000        	ds.b	3
3462                     ; 201 void SI446x_Get_Property( SI446X_PROPERTY Group_Num, uint8_t Num_Props, uint8_t *pRead  )
3462                     ; 202 {
3463                     .text:	section	.text,new
3464  0000               _SI446x_Get_Property:
3466  0000 89            	pushw	x
3467  0001 5204          	subw	sp,#4
3468       00000004      OFST:	set	4
3471                     ; 203     uint8_t l_Cmd[ 4 ] = { 0 };
3473  0003 96            	ldw	x,sp
3474  0004 1c0001        	addw	x,#OFST-3
3475  0007 90ae0179      	ldw	y,#L752_l_Cmd
3476  000b a604          	ld	a,#4
3477  000d cd0000        	call	c_xymvx
3479                     ; 205     l_Cmd[ 0 ] = GET_PROPERTY;
3481  0010 a612          	ld	a,#18
3482  0012 6b01          	ld	(OFST-3,sp),a
3483                     ; 206     l_Cmd[ 1 ] = Group_Num >> 8;
3485  0014 7b05          	ld	a,(OFST+1,sp)
3486  0016 6b02          	ld	(OFST-2,sp),a
3487                     ; 207     l_Cmd[ 2 ] = Num_Props;
3489  0018 7b09          	ld	a,(OFST+5,sp)
3490  001a 6b03          	ld	(OFST-1,sp),a
3491                     ; 208     l_Cmd[ 3 ] = Group_Num;
3493  001c 7b06          	ld	a,(OFST+2,sp)
3494  001e 6b04          	ld	(OFST+0,sp),a
3495                     ; 210     SI446x_Write_Cmds( l_Cmd, 4 );		//发送读取属性命令
3497  0020 4b04          	push	#4
3498  0022 96            	ldw	x,sp
3499  0023 1c0002        	addw	x,#OFST-2
3500  0026 cd0000        	call	_SI446x_Write_Cmds
3502  0029 84            	pop	a
3503                     ; 211     SI446x_Read_Response( pRead, Num_Props + 1 );	//读属性
3505  002a 7b09          	ld	a,(OFST+5,sp)
3506  002c 4c            	inc	a
3507  002d 88            	push	a
3508  002e 1e0b          	ldw	x,(OFST+7,sp)
3509  0030 cd0000        	call	_SI446x_Read_Response
3511  0033 84            	pop	a
3512                     ; 212 }
3515  0034 5b06          	addw	sp,#6
3516  0036 81            	ret
3519                     	switch	.const
3520  017d               L3341_l_Cmd:
3521  017d 00            	dc.b	0
3522  017e 000000000000  	ds.b	19
3595                     ; 223 void SI446x_Set_Property( SI446X_PROPERTY Group_Num, uint8_t Num_Props, uint8_t *pWrite )
3595                     ; 224 {
3596                     .text:	section	.text,new
3597  0000               _SI446x_Set_Property:
3599  0000 89            	pushw	x
3600  0001 5217          	subw	sp,#23
3601       00000017      OFST:	set	23
3604                     ; 225     uint8_t l_Cmd[ 20 ] = { 0 }, i = 0;
3606  0003 96            	ldw	x,sp
3607  0004 1c0003        	addw	x,#OFST-20
3608  0007 90ae017d      	ldw	y,#L3341_l_Cmd
3609  000b a614          	ld	a,#20
3610  000d cd0000        	call	c_xymvx
3614  0010 0f17          	clr	(OFST+0,sp)
3615                     ; 227     if( Num_Props >= 16 )   
3617  0012 7b1c          	ld	a,(OFST+5,sp)
3618  0014 a110          	cp	a,#16
3619  0016 2503          	jrult	L23
3620  0018 cc009c        	jp	L03
3621  001b               L23:
3622                     ; 229 		return; 	//数量不大于16
3624                     ; 232     l_Cmd[ i++ ] = SET_PROPERTY;		//设置属性命令
3626  001b 96            	ldw	x,sp
3627  001c 1c0003        	addw	x,#OFST-20
3628  001f 1f01          	ldw	(OFST-22,sp),x
3629  0021 7b17          	ld	a,(OFST+0,sp)
3630  0023 97            	ld	xl,a
3631  0024 0c17          	inc	(OFST+0,sp)
3632  0026 9f            	ld	a,xl
3633  0027 5f            	clrw	x
3634  0028 97            	ld	xl,a
3635  0029 72fb01        	addw	x,(OFST-22,sp)
3636  002c a611          	ld	a,#17
3637  002e f7            	ld	(x),a
3638                     ; 233     l_Cmd[ i++ ] = Group_Num >> 8;
3640  002f 96            	ldw	x,sp
3641  0030 1c0003        	addw	x,#OFST-20
3642  0033 1f01          	ldw	(OFST-22,sp),x
3643  0035 7b17          	ld	a,(OFST+0,sp)
3644  0037 97            	ld	xl,a
3645  0038 0c17          	inc	(OFST+0,sp)
3646  003a 9f            	ld	a,xl
3647  003b 5f            	clrw	x
3648  003c 97            	ld	xl,a
3649  003d 72fb01        	addw	x,(OFST-22,sp)
3650  0040 7b18          	ld	a,(OFST+1,sp)
3651  0042 f7            	ld	(x),a
3652                     ; 234     l_Cmd[ i++ ] = Num_Props;
3654  0043 96            	ldw	x,sp
3655  0044 1c0003        	addw	x,#OFST-20
3656  0047 1f01          	ldw	(OFST-22,sp),x
3657  0049 7b17          	ld	a,(OFST+0,sp)
3658  004b 97            	ld	xl,a
3659  004c 0c17          	inc	(OFST+0,sp)
3660  004e 9f            	ld	a,xl
3661  004f 5f            	clrw	x
3662  0050 97            	ld	xl,a
3663  0051 72fb01        	addw	x,(OFST-22,sp)
3664  0054 7b1c          	ld	a,(OFST+5,sp)
3665  0056 f7            	ld	(x),a
3666                     ; 235     l_Cmd[ i++ ] = Group_Num;
3668  0057 96            	ldw	x,sp
3669  0058 1c0003        	addw	x,#OFST-20
3670  005b 1f01          	ldw	(OFST-22,sp),x
3671  005d 7b17          	ld	a,(OFST+0,sp)
3672  005f 97            	ld	xl,a
3673  0060 0c17          	inc	(OFST+0,sp)
3674  0062 9f            	ld	a,xl
3675  0063 5f            	clrw	x
3676  0064 97            	ld	xl,a
3677  0065 72fb01        	addw	x,(OFST-22,sp)
3678  0068 7b19          	ld	a,(OFST+2,sp)
3679  006a f7            	ld	(x),a
3681  006b 201d          	jra	L1051
3682  006d               L5741:
3683                     ; 239         l_Cmd[ i++ ] = *pWrite;
3685  006d 96            	ldw	x,sp
3686  006e 1c0003        	addw	x,#OFST-20
3687  0071 1f01          	ldw	(OFST-22,sp),x
3688  0073 7b17          	ld	a,(OFST+0,sp)
3689  0075 97            	ld	xl,a
3690  0076 0c17          	inc	(OFST+0,sp)
3691  0078 9f            	ld	a,xl
3692  0079 5f            	clrw	x
3693  007a 97            	ld	xl,a
3694  007b 72fb01        	addw	x,(OFST-22,sp)
3695  007e 161d          	ldw	y,(OFST+6,sp)
3696  0080 90f6          	ld	a,(y)
3697  0082 f7            	ld	(x),a
3698                     ; 240 		pWrite++;
3700  0083 1e1d          	ldw	x,(OFST+6,sp)
3701  0085 1c0001        	addw	x,#1
3702  0088 1f1d          	ldw	(OFST+6,sp),x
3703  008a               L1051:
3704                     ; 237     while( Num_Props-- )
3706  008a 7b1c          	ld	a,(OFST+5,sp)
3707  008c 0a1c          	dec	(OFST+5,sp)
3708  008e 4d            	tnz	a
3709  008f 26dc          	jrne	L5741
3710                     ; 242     SI446x_Write_Cmds( l_Cmd, i );		//发送命令及数据
3712  0091 7b17          	ld	a,(OFST+0,sp)
3713  0093 88            	push	a
3714  0094 96            	ldw	x,sp
3715  0095 1c0004        	addw	x,#OFST-19
3716  0098 cd0000        	call	_SI446x_Write_Cmds
3718  009b 84            	pop	a
3719                     ; 243 }
3720  009c               L03:
3723  009c 5b19          	addw	sp,#25
3724  009e 81            	ret
3727                     	switch	.const
3728  0191               L5051_l_Cmd:
3729  0191 00            	dc.b	0
3730  0192 00000000      	ds.b	4
3784                     ; 253 void SI446x_Set_Property_1( SI446X_PROPERTY Group_Num, uint8_t Start_Prop )
3784                     ; 254 {
3785                     .text:	section	.text,new
3786  0000               _SI446x_Set_Property_1:
3788  0000 89            	pushw	x
3789  0001 5205          	subw	sp,#5
3790       00000005      OFST:	set	5
3793                     ; 255     uint8_t l_Cmd[ 5 ] = { 0 };
3795  0003 96            	ldw	x,sp
3796  0004 1c0001        	addw	x,#OFST-4
3797  0007 90ae0191      	ldw	y,#L5051_l_Cmd
3798  000b a605          	ld	a,#5
3799  000d cd0000        	call	c_xymvx
3801                     ; 257     l_Cmd[ 0 ] = SET_PROPERTY;		//命令
3803  0010 a611          	ld	a,#17
3804  0012 6b01          	ld	(OFST-4,sp),a
3805                     ; 258     l_Cmd[ 1 ] = Group_Num >> 8;
3807  0014 7b06          	ld	a,(OFST+1,sp)
3808  0016 6b02          	ld	(OFST-3,sp),a
3809                     ; 259     l_Cmd[ 2 ] = 1;
3811  0018 a601          	ld	a,#1
3812  001a 6b03          	ld	(OFST-2,sp),a
3813                     ; 260     l_Cmd[ 3 ] = Group_Num;
3815  001c 7b07          	ld	a,(OFST+2,sp)
3816  001e 6b04          	ld	(OFST-1,sp),a
3817                     ; 261     l_Cmd[ 4 ] = Start_Prop;
3819  0020 7b0a          	ld	a,(OFST+5,sp)
3820  0022 6b05          	ld	(OFST+0,sp),a
3821                     ; 263     SI446x_Write_Cmds( l_Cmd, 5 );	//发送命令设置属性
3823  0024 4b05          	push	#5
3824  0026 96            	ldw	x,sp
3825  0027 1c0002        	addw	x,#OFST-3
3826  002a cd0000        	call	_SI446x_Write_Cmds
3828  002d 84            	pop	a
3829                     ; 264 }
3832  002e 5b07          	addw	sp,#7
3833  0030 81            	ret
3836                     	switch	.const
3837  0196               L5351_l_Cmd:
3838  0196 00            	dc.b	0
3839  0197 000000        	ds.b	3
3885                     ; 273 uint8_t SI446x_Get_Property_1( SI446X_PROPERTY Group_Num )
3885                     ; 274 {
3886                     .text:	section	.text,new
3887  0000               _SI446x_Get_Property_1:
3889  0000 89            	pushw	x
3890  0001 5204          	subw	sp,#4
3891       00000004      OFST:	set	4
3894                     ; 275     uint8_t l_Cmd[ 4 ] = { 0 };
3896  0003 96            	ldw	x,sp
3897  0004 1c0001        	addw	x,#OFST-3
3898  0007 90ae0196      	ldw	y,#L5351_l_Cmd
3899  000b a604          	ld	a,#4
3900  000d cd0000        	call	c_xymvx
3902                     ; 277     l_Cmd[ 0 ] = GET_PROPERTY;
3904  0010 a612          	ld	a,#18
3905  0012 6b01          	ld	(OFST-3,sp),a
3906                     ; 278     l_Cmd[ 1 ] = Group_Num >> 8;
3908  0014 7b05          	ld	a,(OFST+1,sp)
3909  0016 6b02          	ld	(OFST-2,sp),a
3910                     ; 279     l_Cmd[ 2 ] = 1;
3912  0018 a601          	ld	a,#1
3913  001a 6b03          	ld	(OFST-1,sp),a
3914                     ; 280     l_Cmd[ 3 ] = Group_Num;
3916  001c 7b06          	ld	a,(OFST+2,sp)
3917  001e 6b04          	ld	(OFST+0,sp),a
3918                     ; 281     SI446x_Write_Cmds( l_Cmd, 4 );		//发送命令
3920  0020 4b04          	push	#4
3921  0022 96            	ldw	x,sp
3922  0023 1c0002        	addw	x,#OFST-2
3923  0026 cd0000        	call	_SI446x_Write_Cmds
3925  0029 84            	pop	a
3926                     ; 283     SI446x_Read_Response( l_Cmd, 2 );	//读取属性
3928  002a 4b02          	push	#2
3929  002c 96            	ldw	x,sp
3930  002d 1c0002        	addw	x,#OFST-2
3931  0030 cd0000        	call	_SI446x_Read_Response
3933  0033 84            	pop	a
3934                     ; 285     return l_Cmd[ 1 ];
3936  0034 7b02          	ld	a,(OFST-2,sp)
3939  0036 5b06          	addw	sp,#6
3940  0038 81            	ret
3965                     ; 294 void SI446x_Reset( void )
3965                     ; 295 {
3966                     .text:	section	.text,new
3967  0000               _SI446x_Reset:
3971                     ; 296     SI_SET_SDN_HIGH( );		//关设备
3973  0000 72185005      	bset	20485,#4
3974                     ; 297 	  delay_ms( 1 );		//延时 等待设备完全断电
3976  0004 ae0001        	ldw	x,#1
3977  0007 cd0000        	call	_delay_ms
3979                     ; 298     SI_SET_SDN_LOW( );		//开设备
3981  000a 72195005      	bres	20485,#4
3982                     ; 299     SI_SET_CSN_HIGH( );		//取消SPI片选
3984  000e 4b02          	push	#2
3985  0010 ae5005        	ldw	x,#20485
3986  0013 cd0000        	call	_GPIO_SetBits
3988  0016 84            	pop	a
3989                     ; 300 }
3992  0017 81            	ret
3995                     	switch	.const
3996  019a               L1751_l_Cmd:
3997  019a 00            	dc.b	0
3998  019b 000000000000  	ds.b	9
4096                     ; 308 void SI446x_Config_Gpio( uint8_t Gpio_0, uint8_t Gpio_1, uint8_t Gpio_2, uint8_t Gpio_3, uint8_t Irq, uint8_t Sdo, uint8_t Gen_Config )
4096                     ; 309 {
4097                     .text:	section	.text,new
4098  0000               _SI446x_Config_Gpio:
4100  0000 89            	pushw	x
4101  0001 520a          	subw	sp,#10
4102       0000000a      OFST:	set	10
4105                     ; 310     uint8_t l_Cmd[ 10] = { 0 };
4107  0003 96            	ldw	x,sp
4108  0004 1c0001        	addw	x,#OFST-9
4109  0007 90ae019a      	ldw	y,#L1751_l_Cmd
4110  000b a60a          	ld	a,#10
4111  000d cd0000        	call	c_xymvx
4113                     ; 312     l_Cmd[ 0 ] = GPIO_PIN_CFG;
4115  0010 a613          	ld	a,#19
4116  0012 6b01          	ld	(OFST-9,sp),a
4117                     ; 313     l_Cmd[ 1 ] = Gpio_0;
4119  0014 7b0b          	ld	a,(OFST+1,sp)
4120  0016 6b02          	ld	(OFST-8,sp),a
4121                     ; 314     l_Cmd[ 2 ] = Gpio_1;
4123  0018 7b0c          	ld	a,(OFST+2,sp)
4124  001a 6b03          	ld	(OFST-7,sp),a
4125                     ; 315     l_Cmd[ 3 ] = Gpio_2;
4127  001c 7b0f          	ld	a,(OFST+5,sp)
4128  001e 6b04          	ld	(OFST-6,sp),a
4129                     ; 316     l_Cmd[ 4 ] = Gpio_3;
4131  0020 7b10          	ld	a,(OFST+6,sp)
4132  0022 6b05          	ld	(OFST-5,sp),a
4133                     ; 317     l_Cmd[ 5 ] = Irq;
4135  0024 7b11          	ld	a,(OFST+7,sp)
4136  0026 6b06          	ld	(OFST-4,sp),a
4137                     ; 318     l_Cmd[ 6 ] = Sdo;
4139  0028 7b12          	ld	a,(OFST+8,sp)
4140  002a 6b07          	ld	(OFST-3,sp),a
4141                     ; 319     l_Cmd[ 7 ] = Gen_Config;
4143  002c 7b13          	ld	a,(OFST+9,sp)
4144  002e 6b08          	ld	(OFST-2,sp),a
4145                     ; 321     SI446x_Write_Cmds( l_Cmd, 8 );		//写配置
4147  0030 4b08          	push	#8
4148  0032 96            	ldw	x,sp
4149  0033 1c0002        	addw	x,#OFST-8
4150  0036 cd0000        	call	_SI446x_Write_Cmds
4152  0039 84            	pop	a
4153                     ; 322     SI446x_Read_Response( l_Cmd, 8 );	//读配置
4155  003a 4b08          	push	#8
4156  003c 96            	ldw	x,sp
4157  003d 1c0002        	addw	x,#OFST-8
4158  0040 cd0000        	call	_SI446x_Read_Response
4160  0043 84            	pop	a
4161                     ; 323 }
4164  0044 5b0c          	addw	sp,#12
4165  0046 81            	ret
4212                     ; 331 void SI446x_Config_Init( void )
4212                     ; 332 {
4213                     .text:	section	.text,new
4214  0000               _SI446x_Config_Init:
4216  0000 5205          	subw	sp,#5
4217       00000005      OFST:	set	5
4220                     ; 334     uint16_t j = 0;
4222  0002 5f            	clrw	x
4223  0003 1f04          	ldw	(OFST-1,sp),x
4225  0005 2020          	jra	L3761
4226  0007               L7661:
4227                     ; 338         j += 1;
4229  0007 1e04          	ldw	x,(OFST-1,sp)
4230  0009 1c0001        	addw	x,#1
4231  000c 1f04          	ldw	(OFST-1,sp),x
4232                     ; 339         SI446x_Write_Cmds( (uint8_t *)config_table + j, i );
4234  000e 7b03          	ld	a,(OFST-2,sp)
4235  0010 88            	push	a
4236  0011 1e05          	ldw	x,(OFST+0,sp)
4237  0013 1c0000        	addw	x,#L3_config_table
4238  0016 cd0000        	call	_SI446x_Write_Cmds
4240  0019 84            	pop	a
4241                     ; 340         j += i;
4243  001a 7b03          	ld	a,(OFST-2,sp)
4244  001c 5f            	clrw	x
4245  001d 97            	ld	xl,a
4246  001e 1f01          	ldw	(OFST-4,sp),x
4247  0020 1e04          	ldw	x,(OFST-1,sp)
4248  0022 72fb01        	addw	x,(OFST-4,sp)
4249  0025 1f04          	ldw	(OFST-1,sp),x
4250  0027               L3761:
4251                     ; 336     while( ( i = config_table[j] ) != 0 )
4253  0027 1e04          	ldw	x,(OFST-1,sp)
4254  0029 d60000        	ld	a,(L3_config_table,x)
4255  002c 6b03          	ld	(OFST-2,sp),a
4256  002e 26d7          	jrne	L7661
4257                     ; 348     SI446x_Set_Property_1( PKT_CONFIG1, 0x00 );
4259  0030 4b00          	push	#0
4260  0032 ae1206        	ldw	x,#4614
4261  0035 cd0000        	call	_SI446x_Set_Property_1
4263  0038 84            	pop	a
4264                     ; 349     SI446x_Set_Property_1( PKT_CRC_CONFIG, 0x00 );
4266  0039 4b00          	push	#0
4267  003b ae1200        	ldw	x,#4608
4268  003e cd0000        	call	_SI446x_Set_Property_1
4270  0041 84            	pop	a
4271                     ; 350     SI446x_Set_Property_1( PKT_LEN_FIELD_SOURCE, 0x01 );
4273  0042 4b01          	push	#1
4274  0044 ae1209        	ldw	x,#4617
4275  0047 cd0000        	call	_SI446x_Set_Property_1
4277  004a 84            	pop	a
4278                     ; 351     SI446x_Set_Property_1( PKT_LEN, 0x2A );
4280  004b 4b2a          	push	#42
4281  004d ae1208        	ldw	x,#4616
4282  0050 cd0000        	call	_SI446x_Set_Property_1
4284  0053 84            	pop	a
4285                     ; 352     SI446x_Set_Property_1( PKT_LEN_ADJUST, 0x00 );
4287  0054 4b00          	push	#0
4288  0056 ae120a        	ldw	x,#4618
4289  0059 cd0000        	call	_SI446x_Set_Property_1
4291  005c 84            	pop	a
4292                     ; 353     SI446x_Set_Property_1( PKT_FIELD_1_LENGTH_12_8, 0x00 );
4294  005d 4b00          	push	#0
4295  005f ae120d        	ldw	x,#4621
4296  0062 cd0000        	call	_SI446x_Set_Property_1
4298  0065 84            	pop	a
4299                     ; 354     SI446x_Set_Property_1( PKT_FIELD_1_LENGTH_7_0, 0x01 );
4301  0066 4b01          	push	#1
4302  0068 ae120e        	ldw	x,#4622
4303  006b cd0000        	call	_SI446x_Set_Property_1
4305  006e 84            	pop	a
4306                     ; 355     SI446x_Set_Property_1( PKT_FIELD_1_CONFIG, 0x00 );
4308  006f 4b00          	push	#0
4309  0071 ae120f        	ldw	x,#4623
4310  0074 cd0000        	call	_SI446x_Set_Property_1
4312  0077 84            	pop	a
4313                     ; 356     SI446x_Set_Property_1( PKT_FIELD_1_CRC_CONFIG, 0x00 );
4315  0078 4b00          	push	#0
4316  007a ae1210        	ldw	x,#4624
4317  007d cd0000        	call	_SI446x_Set_Property_1
4319  0080 84            	pop	a
4320                     ; 357     SI446x_Set_Property_1( PKT_FIELD_2_LENGTH_12_8, 0x00 );
4322  0081 4b00          	push	#0
4323  0083 ae1211        	ldw	x,#4625
4324  0086 cd0000        	call	_SI446x_Set_Property_1
4326  0089 84            	pop	a
4327                     ; 358     SI446x_Set_Property_1( PKT_FIELD_2_LENGTH_7_0, 0x20 );
4329  008a 4b20          	push	#32
4330  008c ae1212        	ldw	x,#4626
4331  008f cd0000        	call	_SI446x_Set_Property_1
4333  0092 84            	pop	a
4334                     ; 359     SI446x_Set_Property_1( PKT_FIELD_2_CONFIG, 0x00 );
4336  0093 4b00          	push	#0
4337  0095 ae1213        	ldw	x,#4627
4338  0098 cd0000        	call	_SI446x_Set_Property_1
4340  009b 84            	pop	a
4341                     ; 360     SI446x_Set_Property_1( PKT_FIELD_2_CRC_CONFIG, 0x00 );
4343  009c 4b00          	push	#0
4344  009e ae1214        	ldw	x,#4628
4345  00a1 cd0000        	call	_SI446x_Set_Property_1
4347  00a4 84            	pop	a
4348                     ; 367     SI446x_Config_Gpio( 0, 0, 33|0x40, 32|0x40, 0, 0, 0 );    //4463才需要配置
4350  00a5 4b00          	push	#0
4351  00a7 4b00          	push	#0
4352  00a9 4b00          	push	#0
4353  00ab 4b60          	push	#96
4354  00ad 4b61          	push	#97
4355  00af 5f            	clrw	x
4356  00b0 4f            	clr	a
4357  00b1 95            	ld	xh,a
4358  00b2 cd0000        	call	_SI446x_Config_Gpio
4360  00b5 5b05          	addw	sp,#5
4361                     ; 368 }
4364  00b7 5b05          	addw	sp,#5
4365  00b9 81            	ret
4413                     ; 378 void SI446x_Write_TxFifo( uint8_t *pWriteData, uint8_t Length )
4413                     ; 379 {
4414                     .text:	section	.text,new
4415  0000               _SI446x_Write_TxFifo:
4417  0000 89            	pushw	x
4418       00000000      OFST:	set	0
4421                     ; 380     SI_SET_CSN_LOW( );
4423  0001 4b02          	push	#2
4424  0003 ae5005        	ldw	x,#20485
4425  0006 cd0000        	call	_GPIO_ResetBits
4427  0009 84            	pop	a
4428                     ; 381     drv_spi_read_write_byte( WRITE_TX_FIFO );		//写命令
4430  000a a666          	ld	a,#102
4431  000c cd0000        	call	_drv_spi_read_write_byte
4434  000f 200e          	jra	L3271
4435  0011               L1271:
4436                     ; 384 		drv_spi_read_write_byte( *pWriteData++ ); 	//写数据
4438  0011 1e01          	ldw	x,(OFST+1,sp)
4439  0013 1c0001        	addw	x,#1
4440  0016 1f01          	ldw	(OFST+1,sp),x
4441  0018 1d0001        	subw	x,#1
4442  001b f6            	ld	a,(x)
4443  001c cd0000        	call	_drv_spi_read_write_byte
4445  001f               L3271:
4446                     ; 382     while( Length-- )    
4448  001f 7b05          	ld	a,(OFST+5,sp)
4449  0021 0a05          	dec	(OFST+5,sp)
4450  0023 4d            	tnz	a
4451  0024 26eb          	jrne	L1271
4452                     ; 386     SI_SET_CSN_HIGH( );
4454  0026 4b02          	push	#2
4455  0028 ae5005        	ldw	x,#20485
4456  002b cd0000        	call	_GPIO_SetBits
4458  002e 84            	pop	a
4459                     ; 387 }
4462  002f 85            	popw	x
4463  0030 81            	ret
4466                     	switch	.const
4467  01a4               L7271_l_Cmd:
4468  01a4 00            	dc.b	0
4469  01a5 00            	ds.b	1
4504                     ; 395 void SI446x_Reset_RxFifo( void )
4504                     ; 396 {
4505                     .text:	section	.text,new
4506  0000               _SI446x_Reset_RxFifo:
4508  0000 89            	pushw	x
4509       00000002      OFST:	set	2
4512                     ; 397     uint8_t l_Cmd[ 2 ] = { 0 };
4514  0001 c601a4        	ld	a,L7271_l_Cmd
4515  0004 6b01          	ld	(OFST-1,sp),a
4516  0006 c601a5        	ld	a,L7271_l_Cmd+1
4517  0009 6b02          	ld	(OFST+0,sp),a
4518                     ; 399     l_Cmd[ 0 ] = FIFO_INFO;
4520  000b a615          	ld	a,#21
4521  000d 6b01          	ld	(OFST-1,sp),a
4522                     ; 400     l_Cmd[ 1 ] = 0x02;
4524  000f a602          	ld	a,#2
4525  0011 6b02          	ld	(OFST+0,sp),a
4526                     ; 401     SI446x_Write_Cmds( l_Cmd, 2 );
4528  0013 4b02          	push	#2
4529  0015 96            	ldw	x,sp
4530  0016 1c0002        	addw	x,#OFST+0
4531  0019 cd0000        	call	_SI446x_Write_Cmds
4533  001c 84            	pop	a
4534                     ; 402 }
4537  001d 85            	popw	x
4538  001e 81            	ret
4541                     	switch	.const
4542  01a6               L7471_l_Cmd:
4543  01a6 00            	dc.b	0
4544  01a7 00            	ds.b	1
4579                     ; 410 void SI446x_Reset_TxFifo( void )
4579                     ; 411 {
4580                     .text:	section	.text,new
4581  0000               _SI446x_Reset_TxFifo:
4583  0000 89            	pushw	x
4584       00000002      OFST:	set	2
4587                     ; 412     uint8_t l_Cmd[ 2 ] = { 0 };
4589  0001 c601a6        	ld	a,L7471_l_Cmd
4590  0004 6b01          	ld	(OFST-1,sp),a
4591  0006 c601a7        	ld	a,L7471_l_Cmd+1
4592  0009 6b02          	ld	(OFST+0,sp),a
4593                     ; 414     l_Cmd[0] = FIFO_INFO;
4595  000b a615          	ld	a,#21
4596  000d 6b01          	ld	(OFST-1,sp),a
4597                     ; 415     l_Cmd[1] = 0x02;
4599  000f a602          	ld	a,#2
4600  0011 6b02          	ld	(OFST+0,sp),a
4601                     ; 416     SI446x_Write_Cmds( l_Cmd, 2 );
4603  0013 4b02          	push	#2
4604  0015 96            	ldw	x,sp
4605  0016 1c0002        	addw	x,#OFST+0
4606  0019 cd0000        	call	_SI446x_Write_Cmds
4608  001c 84            	pop	a
4609                     ; 417 }
4612  001d 85            	popw	x
4613  001e 81            	ret
4616                     	switch	.const
4617  01a8               L7671_l_Cmd:
4618  01a8 00            	dc.b	0
4619  01a9 00000000      	ds.b	4
4703                     ; 429 void SI446x_Send_Packet( uint8_t *pTxData, uint8_t Length, uint8_t Channel, uint8_t Condition )
4703                     ; 430 {
4704                     .text:	section	.text,new
4705  0000               _SI446x_Send_Packet:
4707  0000 89            	pushw	x
4708  0001 5206          	subw	sp,#6
4709       00000006      OFST:	set	6
4712                     ; 431     uint8_t l_Cmd[ 5 ] = { 0 };
4714  0003 96            	ldw	x,sp
4715  0004 1c0002        	addw	x,#OFST-4
4716  0007 90ae01a8      	ldw	y,#L7671_l_Cmd
4717  000b a605          	ld	a,#5
4718  000d cd0000        	call	c_xymvx
4720                     ; 432     uint8_t tx_len = Length;
4722  0010 7b0b          	ld	a,(OFST+5,sp)
4723  0012 6b01          	ld	(OFST-5,sp),a
4724                     ; 434     SI446x_Reset_TxFifo( );		//清空TX FIFO
4726  0014 cd0000        	call	_SI446x_Reset_TxFifo
4728                     ; 436     SI_SET_CSN_LOW( );		
4730  0017 4b02          	push	#2
4731  0019 ae5005        	ldw	x,#20485
4732  001c cd0000        	call	_GPIO_ResetBits
4734  001f 84            	pop	a
4735                     ; 438     drv_spi_read_write_byte( WRITE_TX_FIFO );	//写TX FIFO命令
4737  0020 a666          	ld	a,#102
4738  0022 cd0000        	call	_drv_spi_read_write_byte
4740                     ; 442     tx_len ++;
4742  0025 0c01          	inc	(OFST-5,sp)
4743                     ; 443     drv_spi_read_write_byte( Length );
4745  0027 7b0b          	ld	a,(OFST+5,sp)
4746  0029 cd0000        	call	_drv_spi_read_write_byte
4749  002c 200e          	jra	L5302
4750  002e               L3302:
4751                     ; 449 		drv_spi_read_write_byte( *pTxData++ ); 	//写数据到TX FIFO
4753  002e 1e07          	ldw	x,(OFST+1,sp)
4754  0030 1c0001        	addw	x,#1
4755  0033 1f07          	ldw	(OFST+1,sp),x
4756  0035 1d0001        	subw	x,#1
4757  0038 f6            	ld	a,(x)
4758  0039 cd0000        	call	_drv_spi_read_write_byte
4760  003c               L5302:
4761                     ; 447     while( Length-- )    
4763  003c 7b0b          	ld	a,(OFST+5,sp)
4764  003e 0a0b          	dec	(OFST+5,sp)
4765  0040 4d            	tnz	a
4766  0041 26eb          	jrne	L3302
4767                     ; 452     SI_SET_CSN_HIGH( );
4769  0043 4b02          	push	#2
4770  0045 ae5005        	ldw	x,#20485
4771  0048 cd0000        	call	_GPIO_SetBits
4773  004b 84            	pop	a
4774                     ; 454     l_Cmd[ 0 ] = START_TX;
4776  004c a631          	ld	a,#49
4777  004e 6b02          	ld	(OFST-4,sp),a
4778                     ; 455     l_Cmd[ 1 ] = Channel;
4780  0050 7b0c          	ld	a,(OFST+6,sp)
4781  0052 6b03          	ld	(OFST-3,sp),a
4782                     ; 456     l_Cmd[ 2 ] = Condition;
4784  0054 7b0d          	ld	a,(OFST+7,sp)
4785  0056 6b04          	ld	(OFST-2,sp),a
4786                     ; 457     l_Cmd[ 3 ] = 0;
4788  0058 0f05          	clr	(OFST-1,sp)
4789                     ; 458     l_Cmd[ 4 ] = tx_len;
4791  005a 7b01          	ld	a,(OFST-5,sp)
4792  005c 6b06          	ld	(OFST+0,sp),a
4793                     ; 460     SI446x_Write_Cmds( l_Cmd, 5 );		//发送数据包
4795  005e 4b05          	push	#5
4796  0060 96            	ldw	x,sp
4797  0061 1c0003        	addw	x,#OFST-3
4798  0064 cd0000        	call	_SI446x_Write_Cmds
4800  0067 84            	pop	a
4801                     ; 461 }
4804  0068 5b08          	addw	sp,#8
4805  006a 81            	ret
4808                     	switch	.const
4809  01ad               L1402_l_Cmd:
4810  01ad 00            	dc.b	0
4811  01ae 00000000      	ds.b	4
4872                     ; 472 void SI446x_Start_Tx( uint8_t Channel, uint8_t Condition, uint16_t Length )
4872                     ; 473 {
4873                     .text:	section	.text,new
4874  0000               _SI446x_Start_Tx:
4876  0000 89            	pushw	x
4877  0001 5205          	subw	sp,#5
4878       00000005      OFST:	set	5
4881                     ; 474     uint8_t l_Cmd[5] = { 0 };
4883  0003 96            	ldw	x,sp
4884  0004 1c0001        	addw	x,#OFST-4
4885  0007 90ae01ad      	ldw	y,#L1402_l_Cmd
4886  000b a605          	ld	a,#5
4887  000d cd0000        	call	c_xymvx
4889                     ; 476     l_Cmd[ 0 ] = START_TX;		
4891  0010 a631          	ld	a,#49
4892  0012 6b01          	ld	(OFST-4,sp),a
4893                     ; 477     l_Cmd[ 1 ] = Channel;
4895  0014 7b06          	ld	a,(OFST+1,sp)
4896  0016 6b02          	ld	(OFST-3,sp),a
4897                     ; 478     l_Cmd[ 2 ] = Condition;
4899  0018 7b07          	ld	a,(OFST+2,sp)
4900  001a 6b03          	ld	(OFST-2,sp),a
4901                     ; 479     l_Cmd[ 3 ] = Length >> 8;
4903  001c 7b0a          	ld	a,(OFST+5,sp)
4904  001e 6b04          	ld	(OFST-1,sp),a
4905                     ; 480     l_Cmd[ 4 ] = Length;
4907  0020 7b0b          	ld	a,(OFST+6,sp)
4908  0022 6b05          	ld	(OFST+0,sp),a
4909                     ; 482     SI446x_Write_Cmds( l_Cmd, 5 );
4911  0024 4b05          	push	#5
4912  0026 96            	ldw	x,sp
4913  0027 1c0002        	addw	x,#OFST-3
4914  002a cd0000        	call	_SI446x_Write_Cmds
4916  002d 84            	pop	a
4917                     ; 483 }
4920  002e 5b07          	addw	sp,#7
4921  0030 81            	ret
4978                     ; 492 uint8_t SI446x_Read_Packet( uint8_t *pRxData )
4978                     ; 493 {
4979                     .text:	section	.text,new
4980  0000               _SI446x_Read_Packet:
4982  0000 89            	pushw	x
4983  0001 89            	pushw	x
4984       00000002      OFST:	set	2
4987                     ; 494     uint8_t length = 0, i = 0;
4991                     ; 496     SI446x_Wait_Cts( );
4993  0002 cd0000        	call	_SI446x_Wait_Cts
4995                     ; 497     SI_SET_CSN_LOW( );
4997  0005 4b02          	push	#2
4998  0007 ae5005        	ldw	x,#20485
4999  000a cd0000        	call	_GPIO_ResetBits
5001  000d 84            	pop	a
5002                     ; 499     drv_spi_read_write_byte( READ_RX_FIFO );	//读FIFO命令
5004  000e a677          	ld	a,#119
5005  0010 cd0000        	call	_drv_spi_read_write_byte
5007                     ; 503     length = drv_spi_read_write_byte( 0xFF );	//读数据长度
5009  0013 a6ff          	ld	a,#255
5010  0015 cd0000        	call	_drv_spi_read_write_byte
5012  0018 6b02          	ld	(OFST+0,sp),a
5013                     ; 510     i = length;
5015  001a 7b02          	ld	a,(OFST+0,sp)
5016  001c 6b01          	ld	(OFST-1,sp),a
5018  001e 2010          	jra	L7212
5019  0020               L3212:
5020                     ; 514         *pRxData++ = drv_spi_read_write_byte( 0xFF );	//读数据
5022  0020 a6ff          	ld	a,#255
5023  0022 cd0000        	call	_drv_spi_read_write_byte
5025  0025 1e03          	ldw	x,(OFST+1,sp)
5026  0027 1c0001        	addw	x,#1
5027  002a 1f03          	ldw	(OFST+1,sp),x
5028  002c 1d0001        	subw	x,#1
5029  002f f7            	ld	(x),a
5030  0030               L7212:
5031                     ; 512     while( length -- )
5033  0030 7b02          	ld	a,(OFST+0,sp)
5034  0032 0a02          	dec	(OFST+0,sp)
5035  0034 4d            	tnz	a
5036  0035 26e9          	jrne	L3212
5037                     ; 517     SI_SET_CSN_HIGH( );		//返回数据个数
5039  0037 4b02          	push	#2
5040  0039 ae5005        	ldw	x,#20485
5041  003c cd0000        	call	_GPIO_SetBits
5043  003f 84            	pop	a
5044                     ; 519     return i;
5046  0040 7b01          	ld	a,(OFST-1,sp)
5049  0042 5b04          	addw	sp,#4
5050  0044 81            	ret
5053                     	switch	.const
5054  01b2               L3312_l_Cmd:
5055  01b2 00            	dc.b	0
5056  01b3 000000000000  	ds.b	7
5146                     ; 534 void SI446x_Start_Rx( uint8_t Channel, uint8_t Condition, uint16_t Length, uint8_t Next_State1, uint8_t Next_State2, uint8_t Next_State3 )
5146                     ; 535 {
5147                     .text:	section	.text,new
5148  0000               _SI446x_Start_Rx:
5150  0000 89            	pushw	x
5151  0001 5208          	subw	sp,#8
5152       00000008      OFST:	set	8
5155                     ; 536     uint8_t l_Cmd[ 8 ] = { 0 };
5157  0003 96            	ldw	x,sp
5158  0004 1c0001        	addw	x,#OFST-7
5159  0007 90ae01b2      	ldw	y,#L3312_l_Cmd
5160  000b a608          	ld	a,#8
5161  000d cd0000        	call	c_xymvx
5163                     ; 538     SI446x_Reset_RxFifo( );
5165  0010 cd0000        	call	_SI446x_Reset_RxFifo
5167                     ; 539     SI446x_Reset_TxFifo( );
5169  0013 cd0000        	call	_SI446x_Reset_TxFifo
5171                     ; 541     l_Cmd[ 0 ] = START_RX;
5173  0016 a632          	ld	a,#50
5174  0018 6b01          	ld	(OFST-7,sp),a
5175                     ; 542     l_Cmd[ 1 ] = Channel;
5177  001a 7b09          	ld	a,(OFST+1,sp)
5178  001c 6b02          	ld	(OFST-6,sp),a
5179                     ; 543     l_Cmd[ 2 ] = Condition;
5181  001e 7b0a          	ld	a,(OFST+2,sp)
5182  0020 6b03          	ld	(OFST-5,sp),a
5183                     ; 544     l_Cmd[ 3 ] = Length >> 8;
5185  0022 7b0d          	ld	a,(OFST+5,sp)
5186  0024 6b04          	ld	(OFST-4,sp),a
5187                     ; 545     l_Cmd[ 4 ] = Length;
5189  0026 7b0e          	ld	a,(OFST+6,sp)
5190  0028 6b05          	ld	(OFST-3,sp),a
5191                     ; 546     l_Cmd[ 5 ] = Next_State1;
5193  002a 7b0f          	ld	a,(OFST+7,sp)
5194  002c 6b06          	ld	(OFST-2,sp),a
5195                     ; 547     l_Cmd[ 6 ] = Next_State2;
5197  002e 7b10          	ld	a,(OFST+8,sp)
5198  0030 6b07          	ld	(OFST-1,sp),a
5199                     ; 548     l_Cmd[ 7 ] = Next_State3;
5201  0032 7b11          	ld	a,(OFST+9,sp)
5202  0034 6b08          	ld	(OFST+0,sp),a
5203                     ; 550     SI446x_Write_Cmds( l_Cmd, 8 );
5205  0036 4b08          	push	#8
5206  0038 96            	ldw	x,sp
5207  0039 1c0002        	addw	x,#OFST-6
5208  003c cd0000        	call	_SI446x_Write_Cmds
5210  003f 84            	pop	a
5211                     ; 551 }
5214  0040 5b0a          	addw	sp,#10
5215  0042 81            	ret
5218                     	switch	.const
5219  01ba               L3022_l_Cmd:
5220  01ba 00            	dc.b	0
5221  01bb 0000000000    	ds.b	5
5294                     ; 563 void SI446x_Get_Packet_Information( uint8_t *pReadData, uint8_t FieldNumMask, uint16_t Length, uint16_t DiffLen )
5294                     ; 564 {
5295                     .text:	section	.text,new
5296  0000               _SI446x_Get_Packet_Information:
5298  0000 89            	pushw	x
5299  0001 5206          	subw	sp,#6
5300       00000006      OFST:	set	6
5303                     ; 565     uint8_t l_Cmd[ 6 ] = { 0 };
5305  0003 96            	ldw	x,sp
5306  0004 1c0001        	addw	x,#OFST-5
5307  0007 90ae01ba      	ldw	y,#L3022_l_Cmd
5308  000b a606          	ld	a,#6
5309  000d cd0000        	call	c_xymvx
5311                     ; 567     l_Cmd[ 0 ] = PACKET_INFO;
5313  0010 a616          	ld	a,#22
5314  0012 6b01          	ld	(OFST-5,sp),a
5315                     ; 568     l_Cmd[ 1 ] = FieldNumMask;
5317  0014 7b0b          	ld	a,(OFST+5,sp)
5318  0016 6b02          	ld	(OFST-4,sp),a
5319                     ; 569     l_Cmd[ 2 ] = Length >> 8;
5321  0018 7b0c          	ld	a,(OFST+6,sp)
5322  001a 6b03          	ld	(OFST-3,sp),a
5323                     ; 570     l_Cmd[ 3 ] = Length;
5325  001c 7b0d          	ld	a,(OFST+7,sp)
5326  001e 6b04          	ld	(OFST-2,sp),a
5327                     ; 571     l_Cmd[ 4 ] = DiffLen >> 8;
5329  0020 7b0e          	ld	a,(OFST+8,sp)
5330  0022 6b05          	ld	(OFST-1,sp),a
5331                     ; 572     l_Cmd[ 5 ] = DiffLen;
5333  0024 7b0f          	ld	a,(OFST+9,sp)
5334  0026 6b06          	ld	(OFST+0,sp),a
5335                     ; 574     SI446x_Write_Cmds( l_Cmd, 6 );
5337  0028 4b06          	push	#6
5338  002a 96            	ldw	x,sp
5339  002b 1c0002        	addw	x,#OFST-4
5340  002e cd0000        	call	_SI446x_Write_Cmds
5342  0031 84            	pop	a
5343                     ; 575     SI446x_Read_Response( pReadData, 3 );
5345  0032 4b03          	push	#3
5346  0034 1e08          	ldw	x,(OFST+2,sp)
5347  0036 cd0000        	call	_SI446x_Read_Response
5349  0039 84            	pop	a
5350                     ; 576 }
5353  003a 5b08          	addw	sp,#8
5354  003c 81            	ret
5357                     	switch	.const
5358  01c0               L3422_l_Cmd:
5359  01c0 00            	dc.b	0
5360  01c1 00            	ds.b	1
5406                     ; 585 void SI446x_Get_Fifo_Information( uint8_t *pReadData )
5406                     ; 586 {
5407                     .text:	section	.text,new
5408  0000               _SI446x_Get_Fifo_Information:
5410  0000 89            	pushw	x
5411  0001 89            	pushw	x
5412       00000002      OFST:	set	2
5415                     ; 587     uint8_t l_Cmd[ 2 ] = { 0 };
5417  0002 c601c0        	ld	a,L3422_l_Cmd
5418  0005 6b01          	ld	(OFST-1,sp),a
5419  0007 c601c1        	ld	a,L3422_l_Cmd+1
5420  000a 6b02          	ld	(OFST+0,sp),a
5421                     ; 589     l_Cmd[ 0 ] = FIFO_INFO;
5423  000c a615          	ld	a,#21
5424  000e 6b01          	ld	(OFST-1,sp),a
5425                     ; 590     l_Cmd[ 1 ] = 0x03;
5427  0010 a603          	ld	a,#3
5428  0012 6b02          	ld	(OFST+0,sp),a
5429                     ; 592     SI446x_Write_Cmds( l_Cmd, 2 );
5431  0014 4b02          	push	#2
5432  0016 96            	ldw	x,sp
5433  0017 1c0002        	addw	x,#OFST+0
5434  001a cd0000        	call	_SI446x_Write_Cmds
5436  001d 84            	pop	a
5437                     ; 593     SI446x_Read_Response( pReadData, 3 );
5439  001e 4b03          	push	#3
5440  0020 1e04          	ldw	x,(OFST+2,sp)
5441  0022 cd0000        	call	_SI446x_Read_Response
5443  0025 84            	pop	a
5444                     ; 594 }
5447  0026 5b04          	addw	sp,#4
5448  0028 81            	ret
5451                     	switch	.const
5452  01c2               L7622_l_Cmd:
5453  01c2 00            	dc.b	0
5454  01c3 00            	ds.b	1
5498                     ; 603 void SI446x_Change_Status( uint8_t NextStatus )
5498                     ; 604 {
5499                     .text:	section	.text,new
5500  0000               _SI446x_Change_Status:
5502  0000 88            	push	a
5503  0001 89            	pushw	x
5504       00000002      OFST:	set	2
5507                     ; 605     uint8_t l_Cmd[ 2 ] = { 0 };
5509  0002 c601c2        	ld	a,L7622_l_Cmd
5510  0005 6b01          	ld	(OFST-1,sp),a
5511  0007 c601c3        	ld	a,L7622_l_Cmd+1
5512  000a 6b02          	ld	(OFST+0,sp),a
5513                     ; 607     l_Cmd[ 0 ] = CHANGE_STATE;
5515  000c a634          	ld	a,#52
5516  000e 6b01          	ld	(OFST-1,sp),a
5517                     ; 608     l_Cmd[ 1 ] = NextStatus;
5519  0010 7b03          	ld	a,(OFST+1,sp)
5520  0012 6b02          	ld	(OFST+0,sp),a
5521                     ; 610     SI446x_Write_Cmds( l_Cmd, 2 );
5523  0014 4b02          	push	#2
5524  0016 96            	ldw	x,sp
5525  0017 1c0002        	addw	x,#OFST+0
5526  001a cd0000        	call	_SI446x_Write_Cmds
5528  001d 84            	pop	a
5529                     ; 611 }
5532  001e 5b03          	addw	sp,#3
5533  0020 81            	ret
5536                     	switch	.const
5537  01c4               L3132_l_Cmd:
5538  01c4 00            	dc.b	0
5539  01c5 0000          	ds.b	2
5575                     ; 619 uint8_t SI446x_Get_Device_Status( void )
5575                     ; 620 {
5576                     .text:	section	.text,new
5577  0000               _SI446x_Get_Device_Status:
5579  0000 5203          	subw	sp,#3
5580       00000003      OFST:	set	3
5583                     ; 621    uint8_t l_Cmd[ 3 ] = { 0 };
5585  0002 96            	ldw	x,sp
5586  0003 1c0001        	addw	x,#OFST-2
5587  0006 90ae01c4      	ldw	y,#L3132_l_Cmd
5588  000a a603          	ld	a,#3
5589  000c cd0000        	call	c_xymvx
5591                     ; 623    l_Cmd [ 0 ] = REQUEST_DEVICE_STATE;
5593  000f a633          	ld	a,#51
5594  0011 6b01          	ld	(OFST-2,sp),a
5595                     ; 625    SI446x_Write_Cmds( l_Cmd, 1 );
5597  0013 4b01          	push	#1
5598  0015 96            	ldw	x,sp
5599  0016 1c0002        	addw	x,#OFST-1
5600  0019 cd0000        	call	_SI446x_Write_Cmds
5602  001c 84            	pop	a
5603                     ; 626    SI446x_Read_Response( l_Cmd, 3 );
5605  001d 4b03          	push	#3
5606  001f 96            	ldw	x,sp
5607  0020 1c0002        	addw	x,#OFST-1
5608  0023 cd0000        	call	_SI446x_Read_Response
5610  0026 84            	pop	a
5611                     ; 628    return l_Cmd[ 1 ] & 0x0F;
5613  0027 7b02          	ld	a,(OFST-1,sp)
5614  0029 a40f          	and	a,#15
5617  002b 5b03          	addw	sp,#3
5618  002d 81            	ret
5653                     ; 638 void SI446x_Set_Power( uint8_t PowerLevel )
5653                     ; 639 {
5654                     .text:	section	.text,new
5655  0000               _SI446x_Set_Power:
5659                     ; 640     SI446x_Set_Property_1( PA_PWR_LVL, PowerLevel );
5661  0000 88            	push	a
5662  0001 ae2201        	ldw	x,#8705
5663  0004 cd0000        	call	_SI446x_Set_Property_1
5665  0007 84            	pop	a
5666                     ; 641 }
5669  0008 81            	ret
5694                     ; 649 void SI446x_Gpio_Init( void )
5694                     ; 650 {
5695                     .text:	section	.text,new
5696  0000               _SI446x_Gpio_Init:
5700                     ; 652 	GPIO_Init( SI4463_SDN_PORT, SI4463_SDN_PIN, GPIO_Mode_Out_PP_High_Fast );
5702  0000 4bf0          	push	#240
5703  0002 4b10          	push	#16
5704  0004 ae5005        	ldw	x,#20485
5705  0007 cd0000        	call	_GPIO_Init
5707  000a 85            	popw	x
5708                     ; 655 	GPIO_Init( SI4463_IRQ_PORT, SI4463_IRQ_PIN,GPIO_Mode_In_PU_No_IT );
5710  000b 4b40          	push	#64
5711  000d 4b01          	push	#1
5712  000f ae500a        	ldw	x,#20490
5713  0012 cd0000        	call	_GPIO_Init
5715  0015 85            	popw	x
5716                     ; 659 	GPIO_ResetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	//SDN 置低使能设备
5718  0016 4b10          	push	#16
5719  0018 ae5005        	ldw	x,#20485
5720  001b cd0000        	call	_GPIO_ResetBits
5722  001e 84            	pop	a
5723                     ; 660 }
5726  001f 81            	ret
5757                     ; 668 void SI446x_Init( void )
5757                     ; 669 {
5758                     .text:	section	.text,new
5759  0000               _SI446x_Init:
5763                     ; 670 	SI446x_Gpio_Init( );		//SI4463引脚初始化
5765  0000 cd0000        	call	_SI446x_Gpio_Init
5767                     ; 671 	SI446x_Reset( );			//SI4463复位
5769  0003 cd0000        	call	_SI446x_Reset
5771                     ; 672 	SI446x_Power_Up( 26000000 );//reset 后需要Power up设备 晶振30MHz
5773  0006 aeba80        	ldw	x,#47744
5774  0009 89            	pushw	x
5775  000a ae018c        	ldw	x,#396
5776  000d 89            	pushw	x
5777  000e cd0000        	call	_SI446x_Power_Up
5779  0011 5b04          	addw	sp,#4
5780                     ; 673 	SI446x_Config_Init( );		//SI4463模块初始化
5782  0013 cd0000        	call	_SI446x_Config_Init
5784                     ; 674 	SI446x_Set_Power( 0x7F );	//功率设置
5786  0016 a67f          	ld	a,#127
5787  0018 cd0000        	call	_SI446x_Set_Power
5789                     ; 675 	SI446x_Change_Status( 6 );	//切换到RX状态
5791  001b a606          	ld	a,#6
5792  001d cd0000        	call	_SI446x_Change_Status
5795  0020               L3732:
5796                     ; 676 	while( 6 != SI446x_Get_Device_Status( ));
5798  0020 cd0000        	call	_SI446x_Get_Device_Status
5800  0023 a106          	cp	a,#6
5801  0025 26f9          	jrne	L3732
5802                     ; 677 	SI446x_Start_Rx( 0, 0, PACKET_LENGTH,0,0,3 );
5804  0027 4b03          	push	#3
5805  0029 4b00          	push	#0
5806  002b 4b00          	push	#0
5807  002d 5f            	clrw	x
5808  002e 89            	pushw	x
5809  002f 5f            	clrw	x
5810  0030 4f            	clr	a
5811  0031 95            	ld	xh,a
5812  0032 cd0000        	call	_SI446x_Start_Rx
5814  0035 5b05          	addw	sp,#5
5815                     ; 679 }
5818  0037 81            	ret
5843                     	xdef	_SI446x_Init
5844                     	xdef	_SI446x_Config_Init
5845                     	xdef	_SI446x_Gpio_Init
5846                     	xdef	_SI446x_Set_Power
5847                     	xdef	_SI446x_Get_Device_Status
5848                     	xdef	_SI446x_Change_Status
5849                     	xdef	_SI446x_Get_Fifo_Information
5850                     	xdef	_SI446x_Get_Packet_Information
5851                     	xdef	_SI446x_Start_Rx
5852                     	xdef	_SI446x_Read_Packet
5853                     	xdef	_SI446x_Start_Tx
5854                     	xdef	_SI446x_Send_Packet
5855                     	xdef	_SI446x_Reset_TxFifo
5856                     	xdef	_SI446x_Reset_RxFifo
5857                     	xdef	_SI446x_Write_TxFifo
5858                     	xdef	_SI446x_Config_Gpio
5859                     	xdef	_SI446x_Reset
5860                     	xdef	_SI446x_Get_Property_1
5861                     	xdef	_SI446x_Set_Property_1
5862                     	xdef	_SI446x_Set_Property
5863                     	xdef	_SI446x_Get_Property
5864                     	xdef	_SI446x_Interrupt_Status
5865                     	xdef	_SI446x_Get_Fun_Informatoin
5866                     	xdef	_SI446x_Get_Part_Informatoin
5867                     	xdef	_SI446x_Nop
5868                     	xdef	_SI446x_Read_Response
5869                     	xdef	_SI446x_Power_Up
5870                     	xdef	_SI446x_Write_Cmds
5871                     	xdef	_SI446x_Wait_Cts
5872                     	xref	_delay_ms
5873                     	xref	_drv_spi_read_write_byte
5874                     	xref	_GPIO_ResetBits
5875                     	xref	_GPIO_SetBits
5876                     	xref	_GPIO_Init
5877                     	xref.b	c_x
5896                     	xref	c_xymvx
5897                     	end
