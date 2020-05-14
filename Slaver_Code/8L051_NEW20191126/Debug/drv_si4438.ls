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
  28  000a 10            	dc.b	16
  29  000b 00            	dc.b	0
  30  000c 61            	dc.b	97
  31  000d 60            	dc.b	96
  32  000e 67            	dc.b	103
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
  48  001e 06            	dc.b	6
  49  001f 11            	dc.b	17
  50  0020 01            	dc.b	1
  51  0021 02            	dc.b	2
  52  0022 00            	dc.b	0
  53  0023 01            	dc.b	1
  54  0024 30            	dc.b	48
  55  0025 08            	dc.b	8
  56  0026 11            	dc.b	17
  57  0027 02            	dc.b	2
  58  0028 04            	dc.b	4
  59  0029 00            	dc.b	0
  60  002a 00            	dc.b	0
  61  002b 00            	dc.b	0
  62  002c 00            	dc.b	0
  63  002d 00            	dc.b	0
  64  002e 0d            	dc.b	13
  65  002f 11            	dc.b	17
  66  0030 10            	dc.b	16
  67  0031 09            	dc.b	9
  68  0032 00            	dc.b	0
  69  0033 08            	dc.b	8
  70  0034 14            	dc.b	20
  71  0035 00            	dc.b	0
  72  0036 0f            	dc.b	15
  73  0037 31            	dc.b	49
  74  0038 00            	dc.b	0
  75  0039 00            	dc.b	0
  76  003a 00            	dc.b	0
  77  003b 00            	dc.b	0
  78  003c 09            	dc.b	9
  79  003d 11            	dc.b	17
  80  003e 11            	dc.b	17
  81  003f 05            	dc.b	5
  82  0040 00            	dc.b	0
  83  0041 01            	dc.b	1
  84  0042 b4            	dc.b	180
  85  0043 2b            	dc.b	43
  86  0044 00            	dc.b	0
  87  0045 00            	dc.b	0
  88  0046 0b            	dc.b	11
  89  0047 11            	dc.b	17
  90  0048 12            	dc.b	18
  91  0049 07            	dc.b	7
  92  004a 00            	dc.b	0
  93  004b 84            	dc.b	132
  94  004c 01            	dc.b	1
  95  004d 08            	dc.b	8
  96  004e ff            	dc.b	255
  97  004f ff            	dc.b	255
  98  0050 00            	dc.b	0
  99  0051 02            	dc.b	2
 100  0052 10            	dc.b	16
 101  0053 11            	dc.b	17
 102  0054 12            	dc.b	18
 103  0055 0c            	dc.b	12
 104  0056 08            	dc.b	8
 105  0057 00            	dc.b	0
 106  0058 00            	dc.b	0
 107  0059 00            	dc.b	0
 108  005a 30            	dc.b	48
 109  005b 30            	dc.b	48
 110  005c 00            	dc.b	0
 111  005d 01            	dc.b	1
 112  005e 04            	dc.b	4
 113  005f 80            	dc.b	128
 114  0060 00            	dc.b	0
 115  0061 07            	dc.b	7
 116  0062 00            	dc.b	0
 117  0063 10            	dc.b	16
 118  0064 11            	dc.b	17
 119  0065 12            	dc.b	18
 120  0066 0c            	dc.b	12
 121  0067 14            	dc.b	20
 122  0068 00            	dc.b	0
 123  0069 00            	dc.b	0
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
 134  0074 10            	dc.b	16
 135  0075 11            	dc.b	17
 136  0076 12            	dc.b	18
 137  0077 0c            	dc.b	12
 138  0078 20            	dc.b	32
 139  0079 00            	dc.b	0
 140  007a 00            	dc.b	0
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
 151  0085 0d            	dc.b	13
 152  0086 11            	dc.b	17
 153  0087 12            	dc.b	18
 154  0088 09            	dc.b	9
 155  0089 2c            	dc.b	44
 156  008a 00            	dc.b	0
 157  008b 00            	dc.b	0
 158  008c 00            	dc.b	0
 159  008d 00            	dc.b	0
 160  008e 00            	dc.b	0
 161  008f 00            	dc.b	0
 162  0090 00            	dc.b	0
 163  0091 00            	dc.b	0
 164  0092 00            	dc.b	0
 165  0093 10            	dc.b	16
 166  0094 11            	dc.b	17
 167  0095 20            	dc.b	32
 168  0096 0c            	dc.b	12
 169  0097 00            	dc.b	0
 170  0098 03            	dc.b	3
 171  0099 00            	dc.b	0
 172  009a 07            	dc.b	7
 173  009b 00            	dc.b	0
 174  009c 9c            	dc.b	156
 175  009d 40            	dc.b	64
 176  009e 05            	dc.b	5
 177  009f 8c            	dc.b	140
 178  00a0 ba            	dc.b	186
 179  00a1 80            	dc.b	128
 180  00a2 00            	dc.b	0
 181  00a3 06            	dc.b	6
 182  00a4 05            	dc.b	5
 183  00a5 11            	dc.b	17
 184  00a6 20            	dc.b	32
 185  00a7 01            	dc.b	1
 186  00a8 0c            	dc.b	12
 187  00a9 4d            	dc.b	77
 188  00aa 0c            	dc.b	12
 189  00ab 11            	dc.b	17
 190  00ac 20            	dc.b	32
 191  00ad 08            	dc.b	8
 192  00ae 18            	dc.b	24
 193  00af 01            	dc.b	1
 194  00b0 80            	dc.b	128
 195  00b1 08            	dc.b	8
 196  00b2 03            	dc.b	3
 197  00b3 80            	dc.b	128
 198  00b4 00            	dc.b	0
 199  00b5 24            	dc.b	36
 200  00b6 20            	dc.b	32
 201  00b7 0d            	dc.b	13
 202  00b8 11            	dc.b	17
 203  00b9 20            	dc.b	32
 204  00ba 09            	dc.b	9
 205  00bb 22            	dc.b	34
 206  00bc 03            	dc.b	3
 207  00bd 2d            	dc.b	45
 208  00be 00            	dc.b	0
 209  00bf a1            	dc.b	161
 210  00c0 52            	dc.b	82
 211  00c1 00            	dc.b	0
 212  00c2 51            	dc.b	81
 213  00c3 02            	dc.b	2
 214  00c4 c2            	dc.b	194
 215  00c5 0b            	dc.b	11
 216  00c6 11            	dc.b	17
 217  00c7 20            	dc.b	32
 218  00c8 07            	dc.b	7
 219  00c9 2c            	dc.b	44
 220  00ca 04            	dc.b	4
 221  00cb 36            	dc.b	54
 222  00cc 80            	dc.b	128
 223  00cd 01            	dc.b	1
 224  00ce 7a            	dc.b	122
 225  00cf 27            	dc.b	39
 226  00d0 80            	dc.b	128
 227  00d1 05            	dc.b	5
 228  00d2 11            	dc.b	17
 229  00d3 20            	dc.b	32
 230  00d4 01            	dc.b	1
 231  00d5 35            	dc.b	53
 232  00d6 e2            	dc.b	226
 233  00d7 07            	dc.b	7
 234  00d8 11            	dc.b	17
 235  00d9 20            	dc.b	32
 236  00da 03            	dc.b	3
 237  00db 38            	dc.b	56
 238  00dc 11            	dc.b	17
 239  00dd b2            	dc.b	178
 240  00de b2            	dc.b	178
 241  00df 05            	dc.b	5
 242  00e0 11            	dc.b	17
 243  00e1 20            	dc.b	32
 244  00e2 01            	dc.b	1
 245  00e3 40            	dc.b	64
 246  00e4 2b            	dc.b	43
 247  00e5 0d            	dc.b	13
 248  00e6 11            	dc.b	17
 249  00e7 20            	dc.b	32
 250  00e8 09            	dc.b	9
 251  00e9 42            	dc.b	66
 252  00ea a4            	dc.b	164
 253  00eb 02            	dc.b	2
 254  00ec d6            	dc.b	214
 255  00ed 82            	dc.b	130
 256  00ee 06            	dc.b	6
 257  00ef 3d            	dc.b	61
 258  00f0 01            	dc.b	1
 259  00f1 80            	dc.b	128
 260  00f2 ff            	dc.b	255
 261  00f3 05            	dc.b	5
 262  00f4 11            	dc.b	17
 263  00f5 20            	dc.b	32
 264  00f6 01            	dc.b	1
 265  00f7 4c            	dc.b	76
 266  00f8 00            	dc.b	0
 267  00f9 05            	dc.b	5
 268  00fa 11            	dc.b	17
 269  00fb 20            	dc.b	32
 270  00fc 01            	dc.b	1
 271  00fd 4e            	dc.b	78
 272  00fe 40            	dc.b	64
 273  00ff 05            	dc.b	5
 274  0100 11            	dc.b	17
 275  0101 20            	dc.b	32
 276  0102 01            	dc.b	1
 277  0103 51            	dc.b	81
 278  0104 0a            	dc.b	10
 279  0105 10            	dc.b	16
 280  0106 11            	dc.b	17
 281  0107 21            	dc.b	33
 282  0108 0c            	dc.b	12
 283  0109 00            	dc.b	0
 284  010a a2            	dc.b	162
 285  010b 81            	dc.b	129
 286  010c 26            	dc.b	38
 287  010d af            	dc.b	175
 288  010e 3f            	dc.b	63
 289  010f ee            	dc.b	238
 290  0110 c8            	dc.b	200
 291  0111 c7            	dc.b	199
 292  0112 db            	dc.b	219
 293  0113 f2            	dc.b	242
 294  0114 02            	dc.b	2
 295  0115 08            	dc.b	8
 296  0116 10            	dc.b	16
 297  0117 11            	dc.b	17
 298  0118 21            	dc.b	33
 299  0119 0c            	dc.b	12
 300  011a 0c            	dc.b	12
 301  011b 07            	dc.b	7
 302  011c 03            	dc.b	3
 303  011d 15            	dc.b	21
 304  011e fc            	dc.b	252
 305  011f 0f            	dc.b	15
 306  0120 00            	dc.b	0
 307  0121 a2            	dc.b	162
 308  0122 81            	dc.b	129
 309  0123 26            	dc.b	38
 310  0124 af            	dc.b	175
 311  0125 3f            	dc.b	63
 312  0126 ee            	dc.b	238
 313  0127 10            	dc.b	16
 314  0128 11            	dc.b	17
 315  0129 21            	dc.b	33
 316  012a 0c            	dc.b	12
 317  012b 18            	dc.b	24
 318  012c c8            	dc.b	200
 319  012d c7            	dc.b	199
 320  012e db            	dc.b	219
 321  012f f2            	dc.b	242
 322  0130 02            	dc.b	2
 323  0131 08            	dc.b	8
 324  0132 07            	dc.b	7
 325  0133 03            	dc.b	3
 326  0134 15            	dc.b	21
 327  0135 fc            	dc.b	252
 328  0136 0f            	dc.b	15
 329  0137 00            	dc.b	0
 330  0138 08            	dc.b	8
 331  0139 11            	dc.b	17
 332  013a 22            	dc.b	34
 333  013b 04            	dc.b	4
 334  013c 00            	dc.b	0
 335  013d 08            	dc.b	8
 336  013e 7f            	dc.b	127
 337  013f 00            	dc.b	0
 338  0140 3d            	dc.b	61
 339  0141 0b            	dc.b	11
 340  0142 11            	dc.b	17
 341  0143 23            	dc.b	35
 342  0144 07            	dc.b	7
 343  0145 00            	dc.b	0
 344  0146 2c            	dc.b	44
 345  0147 0e            	dc.b	14
 346  0148 0b            	dc.b	11
 347  0149 04            	dc.b	4
 348  014a 0c            	dc.b	12
 349  014b 73            	dc.b	115
 350  014c 03            	dc.b	3
 351  014d 10            	dc.b	16
 352  014e 11            	dc.b	17
 353  014f 30            	dc.b	48
 354  0150 0c            	dc.b	12
 355  0151 00            	dc.b	0
 356  0152 00            	dc.b	0
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
 368  015e 0c            	dc.b	12
 369  015f 11            	dc.b	17
 370  0160 40            	dc.b	64
 371  0161 08            	dc.b	8
 372  0162 00            	dc.b	0
 373  0163 41            	dc.b	65
 374  0164 0c            	dc.b	12
 375  0165 ec            	dc.b	236
 376  0166 4e            	dc.b	78
 377  0167 4e            	dc.b	78
 378  0168 c5            	dc.b	197
 379  0169 20            	dc.b	32
 380  016a fe            	dc.b	254
 381  016b 00            	dc.b	0
 434                     ; 30 void SI446x_Wait_Cts( void )
 434                     ; 31 {
 436                     .text:	section	.text,new
 437  0000               _SI446x_Wait_Cts:
 439  0000 5203          	subw	sp,#3
 440       00000003      OFST:	set	3
 443                     ; 33 	uint16_t l_ReadCtsTimes = 0;
 445  0002 5f            	clrw	x
 446  0003 1f01          	ldw	(OFST-2,sp),x
 447  0005               L53:
 448                     ; 37         SI_SET_CSN_LOW( );		//SPI片选
 450  0005 4b02          	push	#2
 451  0007 ae5005        	ldw	x,#20485
 452  000a cd0000        	call	_GPIO_ResetBits
 454  000d 84            	pop	a
 455                     ; 40         drv_spi_read_write_byte( READ_CMD_BUFF );
 457  000e a644          	ld	a,#68
 458  0010 cd0000        	call	_drv_spi_read_write_byte
 460                     ; 41         l_Cts = drv_spi_read_write_byte( 0xFF );		
 462  0013 a6ff          	ld	a,#255
 463  0015 cd0000        	call	_drv_spi_read_write_byte
 465  0018 6b03          	ld	(OFST+0,sp),a
 466                     ; 43         SI_SET_CSN_HIGH( );		//取消SPI片选
 468  001a 4b02          	push	#2
 469  001c ae5005        	ldw	x,#20485
 470  001f cd0000        	call	_GPIO_SetBits
 472  0022 84            	pop	a
 473                     ; 45 		if( 1000 == l_ReadCtsTimes++ )
 475  0023 1e01          	ldw	x,(OFST-2,sp)
 476  0025 1c0001        	addw	x,#1
 477  0028 1f01          	ldw	(OFST-2,sp),x
 478  002a 1d0001        	subw	x,#1
 479  002d a303e8        	cpw	x,#1000
 480  0030 2605          	jrne	L73
 481                     ; 47 			SI446x_Init( );
 483  0032 cd0000        	call	_SI446x_Init
 485                     ; 48 			break;
 487  0035 2006          	jra	L14
 488  0037               L73:
 489                     ; 51 	}while( l_Cts != 0xFF );	//直到读CTS的返回值等于0xFF
 491  0037 7b03          	ld	a,(OFST+0,sp)
 492  0039 a1ff          	cp	a,#255
 493  003b 26c8          	jrne	L53
 494  003d               L14:
 495                     ; 52 }
 498  003d 5b03          	addw	sp,#3
 499  003f 81            	ret
 547                     ; 62 void SI446x_Write_Cmds( uint8_t *pCmd, uint8_t CmdNumber )
 547                     ; 63 {
 548                     .text:	section	.text,new
 549  0000               _SI446x_Write_Cmds:
 551  0000 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 64     SI446x_Wait_Cts( );			//查询CTS状态
 557  0001 cd0000        	call	_SI446x_Wait_Cts
 559                     ; 66     SI_SET_CSN_LOW( );			//SPI片选
 561  0004 4b02          	push	#2
 562  0006 ae5005        	ldw	x,#20485
 563  0009 cd0000        	call	_GPIO_ResetBits
 565  000c 84            	pop	a
 567  000d 200d          	jra	L17
 568  000f               L76:
 569                     ; 70         drv_spi_read_write_byte( *pCmd );	//发送命令
 571  000f 1e01          	ldw	x,(OFST+1,sp)
 572  0011 f6            	ld	a,(x)
 573  0012 cd0000        	call	_drv_spi_read_write_byte
 575                     ; 71 		pCmd++;
 577  0015 1e01          	ldw	x,(OFST+1,sp)
 578  0017 1c0001        	addw	x,#1
 579  001a 1f01          	ldw	(OFST+1,sp),x
 580  001c               L17:
 581                     ; 68     while( CmdNumber -- )
 583  001c 7b05          	ld	a,(OFST+5,sp)
 584  001e 0a05          	dec	(OFST+5,sp)
 585  0020 4d            	tnz	a
 586  0021 26ec          	jrne	L76
 587                     ; 74     SI_SET_CSN_HIGH( );			//取消SPI片选
 589  0023 4b02          	push	#2
 590  0025 ae5005        	ldw	x,#20485
 591  0028 cd0000        	call	_GPIO_SetBits
 593  002b 84            	pop	a
 594                     ; 75 }
 597  002c 85            	popw	x
 598  002d 81            	ret
 601                     	switch	.const
 602  016c               L57_l_Cmd:
 603  016c 00            	dc.b	0
 604  016d 000000000000  	ds.b	6
 647                     ; 84 void SI446x_Power_Up( uint32_t Xo_Freq )
 647                     ; 85 {
 648                     .text:	section	.text,new
 649  0000               _SI446x_Power_Up:
 651  0000 5207          	subw	sp,#7
 652       00000007      OFST:	set	7
 655                     ; 86     uint8_t l_Cmd[7] = { 0 };
 657  0002 96            	ldw	x,sp
 658  0003 1c0001        	addw	x,#OFST-6
 659  0006 90ae016c      	ldw	y,#L57_l_Cmd
 660  000a a607          	ld	a,#7
 661  000c cd0000        	call	c_xymvx
 663                     ; 88     l_Cmd[0] = POWER_UP;		//Power_Up命令
 665  000f a602          	ld	a,#2
 666  0011 6b01          	ld	(OFST-6,sp),a
 667                     ; 89     l_Cmd[1] = 0x01;
 669  0013 a601          	ld	a,#1
 670  0015 6b02          	ld	(OFST-5,sp),a
 671                     ; 90     l_Cmd[2] = 0x00;
 673  0017 0f03          	clr	(OFST-4,sp)
 674                     ; 91     l_Cmd[3] = Xo_Freq >> 24;
 676  0019 7b0a          	ld	a,(OFST+3,sp)
 677  001b 6b04          	ld	(OFST-3,sp),a
 678                     ; 92     l_Cmd[4] = Xo_Freq >> 16;
 680  001d 7b0b          	ld	a,(OFST+4,sp)
 681  001f 6b05          	ld	(OFST-2,sp),a
 682                     ; 93     l_Cmd[5] = Xo_Freq >> 8;
 684  0021 7b0c          	ld	a,(OFST+5,sp)
 685  0023 6b06          	ld	(OFST-1,sp),a
 686                     ; 94     l_Cmd[6] = Xo_Freq;
 688  0025 7b0d          	ld	a,(OFST+6,sp)
 689  0027 6b07          	ld	(OFST+0,sp),a
 690                     ; 95     SI446x_Write_Cmds( l_Cmd, 7 );	//写命令
 692  0029 4b07          	push	#7
 693  002b 96            	ldw	x,sp
 694  002c 1c0002        	addw	x,#OFST-5
 695  002f cd0000        	call	_SI446x_Write_Cmds
 697  0032 84            	pop	a
 698                     ; 96 }
 701  0033 5b07          	addw	sp,#7
 702  0035 81            	ret
 751                     ; 106 void SI446x_Read_Response( uint8_t *pRead, uint8_t Length )
 751                     ; 107 {
 752                     .text:	section	.text,new
 753  0000               _SI446x_Read_Response:
 755  0000 89            	pushw	x
 756       00000000      OFST:	set	0
 759                     ; 108     SI446x_Wait_Cts( );		//查询CTS状态
 761  0001 cd0000        	call	_SI446x_Wait_Cts
 763                     ; 109     SI_SET_CSN_LOW( );		//SPI片选
 765  0004 4b02          	push	#2
 766  0006 ae5005        	ldw	x,#20485
 767  0009 cd0000        	call	_GPIO_ResetBits
 769  000c 84            	pop	a
 770                     ; 111 	drv_spi_read_write_byte( READ_CMD_BUFF );	//发送读命令
 772  000d a644          	ld	a,#68
 773  000f cd0000        	call	_drv_spi_read_write_byte
 776  0012 200f          	jra	L541
 777  0014               L341:
 778                     ; 114         *pRead = drv_spi_read_write_byte( 0xFF );	//交换数据
 780  0014 a6ff          	ld	a,#255
 781  0016 cd0000        	call	_drv_spi_read_write_byte
 783  0019 1e01          	ldw	x,(OFST+1,sp)
 784  001b f7            	ld	(x),a
 785                     ; 115 		pRead++;
 787  001c 1e01          	ldw	x,(OFST+1,sp)
 788  001e 1c0001        	addw	x,#1
 789  0021 1f01          	ldw	(OFST+1,sp),x
 790  0023               L541:
 791                     ; 112 	while( Length-- )
 793  0023 7b05          	ld	a,(OFST+5,sp)
 794  0025 0a05          	dec	(OFST+5,sp)
 795  0027 4d            	tnz	a
 796  0028 26ea          	jrne	L341
 797                     ; 118     SI_SET_CSN_HIGH( );		//SPI取消片选
 799  002a 4b02          	push	#2
 800  002c ae5005        	ldw	x,#20485
 801  002f cd0000        	call	_GPIO_SetBits
 803  0032 84            	pop	a
 804                     ; 120 }
 807  0033 85            	popw	x
 808  0034 81            	ret
 845                     ; 128 uint8_t SI446x_Nop( void )
 845                     ; 129 {
 846                     .text:	section	.text,new
 847  0000               _SI446x_Nop:
 849  0000 88            	push	a
 850       00000001      OFST:	set	1
 853                     ; 132     SI_SET_CSN_LOW( );		//SPI片选
 855  0001 4b02          	push	#2
 856  0003 ae5005        	ldw	x,#20485
 857  0006 cd0000        	call	_GPIO_ResetBits
 859  0009 84            	pop	a
 860                     ; 134     l_Cts = drv_spi_read_write_byte( NOP );	//空操作命令
 862  000a 4f            	clr	a
 863  000b cd0000        	call	_drv_spi_read_write_byte
 865  000e 6b01          	ld	(OFST+0,sp),a
 866                     ; 136     SI_SET_CSN_HIGH( );		//SPI取消片选
 868  0010 4b02          	push	#2
 869  0012 ae5005        	ldw	x,#20485
 870  0015 cd0000        	call	_GPIO_SetBits
 872  0018 84            	pop	a
 873                     ; 138 	return l_Cts;
 875  0019 7b01          	ld	a,(OFST+0,sp)
 878  001b 5b01          	addw	sp,#1
 879  001d 81            	ret
 926                     ; 148 void SI446x_Get_Part_Informatoin( uint8_t *pRead )
 926                     ; 149 {
 927                     .text:	section	.text,new
 928  0000               _SI446x_Get_Part_Informatoin:
 930  0000 89            	pushw	x
 931  0001 88            	push	a
 932       00000001      OFST:	set	1
 935                     ; 150     uint8_t l_Cmd = PART_INFO;
 937  0002 a601          	ld	a,#1
 938  0004 6b01          	ld	(OFST+0,sp),a
 939                     ; 152     SI446x_Write_Cmds( &l_Cmd, 1 );		//命令
 941  0006 4b01          	push	#1
 942  0008 96            	ldw	x,sp
 943  0009 1c0002        	addw	x,#OFST+1
 944  000c cd0000        	call	_SI446x_Write_Cmds
 946  000f 84            	pop	a
 947                     ; 153     SI446x_Read_Response( pRead, 8 );	//读设备基本信息
 949  0010 4b08          	push	#8
 950  0012 1e03          	ldw	x,(OFST+2,sp)
 951  0014 cd0000        	call	_SI446x_Read_Response
 953  0017 84            	pop	a
 954                     ; 155 }
 957  0018 5b03          	addw	sp,#3
 958  001a 81            	ret
1005                     ; 164 void SI446x_Get_Fun_Informatoin( uint8_t *pRead )
1005                     ; 165 {
1006                     .text:	section	.text,new
1007  0000               _SI446x_Get_Fun_Informatoin:
1009  0000 89            	pushw	x
1010  0001 88            	push	a
1011       00000001      OFST:	set	1
1014                     ; 166     uint8_t l_Cmd = FUNC_INFO;
1016  0002 a610          	ld	a,#16
1017  0004 6b01          	ld	(OFST+0,sp),a
1018                     ; 168     SI446x_Write_Cmds( &l_Cmd, 1 );		//命令
1020  0006 4b01          	push	#1
1021  0008 96            	ldw	x,sp
1022  0009 1c0002        	addw	x,#OFST+1
1023  000c cd0000        	call	_SI446x_Write_Cmds
1025  000f 84            	pop	a
1026                     ; 169     SI446x_Read_Response( pRead, 7 );	//读设备功能版本信息
1028  0010 4b07          	push	#7
1029  0012 1e03          	ldw	x,(OFST+2,sp)
1030  0014 cd0000        	call	_SI446x_Read_Response
1032  0017 84            	pop	a
1033                     ; 170 }
1036  0018 5b03          	addw	sp,#3
1037  001a 81            	ret
1040                     	switch	.const
1041  0173               L332_l_Cmd:
1042  0173 00            	dc.b	0
1043  0174 000000        	ds.b	3
1089                     ; 179 void SI446x_Interrupt_Status( uint8_t *pRead )
1089                     ; 180 {
1090                     .text:	section	.text,new
1091  0000               _SI446x_Interrupt_Status:
1093  0000 89            	pushw	x
1094  0001 5204          	subw	sp,#4
1095       00000004      OFST:	set	4
1098                     ; 181     uint8_t l_Cmd[ 4 ] = { 0 };
1100  0003 96            	ldw	x,sp
1101  0004 1c0001        	addw	x,#OFST-3
1102  0007 90ae0173      	ldw	y,#L332_l_Cmd
1103  000b a604          	ld	a,#4
1104  000d cd0000        	call	c_xymvx
1106                     ; 183     l_Cmd[0] = GET_INT_STATUS;		
1108  0010 a620          	ld	a,#32
1109  0012 6b01          	ld	(OFST-3,sp),a
1110                     ; 184     l_Cmd[1] = 0;
1112  0014 0f02          	clr	(OFST-2,sp)
1113                     ; 185     l_Cmd[2] = 0;
1115  0016 0f03          	clr	(OFST-1,sp)
1116                     ; 186     l_Cmd[3] = 0;
1118  0018 0f04          	clr	(OFST+0,sp)
1119                     ; 188     SI446x_Write_Cmds( l_Cmd, 4 );		//发送中断读取命令
1121  001a 4b04          	push	#4
1122  001c 96            	ldw	x,sp
1123  001d 1c0002        	addw	x,#OFST-2
1124  0020 cd0000        	call	_SI446x_Write_Cmds
1126  0023 84            	pop	a
1127                     ; 189     SI446x_Read_Response( pRead, 9 );	//读取状态
1129  0024 4b09          	push	#9
1130  0026 1e06          	ldw	x,(OFST+2,sp)
1131  0028 cd0000        	call	_SI446x_Read_Response
1133  002b 84            	pop	a
1134                     ; 190 }
1137  002c 5b06          	addw	sp,#6
1138  002e 81            	ret
1141                     	switch	.const
1142  0177               L752_l_Cmd:
1143  0177 00            	dc.b	0
1144  0178 000000        	ds.b	3
3460                     ; 201 void SI446x_Get_Property( SI446X_PROPERTY Group_Num, uint8_t Num_Props, uint8_t *pRead  )
3460                     ; 202 {
3461                     .text:	section	.text,new
3462  0000               _SI446x_Get_Property:
3464  0000 89            	pushw	x
3465  0001 5204          	subw	sp,#4
3466       00000004      OFST:	set	4
3469                     ; 203     uint8_t l_Cmd[ 4 ] = { 0 };
3471  0003 96            	ldw	x,sp
3472  0004 1c0001        	addw	x,#OFST-3
3473  0007 90ae0177      	ldw	y,#L752_l_Cmd
3474  000b a604          	ld	a,#4
3475  000d cd0000        	call	c_xymvx
3477                     ; 205     l_Cmd[ 0 ] = GET_PROPERTY;
3479  0010 a612          	ld	a,#18
3480  0012 6b01          	ld	(OFST-3,sp),a
3481                     ; 206     l_Cmd[ 1 ] = Group_Num >> 8;
3483  0014 7b05          	ld	a,(OFST+1,sp)
3484  0016 6b02          	ld	(OFST-2,sp),a
3485                     ; 207     l_Cmd[ 2 ] = Num_Props;
3487  0018 7b09          	ld	a,(OFST+5,sp)
3488  001a 6b03          	ld	(OFST-1,sp),a
3489                     ; 208     l_Cmd[ 3 ] = Group_Num;
3491  001c 7b06          	ld	a,(OFST+2,sp)
3492  001e 6b04          	ld	(OFST+0,sp),a
3493                     ; 210     SI446x_Write_Cmds( l_Cmd, 4 );		//发送读取属性命令
3495  0020 4b04          	push	#4
3496  0022 96            	ldw	x,sp
3497  0023 1c0002        	addw	x,#OFST-2
3498  0026 cd0000        	call	_SI446x_Write_Cmds
3500  0029 84            	pop	a
3501                     ; 211     SI446x_Read_Response( pRead, Num_Props + 1 );	//读属性
3503  002a 7b09          	ld	a,(OFST+5,sp)
3504  002c 4c            	inc	a
3505  002d 88            	push	a
3506  002e 1e0b          	ldw	x,(OFST+7,sp)
3507  0030 cd0000        	call	_SI446x_Read_Response
3509  0033 84            	pop	a
3510                     ; 212 }
3513  0034 5b06          	addw	sp,#6
3514  0036 81            	ret
3517                     	switch	.const
3518  017b               L3341_l_Cmd:
3519  017b 00            	dc.b	0
3520  017c 000000000000  	ds.b	19
3593                     ; 223 void SI446x_Set_Property( SI446X_PROPERTY Group_Num, uint8_t Num_Props, uint8_t *pWrite )
3593                     ; 224 {
3594                     .text:	section	.text,new
3595  0000               _SI446x_Set_Property:
3597  0000 89            	pushw	x
3598  0001 5217          	subw	sp,#23
3599       00000017      OFST:	set	23
3602                     ; 225     uint8_t l_Cmd[ 20 ] = { 0 }, i = 0;
3604  0003 96            	ldw	x,sp
3605  0004 1c0003        	addw	x,#OFST-20
3606  0007 90ae017b      	ldw	y,#L3341_l_Cmd
3607  000b a614          	ld	a,#20
3608  000d cd0000        	call	c_xymvx
3612  0010 0f17          	clr	(OFST+0,sp)
3613                     ; 227     if( Num_Props >= 16 )   
3615  0012 7b1c          	ld	a,(OFST+5,sp)
3616  0014 a110          	cp	a,#16
3617  0016 2503          	jrult	L23
3618  0018 cc009c        	jp	L03
3619  001b               L23:
3620                     ; 229 		return; 	//数量不大于16
3622                     ; 232     l_Cmd[ i++ ] = SET_PROPERTY;		//设置属性命令
3624  001b 96            	ldw	x,sp
3625  001c 1c0003        	addw	x,#OFST-20
3626  001f 1f01          	ldw	(OFST-22,sp),x
3627  0021 7b17          	ld	a,(OFST+0,sp)
3628  0023 97            	ld	xl,a
3629  0024 0c17          	inc	(OFST+0,sp)
3630  0026 9f            	ld	a,xl
3631  0027 5f            	clrw	x
3632  0028 97            	ld	xl,a
3633  0029 72fb01        	addw	x,(OFST-22,sp)
3634  002c a611          	ld	a,#17
3635  002e f7            	ld	(x),a
3636                     ; 233     l_Cmd[ i++ ] = Group_Num >> 8;
3638  002f 96            	ldw	x,sp
3639  0030 1c0003        	addw	x,#OFST-20
3640  0033 1f01          	ldw	(OFST-22,sp),x
3641  0035 7b17          	ld	a,(OFST+0,sp)
3642  0037 97            	ld	xl,a
3643  0038 0c17          	inc	(OFST+0,sp)
3644  003a 9f            	ld	a,xl
3645  003b 5f            	clrw	x
3646  003c 97            	ld	xl,a
3647  003d 72fb01        	addw	x,(OFST-22,sp)
3648  0040 7b18          	ld	a,(OFST+1,sp)
3649  0042 f7            	ld	(x),a
3650                     ; 234     l_Cmd[ i++ ] = Num_Props;
3652  0043 96            	ldw	x,sp
3653  0044 1c0003        	addw	x,#OFST-20
3654  0047 1f01          	ldw	(OFST-22,sp),x
3655  0049 7b17          	ld	a,(OFST+0,sp)
3656  004b 97            	ld	xl,a
3657  004c 0c17          	inc	(OFST+0,sp)
3658  004e 9f            	ld	a,xl
3659  004f 5f            	clrw	x
3660  0050 97            	ld	xl,a
3661  0051 72fb01        	addw	x,(OFST-22,sp)
3662  0054 7b1c          	ld	a,(OFST+5,sp)
3663  0056 f7            	ld	(x),a
3664                     ; 235     l_Cmd[ i++ ] = Group_Num;
3666  0057 96            	ldw	x,sp
3667  0058 1c0003        	addw	x,#OFST-20
3668  005b 1f01          	ldw	(OFST-22,sp),x
3669  005d 7b17          	ld	a,(OFST+0,sp)
3670  005f 97            	ld	xl,a
3671  0060 0c17          	inc	(OFST+0,sp)
3672  0062 9f            	ld	a,xl
3673  0063 5f            	clrw	x
3674  0064 97            	ld	xl,a
3675  0065 72fb01        	addw	x,(OFST-22,sp)
3676  0068 7b19          	ld	a,(OFST+2,sp)
3677  006a f7            	ld	(x),a
3679  006b 201d          	jra	L1051
3680  006d               L5741:
3681                     ; 239         l_Cmd[ i++ ] = *pWrite;
3683  006d 96            	ldw	x,sp
3684  006e 1c0003        	addw	x,#OFST-20
3685  0071 1f01          	ldw	(OFST-22,sp),x
3686  0073 7b17          	ld	a,(OFST+0,sp)
3687  0075 97            	ld	xl,a
3688  0076 0c17          	inc	(OFST+0,sp)
3689  0078 9f            	ld	a,xl
3690  0079 5f            	clrw	x
3691  007a 97            	ld	xl,a
3692  007b 72fb01        	addw	x,(OFST-22,sp)
3693  007e 161d          	ldw	y,(OFST+6,sp)
3694  0080 90f6          	ld	a,(y)
3695  0082 f7            	ld	(x),a
3696                     ; 240 		pWrite++;
3698  0083 1e1d          	ldw	x,(OFST+6,sp)
3699  0085 1c0001        	addw	x,#1
3700  0088 1f1d          	ldw	(OFST+6,sp),x
3701  008a               L1051:
3702                     ; 237     while( Num_Props-- )
3704  008a 7b1c          	ld	a,(OFST+5,sp)
3705  008c 0a1c          	dec	(OFST+5,sp)
3706  008e 4d            	tnz	a
3707  008f 26dc          	jrne	L5741
3708                     ; 242     SI446x_Write_Cmds( l_Cmd, i );		//发送命令及数据
3710  0091 7b17          	ld	a,(OFST+0,sp)
3711  0093 88            	push	a
3712  0094 96            	ldw	x,sp
3713  0095 1c0004        	addw	x,#OFST-19
3714  0098 cd0000        	call	_SI446x_Write_Cmds
3716  009b 84            	pop	a
3717                     ; 243 }
3718  009c               L03:
3721  009c 5b19          	addw	sp,#25
3722  009e 81            	ret
3725                     	switch	.const
3726  018f               L5051_l_Cmd:
3727  018f 00            	dc.b	0
3728  0190 00000000      	ds.b	4
3782                     ; 253 void SI446x_Set_Property_1( SI446X_PROPERTY Group_Num, uint8_t Start_Prop )
3782                     ; 254 {
3783                     .text:	section	.text,new
3784  0000               _SI446x_Set_Property_1:
3786  0000 89            	pushw	x
3787  0001 5205          	subw	sp,#5
3788       00000005      OFST:	set	5
3791                     ; 255     uint8_t l_Cmd[ 5 ] = { 0 };
3793  0003 96            	ldw	x,sp
3794  0004 1c0001        	addw	x,#OFST-4
3795  0007 90ae018f      	ldw	y,#L5051_l_Cmd
3796  000b a605          	ld	a,#5
3797  000d cd0000        	call	c_xymvx
3799                     ; 257     l_Cmd[ 0 ] = SET_PROPERTY;		//命令
3801  0010 a611          	ld	a,#17
3802  0012 6b01          	ld	(OFST-4,sp),a
3803                     ; 258     l_Cmd[ 1 ] = Group_Num >> 8;
3805  0014 7b06          	ld	a,(OFST+1,sp)
3806  0016 6b02          	ld	(OFST-3,sp),a
3807                     ; 259     l_Cmd[ 2 ] = 1;
3809  0018 a601          	ld	a,#1
3810  001a 6b03          	ld	(OFST-2,sp),a
3811                     ; 260     l_Cmd[ 3 ] = Group_Num;
3813  001c 7b07          	ld	a,(OFST+2,sp)
3814  001e 6b04          	ld	(OFST-1,sp),a
3815                     ; 261     l_Cmd[ 4 ] = Start_Prop;
3817  0020 7b0a          	ld	a,(OFST+5,sp)
3818  0022 6b05          	ld	(OFST+0,sp),a
3819                     ; 263     SI446x_Write_Cmds( l_Cmd, 5 );	//发送命令设置属性
3821  0024 4b05          	push	#5
3822  0026 96            	ldw	x,sp
3823  0027 1c0002        	addw	x,#OFST-3
3824  002a cd0000        	call	_SI446x_Write_Cmds
3826  002d 84            	pop	a
3827                     ; 264 }
3830  002e 5b07          	addw	sp,#7
3831  0030 81            	ret
3834                     	switch	.const
3835  0194               L5351_l_Cmd:
3836  0194 00            	dc.b	0
3837  0195 000000        	ds.b	3
3883                     ; 273 uint8_t SI446x_Get_Property_1( SI446X_PROPERTY Group_Num )
3883                     ; 274 {
3884                     .text:	section	.text,new
3885  0000               _SI446x_Get_Property_1:
3887  0000 89            	pushw	x
3888  0001 5204          	subw	sp,#4
3889       00000004      OFST:	set	4
3892                     ; 275     uint8_t l_Cmd[ 4 ] = { 0 };
3894  0003 96            	ldw	x,sp
3895  0004 1c0001        	addw	x,#OFST-3
3896  0007 90ae0194      	ldw	y,#L5351_l_Cmd
3897  000b a604          	ld	a,#4
3898  000d cd0000        	call	c_xymvx
3900                     ; 277     l_Cmd[ 0 ] = GET_PROPERTY;
3902  0010 a612          	ld	a,#18
3903  0012 6b01          	ld	(OFST-3,sp),a
3904                     ; 278     l_Cmd[ 1 ] = Group_Num >> 8;
3906  0014 7b05          	ld	a,(OFST+1,sp)
3907  0016 6b02          	ld	(OFST-2,sp),a
3908                     ; 279     l_Cmd[ 2 ] = 1;
3910  0018 a601          	ld	a,#1
3911  001a 6b03          	ld	(OFST-1,sp),a
3912                     ; 280     l_Cmd[ 3 ] = Group_Num;
3914  001c 7b06          	ld	a,(OFST+2,sp)
3915  001e 6b04          	ld	(OFST+0,sp),a
3916                     ; 281     SI446x_Write_Cmds( l_Cmd, 4 );		//发送命令
3918  0020 4b04          	push	#4
3919  0022 96            	ldw	x,sp
3920  0023 1c0002        	addw	x,#OFST-2
3921  0026 cd0000        	call	_SI446x_Write_Cmds
3923  0029 84            	pop	a
3924                     ; 283     SI446x_Read_Response( l_Cmd, 2 );	//读取属性
3926  002a 4b02          	push	#2
3927  002c 96            	ldw	x,sp
3928  002d 1c0002        	addw	x,#OFST-2
3929  0030 cd0000        	call	_SI446x_Read_Response
3931  0033 84            	pop	a
3932                     ; 285     return l_Cmd[ 1 ];
3934  0034 7b02          	ld	a,(OFST-2,sp)
3937  0036 5b06          	addw	sp,#6
3938  0038 81            	ret
3963                     ; 294 void SI446x_Reset( void )
3963                     ; 295 {
3964                     .text:	section	.text,new
3965  0000               _SI446x_Reset:
3969                     ; 296     SI_SET_SDN_HIGH( );		//关设备
3971  0000 72185005      	bset	20485,#4
3972                     ; 297 	  delay_ms( 1 );		//延时 等待设备完全断电
3974  0004 ae0001        	ldw	x,#1
3975  0007 cd0000        	call	_delay_ms
3977                     ; 298     SI_SET_SDN_LOW( );		//开设备
3979  000a 72195005      	bres	20485,#4
3980                     ; 299     SI_SET_CSN_HIGH( );		//取消SPI片选
3982  000e 4b02          	push	#2
3983  0010 ae5005        	ldw	x,#20485
3984  0013 cd0000        	call	_GPIO_SetBits
3986  0016 84            	pop	a
3987                     ; 300 }
3990  0017 81            	ret
3993                     	switch	.const
3994  0198               L1751_l_Cmd:
3995  0198 00            	dc.b	0
3996  0199 000000000000  	ds.b	9
4094                     ; 308 void SI446x_Config_Gpio( uint8_t Gpio_0, uint8_t Gpio_1, uint8_t Gpio_2, uint8_t Gpio_3, uint8_t Irq, uint8_t Sdo, uint8_t Gen_Config )
4094                     ; 309 {
4095                     .text:	section	.text,new
4096  0000               _SI446x_Config_Gpio:
4098  0000 89            	pushw	x
4099  0001 520a          	subw	sp,#10
4100       0000000a      OFST:	set	10
4103                     ; 310     uint8_t l_Cmd[ 10] = { 0 };
4105  0003 96            	ldw	x,sp
4106  0004 1c0001        	addw	x,#OFST-9
4107  0007 90ae0198      	ldw	y,#L1751_l_Cmd
4108  000b a60a          	ld	a,#10
4109  000d cd0000        	call	c_xymvx
4111                     ; 312     l_Cmd[ 0 ] = GPIO_PIN_CFG;
4113  0010 a613          	ld	a,#19
4114  0012 6b01          	ld	(OFST-9,sp),a
4115                     ; 313     l_Cmd[ 1 ] = Gpio_0;
4117  0014 7b0b          	ld	a,(OFST+1,sp)
4118  0016 6b02          	ld	(OFST-8,sp),a
4119                     ; 314     l_Cmd[ 2 ] = Gpio_1;
4121  0018 7b0c          	ld	a,(OFST+2,sp)
4122  001a 6b03          	ld	(OFST-7,sp),a
4123                     ; 315     l_Cmd[ 3 ] = Gpio_2;
4125  001c 7b0f          	ld	a,(OFST+5,sp)
4126  001e 6b04          	ld	(OFST-6,sp),a
4127                     ; 316     l_Cmd[ 4 ] = Gpio_3;
4129  0020 7b10          	ld	a,(OFST+6,sp)
4130  0022 6b05          	ld	(OFST-5,sp),a
4131                     ; 317     l_Cmd[ 5 ] = Irq;
4133  0024 7b11          	ld	a,(OFST+7,sp)
4134  0026 6b06          	ld	(OFST-4,sp),a
4135                     ; 318     l_Cmd[ 6 ] = Sdo;
4137  0028 7b12          	ld	a,(OFST+8,sp)
4138  002a 6b07          	ld	(OFST-3,sp),a
4139                     ; 319     l_Cmd[ 7 ] = Gen_Config;
4141  002c 7b13          	ld	a,(OFST+9,sp)
4142  002e 6b08          	ld	(OFST-2,sp),a
4143                     ; 321     SI446x_Write_Cmds( l_Cmd, 8 );		//写配置
4145  0030 4b08          	push	#8
4146  0032 96            	ldw	x,sp
4147  0033 1c0002        	addw	x,#OFST-8
4148  0036 cd0000        	call	_SI446x_Write_Cmds
4150  0039 84            	pop	a
4151                     ; 322     SI446x_Read_Response( l_Cmd, 8 );	//读配置
4153  003a 4b08          	push	#8
4154  003c 96            	ldw	x,sp
4155  003d 1c0002        	addw	x,#OFST-8
4156  0040 cd0000        	call	_SI446x_Read_Response
4158  0043 84            	pop	a
4159                     ; 323 }
4162  0044 5b0c          	addw	sp,#12
4163  0046 81            	ret
4210                     ; 331 void SI446x_Config_Init( void )
4210                     ; 332 {
4211                     .text:	section	.text,new
4212  0000               _SI446x_Config_Init:
4214  0000 5205          	subw	sp,#5
4215       00000005      OFST:	set	5
4218                     ; 334     uint16_t j = 0;
4220  0002 5f            	clrw	x
4221  0003 1f04          	ldw	(OFST-1,sp),x
4223  0005 2020          	jra	L3761
4224  0007               L7661:
4225                     ; 338         j += 1;
4227  0007 1e04          	ldw	x,(OFST-1,sp)
4228  0009 1c0001        	addw	x,#1
4229  000c 1f04          	ldw	(OFST-1,sp),x
4230                     ; 339         SI446x_Write_Cmds( (uint8_t *)config_table + j, i );
4232  000e 7b03          	ld	a,(OFST-2,sp)
4233  0010 88            	push	a
4234  0011 1e05          	ldw	x,(OFST+0,sp)
4235  0013 1c0000        	addw	x,#L3_config_table
4236  0016 cd0000        	call	_SI446x_Write_Cmds
4238  0019 84            	pop	a
4239                     ; 340         j += i;
4241  001a 7b03          	ld	a,(OFST-2,sp)
4242  001c 5f            	clrw	x
4243  001d 97            	ld	xl,a
4244  001e 1f01          	ldw	(OFST-4,sp),x
4245  0020 1e04          	ldw	x,(OFST-1,sp)
4246  0022 72fb01        	addw	x,(OFST-4,sp)
4247  0025 1f04          	ldw	(OFST-1,sp),x
4248  0027               L3761:
4249                     ; 336     while( ( i = config_table[j] ) != 0 )
4251  0027 1e04          	ldw	x,(OFST-1,sp)
4252  0029 d60000        	ld	a,(L3_config_table,x)
4253  002c 6b03          	ld	(OFST-2,sp),a
4254  002e 26d7          	jrne	L7661
4255                     ; 348     SI446x_Set_Property_1( PKT_CONFIG1, 0x00 );
4257  0030 4b00          	push	#0
4258  0032 ae1206        	ldw	x,#4614
4259  0035 cd0000        	call	_SI446x_Set_Property_1
4261  0038 84            	pop	a
4262                     ; 349     SI446x_Set_Property_1( PKT_CRC_CONFIG, 0x00 );
4264  0039 4b00          	push	#0
4265  003b ae1200        	ldw	x,#4608
4266  003e cd0000        	call	_SI446x_Set_Property_1
4268  0041 84            	pop	a
4269                     ; 350     SI446x_Set_Property_1( PKT_LEN_FIELD_SOURCE, 0x01 );
4271  0042 4b01          	push	#1
4272  0044 ae1209        	ldw	x,#4617
4273  0047 cd0000        	call	_SI446x_Set_Property_1
4275  004a 84            	pop	a
4276                     ; 351     SI446x_Set_Property_1( PKT_LEN, 0x2A );
4278  004b 4b2a          	push	#42
4279  004d ae1208        	ldw	x,#4616
4280  0050 cd0000        	call	_SI446x_Set_Property_1
4282  0053 84            	pop	a
4283                     ; 352     SI446x_Set_Property_1( PKT_LEN_ADJUST, 0x00 );
4285  0054 4b00          	push	#0
4286  0056 ae120a        	ldw	x,#4618
4287  0059 cd0000        	call	_SI446x_Set_Property_1
4289  005c 84            	pop	a
4290                     ; 353     SI446x_Set_Property_1( PKT_FIELD_1_LENGTH_12_8, 0x00 );
4292  005d 4b00          	push	#0
4293  005f ae120d        	ldw	x,#4621
4294  0062 cd0000        	call	_SI446x_Set_Property_1
4296  0065 84            	pop	a
4297                     ; 354     SI446x_Set_Property_1( PKT_FIELD_1_LENGTH_7_0, 0x01 );
4299  0066 4b01          	push	#1
4300  0068 ae120e        	ldw	x,#4622
4301  006b cd0000        	call	_SI446x_Set_Property_1
4303  006e 84            	pop	a
4304                     ; 355     SI446x_Set_Property_1( PKT_FIELD_1_CONFIG, 0x00 );
4306  006f 4b00          	push	#0
4307  0071 ae120f        	ldw	x,#4623
4308  0074 cd0000        	call	_SI446x_Set_Property_1
4310  0077 84            	pop	a
4311                     ; 356     SI446x_Set_Property_1( PKT_FIELD_1_CRC_CONFIG, 0x00 );
4313  0078 4b00          	push	#0
4314  007a ae1210        	ldw	x,#4624
4315  007d cd0000        	call	_SI446x_Set_Property_1
4317  0080 84            	pop	a
4318                     ; 357     SI446x_Set_Property_1( PKT_FIELD_2_LENGTH_12_8, 0x00 );
4320  0081 4b00          	push	#0
4321  0083 ae1211        	ldw	x,#4625
4322  0086 cd0000        	call	_SI446x_Set_Property_1
4324  0089 84            	pop	a
4325                     ; 358     SI446x_Set_Property_1( PKT_FIELD_2_LENGTH_7_0, 0x20 );
4327  008a 4b20          	push	#32
4328  008c ae1212        	ldw	x,#4626
4329  008f cd0000        	call	_SI446x_Set_Property_1
4331  0092 84            	pop	a
4332                     ; 359     SI446x_Set_Property_1( PKT_FIELD_2_CONFIG, 0x00 );
4334  0093 4b00          	push	#0
4335  0095 ae1213        	ldw	x,#4627
4336  0098 cd0000        	call	_SI446x_Set_Property_1
4338  009b 84            	pop	a
4339                     ; 360     SI446x_Set_Property_1( PKT_FIELD_2_CRC_CONFIG, 0x00 );
4341  009c 4b00          	push	#0
4342  009e ae1214        	ldw	x,#4628
4343  00a1 cd0000        	call	_SI446x_Set_Property_1
4345  00a4 84            	pop	a
4346                     ; 367     SI446x_Config_Gpio( 0, 0, 33|0x40, 32|0x40, 0, 0, 0 );    //4463才需要配置
4348  00a5 4b00          	push	#0
4349  00a7 4b00          	push	#0
4350  00a9 4b00          	push	#0
4351  00ab 4b60          	push	#96
4352  00ad 4b61          	push	#97
4353  00af 5f            	clrw	x
4354  00b0 4f            	clr	a
4355  00b1 95            	ld	xh,a
4356  00b2 cd0000        	call	_SI446x_Config_Gpio
4358  00b5 5b05          	addw	sp,#5
4359                     ; 368 }
4362  00b7 5b05          	addw	sp,#5
4363  00b9 81            	ret
4411                     ; 378 void SI446x_Write_TxFifo( uint8_t *pWriteData, uint8_t Length )
4411                     ; 379 {
4412                     .text:	section	.text,new
4413  0000               _SI446x_Write_TxFifo:
4415  0000 89            	pushw	x
4416       00000000      OFST:	set	0
4419                     ; 380     SI_SET_CSN_LOW( );
4421  0001 4b02          	push	#2
4422  0003 ae5005        	ldw	x,#20485
4423  0006 cd0000        	call	_GPIO_ResetBits
4425  0009 84            	pop	a
4426                     ; 381     drv_spi_read_write_byte( WRITE_TX_FIFO );		//写命令
4428  000a a666          	ld	a,#102
4429  000c cd0000        	call	_drv_spi_read_write_byte
4432  000f 200e          	jra	L3271
4433  0011               L1271:
4434                     ; 384 		drv_spi_read_write_byte( *pWriteData++ ); 	//写数据
4436  0011 1e01          	ldw	x,(OFST+1,sp)
4437  0013 1c0001        	addw	x,#1
4438  0016 1f01          	ldw	(OFST+1,sp),x
4439  0018 1d0001        	subw	x,#1
4440  001b f6            	ld	a,(x)
4441  001c cd0000        	call	_drv_spi_read_write_byte
4443  001f               L3271:
4444                     ; 382     while( Length-- )    
4446  001f 7b05          	ld	a,(OFST+5,sp)
4447  0021 0a05          	dec	(OFST+5,sp)
4448  0023 4d            	tnz	a
4449  0024 26eb          	jrne	L1271
4450                     ; 386     SI_SET_CSN_HIGH( );
4452  0026 4b02          	push	#2
4453  0028 ae5005        	ldw	x,#20485
4454  002b cd0000        	call	_GPIO_SetBits
4456  002e 84            	pop	a
4457                     ; 387 }
4460  002f 85            	popw	x
4461  0030 81            	ret
4464                     	switch	.const
4465  01a2               L7271_l_Cmd:
4466  01a2 00            	dc.b	0
4467  01a3 00            	ds.b	1
4502                     ; 395 void SI446x_Reset_RxFifo( void )
4502                     ; 396 {
4503                     .text:	section	.text,new
4504  0000               _SI446x_Reset_RxFifo:
4506  0000 89            	pushw	x
4507       00000002      OFST:	set	2
4510                     ; 397     uint8_t l_Cmd[ 2 ] = { 0 };
4512  0001 c601a2        	ld	a,L7271_l_Cmd
4513  0004 6b01          	ld	(OFST-1,sp),a
4514  0006 c601a3        	ld	a,L7271_l_Cmd+1
4515  0009 6b02          	ld	(OFST+0,sp),a
4516                     ; 399     l_Cmd[ 0 ] = FIFO_INFO;
4518  000b a615          	ld	a,#21
4519  000d 6b01          	ld	(OFST-1,sp),a
4520                     ; 400     l_Cmd[ 1 ] = 0x02;
4522  000f a602          	ld	a,#2
4523  0011 6b02          	ld	(OFST+0,sp),a
4524                     ; 401     SI446x_Write_Cmds( l_Cmd, 2 );
4526  0013 4b02          	push	#2
4527  0015 96            	ldw	x,sp
4528  0016 1c0002        	addw	x,#OFST+0
4529  0019 cd0000        	call	_SI446x_Write_Cmds
4531  001c 84            	pop	a
4532                     ; 402 }
4535  001d 85            	popw	x
4536  001e 81            	ret
4539                     	switch	.const
4540  01a4               L7471_l_Cmd:
4541  01a4 00            	dc.b	0
4542  01a5 00            	ds.b	1
4577                     ; 410 void SI446x_Reset_TxFifo( void )
4577                     ; 411 {
4578                     .text:	section	.text,new
4579  0000               _SI446x_Reset_TxFifo:
4581  0000 89            	pushw	x
4582       00000002      OFST:	set	2
4585                     ; 412     uint8_t l_Cmd[ 2 ] = { 0 };
4587  0001 c601a4        	ld	a,L7471_l_Cmd
4588  0004 6b01          	ld	(OFST-1,sp),a
4589  0006 c601a5        	ld	a,L7471_l_Cmd+1
4590  0009 6b02          	ld	(OFST+0,sp),a
4591                     ; 414     l_Cmd[0] = FIFO_INFO;
4593  000b a615          	ld	a,#21
4594  000d 6b01          	ld	(OFST-1,sp),a
4595                     ; 415     l_Cmd[1] = 0x02;
4597  000f a602          	ld	a,#2
4598  0011 6b02          	ld	(OFST+0,sp),a
4599                     ; 416     SI446x_Write_Cmds( l_Cmd, 2 );
4601  0013 4b02          	push	#2
4602  0015 96            	ldw	x,sp
4603  0016 1c0002        	addw	x,#OFST+0
4604  0019 cd0000        	call	_SI446x_Write_Cmds
4606  001c 84            	pop	a
4607                     ; 417 }
4610  001d 85            	popw	x
4611  001e 81            	ret
4614                     	switch	.const
4615  01a6               L7671_l_Cmd:
4616  01a6 00            	dc.b	0
4617  01a7 00000000      	ds.b	4
4701                     ; 429 void SI446x_Send_Packet( uint8_t *pTxData, uint8_t Length, uint8_t Channel, uint8_t Condition )
4701                     ; 430 {
4702                     .text:	section	.text,new
4703  0000               _SI446x_Send_Packet:
4705  0000 89            	pushw	x
4706  0001 5206          	subw	sp,#6
4707       00000006      OFST:	set	6
4710                     ; 431     uint8_t l_Cmd[ 5 ] = { 0 };
4712  0003 96            	ldw	x,sp
4713  0004 1c0002        	addw	x,#OFST-4
4714  0007 90ae01a6      	ldw	y,#L7671_l_Cmd
4715  000b a605          	ld	a,#5
4716  000d cd0000        	call	c_xymvx
4718                     ; 432     uint8_t tx_len = Length;
4720  0010 7b0b          	ld	a,(OFST+5,sp)
4721  0012 6b01          	ld	(OFST-5,sp),a
4722                     ; 434     SI446x_Reset_TxFifo( );		//清空TX FIFO
4724  0014 cd0000        	call	_SI446x_Reset_TxFifo
4726                     ; 436     SI_SET_CSN_LOW( );		
4728  0017 4b02          	push	#2
4729  0019 ae5005        	ldw	x,#20485
4730  001c cd0000        	call	_GPIO_ResetBits
4732  001f 84            	pop	a
4733                     ; 438     drv_spi_read_write_byte( WRITE_TX_FIFO );	//写TX FIFO命令
4735  0020 a666          	ld	a,#102
4736  0022 cd0000        	call	_drv_spi_read_write_byte
4738                     ; 442     tx_len ++;
4740  0025 0c01          	inc	(OFST-5,sp)
4741                     ; 443     drv_spi_read_write_byte( Length );
4743  0027 7b0b          	ld	a,(OFST+5,sp)
4744  0029 cd0000        	call	_drv_spi_read_write_byte
4747  002c 200e          	jra	L5302
4748  002e               L3302:
4749                     ; 449 		drv_spi_read_write_byte( *pTxData++ ); 	//写数据到TX FIFO
4751  002e 1e07          	ldw	x,(OFST+1,sp)
4752  0030 1c0001        	addw	x,#1
4753  0033 1f07          	ldw	(OFST+1,sp),x
4754  0035 1d0001        	subw	x,#1
4755  0038 f6            	ld	a,(x)
4756  0039 cd0000        	call	_drv_spi_read_write_byte
4758  003c               L5302:
4759                     ; 447     while( Length-- )    
4761  003c 7b0b          	ld	a,(OFST+5,sp)
4762  003e 0a0b          	dec	(OFST+5,sp)
4763  0040 4d            	tnz	a
4764  0041 26eb          	jrne	L3302
4765                     ; 452     SI_SET_CSN_HIGH( );
4767  0043 4b02          	push	#2
4768  0045 ae5005        	ldw	x,#20485
4769  0048 cd0000        	call	_GPIO_SetBits
4771  004b 84            	pop	a
4772                     ; 454     l_Cmd[ 0 ] = START_TX;
4774  004c a631          	ld	a,#49
4775  004e 6b02          	ld	(OFST-4,sp),a
4776                     ; 455     l_Cmd[ 1 ] = Channel;
4778  0050 7b0c          	ld	a,(OFST+6,sp)
4779  0052 6b03          	ld	(OFST-3,sp),a
4780                     ; 456     l_Cmd[ 2 ] = Condition;
4782  0054 7b0d          	ld	a,(OFST+7,sp)
4783  0056 6b04          	ld	(OFST-2,sp),a
4784                     ; 457     l_Cmd[ 3 ] = 0;
4786  0058 0f05          	clr	(OFST-1,sp)
4787                     ; 458     l_Cmd[ 4 ] = tx_len;
4789  005a 7b01          	ld	a,(OFST-5,sp)
4790  005c 6b06          	ld	(OFST+0,sp),a
4791                     ; 460     SI446x_Write_Cmds( l_Cmd, 5 );		//发送数据包
4793  005e 4b05          	push	#5
4794  0060 96            	ldw	x,sp
4795  0061 1c0003        	addw	x,#OFST-3
4796  0064 cd0000        	call	_SI446x_Write_Cmds
4798  0067 84            	pop	a
4799                     ; 461 }
4802  0068 5b08          	addw	sp,#8
4803  006a 81            	ret
4806                     	switch	.const
4807  01ab               L1402_l_Cmd:
4808  01ab 00            	dc.b	0
4809  01ac 00000000      	ds.b	4
4870                     ; 472 void SI446x_Start_Tx( uint8_t Channel, uint8_t Condition, uint16_t Length )
4870                     ; 473 {
4871                     .text:	section	.text,new
4872  0000               _SI446x_Start_Tx:
4874  0000 89            	pushw	x
4875  0001 5205          	subw	sp,#5
4876       00000005      OFST:	set	5
4879                     ; 474     uint8_t l_Cmd[5] = { 0 };
4881  0003 96            	ldw	x,sp
4882  0004 1c0001        	addw	x,#OFST-4
4883  0007 90ae01ab      	ldw	y,#L1402_l_Cmd
4884  000b a605          	ld	a,#5
4885  000d cd0000        	call	c_xymvx
4887                     ; 476     l_Cmd[ 0 ] = START_TX;		
4889  0010 a631          	ld	a,#49
4890  0012 6b01          	ld	(OFST-4,sp),a
4891                     ; 477     l_Cmd[ 1 ] = Channel;
4893  0014 7b06          	ld	a,(OFST+1,sp)
4894  0016 6b02          	ld	(OFST-3,sp),a
4895                     ; 478     l_Cmd[ 2 ] = Condition;
4897  0018 7b07          	ld	a,(OFST+2,sp)
4898  001a 6b03          	ld	(OFST-2,sp),a
4899                     ; 479     l_Cmd[ 3 ] = Length >> 8;
4901  001c 7b0a          	ld	a,(OFST+5,sp)
4902  001e 6b04          	ld	(OFST-1,sp),a
4903                     ; 480     l_Cmd[ 4 ] = Length;
4905  0020 7b0b          	ld	a,(OFST+6,sp)
4906  0022 6b05          	ld	(OFST+0,sp),a
4907                     ; 482     SI446x_Write_Cmds( l_Cmd, 5 );
4909  0024 4b05          	push	#5
4910  0026 96            	ldw	x,sp
4911  0027 1c0002        	addw	x,#OFST-3
4912  002a cd0000        	call	_SI446x_Write_Cmds
4914  002d 84            	pop	a
4915                     ; 483 }
4918  002e 5b07          	addw	sp,#7
4919  0030 81            	ret
4976                     ; 492 uint8_t SI446x_Read_Packet( uint8_t *pRxData )
4976                     ; 493 {
4977                     .text:	section	.text,new
4978  0000               _SI446x_Read_Packet:
4980  0000 89            	pushw	x
4981  0001 89            	pushw	x
4982       00000002      OFST:	set	2
4985                     ; 494     uint8_t length = 0, i = 0;
4989                     ; 496     SI446x_Wait_Cts( );
4991  0002 cd0000        	call	_SI446x_Wait_Cts
4993                     ; 497     SI_SET_CSN_LOW( );
4995  0005 4b02          	push	#2
4996  0007 ae5005        	ldw	x,#20485
4997  000a cd0000        	call	_GPIO_ResetBits
4999  000d 84            	pop	a
5000                     ; 499     drv_spi_read_write_byte( READ_RX_FIFO );	//读FIFO命令
5002  000e a677          	ld	a,#119
5003  0010 cd0000        	call	_drv_spi_read_write_byte
5005                     ; 503     length = drv_spi_read_write_byte( 0xFF );	//读数据长度
5007  0013 a6ff          	ld	a,#255
5008  0015 cd0000        	call	_drv_spi_read_write_byte
5010  0018 6b02          	ld	(OFST+0,sp),a
5011                     ; 510     i = length;
5013  001a 7b02          	ld	a,(OFST+0,sp)
5014  001c 6b01          	ld	(OFST-1,sp),a
5016  001e 2010          	jra	L7212
5017  0020               L3212:
5018                     ; 514         *pRxData++ = drv_spi_read_write_byte( 0xFF );	//读数据
5020  0020 a6ff          	ld	a,#255
5021  0022 cd0000        	call	_drv_spi_read_write_byte
5023  0025 1e03          	ldw	x,(OFST+1,sp)
5024  0027 1c0001        	addw	x,#1
5025  002a 1f03          	ldw	(OFST+1,sp),x
5026  002c 1d0001        	subw	x,#1
5027  002f f7            	ld	(x),a
5028  0030               L7212:
5029                     ; 512     while( length -- )
5031  0030 7b02          	ld	a,(OFST+0,sp)
5032  0032 0a02          	dec	(OFST+0,sp)
5033  0034 4d            	tnz	a
5034  0035 26e9          	jrne	L3212
5035                     ; 517     SI_SET_CSN_HIGH( );		//返回数据个数
5037  0037 4b02          	push	#2
5038  0039 ae5005        	ldw	x,#20485
5039  003c cd0000        	call	_GPIO_SetBits
5041  003f 84            	pop	a
5042                     ; 519     return i;
5044  0040 7b01          	ld	a,(OFST-1,sp)
5047  0042 5b04          	addw	sp,#4
5048  0044 81            	ret
5051                     	switch	.const
5052  01b0               L3312_l_Cmd:
5053  01b0 00            	dc.b	0
5054  01b1 000000000000  	ds.b	7
5144                     ; 534 void SI446x_Start_Rx( uint8_t Channel, uint8_t Condition, uint16_t Length, uint8_t Next_State1, uint8_t Next_State2, uint8_t Next_State3 )
5144                     ; 535 {
5145                     .text:	section	.text,new
5146  0000               _SI446x_Start_Rx:
5148  0000 89            	pushw	x
5149  0001 5208          	subw	sp,#8
5150       00000008      OFST:	set	8
5153                     ; 536     uint8_t l_Cmd[ 8 ] = { 0 };
5155  0003 96            	ldw	x,sp
5156  0004 1c0001        	addw	x,#OFST-7
5157  0007 90ae01b0      	ldw	y,#L3312_l_Cmd
5158  000b a608          	ld	a,#8
5159  000d cd0000        	call	c_xymvx
5161                     ; 538     SI446x_Reset_RxFifo( );
5163  0010 cd0000        	call	_SI446x_Reset_RxFifo
5165                     ; 539     SI446x_Reset_TxFifo( );
5167  0013 cd0000        	call	_SI446x_Reset_TxFifo
5169                     ; 541     l_Cmd[ 0 ] = START_RX;
5171  0016 a632          	ld	a,#50
5172  0018 6b01          	ld	(OFST-7,sp),a
5173                     ; 542     l_Cmd[ 1 ] = Channel;
5175  001a 7b09          	ld	a,(OFST+1,sp)
5176  001c 6b02          	ld	(OFST-6,sp),a
5177                     ; 543     l_Cmd[ 2 ] = Condition;
5179  001e 7b0a          	ld	a,(OFST+2,sp)
5180  0020 6b03          	ld	(OFST-5,sp),a
5181                     ; 544     l_Cmd[ 3 ] = Length >> 8;
5183  0022 7b0d          	ld	a,(OFST+5,sp)
5184  0024 6b04          	ld	(OFST-4,sp),a
5185                     ; 545     l_Cmd[ 4 ] = Length;
5187  0026 7b0e          	ld	a,(OFST+6,sp)
5188  0028 6b05          	ld	(OFST-3,sp),a
5189                     ; 546     l_Cmd[ 5 ] = Next_State1;
5191  002a 7b0f          	ld	a,(OFST+7,sp)
5192  002c 6b06          	ld	(OFST-2,sp),a
5193                     ; 547     l_Cmd[ 6 ] = Next_State2;
5195  002e 7b10          	ld	a,(OFST+8,sp)
5196  0030 6b07          	ld	(OFST-1,sp),a
5197                     ; 548     l_Cmd[ 7 ] = Next_State3;
5199  0032 7b11          	ld	a,(OFST+9,sp)
5200  0034 6b08          	ld	(OFST+0,sp),a
5201                     ; 550     SI446x_Write_Cmds( l_Cmd, 8 );
5203  0036 4b08          	push	#8
5204  0038 96            	ldw	x,sp
5205  0039 1c0002        	addw	x,#OFST-6
5206  003c cd0000        	call	_SI446x_Write_Cmds
5208  003f 84            	pop	a
5209                     ; 551 }
5212  0040 5b0a          	addw	sp,#10
5213  0042 81            	ret
5216                     	switch	.const
5217  01b8               L3022_l_Cmd:
5218  01b8 00            	dc.b	0
5219  01b9 0000000000    	ds.b	5
5292                     ; 563 void SI446x_Get_Packet_Information( uint8_t *pReadData, uint8_t FieldNumMask, uint16_t Length, uint16_t DiffLen )
5292                     ; 564 {
5293                     .text:	section	.text,new
5294  0000               _SI446x_Get_Packet_Information:
5296  0000 89            	pushw	x
5297  0001 5206          	subw	sp,#6
5298       00000006      OFST:	set	6
5301                     ; 565     uint8_t l_Cmd[ 6 ] = { 0 };
5303  0003 96            	ldw	x,sp
5304  0004 1c0001        	addw	x,#OFST-5
5305  0007 90ae01b8      	ldw	y,#L3022_l_Cmd
5306  000b a606          	ld	a,#6
5307  000d cd0000        	call	c_xymvx
5309                     ; 567     l_Cmd[ 0 ] = PACKET_INFO;
5311  0010 a616          	ld	a,#22
5312  0012 6b01          	ld	(OFST-5,sp),a
5313                     ; 568     l_Cmd[ 1 ] = FieldNumMask;
5315  0014 7b0b          	ld	a,(OFST+5,sp)
5316  0016 6b02          	ld	(OFST-4,sp),a
5317                     ; 569     l_Cmd[ 2 ] = Length >> 8;
5319  0018 7b0c          	ld	a,(OFST+6,sp)
5320  001a 6b03          	ld	(OFST-3,sp),a
5321                     ; 570     l_Cmd[ 3 ] = Length;
5323  001c 7b0d          	ld	a,(OFST+7,sp)
5324  001e 6b04          	ld	(OFST-2,sp),a
5325                     ; 571     l_Cmd[ 4 ] = DiffLen >> 8;
5327  0020 7b0e          	ld	a,(OFST+8,sp)
5328  0022 6b05          	ld	(OFST-1,sp),a
5329                     ; 572     l_Cmd[ 5 ] = DiffLen;
5331  0024 7b0f          	ld	a,(OFST+9,sp)
5332  0026 6b06          	ld	(OFST+0,sp),a
5333                     ; 574     SI446x_Write_Cmds( l_Cmd, 6 );
5335  0028 4b06          	push	#6
5336  002a 96            	ldw	x,sp
5337  002b 1c0002        	addw	x,#OFST-4
5338  002e cd0000        	call	_SI446x_Write_Cmds
5340  0031 84            	pop	a
5341                     ; 575     SI446x_Read_Response( pReadData, 3 );
5343  0032 4b03          	push	#3
5344  0034 1e08          	ldw	x,(OFST+2,sp)
5345  0036 cd0000        	call	_SI446x_Read_Response
5347  0039 84            	pop	a
5348                     ; 576 }
5351  003a 5b08          	addw	sp,#8
5352  003c 81            	ret
5355                     	switch	.const
5356  01be               L3422_l_Cmd:
5357  01be 00            	dc.b	0
5358  01bf 00            	ds.b	1
5404                     ; 585 void SI446x_Get_Fifo_Information( uint8_t *pReadData )
5404                     ; 586 {
5405                     .text:	section	.text,new
5406  0000               _SI446x_Get_Fifo_Information:
5408  0000 89            	pushw	x
5409  0001 89            	pushw	x
5410       00000002      OFST:	set	2
5413                     ; 587     uint8_t l_Cmd[ 2 ] = { 0 };
5415  0002 c601be        	ld	a,L3422_l_Cmd
5416  0005 6b01          	ld	(OFST-1,sp),a
5417  0007 c601bf        	ld	a,L3422_l_Cmd+1
5418  000a 6b02          	ld	(OFST+0,sp),a
5419                     ; 589     l_Cmd[ 0 ] = FIFO_INFO;
5421  000c a615          	ld	a,#21
5422  000e 6b01          	ld	(OFST-1,sp),a
5423                     ; 590     l_Cmd[ 1 ] = 0x03;
5425  0010 a603          	ld	a,#3
5426  0012 6b02          	ld	(OFST+0,sp),a
5427                     ; 592     SI446x_Write_Cmds( l_Cmd, 2 );
5429  0014 4b02          	push	#2
5430  0016 96            	ldw	x,sp
5431  0017 1c0002        	addw	x,#OFST+0
5432  001a cd0000        	call	_SI446x_Write_Cmds
5434  001d 84            	pop	a
5435                     ; 593     SI446x_Read_Response( pReadData, 3 );
5437  001e 4b03          	push	#3
5438  0020 1e04          	ldw	x,(OFST+2,sp)
5439  0022 cd0000        	call	_SI446x_Read_Response
5441  0025 84            	pop	a
5442                     ; 594 }
5445  0026 5b04          	addw	sp,#4
5446  0028 81            	ret
5449                     	switch	.const
5450  01c0               L7622_l_Cmd:
5451  01c0 00            	dc.b	0
5452  01c1 00            	ds.b	1
5496                     ; 603 void SI446x_Change_Status( uint8_t NextStatus )
5496                     ; 604 {
5497                     .text:	section	.text,new
5498  0000               _SI446x_Change_Status:
5500  0000 88            	push	a
5501  0001 89            	pushw	x
5502       00000002      OFST:	set	2
5505                     ; 605     uint8_t l_Cmd[ 2 ] = { 0 };
5507  0002 c601c0        	ld	a,L7622_l_Cmd
5508  0005 6b01          	ld	(OFST-1,sp),a
5509  0007 c601c1        	ld	a,L7622_l_Cmd+1
5510  000a 6b02          	ld	(OFST+0,sp),a
5511                     ; 607     l_Cmd[ 0 ] = CHANGE_STATE;
5513  000c a634          	ld	a,#52
5514  000e 6b01          	ld	(OFST-1,sp),a
5515                     ; 608     l_Cmd[ 1 ] = NextStatus;
5517  0010 7b03          	ld	a,(OFST+1,sp)
5518  0012 6b02          	ld	(OFST+0,sp),a
5519                     ; 610     SI446x_Write_Cmds( l_Cmd, 2 );
5521  0014 4b02          	push	#2
5522  0016 96            	ldw	x,sp
5523  0017 1c0002        	addw	x,#OFST+0
5524  001a cd0000        	call	_SI446x_Write_Cmds
5526  001d 84            	pop	a
5527                     ; 611 }
5530  001e 5b03          	addw	sp,#3
5531  0020 81            	ret
5534                     	switch	.const
5535  01c2               L3132_l_Cmd:
5536  01c2 00            	dc.b	0
5537  01c3 0000          	ds.b	2
5573                     ; 619 uint8_t SI446x_Get_Device_Status( void )
5573                     ; 620 {
5574                     .text:	section	.text,new
5575  0000               _SI446x_Get_Device_Status:
5577  0000 5203          	subw	sp,#3
5578       00000003      OFST:	set	3
5581                     ; 621    uint8_t l_Cmd[ 3 ] = { 0 };
5583  0002 96            	ldw	x,sp
5584  0003 1c0001        	addw	x,#OFST-2
5585  0006 90ae01c2      	ldw	y,#L3132_l_Cmd
5586  000a a603          	ld	a,#3
5587  000c cd0000        	call	c_xymvx
5589                     ; 623    l_Cmd [ 0 ] = REQUEST_DEVICE_STATE;
5591  000f a633          	ld	a,#51
5592  0011 6b01          	ld	(OFST-2,sp),a
5593                     ; 625    SI446x_Write_Cmds( l_Cmd, 1 );
5595  0013 4b01          	push	#1
5596  0015 96            	ldw	x,sp
5597  0016 1c0002        	addw	x,#OFST-1
5598  0019 cd0000        	call	_SI446x_Write_Cmds
5600  001c 84            	pop	a
5601                     ; 626    SI446x_Read_Response( l_Cmd, 3 );
5603  001d 4b03          	push	#3
5604  001f 96            	ldw	x,sp
5605  0020 1c0002        	addw	x,#OFST-1
5606  0023 cd0000        	call	_SI446x_Read_Response
5608  0026 84            	pop	a
5609                     ; 628    return l_Cmd[ 1 ] & 0x0F;
5611  0027 7b02          	ld	a,(OFST-1,sp)
5612  0029 a40f          	and	a,#15
5615  002b 5b03          	addw	sp,#3
5616  002d 81            	ret
5651                     ; 638 void SI446x_Set_Power( uint8_t PowerLevel )
5651                     ; 639 {
5652                     .text:	section	.text,new
5653  0000               _SI446x_Set_Power:
5657                     ; 640     SI446x_Set_Property_1( PA_PWR_LVL, PowerLevel );
5659  0000 88            	push	a
5660  0001 ae2201        	ldw	x,#8705
5661  0004 cd0000        	call	_SI446x_Set_Property_1
5663  0007 84            	pop	a
5664                     ; 641 }
5667  0008 81            	ret
5692                     ; 649 void SI446x_Gpio_Init( void )
5692                     ; 650 {
5693                     .text:	section	.text,new
5694  0000               _SI446x_Gpio_Init:
5698                     ; 652 	GPIO_Init( SI4463_SDN_PORT, SI4463_SDN_PIN, GPIO_Mode_Out_PP_High_Fast );
5700  0000 4bf0          	push	#240
5701  0002 4b10          	push	#16
5702  0004 ae5005        	ldw	x,#20485
5703  0007 cd0000        	call	_GPIO_Init
5705  000a 85            	popw	x
5706                     ; 655 	GPIO_Init( SI4463_IRQ_PORT, SI4463_IRQ_PIN,GPIO_Mode_In_PU_No_IT );
5708  000b 4b40          	push	#64
5709  000d 4b01          	push	#1
5710  000f ae500a        	ldw	x,#20490
5711  0012 cd0000        	call	_GPIO_Init
5713  0015 85            	popw	x
5714                     ; 659 	GPIO_ResetBits( SI4463_SDN_PORT, SI4463_SDN_PIN );	//SDN 置低使能设备
5716  0016 4b10          	push	#16
5717  0018 ae5005        	ldw	x,#20485
5718  001b cd0000        	call	_GPIO_ResetBits
5720  001e 84            	pop	a
5721                     ; 660 }
5724  001f 81            	ret
5755                     ; 668 void SI446x_Init( void )
5755                     ; 669 {
5756                     .text:	section	.text,new
5757  0000               _SI446x_Init:
5761                     ; 670 	SI446x_Gpio_Init( );		//SI4463引脚初始化
5763  0000 cd0000        	call	_SI446x_Gpio_Init
5765                     ; 671 	SI446x_Reset( );			//SI4463复位
5767  0003 cd0000        	call	_SI446x_Reset
5769                     ; 672 	SI446x_Power_Up( 26000000 );//reset 后需要Power up设备 晶振30MHz
5771  0006 aeba80        	ldw	x,#47744
5772  0009 89            	pushw	x
5773  000a ae018c        	ldw	x,#396
5774  000d 89            	pushw	x
5775  000e cd0000        	call	_SI446x_Power_Up
5777  0011 5b04          	addw	sp,#4
5778                     ; 673 	SI446x_Config_Init( );		//SI4463模块初始化
5780  0013 cd0000        	call	_SI446x_Config_Init
5782                     ; 674 	SI446x_Set_Power( 0x7F );	//功率设置
5784  0016 a67f          	ld	a,#127
5785  0018 cd0000        	call	_SI446x_Set_Power
5787                     ; 675 	SI446x_Change_Status( 6 );	//切换到RX状态
5789  001b a606          	ld	a,#6
5790  001d cd0000        	call	_SI446x_Change_Status
5793  0020               L3732:
5794                     ; 676 	while( 6 != SI446x_Get_Device_Status( ));
5796  0020 cd0000        	call	_SI446x_Get_Device_Status
5798  0023 a106          	cp	a,#6
5799  0025 26f9          	jrne	L3732
5800                     ; 677 	SI446x_Start_Rx( 0, 0, PACKET_LENGTH,0,0,3 );
5802  0027 4b03          	push	#3
5803  0029 4b00          	push	#0
5804  002b 4b00          	push	#0
5805  002d 5f            	clrw	x
5806  002e 89            	pushw	x
5807  002f 5f            	clrw	x
5808  0030 4f            	clr	a
5809  0031 95            	ld	xh,a
5810  0032 cd0000        	call	_SI446x_Start_Rx
5812  0035 5b05          	addw	sp,#5
5813                     ; 679 }
5816  0037 81            	ret
5841                     	xdef	_SI446x_Init
5842                     	xdef	_SI446x_Config_Init
5843                     	xdef	_SI446x_Gpio_Init
5844                     	xdef	_SI446x_Set_Power
5845                     	xdef	_SI446x_Get_Device_Status
5846                     	xdef	_SI446x_Change_Status
5847                     	xdef	_SI446x_Get_Fifo_Information
5848                     	xdef	_SI446x_Get_Packet_Information
5849                     	xdef	_SI446x_Start_Rx
5850                     	xdef	_SI446x_Read_Packet
5851                     	xdef	_SI446x_Start_Tx
5852                     	xdef	_SI446x_Send_Packet
5853                     	xdef	_SI446x_Reset_TxFifo
5854                     	xdef	_SI446x_Reset_RxFifo
5855                     	xdef	_SI446x_Write_TxFifo
5856                     	xdef	_SI446x_Config_Gpio
5857                     	xdef	_SI446x_Reset
5858                     	xdef	_SI446x_Get_Property_1
5859                     	xdef	_SI446x_Set_Property_1
5860                     	xdef	_SI446x_Set_Property
5861                     	xdef	_SI446x_Get_Property
5862                     	xdef	_SI446x_Interrupt_Status
5863                     	xdef	_SI446x_Get_Fun_Informatoin
5864                     	xdef	_SI446x_Get_Part_Informatoin
5865                     	xdef	_SI446x_Nop
5866                     	xdef	_SI446x_Read_Response
5867                     	xdef	_SI446x_Power_Up
5868                     	xdef	_SI446x_Write_Cmds
5869                     	xdef	_SI446x_Wait_Cts
5870                     	xref	_delay_ms
5871                     	xref	_drv_spi_read_write_byte
5872                     	xref	_GPIO_ResetBits
5873                     	xref	_GPIO_SetBits
5874                     	xref	_GPIO_Init
5875                     	xref.b	c_x
5894                     	xref	c_xymvx
5895                     	end
