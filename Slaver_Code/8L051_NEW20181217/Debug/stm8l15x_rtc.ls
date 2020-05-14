   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  97                     ; 232 ErrorStatus RTC_DeInit(void)
  97                     ; 233 {
  99                     .text:	section	.text,new
 100  0000               _RTC_DeInit:
 102  0000 5205          	subw	sp,#5
 103       00000005      OFST:	set	5
 106                     ; 234   ErrorStatus status = ERROR;
 108                     ; 235   uint16_t wutwfcount = 0;
 110  0002 5f            	clrw	x
 111  0003 1f02          	ldw	(OFST-3,sp),x
 112                     ; 236   uint16_t recalpfcount = 0;
 114  0005 5f            	clrw	x
 115  0006 1f04          	ldw	(OFST-1,sp),x
 116                     ; 239   RTC->WPR = 0xCA;
 118  0008 35ca5159      	mov	20825,#202
 119                     ; 240   RTC->WPR = 0x53;
 121  000c 35535159      	mov	20825,#83
 122                     ; 243   if (RTC_EnterInitMode() == ERROR)
 124  0010 cd0000        	call	_RTC_EnterInitMode
 126  0013 4d            	tnz	a
 127  0014 260b          	jrne	L35
 128                     ; 245     status = ERROR;
 130  0016 0f01          	clr	(OFST-4,sp)
 131                     ; 247     RTC->WPR = 0xFF; 
 133  0018 35ff5159      	mov	20825,#255
 135  001c               L55:
 136                     ; 343   return (ErrorStatus)status;
 138  001c 7b01          	ld	a,(OFST-4,sp)
 141  001e 5b05          	addw	sp,#5
 142  0020 81            	ret
 143  0021               L35:
 144                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 146  0021 725f5140      	clr	20800
 147                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 149  0025 725f5141      	clr	20801
 150                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 152  0029 725f5142      	clr	20802
 153                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 155  002d 35015144      	mov	20804,#1
 156                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 158  0031 35215145      	mov	20805,#33
 159                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 161  0035 725f5146      	clr	20806
 162                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 164  0039 725f5150      	clr	20816
 165                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 167  003d 35ff5151      	mov	20817,#255
 168                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 170  0041 357f5152      	mov	20818,#127
 171                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 173  0045 725f516c      	clr	20844
 174                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 176  0049 725f516d      	clr	20845
 177                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 179  004d 725f5148      	clr	20808
 180                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 182  0051 725f5149      	clr	20809
 183                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 185  0055 725f514a      	clr	20810
 187  0059 200b          	jra	L36
 188  005b               L75:
 189                     ; 278       wutwfcount++;
 191  005b 1e02          	ldw	x,(OFST-3,sp)
 192  005d 1c0001        	addw	x,#1
 193  0060 1f02          	ldw	(OFST-3,sp),x
 194                     ; 279       RTC->ISR1 = 0;
 196  0062 725f514c      	clr	20812
 197  0066               L36:
 198                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 200  0066 c6514c        	ld	a,20812
 201  0069 a504          	bcp	a,#4
 202  006b 2607          	jrne	L76
 204  006d 1e02          	ldw	x,(OFST-3,sp)
 205  006f a3ffff        	cpw	x,#65535
 206  0072 26e7          	jrne	L75
 207  0074               L76:
 208                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 210  0074 c6514c        	ld	a,20812
 211  0077 a504          	bcp	a,#4
 212  0079 2608          	jrne	L17
 213                     ; 284       status = ERROR;
 215  007b 0f01          	clr	(OFST-4,sp)
 216                     ; 286       RTC->WPR = 0xFF; 
 218  007d 35ff5159      	mov	20825,#255
 220  0081 2099          	jra	L55
 221  0083               L17:
 222                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 224  0083 725f5148      	clr	20808
 225                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 227  0087 35ff5154      	mov	20820,#255
 228                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 230  008b 35ff5155      	mov	20821,#255
 231                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 233  008f 725f515c      	clr	20828
 234                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 236  0093 725f515d      	clr	20829
 237                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 239  0097 725f515e      	clr	20830
 240                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 242  009b 725f515f      	clr	20831
 243                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 245  009f 725f5164      	clr	20836
 246                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 248  00a3 725f5165      	clr	20837
 249                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 251  00a7 725f5166      	clr	20838
 252                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 254  00ab 725f514c      	clr	20812
 255                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 257  00af 725f514d      	clr	20813
 258                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 260  00b3 c6514c        	ld	a,20812
 261  00b6 a502          	bcp	a,#2
 262  00b8 2717          	jreq	L57
 264  00ba 2007          	jra	L101
 265  00bc               L77:
 266                     ; 315           recalpfcount++;
 268  00bc 1e04          	ldw	x,(OFST-1,sp)
 269  00be 1c0001        	addw	x,#1
 270  00c1 1f04          	ldw	(OFST-1,sp),x
 271  00c3               L101:
 272                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 274  00c3 c6514c        	ld	a,20812
 275  00c6 a502          	bcp	a,#2
 276  00c8 2707          	jreq	L57
 278  00ca 1e04          	ldw	x,(OFST-1,sp)
 279  00cc a3ffff        	cpw	x,#65535
 280  00cf 26eb          	jrne	L77
 281  00d1               L57:
 282                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 284  00d1 c6514c        	ld	a,20812
 285  00d4 a502          	bcp	a,#2
 286  00d6 2618          	jrne	L701
 287                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 289  00d8 725f516a      	clr	20842
 290                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 292  00dc 725f516b      	clr	20843
 293                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 295  00e0 cd0000        	call	_RTC_WaitForSynchro
 297  00e3 4d            	tnz	a
 298  00e4 2604          	jrne	L111
 299                     ; 325           status = ERROR;
 301  00e6 0f01          	clr	(OFST-4,sp)
 303  00e8 2008          	jra	L511
 304  00ea               L111:
 305                     ; 329           status = SUCCESS;
 307  00ea a601          	ld	a,#1
 308  00ec 6b01          	ld	(OFST-4,sp),a
 309  00ee 2002          	jra	L511
 310  00f0               L701:
 311                     ; 334         status = ERROR;
 313  00f0 0f01          	clr	(OFST-4,sp)
 314  00f2               L511:
 315                     ; 338       RTC->WPR = 0xFF; 
 317  00f2 35ff5159      	mov	20825,#255
 318  00f6 ac1c001c      	jpf	L55
 418                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 418                     ; 360 {
 419                     .text:	section	.text,new
 420  0000               _RTC_Init:
 422  0000 89            	pushw	x
 423  0001 88            	push	a
 424       00000001      OFST:	set	1
 427                     ; 361   ErrorStatus status = ERROR;
 429                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 431                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 433                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 435                     ; 369   RTC->WPR = 0xCA;
 437  0002 35ca5159      	mov	20825,#202
 438                     ; 370   RTC->WPR = 0x53;
 440  0006 35535159      	mov	20825,#83
 441                     ; 373   if (RTC_EnterInitMode() == ERROR)
 443  000a cd0000        	call	_RTC_EnterInitMode
 445  000d 4d            	tnz	a
 446  000e 2604          	jrne	L761
 447                     ; 375     status = ERROR;
 449  0010 0f01          	clr	(OFST+0,sp)
 451  0012 202d          	jra	L171
 452  0014               L761:
 453                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 455  0014 721d5148      	bres	20808,#6
 456                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 458  0018 1e02          	ldw	x,(OFST+1,sp)
 459  001a c65148        	ld	a,20808
 460  001d fa            	or	a,(x)
 461  001e c75148        	ld	20808,a
 462                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 464  0021 1e02          	ldw	x,(OFST+1,sp)
 465  0023 ee02          	ldw	x,(2,x)
 466  0025 4f            	clr	a
 467  0026 01            	rrwa	x,a
 468  0027 9f            	ld	a,xl
 469  0028 c75150        	ld	20816,a
 470                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 472  002b 1e02          	ldw	x,(OFST+1,sp)
 473  002d e603          	ld	a,(3,x)
 474  002f c75151        	ld	20817,a
 475                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 477  0032 1e02          	ldw	x,(OFST+1,sp)
 478  0034 e601          	ld	a,(1,x)
 479  0036 c75152        	ld	20818,a
 480                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 482  0039 721f514c      	bres	20812,#7
 483                     ; 393     status = SUCCESS;
 485  003d a601          	ld	a,#1
 486  003f 6b01          	ld	(OFST+0,sp),a
 487  0041               L171:
 488                     ; 397   RTC->WPR = 0xFF; 
 490  0041 35ff5159      	mov	20825,#255
 491                     ; 400   return (ErrorStatus)(status);
 493  0045 7b01          	ld	a,(OFST+0,sp)
 496  0047 5b03          	addw	sp,#3
 497  0049 81            	ret
 534                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 534                     ; 411 {
 535                     .text:	section	.text,new
 536  0000               _RTC_StructInit:
 540                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 542  0000 7f            	clr	(x)
 543                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 545  0001 a67f          	ld	a,#127
 546  0003 e701          	ld	(1,x),a
 547                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 549  0005 90ae00ff      	ldw	y,#255
 550  0009 ef02          	ldw	(2,x),y
 551                     ; 420 }
 554  000b 81            	ret
 610                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 610                     ; 431 {
 611                     .text:	section	.text,new
 612  0000               _RTC_WriteProtectionCmd:
 616                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 618                     ; 435   if (NewState != DISABLE)
 620  0000 4d            	tnz	a
 621  0001 2706          	jreq	L142
 622                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 624  0003 35ff5159      	mov	20825,#255
 626  0007 2008          	jra	L342
 627  0009               L142:
 628                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 630  0009 35ca5159      	mov	20825,#202
 631                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 633  000d 35535159      	mov	20825,#83
 634  0011               L342:
 635                     ; 446 }
 638  0011 81            	ret
 683                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 683                     ; 459 {
 684                     .text:	section	.text,new
 685  0000               _RTC_EnterInitMode:
 687  0000 5203          	subw	sp,#3
 688       00000003      OFST:	set	3
 691                     ; 460   ErrorStatus status = ERROR;
 693                     ; 461   uint16_t initfcount = 0;
 695  0002 5f            	clrw	x
 696  0003 1f02          	ldw	(OFST-1,sp),x
 697                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 699  0005 c6514c        	ld	a,20812
 700  0008 a540          	bcp	a,#64
 701  000a 261b          	jrne	L762
 702                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 704  000c 3580514c      	mov	20812,#128
 706  0010 2007          	jra	L572
 707  0012               L172:
 708                     ; 472       initfcount++;
 710  0012 1e02          	ldw	x,(OFST-1,sp)
 711  0014 1c0001        	addw	x,#1
 712  0017 1f02          	ldw	(OFST-1,sp),x
 713  0019               L572:
 714                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 716  0019 c6514c        	ld	a,20812
 717  001c a540          	bcp	a,#64
 718  001e 2607          	jrne	L762
 720  0020 1e02          	ldw	x,(OFST-1,sp)
 721  0022 a3ffff        	cpw	x,#65535
 722  0025 26eb          	jrne	L172
 723  0027               L762:
 724                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 726  0027 c6514c        	ld	a,20812
 727  002a a540          	bcp	a,#64
 728  002c 2604          	jrne	L303
 729                     ; 478     status = ERROR;
 731  002e 0f01          	clr	(OFST-2,sp)
 733  0030 2004          	jra	L503
 734  0032               L303:
 735                     ; 482     status = SUCCESS;
 737  0032 a601          	ld	a,#1
 738  0034 6b01          	ld	(OFST-2,sp),a
 739  0036               L503:
 740                     ; 485   return (ErrorStatus)status;
 742  0036 7b01          	ld	a,(OFST-2,sp)
 745  0038 5b03          	addw	sp,#3
 746  003a 81            	ret
 769                     ; 498 void RTC_ExitInitMode(void)
 769                     ; 499 {
 770                     .text:	section	.text,new
 771  0000               _RTC_ExitInitMode:
 775                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 777  0000 721f514c      	bres	20812,#7
 778                     ; 502 }
 781  0004 81            	ret
 826                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 826                     ; 528 {
 827                     .text:	section	.text,new
 828  0000               _RTC_WaitForSynchro:
 830  0000 5203          	subw	sp,#3
 831       00000003      OFST:	set	3
 834                     ; 529   uint16_t rsfcount = 0;
 836  0002 5f            	clrw	x
 837  0003 1f02          	ldw	(OFST-1,sp),x
 838                     ; 530   ErrorStatus status = ERROR;
 840                     ; 533   RTC->WPR = 0xCA;
 842  0005 35ca5159      	mov	20825,#202
 843                     ; 534   RTC->WPR = 0x53;
 845  0009 35535159      	mov	20825,#83
 846                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 848  000d c6514c        	ld	a,20812
 849  0010 a45f          	and	a,#95
 850  0012 c7514c        	ld	20812,a
 852  0015 2007          	jra	L343
 853  0017               L143:
 854                     ; 542     rsfcount++;
 856  0017 1e02          	ldw	x,(OFST-1,sp)
 857  0019 1c0001        	addw	x,#1
 858  001c 1f02          	ldw	(OFST-1,sp),x
 859  001e               L343:
 860                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 862  001e c6514c        	ld	a,20812
 863  0021 a520          	bcp	a,#32
 864  0023 2607          	jrne	L743
 866  0025 1e02          	ldw	x,(OFST-1,sp)
 867  0027 a3ffff        	cpw	x,#65535
 868  002a 26eb          	jrne	L143
 869  002c               L743:
 870                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 872  002c c6514c        	ld	a,20812
 873  002f a520          	bcp	a,#32
 874  0031 2706          	jreq	L153
 875                     ; 548     status = SUCCESS;
 877  0033 a601          	ld	a,#1
 878  0035 6b01          	ld	(OFST-2,sp),a
 880  0037 2002          	jra	L353
 881  0039               L153:
 882                     ; 552     status = ERROR;
 884  0039 0f01          	clr	(OFST-2,sp)
 885  003b               L353:
 886                     ; 556   RTC->WPR = 0xFF; 
 888  003b 35ff5159      	mov	20825,#255
 889                     ; 558   return (ErrorStatus)status;
 891  003f 7b01          	ld	a,(OFST-2,sp)
 894  0041 5b03          	addw	sp,#3
 895  0043 81            	ret
 930                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 930                     ; 569 {
 931                     .text:	section	.text,new
 932  0000               _RTC_RatioCmd:
 936                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 938                     ; 574   RTC->WPR = 0xCA;
 940  0000 35ca5159      	mov	20825,#202
 941                     ; 575   RTC->WPR = 0x53;
 943  0004 35535159      	mov	20825,#83
 944                     ; 577   if (NewState != DISABLE)
 946  0008 4d            	tnz	a
 947  0009 2706          	jreq	L373
 948                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 950  000b 721a5148      	bset	20808,#5
 952  000f 2004          	jra	L573
 953  0011               L373:
 954                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 956  0011 721b5148      	bres	20808,#5
 957  0015               L573:
 958                     ; 589   RTC->WPR = 0xFF; 
 960  0015 35ff5159      	mov	20825,#255
 961                     ; 590 }
 964  0019 81            	ret
1000                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1000                     ; 599 {
1001                     .text:	section	.text,new
1002  0000               _RTC_BypassShadowCmd:
1006                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1008                     ; 604   RTC->WPR = 0xCA;
1010  0000 35ca5159      	mov	20825,#202
1011                     ; 605   RTC->WPR = 0x53;
1013  0004 35535159      	mov	20825,#83
1014                     ; 607   if (NewState != DISABLE)
1016  0008 4d            	tnz	a
1017  0009 2706          	jreq	L514
1018                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1020  000b 72185148      	bset	20808,#4
1022  000f 2004          	jra	L714
1023  0011               L514:
1024                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1026  0011 72195148      	bres	20808,#4
1027  0015               L714:
1028                     ; 619   RTC->WPR = 0xFF; 
1030  0015 35ff5159      	mov	20825,#255
1031                     ; 620 }
1034  0019 81            	ret
1182                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1182                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1182                     ; 661 {
1183                     .text:	section	.text,new
1184  0000               _RTC_SetTime:
1186  0000 88            	push	a
1187  0001 88            	push	a
1188       00000001      OFST:	set	1
1191                     ; 662   ErrorStatus status = ERROR;
1193                     ; 663   uint8_t temp = 0;
1195                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1197                     ; 668   if (RTC_Format == RTC_Format_BIN)
1199  0002 4d            	tnz	a
1200  0003 2609          	jrne	L315
1201                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1203  0005 c65148        	ld	a,20808
1204  0008 a540          	bcp	a,#64
1205  000a 2700          	jreq	L515
1206                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1208                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1211  000c               L515:
1212                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1214                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1216                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1219  000c 2007          	jra	L125
1220  000e               L315:
1221                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1223  000e c65148        	ld	a,20808
1224  0011 a540          	bcp	a,#64
1225  0013 2700          	jreq	L325
1226                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1228                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1231  0015               L325:
1232                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1234                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1236                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1238  0015               L125:
1239                     ; 701   RTC->WPR = 0xCA;
1241  0015 35ca5159      	mov	20825,#202
1242                     ; 702   RTC->WPR = 0x53;
1244  0019 35535159      	mov	20825,#83
1245                     ; 705   if (RTC_EnterInitMode() == ERROR)
1247  001d cd0000        	call	_RTC_EnterInitMode
1249  0020 4d            	tnz	a
1250  0021 2608          	jrne	L725
1251                     ; 707     status = ERROR;
1253  0023 0f01          	clr	(OFST+0,sp)
1254                     ; 709     RTC->WPR = 0xFF; 
1256  0025 35ff5159      	mov	20825,#255
1258  0029 2072          	jra	L135
1259  002b               L725:
1260                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1262  002b c65148        	ld	a,20808
1263  002e a540          	bcp	a,#64
1264  0030 2708          	jreq	L335
1265                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1267                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1269  0032 1e05          	ldw	x,(OFST+4,sp)
1270  0034 e603          	ld	a,(3,x)
1271  0036 6b01          	ld	(OFST+0,sp),a
1273  0038 2002          	jra	L535
1274  003a               L335:
1275                     ; 721       temp = 0;
1277  003a 0f01          	clr	(OFST+0,sp)
1278  003c               L535:
1279                     ; 724     if (RTC_Format != RTC_Format_BIN)
1281  003c 0d02          	tnz	(OFST+1,sp)
1282  003e 2718          	jreq	L735
1283                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1285  0040 1e05          	ldw	x,(OFST+4,sp)
1286  0042 e602          	ld	a,(2,x)
1287  0044 c75140        	ld	20800,a
1288                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1290  0047 1e05          	ldw	x,(OFST+4,sp)
1291  0049 e601          	ld	a,(1,x)
1292  004b c75141        	ld	20801,a
1293                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1295  004e 1e05          	ldw	x,(OFST+4,sp)
1296  0050 f6            	ld	a,(x)
1297  0051 1a01          	or	a,(OFST+0,sp)
1298  0053 c75142        	ld	20802,a
1300  0056 201f          	jra	L145
1301  0058               L735:
1302                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1304  0058 1e05          	ldw	x,(OFST+4,sp)
1305  005a e602          	ld	a,(2,x)
1306  005c cd0000        	call	L3_ByteToBcd2
1308  005f c75140        	ld	20800,a
1309                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1311  0062 1e05          	ldw	x,(OFST+4,sp)
1312  0064 e601          	ld	a,(1,x)
1313  0066 cd0000        	call	L3_ByteToBcd2
1315  0069 c75141        	ld	20801,a
1316                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1318  006c 1e05          	ldw	x,(OFST+4,sp)
1319  006e f6            	ld	a,(x)
1320  006f cd0000        	call	L3_ByteToBcd2
1322  0072 1a01          	or	a,(OFST+0,sp)
1323  0074 c75142        	ld	20802,a
1324  0077               L145:
1325                     ; 737     (void)(RTC->DR3);
1327  0077 c65146        	ld	a,20806
1328                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1330  007a 721f514c      	bres	20812,#7
1331                     ; 743     RTC->WPR = 0xFF; 
1333  007e 35ff5159      	mov	20825,#255
1334                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1336  0082 c65148        	ld	a,20808
1337  0085 a510          	bcp	a,#16
1338  0087 2610          	jrne	L345
1339                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1341  0089 cd0000        	call	_RTC_WaitForSynchro
1343  008c 4d            	tnz	a
1344  008d 2604          	jrne	L545
1345                     ; 750         status = ERROR;
1347  008f 0f01          	clr	(OFST+0,sp)
1349  0091 200a          	jra	L135
1350  0093               L545:
1351                     ; 754         status = SUCCESS;
1353  0093 a601          	ld	a,#1
1354  0095 6b01          	ld	(OFST+0,sp),a
1355  0097 2004          	jra	L135
1356  0099               L345:
1357                     ; 759       status = SUCCESS;
1359  0099 a601          	ld	a,#1
1360  009b 6b01          	ld	(OFST+0,sp),a
1361  009d               L135:
1362                     ; 763   return (ErrorStatus)status;
1364  009d 7b01          	ld	a,(OFST+0,sp)
1367  009f 85            	popw	x
1368  00a0 81            	ret
1405                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1405                     ; 776 {
1406                     .text:	section	.text,new
1407  0000               _RTC_TimeStructInit:
1411                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1413  0000 6f03          	clr	(3,x)
1414                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1416  0002 7f            	clr	(x)
1417                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1419  0003 6f01          	clr	(1,x)
1420                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1422  0005 6f02          	clr	(2,x)
1423                     ; 782 }
1426  0007 81            	ret
1483                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1483                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1483                     ; 800 {
1484                     .text:	section	.text,new
1485  0000               _RTC_GetTime:
1487  0000 88            	push	a
1488  0001 88            	push	a
1489       00000001      OFST:	set	1
1492                     ; 801   uint8_t  tmpreg = 0;
1494                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1496                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1498  0002 1e05          	ldw	x,(OFST+4,sp)
1499  0004 c65140        	ld	a,20800
1500  0007 e702          	ld	(2,x),a
1501                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1503  0009 1e05          	ldw	x,(OFST+4,sp)
1504  000b c65141        	ld	a,20801
1505  000e e701          	ld	(1,x),a
1506                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1508  0010 c65142        	ld	a,20802
1509  0013 6b01          	ld	(OFST+0,sp),a
1510                     ; 817   (void) (RTC->DR3) ;
1512  0015 c65146        	ld	a,20806
1513                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1515  0018 7b01          	ld	a,(OFST+0,sp)
1516  001a a4bf          	and	a,#191
1517  001c 1e05          	ldw	x,(OFST+4,sp)
1518  001e f7            	ld	(x),a
1519                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1521  001f 7b01          	ld	a,(OFST+0,sp)
1522  0021 a440          	and	a,#64
1523  0023 1e05          	ldw	x,(OFST+4,sp)
1524  0025 e703          	ld	(3,x),a
1525                     ; 827   if (RTC_Format == RTC_Format_BIN)
1527  0027 0d02          	tnz	(OFST+1,sp)
1528  0029 261f          	jrne	L326
1529                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1531  002b 1e05          	ldw	x,(OFST+4,sp)
1532  002d f6            	ld	a,(x)
1533  002e cd0000        	call	L5_Bcd2ToByte
1535  0031 1e05          	ldw	x,(OFST+4,sp)
1536  0033 f7            	ld	(x),a
1537                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1539  0034 1e05          	ldw	x,(OFST+4,sp)
1540  0036 e601          	ld	a,(1,x)
1541  0038 cd0000        	call	L5_Bcd2ToByte
1543  003b 1e05          	ldw	x,(OFST+4,sp)
1544  003d e701          	ld	(1,x),a
1545                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1547  003f 1e05          	ldw	x,(OFST+4,sp)
1548  0041 e602          	ld	a,(2,x)
1549  0043 cd0000        	call	L5_Bcd2ToByte
1551  0046 1e05          	ldw	x,(OFST+4,sp)
1552  0048 e702          	ld	(2,x),a
1553  004a               L326:
1554                     ; 834 }
1557  004a 85            	popw	x
1558  004b 81            	ret
1610                     ; 845 uint16_t RTC_GetSubSecond(void)
1610                     ; 846 {
1611                     .text:	section	.text,new
1612  0000               _RTC_GetSubSecond:
1614  0000 5206          	subw	sp,#6
1615       00000006      OFST:	set	6
1618                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1622                     ; 848   uint16_t ssrreg = 0;
1624                     ; 851   ssrhreg = RTC->SSRH;
1626  0002 c65157        	ld	a,20823
1627  0005 6b03          	ld	(OFST-3,sp),a
1628                     ; 852   ssrlreg = RTC->SSRL;
1630  0007 c65158        	ld	a,20824
1631  000a 6b04          	ld	(OFST-2,sp),a
1632                     ; 855   (void) (RTC->DR3);
1634  000c c65146        	ld	a,20806
1635                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1637  000f 7b04          	ld	a,(OFST-2,sp)
1638  0011 5f            	clrw	x
1639  0012 97            	ld	xl,a
1640  0013 1f01          	ldw	(OFST-5,sp),x
1641  0015 7b03          	ld	a,(OFST-3,sp)
1642  0017 5f            	clrw	x
1643  0018 97            	ld	xl,a
1644  0019 4f            	clr	a
1645  001a 02            	rlwa	x,a
1646  001b 01            	rrwa	x,a
1647  001c 1a02          	or	a,(OFST-4,sp)
1648  001e 01            	rrwa	x,a
1649  001f 1a01          	or	a,(OFST-5,sp)
1650  0021 01            	rrwa	x,a
1651  0022 1f05          	ldw	(OFST-1,sp),x
1652                     ; 859   return (uint16_t)(ssrreg);
1654  0024 1e05          	ldw	x,(OFST-1,sp)
1657  0026 5b06          	addw	sp,#6
1658  0028 81            	ret
1910                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1910                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1910                     ; 878 {
1911                     .text:	section	.text,new
1912  0000               _RTC_SetDate:
1914  0000 88            	push	a
1915  0001 89            	pushw	x
1916       00000002      OFST:	set	2
1919                     ; 879   ErrorStatus status = ERROR;
1921                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1923  0002 4d            	tnz	a
1924  0003 2616          	jrne	L1001
1926  0005 1e06          	ldw	x,(OFST+4,sp)
1927  0007 e601          	ld	a,(1,x)
1928  0009 a410          	and	a,#16
1929  000b a110          	cp	a,#16
1930  000d 260c          	jrne	L1001
1931                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1933  000f 1e06          	ldw	x,(OFST+4,sp)
1934  0011 e601          	ld	a,(1,x)
1935  0013 a4ef          	and	a,#239
1936  0015 ab0a          	add	a,#10
1937  0017 1e06          	ldw	x,(OFST+4,sp)
1938  0019 e701          	ld	(1,x),a
1939  001b               L1001:
1940                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1942                     ; 888   if (RTC_Format == RTC_Format_BIN)
1944  001b 0d03          	tnz	(OFST+1,sp)
1945  001d 2600          	jrne	L3001
1946                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1948                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1950                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1952                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1954                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1957  001f               L3001:
1958                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1960                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1962                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1964                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1966                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1968                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1970                     ; 907   RTC->WPR = 0xCA;
1972  001f 35ca5159      	mov	20825,#202
1973                     ; 908   RTC->WPR = 0x53;
1975  0023 35535159      	mov	20825,#83
1976                     ; 911   if (RTC_EnterInitMode() == ERROR)
1978  0027 cd0000        	call	_RTC_EnterInitMode
1980  002a 4d            	tnz	a
1981  002b 2608          	jrne	L7001
1982                     ; 913     status = ERROR;
1984  002d 0f02          	clr	(OFST+0,sp)
1985                     ; 915     RTC->WPR = 0xFF; 
1987  002f 35ff5159      	mov	20825,#255
1989  0033 2073          	jra	L1101
1990  0035               L7001:
1991                     ; 919     (void)(RTC->TR1);
1993  0035 c65140        	ld	a,20800
1994                     ; 922     if (RTC_Format != RTC_Format_BIN)
1996  0038 0d03          	tnz	(OFST+1,sp)
1997  003a 271f          	jreq	L3101
1998                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2000  003c 1e06          	ldw	x,(OFST+4,sp)
2001  003e e602          	ld	a,(2,x)
2002  0040 c75144        	ld	20804,a
2003                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2005  0043 1e06          	ldw	x,(OFST+4,sp)
2006  0045 f6            	ld	a,(x)
2007  0046 97            	ld	xl,a
2008  0047 a620          	ld	a,#32
2009  0049 42            	mul	x,a
2010  004a 9f            	ld	a,xl
2011  004b 1e06          	ldw	x,(OFST+4,sp)
2012  004d ea01          	or	a,(1,x)
2013  004f c75145        	ld	20805,a
2014                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2016  0052 1e06          	ldw	x,(OFST+4,sp)
2017  0054 e603          	ld	a,(3,x)
2018  0056 c75146        	ld	20806,a
2020  0059 202a          	jra	L5101
2021  005b               L3101:
2022                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2024  005b 1e06          	ldw	x,(OFST+4,sp)
2025  005d e602          	ld	a,(2,x)
2026  005f cd0000        	call	L3_ByteToBcd2
2028  0062 c75144        	ld	20804,a
2029                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2031  0065 1e06          	ldw	x,(OFST+4,sp)
2032  0067 f6            	ld	a,(x)
2033  0068 97            	ld	xl,a
2034  0069 a620          	ld	a,#32
2035  006b 42            	mul	x,a
2036  006c 9f            	ld	a,xl
2037  006d 6b01          	ld	(OFST-1,sp),a
2038  006f 1e06          	ldw	x,(OFST+4,sp)
2039  0071 e601          	ld	a,(1,x)
2040  0073 cd0000        	call	L3_ByteToBcd2
2042  0076 1a01          	or	a,(OFST-1,sp)
2043  0078 c75145        	ld	20805,a
2044                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2046  007b 1e06          	ldw	x,(OFST+4,sp)
2047  007d e603          	ld	a,(3,x)
2048  007f cd0000        	call	L3_ByteToBcd2
2050  0082 c75146        	ld	20806,a
2051  0085               L5101:
2052                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2054  0085 721f514c      	bres	20812,#7
2055                     ; 939     RTC->WPR = 0xFF; 
2057  0089 35ff5159      	mov	20825,#255
2058                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2060  008d c65148        	ld	a,20808
2061  0090 a510          	bcp	a,#16
2062  0092 2610          	jrne	L7101
2063                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2065  0094 cd0000        	call	_RTC_WaitForSynchro
2067  0097 4d            	tnz	a
2068  0098 2604          	jrne	L1201
2069                     ; 946         status = ERROR;
2071  009a 0f02          	clr	(OFST+0,sp)
2073  009c 200a          	jra	L1101
2074  009e               L1201:
2075                     ; 950         status = SUCCESS;
2077  009e a601          	ld	a,#1
2078  00a0 6b02          	ld	(OFST+0,sp),a
2079  00a2 2004          	jra	L1101
2080  00a4               L7101:
2081                     ; 955       status = SUCCESS;
2083  00a4 a601          	ld	a,#1
2084  00a6 6b02          	ld	(OFST+0,sp),a
2085  00a8               L1101:
2086                     ; 959   return (ErrorStatus)status;
2088  00a8 7b02          	ld	a,(OFST+0,sp)
2091  00aa 5b03          	addw	sp,#3
2092  00ac 81            	ret
2129                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2129                     ; 969 {
2130                     .text:	section	.text,new
2131  0000               _RTC_DateStructInit:
2135                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2137  0000 a601          	ld	a,#1
2138  0002 f7            	ld	(x),a
2139                     ; 972   RTC_DateStruct->RTC_Date = 1;
2141  0003 a601          	ld	a,#1
2142  0005 e702          	ld	(2,x),a
2143                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2145  0007 a601          	ld	a,#1
2146  0009 e701          	ld	(1,x),a
2147                     ; 974   RTC_DateStruct->RTC_Year = 0;
2149  000b 6f03          	clr	(3,x)
2150                     ; 975 }
2153  000d 81            	ret
2210                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2210                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2210                     ; 990 {
2211                     .text:	section	.text,new
2212  0000               _RTC_GetDate:
2214  0000 88            	push	a
2215  0001 88            	push	a
2216       00000001      OFST:	set	1
2219                     ; 991   uint8_t tmpreg = 0;
2221                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2223                     ; 997   (void) (RTC->TR1) ;
2225  0002 c65140        	ld	a,20800
2226                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2228  0005 1e05          	ldw	x,(OFST+4,sp)
2229  0007 c65144        	ld	a,20804
2230  000a e702          	ld	(2,x),a
2231                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2233  000c c65145        	ld	a,20805
2234  000f 6b01          	ld	(OFST+0,sp),a
2235                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2237  0011 1e05          	ldw	x,(OFST+4,sp)
2238  0013 c65146        	ld	a,20806
2239  0016 e703          	ld	(3,x),a
2240                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2242  0018 7b01          	ld	a,(OFST+0,sp)
2243  001a a41f          	and	a,#31
2244  001c 1e05          	ldw	x,(OFST+4,sp)
2245  001e e701          	ld	(1,x),a
2246                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2248  0020 7b01          	ld	a,(OFST+0,sp)
2249  0022 a4e0          	and	a,#224
2250  0024 4e            	swap	a
2251  0025 44            	srl	a
2252  0026 a407          	and	a,#7
2253  0028 1e05          	ldw	x,(OFST+4,sp)
2254  002a f7            	ld	(x),a
2255                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2257  002b 0d02          	tnz	(OFST+1,sp)
2258  002d 2621          	jrne	L7701
2259                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2261  002f 1e05          	ldw	x,(OFST+4,sp)
2262  0031 e603          	ld	a,(3,x)
2263  0033 cd0000        	call	L5_Bcd2ToByte
2265  0036 1e05          	ldw	x,(OFST+4,sp)
2266  0038 e703          	ld	(3,x),a
2267                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2269  003a 1e05          	ldw	x,(OFST+4,sp)
2270  003c e601          	ld	a,(1,x)
2271  003e cd0000        	call	L5_Bcd2ToByte
2273  0041 1e05          	ldw	x,(OFST+4,sp)
2274  0043 e701          	ld	(1,x),a
2275                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2277  0045 1e05          	ldw	x,(OFST+4,sp)
2278  0047 e602          	ld	a,(2,x)
2279  0049 cd0000        	call	L5_Bcd2ToByte
2281  004c 1e05          	ldw	x,(OFST+4,sp)
2282  004e e702          	ld	(2,x),a
2283  0050               L7701:
2284                     ; 1014 }
2287  0050 85            	popw	x
2288  0051 81            	ret
2437                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2437                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2437                     ; 1046 {
2438                     .text:	section	.text,new
2439  0000               _RTC_SetAlarm:
2441  0000 88            	push	a
2442  0001 5205          	subw	sp,#5
2443       00000005      OFST:	set	5
2446                     ; 1047   uint8_t tmpreg1 = 0;
2448                     ; 1048   uint8_t tmpreg2 = 0;
2450                     ; 1049   uint8_t tmpreg3 = 0;
2452                     ; 1050   uint8_t tmpreg4 = 0;
2454                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2456                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2458                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2460                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2462                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2464  0003 4d            	tnz	a
2465  0004 2609          	jrne	L5711
2466                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2468  0006 c65148        	ld	a,20808
2469  0009 a540          	bcp	a,#64
2470  000b 2700          	jreq	L7711
2471                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2473                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2476  000d               L7711:
2477                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2479                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2481                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2484  000d 2007          	jra	L3021
2485  000f               L5711:
2486                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2488  000f c65148        	ld	a,20808
2489  0012 a540          	bcp	a,#64
2490  0014 2700          	jreq	L5021
2491                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2493                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2496  0016               L5021:
2497                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2499                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2501                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2503  0016               L3021:
2504                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2506  0016 1e09          	ldw	x,(OFST+4,sp)
2507  0018 e604          	ld	a,(4,x)
2508  001a a510          	bcp	a,#16
2509  001c 2608          	jrne	L1121
2510                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2512  001e 1e09          	ldw	x,(OFST+4,sp)
2513  0020 e605          	ld	a,(5,x)
2514  0022 a140          	cp	a,#64
2515  0024 2600          	jrne	L3121
2516                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2519  0026               L3121:
2520                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2522                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2524  0026               L1121:
2525                     ; 1108   RTC->WPR = 0xCA;
2527  0026 35ca5159      	mov	20825,#202
2528                     ; 1109   RTC->WPR = 0x53;
2530  002a 35535159      	mov	20825,#83
2531                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2533  002e 0d06          	tnz	(OFST+1,sp)
2534  0030 2747          	jreq	L7121
2535                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2535                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2537  0032 1e09          	ldw	x,(OFST+4,sp)
2538  0034 e604          	ld	a,(4,x)
2539  0036 a480          	and	a,#128
2540  0038 1e09          	ldw	x,(OFST+4,sp)
2541  003a ea02          	or	a,(2,x)
2542  003c 6b02          	ld	(OFST-3,sp),a
2543                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2543                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2545  003e 1e09          	ldw	x,(OFST+4,sp)
2546  0040 e604          	ld	a,(4,x)
2547  0042 48            	sll	a
2548  0043 a480          	and	a,#128
2549  0045 1e09          	ldw	x,(OFST+4,sp)
2550  0047 ea01          	or	a,(1,x)
2551  0049 6b03          	ld	(OFST-2,sp),a
2552                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2552                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2552                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2554  004b 1e09          	ldw	x,(OFST+4,sp)
2555  004d e604          	ld	a,(4,x)
2556  004f 48            	sll	a
2557  0050 48            	sll	a
2558  0051 a480          	and	a,#128
2559  0053 6b01          	ld	(OFST-4,sp),a
2560  0055 1e09          	ldw	x,(OFST+4,sp)
2561  0057 e603          	ld	a,(3,x)
2562  0059 1e09          	ldw	x,(OFST+4,sp)
2563  005b fa            	or	a,(x)
2564  005c 1a01          	or	a,(OFST-4,sp)
2565  005e 6b04          	ld	(OFST-1,sp),a
2566                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2566                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2566                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2568  0060 1e09          	ldw	x,(OFST+4,sp)
2569  0062 e604          	ld	a,(4,x)
2570  0064 48            	sll	a
2571  0065 48            	sll	a
2572  0066 48            	sll	a
2573  0067 a480          	and	a,#128
2574  0069 6b01          	ld	(OFST-4,sp),a
2575  006b 1e09          	ldw	x,(OFST+4,sp)
2576  006d e605          	ld	a,(5,x)
2577  006f 1e09          	ldw	x,(OFST+4,sp)
2578  0071 ea06          	or	a,(6,x)
2579  0073 1a01          	or	a,(OFST-4,sp)
2580  0075 6b05          	ld	(OFST+0,sp),a
2582  0077 2059          	jra	L1221
2583  0079               L7121:
2584                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2584                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2586  0079 1e09          	ldw	x,(OFST+4,sp)
2587  007b e604          	ld	a,(4,x)
2588  007d a480          	and	a,#128
2589  007f 6b01          	ld	(OFST-4,sp),a
2590  0081 1e09          	ldw	x,(OFST+4,sp)
2591  0083 e602          	ld	a,(2,x)
2592  0085 cd0000        	call	L3_ByteToBcd2
2594  0088 1a01          	or	a,(OFST-4,sp)
2595  008a 6b02          	ld	(OFST-3,sp),a
2596                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2596                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2598  008c 1e09          	ldw	x,(OFST+4,sp)
2599  008e e604          	ld	a,(4,x)
2600  0090 48            	sll	a
2601  0091 a480          	and	a,#128
2602  0093 6b01          	ld	(OFST-4,sp),a
2603  0095 1e09          	ldw	x,(OFST+4,sp)
2604  0097 e601          	ld	a,(1,x)
2605  0099 cd0000        	call	L3_ByteToBcd2
2607  009c 1a01          	or	a,(OFST-4,sp)
2608  009e 6b03          	ld	(OFST-2,sp),a
2609                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2609                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2609                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2611  00a0 1e09          	ldw	x,(OFST+4,sp)
2612  00a2 e604          	ld	a,(4,x)
2613  00a4 48            	sll	a
2614  00a5 48            	sll	a
2615  00a6 a480          	and	a,#128
2616  00a8 6b01          	ld	(OFST-4,sp),a
2617  00aa 1e09          	ldw	x,(OFST+4,sp)
2618  00ac f6            	ld	a,(x)
2619  00ad cd0000        	call	L3_ByteToBcd2
2621  00b0 1e09          	ldw	x,(OFST+4,sp)
2622  00b2 ea03          	or	a,(3,x)
2623  00b4 1a01          	or	a,(OFST-4,sp)
2624  00b6 6b04          	ld	(OFST-1,sp),a
2625                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2625                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2625                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2627  00b8 1e09          	ldw	x,(OFST+4,sp)
2628  00ba e604          	ld	a,(4,x)
2629  00bc 48            	sll	a
2630  00bd 48            	sll	a
2631  00be 48            	sll	a
2632  00bf a480          	and	a,#128
2633  00c1 6b01          	ld	(OFST-4,sp),a
2634  00c3 1e09          	ldw	x,(OFST+4,sp)
2635  00c5 e606          	ld	a,(6,x)
2636  00c7 cd0000        	call	L3_ByteToBcd2
2638  00ca 1e09          	ldw	x,(OFST+4,sp)
2639  00cc ea05          	or	a,(5,x)
2640  00ce 1a01          	or	a,(OFST-4,sp)
2641  00d0 6b05          	ld	(OFST+0,sp),a
2642  00d2               L1221:
2643                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2645  00d2 7b02          	ld	a,(OFST-3,sp)
2646  00d4 c7515c        	ld	20828,a
2647                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2649  00d7 7b03          	ld	a,(OFST-2,sp)
2650  00d9 c7515d        	ld	20829,a
2651                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2653  00dc 7b04          	ld	a,(OFST-1,sp)
2654  00de c7515e        	ld	20830,a
2655                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2657  00e1 7b05          	ld	a,(OFST+0,sp)
2658  00e3 c7515f        	ld	20831,a
2659                     ; 1154   RTC->WPR = 0xFF; 
2661  00e6 35ff5159      	mov	20825,#255
2662                     ; 1155 }
2665  00ea 5b06          	addw	sp,#6
2666  00ec 81            	ret
2704                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2704                     ; 1166 {
2705                     .text:	section	.text,new
2706  0000               _RTC_AlarmStructInit:
2710                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2712  0000 6f03          	clr	(3,x)
2713                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2715  0002 7f            	clr	(x)
2716                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2718  0003 6f01          	clr	(1,x)
2719                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2721  0005 6f02          	clr	(2,x)
2722                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2724  0007 6f05          	clr	(5,x)
2725                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2727  0009 a601          	ld	a,#1
2728  000b e706          	ld	(6,x),a
2729                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2731  000d a6f0          	ld	a,#240
2732  000f e704          	ld	(4,x),a
2733                     ; 1179 }
2736  0011 81            	ret
2829                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2829                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2829                     ; 1190 {
2830                     .text:	section	.text,new
2831  0000               _RTC_GetAlarm:
2833  0000 88            	push	a
2834  0001 5204          	subw	sp,#4
2835       00000004      OFST:	set	4
2838                     ; 1191   uint8_t tmpreg1 = 0;
2840                     ; 1192   uint8_t tmpreg2 = 0;
2842                     ; 1193   uint8_t tmpreg3 = 0;
2844                     ; 1194   uint8_t tmpreg4 = 0;
2846                     ; 1195   uint8_t alarmmask = 0;
2848                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2850                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2852  0003 c6515c        	ld	a,20828
2853  0006 6b04          	ld	(OFST+0,sp),a
2854                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2856  0008 c6515d        	ld	a,20829
2857  000b 6b01          	ld	(OFST-3,sp),a
2858                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2860  000d c6515e        	ld	a,20830
2861  0010 6b02          	ld	(OFST-2,sp),a
2862                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2864  0012 c6515f        	ld	a,20831
2865  0015 6b03          	ld	(OFST-1,sp),a
2866                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2868  0017 7b04          	ld	a,(OFST+0,sp)
2869  0019 a47f          	and	a,#127
2870  001b 1e08          	ldw	x,(OFST+4,sp)
2871  001d e702          	ld	(2,x),a
2872                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2874  001f 7b04          	ld	a,(OFST+0,sp)
2875  0021 a480          	and	a,#128
2876  0023 6b04          	ld	(OFST+0,sp),a
2877                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2879  0025 7b01          	ld	a,(OFST-3,sp)
2880  0027 a47f          	and	a,#127
2881  0029 1e08          	ldw	x,(OFST+4,sp)
2882  002b e701          	ld	(1,x),a
2883                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2885  002d 7b01          	ld	a,(OFST-3,sp)
2886  002f a480          	and	a,#128
2887  0031 44            	srl	a
2888  0032 1a04          	or	a,(OFST+0,sp)
2889  0034 6b04          	ld	(OFST+0,sp),a
2890                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2892  0036 7b02          	ld	a,(OFST-2,sp)
2893  0038 a43f          	and	a,#63
2894  003a 1e08          	ldw	x,(OFST+4,sp)
2895  003c f7            	ld	(x),a
2896                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2898  003d 7b02          	ld	a,(OFST-2,sp)
2899  003f a440          	and	a,#64
2900  0041 1e08          	ldw	x,(OFST+4,sp)
2901  0043 e703          	ld	(3,x),a
2902                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2904  0045 7b02          	ld	a,(OFST-2,sp)
2905  0047 a480          	and	a,#128
2906  0049 44            	srl	a
2907  004a 44            	srl	a
2908  004b 1a04          	or	a,(OFST+0,sp)
2909  004d 6b04          	ld	(OFST+0,sp),a
2910                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2912  004f 7b03          	ld	a,(OFST-1,sp)
2913  0051 a43f          	and	a,#63
2914  0053 1e08          	ldw	x,(OFST+4,sp)
2915  0055 e706          	ld	(6,x),a
2916                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2918  0057 7b03          	ld	a,(OFST-1,sp)
2919  0059 a440          	and	a,#64
2920  005b 1e08          	ldw	x,(OFST+4,sp)
2921  005d e705          	ld	(5,x),a
2922                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2924  005f 7b03          	ld	a,(OFST-1,sp)
2925  0061 a480          	and	a,#128
2926  0063 44            	srl	a
2927  0064 44            	srl	a
2928  0065 44            	srl	a
2929  0066 1a04          	or	a,(OFST+0,sp)
2930  0068 6b04          	ld	(OFST+0,sp),a
2931                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2933  006a 7b04          	ld	a,(OFST+0,sp)
2934  006c 1e08          	ldw	x,(OFST+4,sp)
2935  006e e704          	ld	(4,x),a
2936                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2938  0070 0d05          	tnz	(OFST+1,sp)
2939  0072 262a          	jrne	L3131
2940                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2942  0074 1e08          	ldw	x,(OFST+4,sp)
2943  0076 f6            	ld	a,(x)
2944  0077 cd0000        	call	L5_Bcd2ToByte
2946  007a 1e08          	ldw	x,(OFST+4,sp)
2947  007c f7            	ld	(x),a
2948                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2950  007d 1e08          	ldw	x,(OFST+4,sp)
2951  007f e601          	ld	a,(1,x)
2952  0081 cd0000        	call	L5_Bcd2ToByte
2954  0084 1e08          	ldw	x,(OFST+4,sp)
2955  0086 e701          	ld	(1,x),a
2956                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2958  0088 1e08          	ldw	x,(OFST+4,sp)
2959  008a e602          	ld	a,(2,x)
2960  008c cd0000        	call	L5_Bcd2ToByte
2962  008f 1e08          	ldw	x,(OFST+4,sp)
2963  0091 e702          	ld	(2,x),a
2964                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2966  0093 1e08          	ldw	x,(OFST+4,sp)
2967  0095 e606          	ld	a,(6,x)
2968  0097 cd0000        	call	L5_Bcd2ToByte
2970  009a 1e08          	ldw	x,(OFST+4,sp)
2971  009c e706          	ld	(6,x),a
2972  009e               L3131:
2973                     ; 1233 }
2976  009e 5b05          	addw	sp,#5
2977  00a0 81            	ret
3041                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3041                     ; 1243 {
3042                     .text:	section	.text,new
3043  0000               _RTC_AlarmCmd:
3045  0000 5203          	subw	sp,#3
3046       00000003      OFST:	set	3
3049                     ; 1244   __IO uint16_t alrawfcount = 0;
3051  0002 5f            	clrw	x
3052  0003 1f01          	ldw	(OFST-2,sp),x
3053                     ; 1245   ErrorStatus status = ERROR;
3055                     ; 1246   uint8_t temp1 = 0;
3057                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3059                     ; 1252   RTC->WPR = 0xCA;
3061  0005 35ca5159      	mov	20825,#202
3062                     ; 1253   RTC->WPR = 0x53;
3064  0009 35535159      	mov	20825,#83
3065                     ; 1256   if (NewState != DISABLE)
3067  000d 4d            	tnz	a
3068  000e 2711          	jreq	L7431
3069                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3071  0010 72105149      	bset	20809,#0
3072                     ; 1259     status = SUCCESS;
3074  0014 a601          	ld	a,#1
3075  0016 6b03          	ld	(OFST+0,sp),a
3077  0018               L1531:
3078                     ; 1283   RTC->WPR = 0xFF; 
3080  0018 35ff5159      	mov	20825,#255
3081                     ; 1286   return (ErrorStatus)status;
3083  001c 7b03          	ld	a,(OFST+0,sp)
3086  001e 5b03          	addw	sp,#3
3087  0020 81            	ret
3088  0021               L7431:
3089                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3091  0021 72115149      	bres	20809,#0
3092                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3094  0025 c6514c        	ld	a,20812
3095  0028 a401          	and	a,#1
3096  002a 6b03          	ld	(OFST+0,sp),a
3098  002c 2007          	jra	L7531
3099  002e               L3531:
3100                     ; 1269       alrawfcount++;
3102  002e 1e01          	ldw	x,(OFST-2,sp)
3103  0030 1c0001        	addw	x,#1
3104  0033 1f01          	ldw	(OFST-2,sp),x
3105  0035               L7531:
3106                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3108  0035 1e01          	ldw	x,(OFST-2,sp)
3109  0037 a3ffff        	cpw	x,#65535
3110  003a 2704          	jreq	L3631
3112  003c 0d03          	tnz	(OFST+0,sp)
3113  003e 27ee          	jreq	L3531
3114  0040               L3631:
3115                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3117  0040 c6514c        	ld	a,20812
3118  0043 a501          	bcp	a,#1
3119  0045 2604          	jrne	L5631
3120                     ; 1274       status = ERROR;
3122  0047 0f03          	clr	(OFST+0,sp)
3124  0049 20cd          	jra	L1531
3125  004b               L5631:
3126                     ; 1278       status = SUCCESS;
3128  004b a601          	ld	a,#1
3129  004d 6b03          	ld	(OFST+0,sp),a
3130  004f 20c7          	jra	L1531
3331                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3331                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3331                     ; 1300 {
3332                     .text:	section	.text,new
3333  0000               _RTC_AlarmSubSecondConfig:
3335  0000 89            	pushw	x
3336  0001 88            	push	a
3337       00000001      OFST:	set	1
3340                     ; 1301   uint8_t alarmstatus = 0;
3342                     ; 1302   ErrorStatus status = ERROR;
3344                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3346                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3348                     ; 1309   RTC->WPR = 0xCA;
3350  0002 35ca5159      	mov	20825,#202
3351                     ; 1310   RTC->WPR = 0x53;
3353  0006 35535159      	mov	20825,#83
3354                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3356  000a c6514c        	ld	a,20812
3357  000d a540          	bcp	a,#64
3358  000f 2626          	jrne	L7641
3359                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3361  0011 c65149        	ld	a,20809
3362  0014 aa01          	or	a,#1
3363  0016 6b01          	ld	(OFST+0,sp),a
3364                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3366  0018 72115149      	bres	20809,#0
3367                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3369  001c 9e            	ld	a,xh
3370  001d c75164        	ld	20836,a
3371                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3373  0020 9f            	ld	a,xl
3374  0021 c75165        	ld	20837,a
3375                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3377  0024 7b06          	ld	a,(OFST+5,sp)
3378  0026 c75166        	ld	20838,a
3379                     ; 1327     RTC->CR2 |= alarmstatus;
3381  0029 c65149        	ld	a,20809
3382  002c 1a01          	or	a,(OFST+0,sp)
3383  002e c75149        	ld	20809,a
3384                     ; 1329     status = SUCCESS;
3386  0031 a601          	ld	a,#1
3387  0033 6b01          	ld	(OFST+0,sp),a
3389  0035 2002          	jra	L1741
3390  0037               L7641:
3391                     ; 1333     status = ERROR;
3393  0037 0f01          	clr	(OFST+0,sp)
3394  0039               L1741:
3395                     ; 1337   RTC->WPR = 0xFF; 
3397  0039 35ff5159      	mov	20825,#255
3398                     ; 1339   return (ErrorStatus)status;
3400  003d 7b01          	ld	a,(OFST+0,sp)
3403  003f 5b03          	addw	sp,#3
3404  0041 81            	ret
3494                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3494                     ; 1370 {
3495                     .text:	section	.text,new
3496  0000               _RTC_WakeUpClockConfig:
3498  0000 88            	push	a
3499       00000000      OFST:	set	0
3502                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3504                     ; 1376   RTC->WPR = 0xCA;
3506  0001 35ca5159      	mov	20825,#202
3507                     ; 1377   RTC->WPR = 0x53;
3509  0005 35535159      	mov	20825,#83
3510                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3512  0009 72155149      	bres	20809,#2
3513                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3515  000d c65148        	ld	a,20808
3516  0010 a4f8          	and	a,#248
3517  0012 c75148        	ld	20808,a
3518                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3520  0015 c65148        	ld	a,20808
3521  0018 1a01          	or	a,(OFST+1,sp)
3522  001a c75148        	ld	20808,a
3523                     ; 1389   RTC->WPR = 0xFF; 
3525  001d 35ff5159      	mov	20825,#255
3526                     ; 1390 }
3529  0021 84            	pop	a
3530  0022 81            	ret
3565                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3565                     ; 1401 {
3566                     .text:	section	.text,new
3567  0000               _RTC_SetWakeUpCounter:
3571                     ; 1403   RTC->WPR = 0xCA;
3573  0000 35ca5159      	mov	20825,#202
3574                     ; 1404   RTC->WPR = 0x53;
3576  0004 35535159      	mov	20825,#83
3577                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3579  0008 9e            	ld	a,xh
3580  0009 c75154        	ld	20820,a
3581                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3583  000c 9f            	ld	a,xl
3584  000d c75155        	ld	20821,a
3585                     ; 1412   RTC->WPR = 0xFF; 
3587  0010 35ff5159      	mov	20825,#255
3588                     ; 1413 }
3591  0014 81            	ret
3626                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3626                     ; 1421 {
3627                     .text:	section	.text,new
3628  0000               _RTC_GetWakeUpCounter:
3630  0000 89            	pushw	x
3631       00000002      OFST:	set	2
3634                     ; 1422   uint16_t tmpreg = 0;
3636                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3638  0001 c65154        	ld	a,20820
3639  0004 5f            	clrw	x
3640  0005 97            	ld	xl,a
3641  0006 4f            	clr	a
3642  0007 02            	rlwa	x,a
3643  0008 1f01          	ldw	(OFST-1,sp),x
3644                     ; 1426   tmpreg |= RTC->WUTRL;
3646  000a c65155        	ld	a,20821
3647  000d 5f            	clrw	x
3648  000e 97            	ld	xl,a
3649  000f 01            	rrwa	x,a
3650  0010 1a02          	or	a,(OFST+0,sp)
3651  0012 01            	rrwa	x,a
3652  0013 1a01          	or	a,(OFST-1,sp)
3653  0015 01            	rrwa	x,a
3654  0016 1f01          	ldw	(OFST-1,sp),x
3655                     ; 1429   return (uint16_t)tmpreg;
3657  0018 1e01          	ldw	x,(OFST-1,sp)
3660  001a 5b02          	addw	sp,#2
3661  001c 81            	ret
3716                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3716                     ; 1441 {
3717                     .text:	section	.text,new
3718  0000               _RTC_WakeUpCmd:
3720  0000 5203          	subw	sp,#3
3721       00000003      OFST:	set	3
3724                     ; 1442   ErrorStatus status = ERROR;
3726                     ; 1443   uint16_t wutwfcount = 0;
3728  0002 5f            	clrw	x
3729  0003 1f02          	ldw	(OFST-1,sp),x
3730                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3732                     ; 1449   RTC->WPR = 0xCA;
3734  0005 35ca5159      	mov	20825,#202
3735                     ; 1450   RTC->WPR = 0x53;
3737  0009 35535159      	mov	20825,#83
3738                     ; 1452   if (NewState != DISABLE)
3740  000d 4d            	tnz	a
3741  000e 2711          	jreq	L3161
3742                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3744  0010 72145149      	bset	20809,#2
3745                     ; 1457     status = SUCCESS;
3747  0014 a601          	ld	a,#1
3748  0016 6b01          	ld	(OFST-2,sp),a
3750  0018               L5161:
3751                     ; 1482   RTC->WPR = 0xFF; 
3753  0018 35ff5159      	mov	20825,#255
3754                     ; 1485   return (ErrorStatus)status;
3756  001c 7b01          	ld	a,(OFST-2,sp)
3759  001e 5b03          	addw	sp,#3
3760  0020 81            	ret
3761  0021               L3161:
3762                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3764  0021 72155149      	bres	20809,#2
3766  0025 2007          	jra	L1261
3767  0027               L7161:
3768                     ; 1467       wutwfcount++;
3770  0027 1e02          	ldw	x,(OFST-1,sp)
3771  0029 1c0001        	addw	x,#1
3772  002c 1f02          	ldw	(OFST-1,sp),x
3773  002e               L1261:
3774                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3776  002e c6514c        	ld	a,20812
3777  0031 a504          	bcp	a,#4
3778  0033 2607          	jrne	L5261
3780  0035 1e02          	ldw	x,(OFST-1,sp)
3781  0037 a3ffff        	cpw	x,#65535
3782  003a 26eb          	jrne	L7161
3783  003c               L5261:
3784                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3786  003c c6514c        	ld	a,20812
3787  003f a504          	bcp	a,#4
3788  0041 2604          	jrne	L7261
3789                     ; 1473       status = ERROR;
3791  0043 0f01          	clr	(OFST-2,sp)
3793  0045 20d1          	jra	L5161
3794  0047               L7261:
3795                     ; 1477       status = SUCCESS;
3797  0047 a601          	ld	a,#1
3798  0049 6b01          	ld	(OFST-2,sp),a
3799  004b 20cb          	jra	L5161
3889                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3889                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3889                     ; 1524 {
3890                     .text:	section	.text,new
3891  0000               _RTC_DayLightSavingConfig:
3893  0000 89            	pushw	x
3894       00000000      OFST:	set	0
3897                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3899                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3901                     ; 1530   RTC->WPR = 0xCA;
3903  0001 35ca5159      	mov	20825,#202
3904                     ; 1531   RTC->WPR = 0x53;
3906  0005 35535159      	mov	20825,#83
3907                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3909  0009 7215514a      	bres	20810,#2
3910                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3912  000d 9f            	ld	a,xl
3913  000e 1a01          	or	a,(OFST+1,sp)
3914  0010 ca514a        	or	a,20810
3915  0013 c7514a        	ld	20810,a
3916                     ; 1540   RTC->WPR = 0xFF; 
3918  0016 35ff5159      	mov	20825,#255
3919                     ; 1541 }
3922  001a 85            	popw	x
3923  001b 81            	ret
3948                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3948                     ; 1550 {
3949                     .text:	section	.text,new
3950  0000               _RTC_GetStoreOperation:
3954                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3956  0000 c6514a        	ld	a,20810
3957  0003 a404          	and	a,#4
3960  0005 81            	ret
4054                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4054                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4054                     ; 1589 {
4055                     .text:	section	.text,new
4056  0000               _RTC_OutputConfig:
4058  0000 89            	pushw	x
4059       00000000      OFST:	set	0
4062                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4064                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4066                     ; 1595   RTC->WPR = 0xCA;
4068  0001 35ca5159      	mov	20825,#202
4069                     ; 1596   RTC->WPR = 0x53;
4071  0005 35535159      	mov	20825,#83
4072                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4074  0009 c6514a        	ld	a,20810
4075  000c a48f          	and	a,#143
4076  000e c7514a        	ld	20810,a
4077                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4079  0011 9f            	ld	a,xl
4080  0012 1a01          	or	a,(OFST+1,sp)
4081  0014 ca514a        	or	a,20810
4082  0017 c7514a        	ld	20810,a
4083                     ; 1605   RTC->WPR = 0xFF; 
4085  001a 35ff5159      	mov	20825,#255
4086                     ; 1606 }
4089  001e 85            	popw	x
4090  001f 81            	ret
4185                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4185                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4185                     ; 1641 {
4186                     .text:	section	.text,new
4187  0000               _RTC_SynchroShiftConfig:
4189  0000 88            	push	a
4190  0001 5203          	subw	sp,#3
4191       00000003      OFST:	set	3
4194                     ; 1642   uint8_t shiftrhreg = 0;
4196                     ; 1643   ErrorStatus status = ERROR;
4198                     ; 1644   uint16_t shpfcount = 0;
4200  0003 5f            	clrw	x
4201  0004 1f02          	ldw	(OFST-1,sp),x
4202                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4204                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4206                     ; 1651   RTC->WPR = 0xCA;
4208  0006 35ca5159      	mov	20825,#202
4209                     ; 1652   RTC->WPR = 0x53;
4211  000a 35535159      	mov	20825,#83
4212                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4214  000e c6514c        	ld	a,20812
4215  0011 a508          	bcp	a,#8
4216  0013 2717          	jreq	L7102
4218  0015 2007          	jra	L3202
4219  0017               L1202:
4220                     ; 1660       shpfcount++;
4222  0017 1e02          	ldw	x,(OFST-1,sp)
4223  0019 1c0001        	addw	x,#1
4224  001c 1f02          	ldw	(OFST-1,sp),x
4225  001e               L3202:
4226                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4228  001e c6514c        	ld	a,20812
4229  0021 a508          	bcp	a,#8
4230  0023 2707          	jreq	L7102
4232  0025 1e02          	ldw	x,(OFST-1,sp)
4233  0027 a3ffff        	cpw	x,#65535
4234  002a 26eb          	jrne	L1202
4235  002c               L7102:
4236                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4238  002c c6514c        	ld	a,20812
4239  002f a508          	bcp	a,#8
4240  0031 2616          	jrne	L1302
4241                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4243  0033 7b07          	ld	a,(OFST+4,sp)
4244  0035 1a04          	or	a,(OFST+1,sp)
4245  0037 6b01          	ld	(OFST-2,sp),a
4246                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4248  0039 7b01          	ld	a,(OFST-2,sp)
4249  003b c7515a        	ld	20826,a
4250                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4252  003e 7b08          	ld	a,(OFST+5,sp)
4253  0040 c7515b        	ld	20827,a
4254                     ; 1672     status = SUCCESS;
4256  0043 a601          	ld	a,#1
4257  0045 6b01          	ld	(OFST-2,sp),a
4259  0047 2002          	jra	L3302
4260  0049               L1302:
4261                     ; 1676     status = ERROR;
4263  0049 0f01          	clr	(OFST-2,sp)
4264  004b               L3302:
4265                     ; 1680   RTC->WPR = 0xFF; 
4267  004b 35ff5159      	mov	20825,#255
4268                     ; 1682   return (ErrorStatus)(status);
4270  004f 7b01          	ld	a,(OFST-2,sp)
4273  0051 5b04          	addw	sp,#4
4274  0053 81            	ret
4404                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4404                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4404                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4404                     ; 1721 {
4405                     .text:	section	.text,new
4406  0000               _RTC_SmoothCalibConfig:
4408  0000 89            	pushw	x
4409  0001 5203          	subw	sp,#3
4410       00000003      OFST:	set	3
4413                     ; 1722   ErrorStatus status = ERROR;
4415                     ; 1723   uint16_t recalpfcount = 0;
4417  0003 5f            	clrw	x
4418  0004 1f02          	ldw	(OFST-1,sp),x
4419                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4421                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4423                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4425                     ; 1731   RTC->WPR = 0xCA;
4427  0006 35ca5159      	mov	20825,#202
4428                     ; 1732   RTC->WPR = 0x53;
4430  000a 35535159      	mov	20825,#83
4431                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4433  000e c6514c        	ld	a,20812
4434  0011 a502          	bcp	a,#2
4435  0013 2717          	jreq	L5112
4437  0015 2007          	jra	L1212
4438  0017               L7112:
4439                     ; 1740       recalpfcount++;
4441  0017 1e02          	ldw	x,(OFST-1,sp)
4442  0019 1c0001        	addw	x,#1
4443  001c 1f02          	ldw	(OFST-1,sp),x
4444  001e               L1212:
4445                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4447  001e c6514c        	ld	a,20812
4448  0021 a502          	bcp	a,#2
4449  0023 2707          	jreq	L5112
4451  0025 1e02          	ldw	x,(OFST-1,sp)
4452  0027 a3ffff        	cpw	x,#65535
4453  002a 26eb          	jrne	L7112
4454  002c               L5112:
4455                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4457  002c c6514c        	ld	a,20812
4458  002f a502          	bcp	a,#2
4459  0031 2614          	jrne	L7212
4460                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4460                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4460                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4462  0033 7b04          	ld	a,(OFST+1,sp)
4463  0035 1a05          	or	a,(OFST+2,sp)
4464  0037 1a08          	or	a,(OFST+5,sp)
4465  0039 c7516a        	ld	20842,a
4466                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4468  003c 7b09          	ld	a,(OFST+6,sp)
4469  003e c7516b        	ld	20843,a
4470                     ; 1754     status = SUCCESS;
4472  0041 a601          	ld	a,#1
4473  0043 6b01          	ld	(OFST-2,sp),a
4475  0045 2002          	jra	L1312
4476  0047               L7212:
4477                     ; 1758     status = ERROR;
4479  0047 0f01          	clr	(OFST-2,sp)
4480  0049               L1312:
4481                     ; 1762   RTC->WPR = 0xFF; 
4483  0049 35ff5159      	mov	20825,#255
4484                     ; 1764   return (ErrorStatus)(status);
4486  004d 7b01          	ld	a,(OFST-2,sp)
4489  004f 5b05          	addw	sp,#5
4490  0051 81            	ret
4548                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4548                     ; 1791 {
4549                     .text:	section	.text,new
4550  0000               _RTC_CalibOutputConfig:
4554                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4556                     ; 1796   RTC->WPR = 0xCA;
4558  0000 35ca5159      	mov	20825,#202
4559                     ; 1797   RTC->WPR = 0x53;
4561  0004 35535159      	mov	20825,#83
4562                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4564  0008 4d            	tnz	a
4565  0009 2706          	jreq	L1612
4566                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4568  000b 7216514a      	bset	20810,#3
4570  000f 2004          	jra	L3612
4571  0011               L1612:
4572                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4574  0011 7217514a      	bres	20810,#3
4575  0015               L3612:
4576                     ; 1811   RTC->WPR = 0xFF; 
4578  0015 35ff5159      	mov	20825,#255
4579                     ; 1812 }
4582  0019 81            	ret
4617                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4617                     ; 1821 {
4618                     .text:	section	.text,new
4619  0000               _RTC_CalibOutputCmd:
4623                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4625                     ; 1826   RTC->WPR = 0xCA;
4627  0000 35ca5159      	mov	20825,#202
4628                     ; 1827   RTC->WPR = 0x53;
4630  0004 35535159      	mov	20825,#83
4631                     ; 1829   if (NewState != DISABLE)
4633  0008 4d            	tnz	a
4634  0009 2706          	jreq	L3022
4635                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4637  000b 721e514a      	bset	20810,#7
4639  000f 2004          	jra	L5022
4640  0011               L3022:
4641                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4643  0011 721f514a      	bres	20810,#7
4644  0015               L5022:
4645                     ; 1841   RTC->WPR = 0xFF; 
4647  0015 35ff5159      	mov	20825,#255
4648                     ; 1842 }
4651  0019 81            	ret
4746                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4746                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4746                     ; 1873 {
4747                     .text:	section	.text,new
4748  0000               _RTC_TamperLevelConfig:
4750  0000 89            	pushw	x
4751       00000000      OFST:	set	0
4754                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4756                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4758                     ; 1879   RTC->WPR = 0xCA;
4760  0001 35ca5159      	mov	20825,#202
4761                     ; 1880   RTC->WPR = 0x53;
4763  0005 35535159      	mov	20825,#83
4764                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4766  0009 9f            	ld	a,xl
4767  000a 4d            	tnz	a
4768  000b 270a          	jreq	L3522
4769                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4771  000d 9e            	ld	a,xh
4772  000e 48            	sll	a
4773  000f ca516c        	or	a,20844
4774  0012 c7516c        	ld	20844,a
4776  0015 200a          	jra	L5522
4777  0017               L3522:
4778                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4780  0017 7b01          	ld	a,(OFST+1,sp)
4781  0019 48            	sll	a
4782  001a 43            	cpl	a
4783  001b c4516c        	and	a,20844
4784  001e c7516c        	ld	20844,a
4785  0021               L5522:
4786                     ; 1894   RTC->WPR = 0xFF; 
4788  0021 35ff5159      	mov	20825,#255
4789                     ; 1895 }
4792  0025 85            	popw	x
4793  0026 81            	ret
4867                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4867                     ; 1904 {
4868                     .text:	section	.text,new
4869  0000               _RTC_TamperFilterConfig:
4871  0000 88            	push	a
4872       00000000      OFST:	set	0
4875                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4877                     ; 1910   RTC->WPR = 0xCA;
4879  0001 35ca5159      	mov	20825,#202
4880                     ; 1911   RTC->WPR = 0x53;
4882  0005 35535159      	mov	20825,#83
4883                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4885  0009 c6516d        	ld	a,20845
4886  000c a4e7          	and	a,#231
4887  000e c7516d        	ld	20845,a
4888                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4890  0011 c6516d        	ld	a,20845
4891  0014 1a01          	or	a,(OFST+1,sp)
4892  0016 c7516d        	ld	20845,a
4893                     ; 1920   RTC->WPR = 0xFF; 
4895  0019 35ff5159      	mov	20825,#255
4896                     ; 1922 }
4899  001d 84            	pop	a
4900  001e 81            	ret
5013                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5013                     ; 1932 {
5014                     .text:	section	.text,new
5015  0000               _RTC_TamperSamplingFreqConfig:
5017  0000 88            	push	a
5018       00000000      OFST:	set	0
5021                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5023                     ; 1937   RTC->WPR = 0xCA;
5025  0001 35ca5159      	mov	20825,#202
5026                     ; 1938   RTC->WPR = 0x53;
5028  0005 35535159      	mov	20825,#83
5029                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5031  0009 c6516d        	ld	a,20845
5032  000c a4f8          	and	a,#248
5033  000e c7516d        	ld	20845,a
5034                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5036  0011 c6516d        	ld	a,20845
5037  0014 1a01          	or	a,(OFST+1,sp)
5038  0016 c7516d        	ld	20845,a
5039                     ; 1947   RTC->WPR = 0xFF; 
5041  0019 35ff5159      	mov	20825,#255
5042                     ; 1948 }
5045  001d 84            	pop	a
5046  001e 81            	ret
5129                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5129                     ; 1959 {
5130                     .text:	section	.text,new
5131  0000               _RTC_TamperPinsPrechargeDuration:
5133  0000 88            	push	a
5134       00000000      OFST:	set	0
5137                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5139                     ; 1964   RTC->WPR = 0xCA;
5141  0001 35ca5159      	mov	20825,#202
5142                     ; 1965   RTC->WPR = 0x53;
5144  0005 35535159      	mov	20825,#83
5145                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5147  0009 c6516d        	ld	a,20845
5148  000c a41f          	and	a,#31
5149  000e c7516d        	ld	20845,a
5150                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5152  0011 c6516d        	ld	a,20845
5153  0014 1a01          	or	a,(OFST+1,sp)
5154  0016 c7516d        	ld	20845,a
5155                     ; 1974   RTC->WPR = 0xFF; 
5157  0019 35ff5159      	mov	20825,#255
5158                     ; 1975 }
5161  001d 84            	pop	a
5162  001e 81            	ret
5207                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5207                     ; 1988                    FunctionalState NewState)
5207                     ; 1989 {
5208                     .text:	section	.text,new
5209  0000               _RTC_TamperCmd:
5211  0000 89            	pushw	x
5212       00000000      OFST:	set	0
5215                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5217                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5219                     ; 1996   RTC->WPR = 0xCA;
5221  0001 35ca5159      	mov	20825,#202
5222                     ; 1997   RTC->WPR = 0x53;
5224  0005 35535159      	mov	20825,#83
5225                     ; 2000   if (NewState != DISABLE)
5227  0009 9f            	ld	a,xl
5228  000a 4d            	tnz	a
5229  000b 2709          	jreq	L1342
5230                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5232  000d 9e            	ld	a,xh
5233  000e ca516c        	or	a,20844
5234  0011 c7516c        	ld	20844,a
5236  0014 2009          	jra	L3342
5237  0016               L1342:
5238                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5240  0016 7b01          	ld	a,(OFST+1,sp)
5241  0018 43            	cpl	a
5242  0019 c4516c        	and	a,20844
5243  001c c7516c        	ld	20844,a
5244  001f               L3342:
5245                     ; 2013   RTC->WPR = 0xFF; 
5247  001f 35ff5159      	mov	20825,#255
5248                     ; 2014 }
5251  0023 85            	popw	x
5252  0024 81            	ret
5324                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5324                     ; 2059 {
5325                     .text:	section	.text,new
5326  0000               _RTC_ITConfig:
5328  0000 89            	pushw	x
5329       00000000      OFST:	set	0
5332                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5334                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5336                     ; 2065   RTC->WPR = 0xCA;
5338  0001 35ca5159      	mov	20825,#202
5339                     ; 2066   RTC->WPR = 0x53;
5341  0005 35535159      	mov	20825,#83
5342                     ; 2068   if (NewState != DISABLE)
5344  0009 0d05          	tnz	(OFST+5,sp)
5345  000b 2715          	jreq	L1742
5346                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5348  000d 9f            	ld	a,xl
5349  000e a4f0          	and	a,#240
5350  0010 ca5149        	or	a,20809
5351  0013 c75149        	ld	20809,a
5352                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5354  0016 7b02          	ld	a,(OFST+2,sp)
5355  0018 a401          	and	a,#1
5356  001a ca516c        	or	a,20844
5357  001d c7516c        	ld	20844,a
5359  0020 2016          	jra	L3742
5360  0022               L1742:
5361                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5363  0022 7b02          	ld	a,(OFST+2,sp)
5364  0024 a4f0          	and	a,#240
5365  0026 43            	cpl	a
5366  0027 c45149        	and	a,20809
5367  002a c75149        	ld	20809,a
5368                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5370  002d 7b02          	ld	a,(OFST+2,sp)
5371  002f a401          	and	a,#1
5372  0031 43            	cpl	a
5373  0032 c4516c        	and	a,20844
5374  0035 c7516c        	ld	20844,a
5375  0038               L3742:
5376                     ; 2082   RTC->WPR = 0xFF; 
5378  0038 35ff5159      	mov	20825,#255
5379                     ; 2083 }
5382  003c 85            	popw	x
5383  003d 81            	ret
5557                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5557                     ; 2091 {
5558                     .text:	section	.text,new
5559  0000               _RTC_GetFlagStatus:
5561  0000 89            	pushw	x
5562  0001 5203          	subw	sp,#3
5563       00000003      OFST:	set	3
5566                     ; 2092   FlagStatus flagstatus = RESET;
5568                     ; 2093   uint16_t tmpreg1 = 0;
5570                     ; 2094   uint16_t tmpreg2 = 0;
5572                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5574                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5576  0003 c6514c        	ld	a,20812
5577  0006 5f            	clrw	x
5578  0007 97            	ld	xl,a
5579  0008 4f            	clr	a
5580  0009 02            	rlwa	x,a
5581  000a 1f02          	ldw	(OFST-1,sp),x
5582                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5584  000c c6514d        	ld	a,20813
5585  000f 5f            	clrw	x
5586  0010 97            	ld	xl,a
5587  0011 01            	rrwa	x,a
5588  0012 1a03          	or	a,(OFST+0,sp)
5589  0014 01            	rrwa	x,a
5590  0015 1a02          	or	a,(OFST-1,sp)
5591  0017 01            	rrwa	x,a
5592  0018 1f02          	ldw	(OFST-1,sp),x
5593                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5595  001a 1e02          	ldw	x,(OFST-1,sp)
5596  001c 01            	rrwa	x,a
5597  001d 1405          	and	a,(OFST+2,sp)
5598  001f 01            	rrwa	x,a
5599  0020 1404          	and	a,(OFST+1,sp)
5600  0022 01            	rrwa	x,a
5601  0023 a30000        	cpw	x,#0
5602  0026 2706          	jreq	L3752
5603                     ; 2106     flagstatus = SET;
5605  0028 a601          	ld	a,#1
5606  002a 6b01          	ld	(OFST-2,sp),a
5608  002c 2002          	jra	L5752
5609  002e               L3752:
5610                     ; 2110     flagstatus = RESET;
5612  002e 0f01          	clr	(OFST-2,sp)
5613  0030               L5752:
5614                     ; 2112   return (FlagStatus)flagstatus;
5616  0030 7b01          	ld	a,(OFST-2,sp)
5619  0032 5b05          	addw	sp,#5
5620  0034 81            	ret
5655                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5655                     ; 2123 {
5656                     .text:	section	.text,new
5657  0000               _RTC_ClearFlag:
5659  0000 89            	pushw	x
5660       00000000      OFST:	set	0
5663                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5665                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5667  0001 9f            	ld	a,xl
5668  0002 43            	cpl	a
5669  0003 c7514d        	ld	20813,a
5670                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5672  0006 7b01          	ld	a,(OFST+1,sp)
5673  0008 43            	cpl	a
5674  0009 a47f          	and	a,#127
5675  000b c7514c        	ld	20812,a
5676                     ; 2130 }
5679  000e 85            	popw	x
5680  000f 81            	ret
5744                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5744                     ; 2139 {
5745                     .text:	section	.text,new
5746  0000               _RTC_GetITStatus:
5748  0000 89            	pushw	x
5749  0001 89            	pushw	x
5750       00000002      OFST:	set	2
5753                     ; 2140   ITStatus itstatus = RESET;
5755                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5759                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5761                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5763  0002 9f            	ld	a,xl
5764  0003 c45149        	and	a,20809
5765  0006 6b01          	ld	(OFST-1,sp),a
5766                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5768  0008 1e03          	ldw	x,(OFST+1,sp)
5769  000a 54            	srlw	x
5770  000b 54            	srlw	x
5771  000c 54            	srlw	x
5772  000d 54            	srlw	x
5773  000e 9f            	ld	a,xl
5774  000f c4514d        	and	a,20813
5775  0012 6b02          	ld	(OFST+0,sp),a
5776                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5778  0014 0d01          	tnz	(OFST-1,sp)
5779  0016 270a          	jreq	L7462
5781  0018 0d02          	tnz	(OFST+0,sp)
5782  001a 2706          	jreq	L7462
5783                     ; 2155     itstatus = SET;
5785  001c a601          	ld	a,#1
5786  001e 6b02          	ld	(OFST+0,sp),a
5788  0020 2002          	jra	L1562
5789  0022               L7462:
5790                     ; 2159     itstatus = RESET;
5792  0022 0f02          	clr	(OFST+0,sp)
5793  0024               L1562:
5794                     ; 2162   return (ITStatus)itstatus;
5796  0024 7b02          	ld	a,(OFST+0,sp)
5799  0026 5b04          	addw	sp,#4
5800  0028 81            	ret
5836                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5836                     ; 2173 {
5837                     .text:	section	.text,new
5838  0000               _RTC_ClearITPendingBit:
5842                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5844                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5846  0000 54            	srlw	x
5847  0001 54            	srlw	x
5848  0002 54            	srlw	x
5849  0003 54            	srlw	x
5850  0004 9f            	ld	a,xl
5851  0005 43            	cpl	a
5852  0006 c7514d        	ld	20813,a
5853                     ; 2179 }
5856  0009 81            	ret
5899                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5899                     ; 2203 {
5900                     .text:	section	.text,new
5901  0000               L3_ByteToBcd2:
5903  0000 88            	push	a
5904  0001 88            	push	a
5905       00000001      OFST:	set	1
5908                     ; 2204   uint8_t bcdhigh = 0;
5910  0002 0f01          	clr	(OFST+0,sp)
5912  0004 2008          	jra	L7172
5913  0006               L3172:
5914                     ; 2208     bcdhigh++;
5916  0006 0c01          	inc	(OFST+0,sp)
5917                     ; 2209     Value -= 10;
5919  0008 7b02          	ld	a,(OFST+1,sp)
5920  000a a00a          	sub	a,#10
5921  000c 6b02          	ld	(OFST+1,sp),a
5922  000e               L7172:
5923                     ; 2206   while (Value >= 10)
5925  000e 7b02          	ld	a,(OFST+1,sp)
5926  0010 a10a          	cp	a,#10
5927  0012 24f2          	jruge	L3172
5928                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5930  0014 7b01          	ld	a,(OFST+0,sp)
5931  0016 97            	ld	xl,a
5932  0017 a610          	ld	a,#16
5933  0019 42            	mul	x,a
5934  001a 9f            	ld	a,xl
5935  001b 1a02          	or	a,(OFST+1,sp)
5938  001d 85            	popw	x
5939  001e 81            	ret
5982                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5982                     ; 2221 {
5983                     .text:	section	.text,new
5984  0000               L5_Bcd2ToByte:
5986  0000 88            	push	a
5987  0001 88            	push	a
5988       00000001      OFST:	set	1
5991                     ; 2222   uint8_t tmp = 0;
5993                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5995  0002 a4f0          	and	a,#240
5996  0004 4e            	swap	a
5997  0005 a40f          	and	a,#15
5998  0007 97            	ld	xl,a
5999  0008 a60a          	ld	a,#10
6000  000a 42            	mul	x,a
6001  000b 9f            	ld	a,xl
6002  000c 6b01          	ld	(OFST+0,sp),a
6003                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6005  000e 7b02          	ld	a,(OFST+1,sp)
6006  0010 a40f          	and	a,#15
6007  0012 1b01          	add	a,(OFST+0,sp)
6010  0014 85            	popw	x
6011  0015 81            	ret
6024                     	xdef	_RTC_ClearITPendingBit
6025                     	xdef	_RTC_GetITStatus
6026                     	xdef	_RTC_ClearFlag
6027                     	xdef	_RTC_GetFlagStatus
6028                     	xdef	_RTC_ITConfig
6029                     	xdef	_RTC_TamperCmd
6030                     	xdef	_RTC_TamperPinsPrechargeDuration
6031                     	xdef	_RTC_TamperSamplingFreqConfig
6032                     	xdef	_RTC_TamperFilterConfig
6033                     	xdef	_RTC_TamperLevelConfig
6034                     	xdef	_RTC_CalibOutputCmd
6035                     	xdef	_RTC_CalibOutputConfig
6036                     	xdef	_RTC_SmoothCalibConfig
6037                     	xdef	_RTC_SynchroShiftConfig
6038                     	xdef	_RTC_OutputConfig
6039                     	xdef	_RTC_GetStoreOperation
6040                     	xdef	_RTC_DayLightSavingConfig
6041                     	xdef	_RTC_WakeUpCmd
6042                     	xdef	_RTC_GetWakeUpCounter
6043                     	xdef	_RTC_SetWakeUpCounter
6044                     	xdef	_RTC_WakeUpClockConfig
6045                     	xdef	_RTC_AlarmSubSecondConfig
6046                     	xdef	_RTC_AlarmCmd
6047                     	xdef	_RTC_GetAlarm
6048                     	xdef	_RTC_AlarmStructInit
6049                     	xdef	_RTC_SetAlarm
6050                     	xdef	_RTC_GetDate
6051                     	xdef	_RTC_DateStructInit
6052                     	xdef	_RTC_SetDate
6053                     	xdef	_RTC_GetSubSecond
6054                     	xdef	_RTC_GetTime
6055                     	xdef	_RTC_TimeStructInit
6056                     	xdef	_RTC_SetTime
6057                     	xdef	_RTC_BypassShadowCmd
6058                     	xdef	_RTC_RatioCmd
6059                     	xdef	_RTC_WaitForSynchro
6060                     	xdef	_RTC_ExitInitMode
6061                     	xdef	_RTC_EnterInitMode
6062                     	xdef	_RTC_WriteProtectionCmd
6063                     	xdef	_RTC_StructInit
6064                     	xdef	_RTC_Init
6065                     	xdef	_RTC_DeInit
6084                     	end
