   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  60                     ; 16 unsigned char init_1820(void)  
  60                     ; 17 {  
  62                     .text:	section	.text,new
  63  0000               _init_1820:
  65  0000 88            	push	a
  66       00000001      OFST:	set	1
  69                     ; 18   unsigned char time=0;  
  71  0001 0f01          	clr	(OFST+0,sp)
  72                     ; 19     SET_DIR_1WIRE; //输出 
  74  0003 4be0          	push	#224
  75  0005 4b08          	push	#8
  76  0007 ae5000        	ldw	x,#20480
  77  000a cd0000        	call	_GPIO_Init
  79  000d 85            	popw	x
  80                     ; 20     SET_OP_1WIRE;//H   
  83  000e 4b08          	push	#8
  84  0010 ae5000        	ldw	x,#20480
  85  0013 cd0000        	call	_GPIO_SetBits
  87  0016 84            	pop	a
  88                     ; 21     CLR_OP_1WIRE;//L  
  90  0017 4b08          	push	#8
  91  0019 ae5000        	ldw	x,#20480
  92  001c cd0000        	call	_GPIO_ResetBits
  94  001f 84            	pop	a
  95                     ; 22     delay_10us(50);    //480us以上 
  97  0020 ae0032        	ldw	x,#50
  98  0023 cd0000        	call	_delay_10us
 100                     ; 23     SET_OP_1WIRE;//H  
 102  0026 4b08          	push	#8
 103  0028 ae5000        	ldw	x,#20480
 104  002b cd0000        	call	_GPIO_SetBits
 106  002e 84            	pop	a
 107                     ; 24     CLR_DIR_1WIRE;//输入  
 109  002f 4b00          	push	#0
 110  0031 4b08          	push	#8
 111  0033 ae5000        	ldw	x,#20480
 112  0036 cd0000        	call	_GPIO_Init
 114  0039 85            	popw	x
 115                     ; 25     delay_10us(3);     //15~60us    
 118  003a ae0003        	ldw	x,#3
 119  003d cd0000        	call	_delay_10us
 122  0040 200a          	jra	L13
 123  0042               L72:
 124                     ; 28       if(time==0XFE)
 126  0042 7b01          	ld	a,(OFST+0,sp)
 127  0044 a1fe          	cp	a,#254
 128  0046 2604          	jrne	L13
 129                     ; 29         return 0;
 131  0048 4f            	clr	a
 134  0049 5b01          	addw	sp,#1
 135  004b 81            	ret
 136  004c               L13:
 137                     ; 26     while(CHECK_IP_1WIRE&&time++)
 139  004c 4b08          	push	#8
 140  004e ae5000        	ldw	x,#20480
 141  0051 cd0000        	call	_GPIO_ReadInputDataBit
 143  0054 5b01          	addw	sp,#1
 144  0056 4d            	tnz	a
 145  0057 2707          	jreq	L73
 147  0059 7b01          	ld	a,(OFST+0,sp)
 148  005b 0c01          	inc	(OFST+0,sp)
 149  005d 4d            	tnz	a
 150  005e 26e2          	jrne	L72
 151  0060               L73:
 152                     ; 32     SET_DIR_1WIRE;  
 154  0060 4be0          	push	#224
 155  0062 4b08          	push	#8
 156  0064 ae5000        	ldw	x,#20480
 157  0067 cd0000        	call	_GPIO_Init
 159  006a 85            	popw	x
 160                     ; 33     SET_OP_1WIRE;  
 163  006b 4b08          	push	#8
 164  006d ae5000        	ldw	x,#20480
 165  0070 cd0000        	call	_GPIO_SetBits
 167  0073 84            	pop	a
 168                     ; 34     delay_10us(12);   //60~240us
 170  0074 ae000c        	ldw	x,#12
 171  0077 cd0000        	call	_delay_10us
 173                     ; 35     return 1;
 175  007a a601          	ld	a,#1
 178  007c 5b01          	addw	sp,#1
 179  007e 81            	ret
 225                     ; 43 void write_1820(unsigned char x)  
 225                     ; 44 {     
 226                     .text:	section	.text,new
 227  0000               _write_1820:
 229  0000 88            	push	a
 230  0001 5203          	subw	sp,#3
 231       00000003      OFST:	set	3
 234                     ; 46     for(m=0;m<8;m++)  
 236  0003 0f03          	clr	(OFST+0,sp)
 237  0005               L36:
 238                     ; 48        CLR_OP_1WIRE;  
 240  0005 4b08          	push	#8
 241  0007 ae5000        	ldw	x,#20480
 242  000a cd0000        	call	_GPIO_ResetBits
 244  000d 84            	pop	a
 245                     ; 49        if(x&(1<<m))    //写数据了，先写低位的！ 
 247  000e 7b04          	ld	a,(OFST+1,sp)
 248  0010 5f            	clrw	x
 249  0011 97            	ld	xl,a
 250  0012 1f01          	ldw	(OFST-2,sp),x
 251  0014 ae0001        	ldw	x,#1
 252  0017 7b03          	ld	a,(OFST+0,sp)
 253  0019 4d            	tnz	a
 254  001a 2704          	jreq	L01
 255  001c               L21:
 256  001c 58            	sllw	x
 257  001d 4a            	dec	a
 258  001e 26fc          	jrne	L21
 259  0020               L01:
 260  0020 01            	rrwa	x,a
 261  0021 1402          	and	a,(OFST-1,sp)
 262  0023 01            	rrwa	x,a
 263  0024 1401          	and	a,(OFST-2,sp)
 264  0026 01            	rrwa	x,a
 265  0027 a30000        	cpw	x,#0
 266  002a 270b          	jreq	L17
 267                     ; 50        SET_OP_1WIRE;  
 269  002c 4b08          	push	#8
 270  002e ae5000        	ldw	x,#20480
 271  0031 cd0000        	call	_GPIO_SetBits
 273  0034 84            	pop	a
 275  0035 2009          	jra	L37
 276  0037               L17:
 277                     ; 52        {CLR_OP_1WIRE;}  
 279  0037 4b08          	push	#8
 280  0039 ae5000        	ldw	x,#20480
 281  003c cd0000        	call	_GPIO_ResetBits
 283  003f 84            	pop	a
 284  0040               L37:
 285                     ; 53        delay_10us(4);   //15~60us 
 287  0040 ae0004        	ldw	x,#4
 288  0043 cd0000        	call	_delay_10us
 290                     ; 54        SET_OP_1WIRE;  
 292  0046 4b08          	push	#8
 293  0048 ae5000        	ldw	x,#20480
 294  004b cd0000        	call	_GPIO_SetBits
 296  004e 84            	pop	a
 297                     ; 46     for(m=0;m<8;m++)  
 299  004f 0c03          	inc	(OFST+0,sp)
 302  0051 7b03          	ld	a,(OFST+0,sp)
 303  0053 a108          	cp	a,#8
 304  0055 25ae          	jrult	L36
 305                     ; 56      SET_OP_1WIRE;  
 307  0057 4b08          	push	#8
 308  0059 ae5000        	ldw	x,#20480
 309  005c cd0000        	call	_GPIO_SetBits
 311  005f 84            	pop	a
 312                     ; 57 } 
 315  0060 5b04          	addw	sp,#4
 316  0062 81            	ret
 373                     ; 64 unsigned char read_1820(void)  
 373                     ; 65 {      
 374                     .text:	section	.text,new
 375  0000               _read_1820:
 377  0000 5203          	subw	sp,#3
 378       00000003      OFST:	set	3
 381                     ; 67     temp=0;  
 383  0002 0f02          	clr	(OFST-1,sp)
 384                     ; 68     for(n=0;n<8;n++)  
 386  0004 0f03          	clr	(OFST+0,sp)
 387  0006               L321:
 388                     ; 70       CLR_OP_1WIRE;  
 390  0006 4b08          	push	#8
 391  0008 ae5000        	ldw	x,#20480
 392  000b cd0000        	call	_GPIO_ResetBits
 394  000e 84            	pop	a
 395                     ; 71       SET_OP_1WIRE;  
 397  000f 4b08          	push	#8
 398  0011 ae5000        	ldw	x,#20480
 399  0014 cd0000        	call	_GPIO_SetBits
 401  0017 84            	pop	a
 402                     ; 72       CLR_DIR_1WIRE;  
 404  0018 4b00          	push	#0
 405  001a 4b08          	push	#8
 406  001c ae5000        	ldw	x,#20480
 407  001f cd0000        	call	_GPIO_Init
 409  0022 85            	popw	x
 410                     ; 73       k=(CHECK_IP_1WIRE);    //读数据,从低位开始  
 413  0023 4b08          	push	#8
 414  0025 ae5000        	ldw	x,#20480
 415  0028 cd0000        	call	_GPIO_ReadInputDataBit
 417  002b 5b01          	addw	sp,#1
 418  002d 6b01          	ld	(OFST-2,sp),a
 419                     ; 74       if(k)  
 421  002f 0d01          	tnz	(OFST-2,sp)
 422  0031 2713          	jreq	L131
 423                     ; 75       temp|=(1<<n);  
 425  0033 7b03          	ld	a,(OFST+0,sp)
 426  0035 5f            	clrw	x
 427  0036 97            	ld	xl,a
 428  0037 a601          	ld	a,#1
 429  0039 5d            	tnzw	x
 430  003a 2704          	jreq	L61
 431  003c               L02:
 432  003c 48            	sll	a
 433  003d 5a            	decw	x
 434  003e 26fc          	jrne	L02
 435  0040               L61:
 436  0040 1a02          	or	a,(OFST-1,sp)
 437  0042 6b02          	ld	(OFST-1,sp),a
 439  0044 2012          	jra	L331
 440  0046               L131:
 441                     ; 77       temp&=~(1<<n);  
 443  0046 7b03          	ld	a,(OFST+0,sp)
 444  0048 5f            	clrw	x
 445  0049 97            	ld	xl,a
 446  004a a601          	ld	a,#1
 447  004c 5d            	tnzw	x
 448  004d 2704          	jreq	L22
 449  004f               L42:
 450  004f 48            	sll	a
 451  0050 5a            	decw	x
 452  0051 26fc          	jrne	L42
 453  0053               L22:
 454  0053 43            	cpl	a
 455  0054 1402          	and	a,(OFST-1,sp)
 456  0056 6b02          	ld	(OFST-1,sp),a
 457  0058               L331:
 458                     ; 78       delay_10us(8); //60~120us     
 460  0058 ae0008        	ldw	x,#8
 461  005b cd0000        	call	_delay_10us
 463                     ; 79       SET_DIR_1WIRE;  
 465  005e 4be0          	push	#224
 466  0060 4b08          	push	#8
 467  0062 ae5000        	ldw	x,#20480
 468  0065 cd0000        	call	_GPIO_Init
 470  0068 85            	popw	x
 471                     ; 68     for(n=0;n<8;n++)  
 474  0069 0c03          	inc	(OFST+0,sp)
 477  006b 7b03          	ld	a,(OFST+0,sp)
 478  006d a108          	cp	a,#8
 479  006f 2595          	jrult	L321
 480                     ; 81    return (temp);  
 482  0071 7b02          	ld	a,(OFST-1,sp)
 485  0073 5b03          	addw	sp,#3
 486  0075 81            	ret
 533                     ; 89 void gettemp(void)    //读取温度值 
 533                     ; 90 {  
 534                     .text:	section	.text,new
 535  0000               _gettemp:
 537  0000 89            	pushw	x
 538       00000002      OFST:	set	2
 541                     ; 94      init_1820();        //复位18b20  
 543  0001 cd0000        	call	_init_1820
 545                     ; 95      write_1820(0xcc);   // 发出转换命令  
 547  0004 a6cc          	ld	a,#204
 548  0006 cd0000        	call	_write_1820
 550                     ; 96      write_1820(0x44); 
 552  0009 a644          	ld	a,#68
 553  000b cd0000        	call	_write_1820
 555                     ; 98      init_1820();  
 557  000e cd0000        	call	_init_1820
 559                     ; 99      write_1820(0xcc);  //发出读命令  
 561  0011 a6cc          	ld	a,#204
 562  0013 cd0000        	call	_write_1820
 564                     ; 100      write_1820(0xbe);  
 566  0016 a6be          	ld	a,#190
 567  0018 cd0000        	call	_write_1820
 569                     ; 101      teml=read_1820();  //读数据  
 571  001b cd0000        	call	_read_1820
 573  001e 6b02          	ld	(OFST+0,sp),a
 574                     ; 102      temh=read_1820();
 576  0020 cd0000        	call	_read_1820
 578  0023 6b01          	ld	(OFST-1,sp),a
 579                     ; 103 		 SendBuffer[4]=temh;
 581  0025 7b01          	ld	a,(OFST-1,sp)
 582  0027 b704          	ld	_SendBuffer+4,a
 583                     ; 104 		 SendBuffer[5]=teml;
 585  0029 7b02          	ld	a,(OFST+0,sp)
 586  002b b705          	ld	_SendBuffer+5,a
 587                     ; 111 }  
 590  002d 85            	popw	x
 591  002e 81            	ret
 604                     	xdef	_write_1820
 605                     	xref.b	_SendBuffer
 606                     	xref	_delay_10us
 607                     	xdef	_gettemp
 608                     	xdef	_read_1820
 609                     	xdef	_init_1820
 610                     	xref	_GPIO_ReadInputDataBit
 611                     	xref	_GPIO_ResetBits
 612                     	xref	_GPIO_SetBits
 613                     	xref	_GPIO_Init
 632                     	end
