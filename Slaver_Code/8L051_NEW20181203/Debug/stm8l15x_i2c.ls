   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 200                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 200                     ; 142 {
 202                     .text:	section	.text,new
 203  0000               _I2C_DeInit:
 207                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 209  0000 7f            	clr	(x)
 210                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 212  0001 6f01          	clr	(1,x)
 213                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 215  0003 6f02          	clr	(2,x)
 216                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 218  0005 6f03          	clr	(3,x)
 219                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 221  0007 6f04          	clr	(4,x)
 222                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 224  0009 6f05          	clr	(5,x)
 225                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 227  000b 6f0a          	clr	(10,x)
 228                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 230  000d 6f0b          	clr	(11,x)
 231                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 233  000f 6f0c          	clr	(12,x)
 234                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 236  0011 a602          	ld	a,#2
 237  0013 e70d          	ld	(13,x),a
 238                     ; 153 }
 241  0015 81            	ret
 465                     .const:	section	.text
 466  0000               L01:
 467  0000 000f4240      	dc.l	1000000
 468  0004               L21:
 469  0004 000186a1      	dc.l	100001
 470  0008               L41:
 471  0008 00000004      	dc.l	4
 472                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 472                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 472                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 472                     ; 187 {
 473                     .text:	section	.text,new
 474  0000               _I2C_Init:
 476  0000 89            	pushw	x
 477  0001 520c          	subw	sp,#12
 478       0000000c      OFST:	set	12
 481                     ; 188   uint32_t result = 0x0004;
 483                     ; 189   uint16_t tmpval = 0;
 485                     ; 190   uint8_t tmpccrh = 0;
 487  0003 0f07          	clr	(OFST-5,sp)
 488                     ; 191   uint8_t input_clock = 0;
 490                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 492                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 494                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 496                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 498                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 500                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 502                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 504  0005 cd0000        	call	_CLK_GetClockFreq
 506  0008 ae0000        	ldw	x,#L01
 507  000b cd0000        	call	c_ludv
 509  000e b603          	ld	a,c_lreg+3
 510  0010 6b08          	ld	(OFST-4,sp),a
 511                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 513  0012 1e0d          	ldw	x,(OFST+1,sp)
 514  0014 e602          	ld	a,(2,x)
 515  0016 a4c0          	and	a,#192
 516  0018 e702          	ld	(2,x),a
 517                     ; 209   I2Cx->FREQR |= input_clock;
 519  001a 1e0d          	ldw	x,(OFST+1,sp)
 520  001c e602          	ld	a,(2,x)
 521  001e 1a08          	or	a,(OFST-4,sp)
 522  0020 e702          	ld	(2,x),a
 523                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 525  0022 1e0d          	ldw	x,(OFST+1,sp)
 526  0024 f6            	ld	a,(x)
 527  0025 a4fe          	and	a,#254
 528  0027 f7            	ld	(x),a
 529                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 531  0028 1e0d          	ldw	x,(OFST+1,sp)
 532  002a e60c          	ld	a,(12,x)
 533  002c a430          	and	a,#48
 534  002e e70c          	ld	(12,x),a
 535                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 537  0030 1e0d          	ldw	x,(OFST+1,sp)
 538  0032 6f0b          	clr	(11,x)
 539                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 541  0034 96            	ldw	x,sp
 542  0035 1c0011        	addw	x,#OFST+5
 543  0038 cd0000        	call	c_ltor
 545  003b ae0004        	ldw	x,#L21
 546  003e cd0000        	call	c_lcmp
 548  0041 2403          	jruge	L61
 549  0043 cc00e1        	jp	L362
 550  0046               L61:
 551                     ; 223     tmpccrh = I2C_CCRH_FS;
 553  0046 a680          	ld	a,#128
 554  0048 6b07          	ld	(OFST-5,sp),a
 555                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 557  004a 0d18          	tnz	(OFST+12,sp)
 558  004c 2633          	jrne	L562
 559                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 561  004e 96            	ldw	x,sp
 562  004f 1c0011        	addw	x,#OFST+5
 563  0052 cd0000        	call	c_ltor
 565  0055 a603          	ld	a,#3
 566  0057 cd0000        	call	c_smul
 568  005a 96            	ldw	x,sp
 569  005b 1c0001        	addw	x,#OFST-11
 570  005e cd0000        	call	c_rtol
 572  0061 7b08          	ld	a,(OFST-4,sp)
 573  0063 b703          	ld	c_lreg+3,a
 574  0065 3f02          	clr	c_lreg+2
 575  0067 3f01          	clr	c_lreg+1
 576  0069 3f00          	clr	c_lreg
 577  006b ae0000        	ldw	x,#L01
 578  006e cd0000        	call	c_lmul
 580  0071 96            	ldw	x,sp
 581  0072 1c0001        	addw	x,#OFST-11
 582  0075 cd0000        	call	c_ludv
 584  0078 96            	ldw	x,sp
 585  0079 1c0009        	addw	x,#OFST-3
 586  007c cd0000        	call	c_rtol
 589  007f 2037          	jra	L762
 590  0081               L562:
 591                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 593  0081 96            	ldw	x,sp
 594  0082 1c0011        	addw	x,#OFST+5
 595  0085 cd0000        	call	c_ltor
 597  0088 a619          	ld	a,#25
 598  008a cd0000        	call	c_smul
 600  008d 96            	ldw	x,sp
 601  008e 1c0001        	addw	x,#OFST-11
 602  0091 cd0000        	call	c_rtol
 604  0094 7b08          	ld	a,(OFST-4,sp)
 605  0096 b703          	ld	c_lreg+3,a
 606  0098 3f02          	clr	c_lreg+2
 607  009a 3f01          	clr	c_lreg+1
 608  009c 3f00          	clr	c_lreg
 609  009e ae0000        	ldw	x,#L01
 610  00a1 cd0000        	call	c_lmul
 612  00a4 96            	ldw	x,sp
 613  00a5 1c0001        	addw	x,#OFST-11
 614  00a8 cd0000        	call	c_ludv
 616  00ab 96            	ldw	x,sp
 617  00ac 1c0009        	addw	x,#OFST-3
 618  00af cd0000        	call	c_rtol
 620                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 622  00b2 7b07          	ld	a,(OFST-5,sp)
 623  00b4 aa40          	or	a,#64
 624  00b6 6b07          	ld	(OFST-5,sp),a
 625  00b8               L762:
 626                     ; 239     if (result < (uint16_t)0x01)
 628  00b8 96            	ldw	x,sp
 629  00b9 1c0009        	addw	x,#OFST-3
 630  00bc cd0000        	call	c_lzmp
 632  00bf 260a          	jrne	L172
 633                     ; 242       result = (uint16_t)0x0001;
 635  00c1 ae0001        	ldw	x,#1
 636  00c4 1f0b          	ldw	(OFST-1,sp),x
 637  00c6 ae0000        	ldw	x,#0
 638  00c9 1f09          	ldw	(OFST-3,sp),x
 639  00cb               L172:
 640                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 642  00cb 7b08          	ld	a,(OFST-4,sp)
 643  00cd 97            	ld	xl,a
 644  00ce a603          	ld	a,#3
 645  00d0 42            	mul	x,a
 646  00d1 a60a          	ld	a,#10
 647  00d3 cd0000        	call	c_sdivx
 649  00d6 5c            	incw	x
 650  00d7 1f05          	ldw	(OFST-7,sp),x
 651                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 653  00d9 7b06          	ld	a,(OFST-6,sp)
 654  00db 1e0d          	ldw	x,(OFST+1,sp)
 655  00dd e70d          	ld	(13,x),a
 657  00df 205c          	jra	L372
 658  00e1               L362:
 659                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 661  00e1 96            	ldw	x,sp
 662  00e2 1c0011        	addw	x,#OFST+5
 663  00e5 cd0000        	call	c_ltor
 665  00e8 3803          	sll	c_lreg+3
 666  00ea 3902          	rlc	c_lreg+2
 667  00ec 3901          	rlc	c_lreg+1
 668  00ee 3900          	rlc	c_lreg
 669  00f0 96            	ldw	x,sp
 670  00f1 1c0001        	addw	x,#OFST-11
 671  00f4 cd0000        	call	c_rtol
 673  00f7 7b08          	ld	a,(OFST-4,sp)
 674  00f9 b703          	ld	c_lreg+3,a
 675  00fb 3f02          	clr	c_lreg+2
 676  00fd 3f01          	clr	c_lreg+1
 677  00ff 3f00          	clr	c_lreg
 678  0101 ae0000        	ldw	x,#L01
 679  0104 cd0000        	call	c_lmul
 681  0107 96            	ldw	x,sp
 682  0108 1c0001        	addw	x,#OFST-11
 683  010b cd0000        	call	c_ludv
 685  010e b602          	ld	a,c_lreg+2
 686  0110 97            	ld	xl,a
 687  0111 b603          	ld	a,c_lreg+3
 688  0113 cd0000        	call	c_uitol
 690  0116 96            	ldw	x,sp
 691  0117 1c0009        	addw	x,#OFST-3
 692  011a cd0000        	call	c_rtol
 694                     ; 259     if (result < (uint16_t)0x0004)
 696  011d 96            	ldw	x,sp
 697  011e 1c0009        	addw	x,#OFST-3
 698  0121 cd0000        	call	c_ltor
 700  0124 ae0008        	ldw	x,#L41
 701  0127 cd0000        	call	c_lcmp
 703  012a 240a          	jruge	L572
 704                     ; 262       result = (uint16_t)0x0004;
 706  012c ae0004        	ldw	x,#4
 707  012f 1f0b          	ldw	(OFST-1,sp),x
 708  0131 ae0000        	ldw	x,#0
 709  0134 1f09          	ldw	(OFST-3,sp),x
 710  0136               L572:
 711                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 713  0136 7b08          	ld	a,(OFST-4,sp)
 714  0138 4c            	inc	a
 715  0139 1e0d          	ldw	x,(OFST+1,sp)
 716  013b e70d          	ld	(13,x),a
 717  013d               L372:
 718                     ; 273   I2Cx->CCRL = (uint8_t)result;
 720  013d 7b0c          	ld	a,(OFST+0,sp)
 721  013f 1e0d          	ldw	x,(OFST+1,sp)
 722  0141 e70b          	ld	(11,x),a
 723                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 725  0143 7b07          	ld	a,(OFST-5,sp)
 726  0145 1e0d          	ldw	x,(OFST+1,sp)
 727  0147 e70c          	ld	(12,x),a
 728                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 730  0149 1e0d          	ldw	x,(OFST+1,sp)
 731  014b 7b17          	ld	a,(OFST+11,sp)
 732  014d aa01          	or	a,#1
 733  014f fa            	or	a,(x)
 734  0150 f7            	ld	(x),a
 735                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 737  0151 1e0d          	ldw	x,(OFST+1,sp)
 738  0153 e601          	ld	a,(1,x)
 739  0155 1a19          	or	a,(OFST+13,sp)
 740  0157 e701          	ld	(1,x),a
 741                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 743  0159 7b16          	ld	a,(OFST+10,sp)
 744  015b 1e0d          	ldw	x,(OFST+1,sp)
 745  015d e703          	ld	(3,x),a
 746                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 746                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 748  015f 7b15          	ld	a,(OFST+9,sp)
 749  0161 97            	ld	xl,a
 750  0162 7b16          	ld	a,(OFST+10,sp)
 751  0164 9f            	ld	a,xl
 752  0165 a403          	and	a,#3
 753  0167 97            	ld	xl,a
 754  0168 4f            	clr	a
 755  0169 02            	rlwa	x,a
 756  016a 4f            	clr	a
 757  016b 01            	rrwa	x,a
 758  016c 48            	sll	a
 759  016d 59            	rlcw	x
 760  016e 9f            	ld	a,xl
 761  016f 6b04          	ld	(OFST-8,sp),a
 762  0171 7b1a          	ld	a,(OFST+14,sp)
 763  0173 aa40          	or	a,#64
 764  0175 1a04          	or	a,(OFST-8,sp)
 765  0177 1e0d          	ldw	x,(OFST+1,sp)
 766  0179 e704          	ld	(4,x),a
 767                     ; 286 }
 770  017b 5b0e          	addw	sp,#14
 771  017d 81            	ret
 838                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 838                     ; 296 {
 839                     .text:	section	.text,new
 840  0000               _I2C_Cmd:
 842  0000 89            	pushw	x
 843       00000000      OFST:	set	0
 846                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 848                     ; 301   if (NewState != DISABLE)
 850  0001 0d05          	tnz	(OFST+5,sp)
 851  0003 2706          	jreq	L333
 852                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 854  0005 f6            	ld	a,(x)
 855  0006 aa01          	or	a,#1
 856  0008 f7            	ld	(x),a
 858  0009 2006          	jra	L533
 859  000b               L333:
 860                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 862  000b 1e01          	ldw	x,(OFST+1,sp)
 863  000d f6            	ld	a,(x)
 864  000e a4fe          	and	a,#254
 865  0010 f7            	ld	(x),a
 866  0011               L533:
 867                     ; 311 }
 870  0011 85            	popw	x
 871  0012 81            	ret
 918                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 918                     ; 321 {
 919                     .text:	section	.text,new
 920  0000               _I2C_GeneralCallCmd:
 922  0000 89            	pushw	x
 923       00000000      OFST:	set	0
 926                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 928                     ; 326   if (NewState != DISABLE)
 930  0001 0d05          	tnz	(OFST+5,sp)
 931  0003 2706          	jreq	L363
 932                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 934  0005 f6            	ld	a,(x)
 935  0006 aa40          	or	a,#64
 936  0008 f7            	ld	(x),a
 938  0009 2006          	jra	L563
 939  000b               L363:
 940                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 942  000b 1e01          	ldw	x,(OFST+1,sp)
 943  000d f6            	ld	a,(x)
 944  000e a4bf          	and	a,#191
 945  0010 f7            	ld	(x),a
 946  0011               L563:
 947                     ; 336 }
 950  0011 85            	popw	x
 951  0012 81            	ret
 998                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 998                     ; 348 {
 999                     .text:	section	.text,new
1000  0000               _I2C_GenerateSTART:
1002  0000 89            	pushw	x
1003       00000000      OFST:	set	0
1006                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1008                     ; 353   if (NewState != DISABLE)
1010  0001 0d05          	tnz	(OFST+5,sp)
1011  0003 2708          	jreq	L314
1012                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1014  0005 e601          	ld	a,(1,x)
1015  0007 aa01          	or	a,#1
1016  0009 e701          	ld	(1,x),a
1018  000b 2008          	jra	L514
1019  000d               L314:
1020                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1022  000d 1e01          	ldw	x,(OFST+1,sp)
1023  000f e601          	ld	a,(1,x)
1024  0011 a4fe          	and	a,#254
1025  0013 e701          	ld	(1,x),a
1026  0015               L514:
1027                     ; 363 }
1030  0015 85            	popw	x
1031  0016 81            	ret
1078                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1078                     ; 373 {
1079                     .text:	section	.text,new
1080  0000               _I2C_GenerateSTOP:
1082  0000 89            	pushw	x
1083       00000000      OFST:	set	0
1086                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1088                     ; 378   if (NewState != DISABLE)
1090  0001 0d05          	tnz	(OFST+5,sp)
1091  0003 2708          	jreq	L344
1092                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1094  0005 e601          	ld	a,(1,x)
1095  0007 aa02          	or	a,#2
1096  0009 e701          	ld	(1,x),a
1098  000b 2008          	jra	L544
1099  000d               L344:
1100                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1102  000d 1e01          	ldw	x,(OFST+1,sp)
1103  000f e601          	ld	a,(1,x)
1104  0011 a4fd          	and	a,#253
1105  0013 e701          	ld	(1,x),a
1106  0015               L544:
1107                     ; 388 }
1110  0015 85            	popw	x
1111  0016 81            	ret
1159                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1159                     ; 398 {
1160                     .text:	section	.text,new
1161  0000               _I2C_SoftwareResetCmd:
1163  0000 89            	pushw	x
1164       00000000      OFST:	set	0
1167                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1169                     ; 402   if (NewState != DISABLE)
1171  0001 0d05          	tnz	(OFST+5,sp)
1172  0003 2708          	jreq	L374
1173                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1175  0005 e601          	ld	a,(1,x)
1176  0007 aa80          	or	a,#128
1177  0009 e701          	ld	(1,x),a
1179  000b 2008          	jra	L574
1180  000d               L374:
1181                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1183  000d 1e01          	ldw	x,(OFST+1,sp)
1184  000f e601          	ld	a,(1,x)
1185  0011 a47f          	and	a,#127
1186  0013 e701          	ld	(1,x),a
1187  0015               L574:
1188                     ; 412 }
1191  0015 85            	popw	x
1192  0016 81            	ret
1240                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1240                     ; 422 {
1241                     .text:	section	.text,new
1242  0000               _I2C_StretchClockCmd:
1244  0000 89            	pushw	x
1245       00000000      OFST:	set	0
1248                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1250                     ; 426   if (NewState != DISABLE)
1252  0001 0d05          	tnz	(OFST+5,sp)
1253  0003 2706          	jreq	L325
1254                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1256  0005 f6            	ld	a,(x)
1257  0006 a47f          	and	a,#127
1258  0008 f7            	ld	(x),a
1260  0009 2006          	jra	L525
1261  000b               L325:
1262                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1264  000b 1e01          	ldw	x,(OFST+1,sp)
1265  000d f6            	ld	a,(x)
1266  000e aa80          	or	a,#128
1267  0010 f7            	ld	(x),a
1268  0011               L525:
1269                     ; 437 }
1272  0011 85            	popw	x
1273  0012 81            	ret
1320                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1320                     ; 447 {
1321                     .text:	section	.text,new
1322  0000               _I2C_ARPCmd:
1324  0000 89            	pushw	x
1325       00000000      OFST:	set	0
1328                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1330                     ; 451   if (NewState != DISABLE)
1332  0001 0d05          	tnz	(OFST+5,sp)
1333  0003 2706          	jreq	L355
1334                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1336  0005 f6            	ld	a,(x)
1337  0006 aa10          	or	a,#16
1338  0008 f7            	ld	(x),a
1340  0009 2006          	jra	L555
1341  000b               L355:
1342                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1344  000b 1e01          	ldw	x,(OFST+1,sp)
1345  000d f6            	ld	a,(x)
1346  000e a4ef          	and	a,#239
1347  0010 f7            	ld	(x),a
1348  0011               L555:
1349                     ; 462 }
1352  0011 85            	popw	x
1353  0012 81            	ret
1401                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1401                     ; 472 {
1402                     .text:	section	.text,new
1403  0000               _I2C_AcknowledgeConfig:
1405  0000 89            	pushw	x
1406       00000000      OFST:	set	0
1409                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1411                     ; 476   if (NewState != DISABLE)
1413  0001 0d05          	tnz	(OFST+5,sp)
1414  0003 2708          	jreq	L306
1415                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1417  0005 e601          	ld	a,(1,x)
1418  0007 aa04          	or	a,#4
1419  0009 e701          	ld	(1,x),a
1421  000b 2008          	jra	L506
1422  000d               L306:
1423                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1425  000d 1e01          	ldw	x,(OFST+1,sp)
1426  000f e601          	ld	a,(1,x)
1427  0011 a4fb          	and	a,#251
1428  0013 e701          	ld	(1,x),a
1429  0015               L506:
1430                     ; 486 }
1433  0015 85            	popw	x
1434  0016 81            	ret
1490                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1490                     ; 495 {
1491                     .text:	section	.text,new
1492  0000               _I2C_OwnAddress2Config:
1494  0000 89            	pushw	x
1495  0001 88            	push	a
1496       00000001      OFST:	set	1
1499                     ; 496   uint8_t tmpreg = 0;
1501                     ; 499   tmpreg = I2Cx->OAR2;
1503  0002 e605          	ld	a,(5,x)
1504  0004 6b01          	ld	(OFST+0,sp),a
1505                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1507  0006 7b01          	ld	a,(OFST+0,sp)
1508  0008 a401          	and	a,#1
1509  000a 6b01          	ld	(OFST+0,sp),a
1510                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1512  000c 7b06          	ld	a,(OFST+5,sp)
1513  000e a4fe          	and	a,#254
1514  0010 1a01          	or	a,(OFST+0,sp)
1515  0012 6b01          	ld	(OFST+0,sp),a
1516                     ; 508   I2Cx->OAR2 = tmpreg;
1518  0014 7b01          	ld	a,(OFST+0,sp)
1519  0016 1e02          	ldw	x,(OFST+1,sp)
1520  0018 e705          	ld	(5,x),a
1521                     ; 509 }
1524  001a 5b03          	addw	sp,#3
1525  001c 81            	ret
1572                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1572                     ; 519 {
1573                     .text:	section	.text,new
1574  0000               _I2C_DualAddressCmd:
1576  0000 89            	pushw	x
1577       00000000      OFST:	set	0
1580                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1582                     ; 523   if (NewState != DISABLE)
1584  0001 0d05          	tnz	(OFST+5,sp)
1585  0003 2708          	jreq	L366
1586                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1588  0005 e605          	ld	a,(5,x)
1589  0007 aa01          	or	a,#1
1590  0009 e705          	ld	(5,x),a
1592  000b 2008          	jra	L566
1593  000d               L366:
1594                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1596  000d 1e01          	ldw	x,(OFST+1,sp)
1597  000f e605          	ld	a,(5,x)
1598  0011 a4fe          	and	a,#254
1599  0013 e705          	ld	(5,x),a
1600  0015               L566:
1601                     ; 533 }
1604  0015 85            	popw	x
1605  0016 81            	ret
1675                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1675                     ; 546 {
1676                     .text:	section	.text,new
1677  0000               _I2C_AckPositionConfig:
1679  0000 89            	pushw	x
1680       00000000      OFST:	set	0
1683                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1685                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1687  0001 e601          	ld	a,(1,x)
1688  0003 a4f7          	and	a,#247
1689  0005 e701          	ld	(1,x),a
1690                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1692  0007 e601          	ld	a,(1,x)
1693  0009 1a05          	or	a,(OFST+5,sp)
1694  000b e701          	ld	(1,x),a
1695                     ; 554 }
1698  000d 85            	popw	x
1699  000e 81            	ret
1768                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1768                     ; 566 {
1769                     .text:	section	.text,new
1770  0000               _I2C_SMBusAlertConfig:
1772  0000 89            	pushw	x
1773       00000000      OFST:	set	0
1776                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1778                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1780  0001 0d05          	tnz	(OFST+5,sp)
1781  0003 2708          	jreq	L757
1782                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1784  0005 e601          	ld	a,(1,x)
1785  0007 aa20          	or	a,#32
1786  0009 e701          	ld	(1,x),a
1788  000b 2008          	jra	L167
1789  000d               L757:
1790                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1792  000d 1e01          	ldw	x,(OFST+1,sp)
1793  000f e601          	ld	a,(1,x)
1794  0011 a4df          	and	a,#223
1795  0013 e701          	ld	(1,x),a
1796  0015               L167:
1797                     ; 581 }
1800  0015 85            	popw	x
1801  0016 81            	ret
1849                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1849                     ; 593 {
1850                     .text:	section	.text,new
1851  0000               _I2C_FastModeDutyCycleConfig:
1853  0000 89            	pushw	x
1854       00000000      OFST:	set	0
1857                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1859                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1861  0001 7b05          	ld	a,(OFST+5,sp)
1862  0003 a140          	cp	a,#64
1863  0005 2608          	jrne	L7001
1864                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1866  0007 e60c          	ld	a,(12,x)
1867  0009 aa40          	or	a,#64
1868  000b e70c          	ld	(12,x),a
1870  000d 2008          	jra	L1101
1871  000f               L7001:
1872                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1874  000f 1e01          	ldw	x,(OFST+1,sp)
1875  0011 e60c          	ld	a,(12,x)
1876  0013 a4bf          	and	a,#191
1877  0015 e70c          	ld	(12,x),a
1878  0017               L1101:
1879                     ; 608 }
1882  0017 85            	popw	x
1883  0018 81            	ret
1962                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1962                     ; 622 {
1963                     .text:	section	.text,new
1964  0000               _I2C_Send7bitAddress:
1966  0000 89            	pushw	x
1967       00000000      OFST:	set	0
1970                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1972                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1974                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1976  0001 0d06          	tnz	(OFST+6,sp)
1977  0003 2708          	jreq	L3501
1978                     ; 631     Address |= OAR1_ADD0_Set;
1980  0005 7b05          	ld	a,(OFST+5,sp)
1981  0007 aa01          	or	a,#1
1982  0009 6b05          	ld	(OFST+5,sp),a
1984  000b 2006          	jra	L5501
1985  000d               L3501:
1986                     ; 636     Address &= OAR1_ADD0_Reset;
1988  000d 7b05          	ld	a,(OFST+5,sp)
1989  000f a4fe          	and	a,#254
1990  0011 6b05          	ld	(OFST+5,sp),a
1991  0013               L5501:
1992                     ; 639   I2Cx->DR = Address;
1994  0013 7b05          	ld	a,(OFST+5,sp)
1995  0015 1e01          	ldw	x,(OFST+1,sp)
1996  0017 e706          	ld	(6,x),a
1997                     ; 640 }
2000  0019 85            	popw	x
2001  001a 81            	ret
2047                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2047                     ; 665 {
2048                     .text:	section	.text,new
2049  0000               _I2C_SendData:
2051  0000 89            	pushw	x
2052       00000000      OFST:	set	0
2055                     ; 667   I2Cx->DR = Data;
2057  0001 7b05          	ld	a,(OFST+5,sp)
2058  0003 1e01          	ldw	x,(OFST+1,sp)
2059  0005 e706          	ld	(6,x),a
2060                     ; 668 }
2063  0007 85            	popw	x
2064  0008 81            	ret
2101                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2101                     ; 677 {
2102                     .text:	section	.text,new
2103  0000               _I2C_ReceiveData:
2107                     ; 679   return ((uint8_t)I2Cx->DR);
2109  0000 e606          	ld	a,(6,x)
2112  0002 81            	ret
2159                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2159                     ; 706 {
2160                     .text:	section	.text,new
2161  0000               _I2C_TransmitPEC:
2163  0000 89            	pushw	x
2164       00000000      OFST:	set	0
2167                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2169                     ; 710   if (NewState != DISABLE)
2171  0001 0d05          	tnz	(OFST+5,sp)
2172  0003 2708          	jreq	L7411
2173                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2175  0005 e601          	ld	a,(1,x)
2176  0007 aa10          	or	a,#16
2177  0009 e701          	ld	(1,x),a
2179  000b 2008          	jra	L1511
2180  000d               L7411:
2181                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2183  000d 1e01          	ldw	x,(OFST+1,sp)
2184  000f e601          	ld	a,(1,x)
2185  0011 a4ef          	and	a,#239
2186  0013 e701          	ld	(1,x),a
2187  0015               L1511:
2188                     ; 720 }
2191  0015 85            	popw	x
2192  0016 81            	ret
2239                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2239                     ; 730 {
2240                     .text:	section	.text,new
2241  0000               _I2C_CalculatePEC:
2243  0000 89            	pushw	x
2244       00000000      OFST:	set	0
2247                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2249                     ; 734   if (NewState != DISABLE)
2251  0001 0d05          	tnz	(OFST+5,sp)
2252  0003 2706          	jreq	L7711
2253                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2255  0005 f6            	ld	a,(x)
2256  0006 aa20          	or	a,#32
2257  0008 f7            	ld	(x),a
2259  0009 2006          	jra	L1021
2260  000b               L7711:
2261                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2263  000b 1e01          	ldw	x,(OFST+1,sp)
2264  000d f6            	ld	a,(x)
2265  000e a4df          	and	a,#223
2266  0010 f7            	ld	(x),a
2267  0011               L1021:
2268                     ; 744 }
2271  0011 85            	popw	x
2272  0012 81            	ret
2342                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2342                     ; 756 {
2343                     .text:	section	.text,new
2344  0000               _I2C_PECPositionConfig:
2346  0000 89            	pushw	x
2347       00000000      OFST:	set	0
2350                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2352                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2354  0001 e601          	ld	a,(1,x)
2355  0003 a4f7          	and	a,#247
2356  0005 e701          	ld	(1,x),a
2357                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2359  0007 e601          	ld	a,(1,x)
2360  0009 1a05          	or	a,(OFST+5,sp)
2361  000b e701          	ld	(1,x),a
2362                     ; 764 }
2365  000d 85            	popw	x
2366  000e 81            	ret
2403                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2403                     ; 773 {
2404                     .text:	section	.text,new
2405  0000               _I2C_GetPEC:
2409                     ; 775   return (I2Cx->PECR);
2411  0000 e60e          	ld	a,(14,x)
2414  0002 81            	ret
2461                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2461                     ; 804 {
2462                     .text:	section	.text,new
2463  0000               _I2C_DMACmd:
2465  0000 89            	pushw	x
2466       00000000      OFST:	set	0
2469                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2471                     ; 808   if (NewState != DISABLE)
2473  0001 0d05          	tnz	(OFST+5,sp)
2474  0003 2708          	jreq	L3031
2475                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2477  0005 e60a          	ld	a,(10,x)
2478  0007 aa08          	or	a,#8
2479  0009 e70a          	ld	(10,x),a
2481  000b 2008          	jra	L5031
2482  000d               L3031:
2483                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2485  000d 1e01          	ldw	x,(OFST+1,sp)
2486  000f e60a          	ld	a,(10,x)
2487  0011 a4f7          	and	a,#247
2488  0013 e70a          	ld	(10,x),a
2489  0015               L5031:
2490                     ; 818 }
2493  0015 85            	popw	x
2494  0016 81            	ret
2542                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2542                     ; 828 {
2543                     .text:	section	.text,new
2544  0000               _I2C_DMALastTransferCmd:
2546  0000 89            	pushw	x
2547       00000000      OFST:	set	0
2550                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2552                     ; 832   if (NewState != DISABLE)
2554  0001 0d05          	tnz	(OFST+5,sp)
2555  0003 2708          	jreq	L3331
2556                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2558  0005 e60a          	ld	a,(10,x)
2559  0007 aa10          	or	a,#16
2560  0009 e70a          	ld	(10,x),a
2562  000b 2008          	jra	L5331
2563  000d               L3331:
2564                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2566  000d 1e01          	ldw	x,(OFST+1,sp)
2567  000f e60a          	ld	a,(10,x)
2568  0011 a4ef          	and	a,#239
2569  0013 e70a          	ld	(10,x),a
2570  0015               L5331:
2571                     ; 842 }
2574  0015 85            	popw	x
2575  0016 81            	ret
2764                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2764                     ; 955 {
2765                     .text:	section	.text,new
2766  0000               _I2C_ITConfig:
2768  0000 89            	pushw	x
2769       00000000      OFST:	set	0
2772                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2774                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2776                     ; 960   if (NewState != DISABLE)
2778  0001 0d07          	tnz	(OFST+7,sp)
2779  0003 2708          	jreq	L7341
2780                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2782  0005 e60a          	ld	a,(10,x)
2783  0007 1a06          	or	a,(OFST+6,sp)
2784  0009 e70a          	ld	(10,x),a
2786  000b 2009          	jra	L1441
2787  000d               L7341:
2788                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2790  000d 1e01          	ldw	x,(OFST+1,sp)
2791  000f 7b06          	ld	a,(OFST+6,sp)
2792  0011 43            	cpl	a
2793  0012 e40a          	and	a,(10,x)
2794  0014 e70a          	ld	(10,x),a
2795  0016               L1441:
2796                     ; 970 }
2799  0016 85            	popw	x
2800  0017 81            	ret
2961                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2961                     ; 995 {
2962                     .text:	section	.text,new
2963  0000               _I2C_ReadRegister:
2965  0000 89            	pushw	x
2966  0001 5204          	subw	sp,#4
2967       00000004      OFST:	set	4
2970                     ; 996   __IO uint16_t tmp = 0;
2972  0003 5f            	clrw	x
2973  0004 1f03          	ldw	(OFST-1,sp),x
2974                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2976                     ; 1000   tmp = (uint16_t) I2Cx;
2978  0006 1e05          	ldw	x,(OFST+1,sp)
2979  0008 1f03          	ldw	(OFST-1,sp),x
2980                     ; 1001   tmp += I2C_Register;
2982  000a 7b09          	ld	a,(OFST+5,sp)
2983  000c 5f            	clrw	x
2984  000d 97            	ld	xl,a
2985  000e 1f01          	ldw	(OFST-3,sp),x
2986  0010 1e03          	ldw	x,(OFST-1,sp)
2987  0012 72fb01        	addw	x,(OFST-3,sp)
2988  0015 1f03          	ldw	(OFST-1,sp),x
2989                     ; 1004   return (*(__IO uint8_t *) tmp);
2991  0017 1e03          	ldw	x,(OFST-1,sp)
2992  0019 f6            	ld	a,(x)
2995  001a 5b06          	addw	sp,#6
2996  001c 81            	ret
3250                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3250                     ; 1045 {
3251                     .text:	section	.text,new
3252  0000               _I2C_CheckEvent:
3254  0000 89            	pushw	x
3255  0001 5206          	subw	sp,#6
3256       00000006      OFST:	set	6
3259                     ; 1046   __IO uint16_t lastevent = 0x00;
3261  0003 5f            	clrw	x
3262  0004 1f04          	ldw	(OFST-2,sp),x
3263                     ; 1047   uint8_t flag1 = 0x00 ;
3265                     ; 1048   uint8_t flag2 = 0x00;
3267                     ; 1049   ErrorStatus status = ERROR;
3269                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3271                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3273  0006 1e0b          	ldw	x,(OFST+5,sp)
3274  0008 a30004        	cpw	x,#4
3275  000b 260c          	jrne	L5561
3276                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3278  000d 1e07          	ldw	x,(OFST+1,sp)
3279  000f e608          	ld	a,(8,x)
3280  0011 a404          	and	a,#4
3281  0013 5f            	clrw	x
3282  0014 97            	ld	xl,a
3283  0015 1f04          	ldw	(OFST-2,sp),x
3285  0017 2021          	jra	L7561
3286  0019               L5561:
3287                     ; 1060     flag1 = I2Cx->SR1;
3289  0019 1e07          	ldw	x,(OFST+1,sp)
3290  001b e607          	ld	a,(7,x)
3291  001d 6b03          	ld	(OFST-3,sp),a
3292                     ; 1061     flag2 = I2Cx->SR3;
3294  001f 1e07          	ldw	x,(OFST+1,sp)
3295  0021 e609          	ld	a,(9,x)
3296  0023 6b06          	ld	(OFST+0,sp),a
3297                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3299  0025 7b03          	ld	a,(OFST-3,sp)
3300  0027 5f            	clrw	x
3301  0028 97            	ld	xl,a
3302  0029 1f01          	ldw	(OFST-5,sp),x
3303  002b 7b06          	ld	a,(OFST+0,sp)
3304  002d 5f            	clrw	x
3305  002e 97            	ld	xl,a
3306  002f 4f            	clr	a
3307  0030 02            	rlwa	x,a
3308  0031 01            	rrwa	x,a
3309  0032 1a02          	or	a,(OFST-4,sp)
3310  0034 01            	rrwa	x,a
3311  0035 1a01          	or	a,(OFST-5,sp)
3312  0037 01            	rrwa	x,a
3313  0038 1f04          	ldw	(OFST-2,sp),x
3314  003a               L7561:
3315                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3317  003a 1e04          	ldw	x,(OFST-2,sp)
3318  003c 01            	rrwa	x,a
3319  003d 140c          	and	a,(OFST+6,sp)
3320  003f 01            	rrwa	x,a
3321  0040 140b          	and	a,(OFST+5,sp)
3322  0042 01            	rrwa	x,a
3323  0043 130b          	cpw	x,(OFST+5,sp)
3324  0045 2606          	jrne	L1661
3325                     ; 1068     status = SUCCESS;
3327  0047 a601          	ld	a,#1
3328  0049 6b06          	ld	(OFST+0,sp),a
3330  004b 2002          	jra	L3661
3331  004d               L1661:
3332                     ; 1073     status = ERROR;
3334  004d 0f06          	clr	(OFST+0,sp)
3335  004f               L3661:
3336                     ; 1077   return status;
3338  004f 7b06          	ld	a,(OFST+0,sp)
3341  0051 5b08          	addw	sp,#8
3342  0053 81            	ret
3407                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3407                     ; 1096 {
3408                     .text:	section	.text,new
3409  0000               _I2C_GetLastEvent:
3411  0000 89            	pushw	x
3412  0001 5206          	subw	sp,#6
3413       00000006      OFST:	set	6
3416                     ; 1097   __IO uint16_t lastevent = 0;
3418  0003 5f            	clrw	x
3419  0004 1f05          	ldw	(OFST-1,sp),x
3420                     ; 1098   uint16_t flag1 = 0;
3422                     ; 1099   uint16_t flag2 = 0;
3424                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3426  0006 1e07          	ldw	x,(OFST+1,sp)
3427  0008 e608          	ld	a,(8,x)
3428  000a a504          	bcp	a,#4
3429  000c 2707          	jreq	L1271
3430                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3432  000e ae0004        	ldw	x,#4
3433  0011 1f05          	ldw	(OFST-1,sp),x
3435  0013 201d          	jra	L3271
3436  0015               L1271:
3437                     ; 1108     flag1 = I2Cx->SR1;
3439  0015 1e07          	ldw	x,(OFST+1,sp)
3440  0017 e607          	ld	a,(7,x)
3441  0019 5f            	clrw	x
3442  001a 97            	ld	xl,a
3443  001b 1f01          	ldw	(OFST-5,sp),x
3444                     ; 1109     flag2 = I2Cx->SR3;
3446  001d 1e07          	ldw	x,(OFST+1,sp)
3447  001f e609          	ld	a,(9,x)
3448  0021 5f            	clrw	x
3449  0022 97            	ld	xl,a
3450  0023 1f03          	ldw	(OFST-3,sp),x
3451                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3453  0025 1e03          	ldw	x,(OFST-3,sp)
3454  0027 4f            	clr	a
3455  0028 02            	rlwa	x,a
3456  0029 01            	rrwa	x,a
3457  002a 1a02          	or	a,(OFST-4,sp)
3458  002c 01            	rrwa	x,a
3459  002d 1a01          	or	a,(OFST-5,sp)
3460  002f 01            	rrwa	x,a
3461  0030 1f05          	ldw	(OFST-1,sp),x
3462  0032               L3271:
3463                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3465  0032 1e05          	ldw	x,(OFST-1,sp)
3468  0034 5b08          	addw	sp,#8
3469  0036 81            	ret
3726                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3726                     ; 1153 {
3727                     .text:	section	.text,new
3728  0000               _I2C_GetFlagStatus:
3730  0000 89            	pushw	x
3731  0001 89            	pushw	x
3732       00000002      OFST:	set	2
3735                     ; 1154   uint8_t tempreg = 0;
3737  0002 0f02          	clr	(OFST+0,sp)
3738                     ; 1155   uint8_t regindex = 0;
3740                     ; 1156   FlagStatus bitstatus = RESET;
3742                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3744                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3746  0004 7b07          	ld	a,(OFST+5,sp)
3747  0006 6b01          	ld	(OFST-1,sp),a
3748                     ; 1164   switch (regindex)
3750  0008 7b01          	ld	a,(OFST-1,sp)
3752                     ; 1181     default:
3752                     ; 1182       break;
3753  000a 4a            	dec	a
3754  000b 2708          	jreq	L5271
3755  000d 4a            	dec	a
3756  000e 270d          	jreq	L7271
3757  0010 4a            	dec	a
3758  0011 2712          	jreq	L1371
3759  0013 2016          	jra	L7602
3760  0015               L5271:
3761                     ; 1167     case 0x01:
3761                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3763  0015 1e03          	ldw	x,(OFST+1,sp)
3764  0017 e607          	ld	a,(7,x)
3765  0019 6b02          	ld	(OFST+0,sp),a
3766                     ; 1169       break;
3768  001b 200e          	jra	L7602
3769  001d               L7271:
3770                     ; 1172     case 0x02:
3770                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3772  001d 1e03          	ldw	x,(OFST+1,sp)
3773  001f e608          	ld	a,(8,x)
3774  0021 6b02          	ld	(OFST+0,sp),a
3775                     ; 1174       break;
3777  0023 2006          	jra	L7602
3778  0025               L1371:
3779                     ; 1177     case 0x03:
3779                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3781  0025 1e03          	ldw	x,(OFST+1,sp)
3782  0027 e609          	ld	a,(9,x)
3783  0029 6b02          	ld	(OFST+0,sp),a
3784                     ; 1179       break;
3786  002b               L3371:
3787                     ; 1181     default:
3787                     ; 1182       break;
3789  002b               L7602:
3790                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3792  002b 7b08          	ld	a,(OFST+6,sp)
3793  002d 1502          	bcp	a,(OFST+0,sp)
3794  002f 2706          	jreq	L1702
3795                     ; 1189     bitstatus = SET;
3797  0031 a601          	ld	a,#1
3798  0033 6b02          	ld	(OFST+0,sp),a
3800  0035 2002          	jra	L3702
3801  0037               L1702:
3802                     ; 1194     bitstatus = RESET;
3804  0037 0f02          	clr	(OFST+0,sp)
3805  0039               L3702:
3806                     ; 1197   return bitstatus;
3808  0039 7b02          	ld	a,(OFST+0,sp)
3811  003b 5b04          	addw	sp,#4
3812  003d 81            	ret
3868                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3868                     ; 1230 {
3869                     .text:	section	.text,new
3870  0000               _I2C_ClearFlag:
3872  0000 89            	pushw	x
3873  0001 89            	pushw	x
3874       00000002      OFST:	set	2
3877                     ; 1231   uint16_t flagpos = 0;
3879                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3881                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3883  0002 7b07          	ld	a,(OFST+5,sp)
3884  0004 97            	ld	xl,a
3885  0005 7b08          	ld	a,(OFST+6,sp)
3886  0007 a4ff          	and	a,#255
3887  0009 5f            	clrw	x
3888  000a 02            	rlwa	x,a
3889  000b 1f01          	ldw	(OFST-1,sp),x
3890  000d 01            	rrwa	x,a
3891                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3893  000e 7b02          	ld	a,(OFST+0,sp)
3894  0010 43            	cpl	a
3895  0011 1e03          	ldw	x,(OFST+1,sp)
3896  0013 e708          	ld	(8,x),a
3897                     ; 1239 }
3900  0015 5b04          	addw	sp,#4
3901  0017 81            	ret
3977                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3977                     ; 1265 {
3978                     .text:	section	.text,new
3979  0000               _I2C_GetITStatus:
3981  0000 89            	pushw	x
3982  0001 5204          	subw	sp,#4
3983       00000004      OFST:	set	4
3986                     ; 1266   ITStatus bitstatus = RESET;
3988                     ; 1267   __IO uint8_t enablestatus = 0;
3990  0003 0f03          	clr	(OFST-1,sp)
3991                     ; 1268   uint16_t tempregister = 0;
3993                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3995                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3997  0005 7b09          	ld	a,(OFST+5,sp)
3998  0007 97            	ld	xl,a
3999  0008 7b0a          	ld	a,(OFST+6,sp)
4000  000a 9f            	ld	a,xl
4001  000b a407          	and	a,#7
4002  000d 97            	ld	xl,a
4003  000e 4f            	clr	a
4004  000f 02            	rlwa	x,a
4005  0010 4f            	clr	a
4006  0011 01            	rrwa	x,a
4007  0012 9f            	ld	a,xl
4008  0013 5f            	clrw	x
4009  0014 97            	ld	xl,a
4010  0015 1f01          	ldw	(OFST-3,sp),x
4011                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4013  0017 1e05          	ldw	x,(OFST+1,sp)
4014  0019 e60a          	ld	a,(10,x)
4015  001b 1402          	and	a,(OFST-2,sp)
4016  001d 6b03          	ld	(OFST-1,sp),a
4017                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4019  001f 7b09          	ld	a,(OFST+5,sp)
4020  0021 97            	ld	xl,a
4021  0022 7b0a          	ld	a,(OFST+6,sp)
4022  0024 9f            	ld	a,xl
4023  0025 a430          	and	a,#48
4024  0027 97            	ld	xl,a
4025  0028 4f            	clr	a
4026  0029 02            	rlwa	x,a
4027  002a a30100        	cpw	x,#256
4028  002d 2616          	jrne	L5612
4029                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4031  002f 1e05          	ldw	x,(OFST+1,sp)
4032  0031 e607          	ld	a,(7,x)
4033  0033 150a          	bcp	a,(OFST+6,sp)
4034  0035 270a          	jreq	L7612
4036  0037 0d03          	tnz	(OFST-1,sp)
4037  0039 2706          	jreq	L7612
4038                     ; 1284       bitstatus = SET;
4040  003b a601          	ld	a,#1
4041  003d 6b04          	ld	(OFST+0,sp),a
4043  003f 2018          	jra	L3712
4044  0041               L7612:
4045                     ; 1289       bitstatus = RESET;
4047  0041 0f04          	clr	(OFST+0,sp)
4048  0043 2014          	jra	L3712
4049  0045               L5612:
4050                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4052  0045 1e05          	ldw	x,(OFST+1,sp)
4053  0047 e608          	ld	a,(8,x)
4054  0049 150a          	bcp	a,(OFST+6,sp)
4055  004b 270a          	jreq	L5712
4057  004d 0d03          	tnz	(OFST-1,sp)
4058  004f 2706          	jreq	L5712
4059                     ; 1298       bitstatus = SET;
4061  0051 a601          	ld	a,#1
4062  0053 6b04          	ld	(OFST+0,sp),a
4064  0055 2002          	jra	L3712
4065  0057               L5712:
4066                     ; 1303       bitstatus = RESET;
4068  0057 0f04          	clr	(OFST+0,sp)
4069  0059               L3712:
4070                     ; 1307   return  bitstatus;
4072  0059 7b04          	ld	a,(OFST+0,sp)
4075  005b 5b06          	addw	sp,#6
4076  005d 81            	ret
4133                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4133                     ; 1341 {
4134                     .text:	section	.text,new
4135  0000               _I2C_ClearITPendingBit:
4137  0000 89            	pushw	x
4138  0001 89            	pushw	x
4139       00000002      OFST:	set	2
4142                     ; 1342   uint16_t flagpos = 0;
4144                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4146                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4148  0002 7b07          	ld	a,(OFST+5,sp)
4149  0004 97            	ld	xl,a
4150  0005 7b08          	ld	a,(OFST+6,sp)
4151  0007 a4ff          	and	a,#255
4152  0009 5f            	clrw	x
4153  000a 02            	rlwa	x,a
4154  000b 1f01          	ldw	(OFST-1,sp),x
4155  000d 01            	rrwa	x,a
4156                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4158  000e 7b02          	ld	a,(OFST+0,sp)
4159  0010 43            	cpl	a
4160  0011 1e03          	ldw	x,(OFST+1,sp)
4161  0013 e708          	ld	(8,x),a
4162                     ; 1352 }
4165  0015 5b04          	addw	sp,#4
4166  0017 81            	ret
4179                     	xdef	_I2C_ClearITPendingBit
4180                     	xdef	_I2C_GetITStatus
4181                     	xdef	_I2C_ClearFlag
4182                     	xdef	_I2C_GetFlagStatus
4183                     	xdef	_I2C_GetLastEvent
4184                     	xdef	_I2C_CheckEvent
4185                     	xdef	_I2C_ReadRegister
4186                     	xdef	_I2C_ITConfig
4187                     	xdef	_I2C_DMALastTransferCmd
4188                     	xdef	_I2C_DMACmd
4189                     	xdef	_I2C_CalculatePEC
4190                     	xdef	_I2C_TransmitPEC
4191                     	xdef	_I2C_GetPEC
4192                     	xdef	_I2C_PECPositionConfig
4193                     	xdef	_I2C_ReceiveData
4194                     	xdef	_I2C_SendData
4195                     	xdef	_I2C_Send7bitAddress
4196                     	xdef	_I2C_SMBusAlertConfig
4197                     	xdef	_I2C_FastModeDutyCycleConfig
4198                     	xdef	_I2C_AckPositionConfig
4199                     	xdef	_I2C_DualAddressCmd
4200                     	xdef	_I2C_OwnAddress2Config
4201                     	xdef	_I2C_AcknowledgeConfig
4202                     	xdef	_I2C_GenerateSTOP
4203                     	xdef	_I2C_GenerateSTART
4204                     	xdef	_I2C_ARPCmd
4205                     	xdef	_I2C_StretchClockCmd
4206                     	xdef	_I2C_SoftwareResetCmd
4207                     	xdef	_I2C_GeneralCallCmd
4208                     	xdef	_I2C_Cmd
4209                     	xdef	_I2C_Init
4210                     	xdef	_I2C_DeInit
4211                     	xref	_CLK_GetClockFreq
4212                     	xref.b	c_lreg
4213                     	xref.b	c_x
4232                     	xref	c_uitol
4233                     	xref	c_sdivx
4234                     	xref	c_lzmp
4235                     	xref	c_rtol
4236                     	xref	c_smul
4237                     	xref	c_lmul
4238                     	xref	c_lcmp
4239                     	xref	c_ltor
4240                     	xref	c_ludv
4241                     	end
