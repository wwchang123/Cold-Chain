   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 168 void TIM5_DeInit(void)
  44                     ; 169 {
  46                     .text:	section	.text,new
  47  0000               _TIM5_DeInit:
  51                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  56  0004 725f5301      	clr	21249
  57                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  59  0008 725f5302      	clr	21250
  60                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  62  000c 725f5303      	clr	21251
  63                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  65  0010 725f5305      	clr	21253
  66                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  68  0014 725f5307      	clr	21255
  69                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  74  001c 35015309      	mov	21257,#1
  75                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  77  0020 3501530a      	mov	21258,#1
  78                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  80  0024 725f530b      	clr	21259
  81                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  83  0028 725f5309      	clr	21257
  84                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  86  002c 725f530a      	clr	21258
  87                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  89  0030 725f530c      	clr	21260
  90                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  92  0034 725f530d      	clr	21261
  93                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  95  0038 725f530e      	clr	21262
  96                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  98  003c 35ff530f      	mov	21263,#255
  99                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 101  0040 35ff5310      	mov	21264,#255
 102                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 104  0044 725f5311      	clr	21265
 105                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 107  0048 725f5312      	clr	21266
 108                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 110  004c 725f5313      	clr	21267
 111                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 113  0050 725f5314      	clr	21268
 114                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 116  0054 725f5316      	clr	21270
 117                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 119  0058 35015308      	mov	21256,#1
 120                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 122  005c 725f5315      	clr	21269
 123                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 125  0060 725f5306      	clr	21254
 126                     ; 206 }
 129  0064 81            	ret
 291                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 291                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 291                     ; 233                        uint16_t TIM5_Period)
 291                     ; 234 {
 292                     .text:	section	.text,new
 293  0000               _TIM5_TimeBaseInit:
 295  0000 89            	pushw	x
 296       00000000      OFST:	set	0
 299                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 301                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 303                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 305  0001 7b05          	ld	a,(OFST+5,sp)
 306  0003 c7530f        	ld	21263,a
 307                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 309  0006 7b06          	ld	a,(OFST+6,sp)
 310  0008 c75310        	ld	21264,a
 311                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 313  000b 9e            	ld	a,xh
 314  000c c7530e        	ld	21262,a
 315                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 317  000f c65300        	ld	a,21248
 318  0012 a48f          	and	a,#143
 319  0014 c75300        	ld	21248,a
 320                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 322  0017 9f            	ld	a,xl
 323  0018 ca5300        	or	a,21248
 324  001b c75300        	ld	21248,a
 325                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 327  001e 35015308      	mov	21256,#1
 328                     ; 254 }
 331  0022 85            	popw	x
 332  0023 81            	ret
 400                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 400                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 400                     ; 276 {
 401                     .text:	section	.text,new
 402  0000               _TIM5_PrescalerConfig:
 406                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 408                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 410                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 412  0000 9e            	ld	a,xh
 413  0001 c7530e        	ld	21262,a
 414                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 416  0004 9f            	ld	a,xl
 417  0005 a101          	cp	a,#1
 418  0007 2606          	jrne	L741
 419                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 421  0009 72105308      	bset	21256,#0
 423  000d 2004          	jra	L151
 424  000f               L741:
 425                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 427  000f 72115308      	bres	21256,#0
 428  0013               L151:
 429                     ; 293 }
 432  0013 81            	ret
 477                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 477                     ; 307 {
 478                     .text:	section	.text,new
 479  0000               _TIM5_CounterModeConfig:
 481  0000 88            	push	a
 482  0001 88            	push	a
 483       00000001      OFST:	set	1
 486                     ; 308   uint8_t tmpcr1 = 0;
 488                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 490                     ; 313   tmpcr1 = TIM5->CR1;
 492  0002 c65300        	ld	a,21248
 493  0005 6b01          	ld	(OFST+0,sp),a
 494                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 496  0007 7b01          	ld	a,(OFST+0,sp)
 497  0009 a48f          	and	a,#143
 498  000b 6b01          	ld	(OFST+0,sp),a
 499                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 501  000d 7b01          	ld	a,(OFST+0,sp)
 502  000f 1a02          	or	a,(OFST+1,sp)
 503  0011 6b01          	ld	(OFST+0,sp),a
 504                     ; 321   TIM5->CR1 = tmpcr1;
 506  0013 7b01          	ld	a,(OFST+0,sp)
 507  0015 c75300        	ld	21248,a
 508                     ; 322 }
 511  0018 85            	popw	x
 512  0019 81            	ret
 546                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 546                     ; 331 {
 547                     .text:	section	.text,new
 548  0000               _TIM5_SetCounter:
 552                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 554  0000 9e            	ld	a,xh
 555  0001 c7530c        	ld	21260,a
 556                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 558  0004 9f            	ld	a,xl
 559  0005 c7530d        	ld	21261,a
 560                     ; 336 }
 563  0008 81            	ret
 597                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 597                     ; 345 {
 598                     .text:	section	.text,new
 599  0000               _TIM5_SetAutoreload:
 603                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 605  0000 9e            	ld	a,xh
 606  0001 c7530f        	ld	21263,a
 607                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 609  0004 9f            	ld	a,xl
 610  0005 c75310        	ld	21264,a
 611                     ; 349 }
 614  0008 81            	ret
 666                     ; 356 uint16_t TIM5_GetCounter(void)
 666                     ; 357 {
 667                     .text:	section	.text,new
 668  0000               _TIM5_GetCounter:
 670  0000 5204          	subw	sp,#4
 671       00000004      OFST:	set	4
 674                     ; 358   uint16_t tmpcnt = 0;
 676                     ; 361   tmpcntrh = TIM5->CNTRH;
 678  0002 c6530c        	ld	a,21260
 679  0005 6b02          	ld	(OFST-2,sp),a
 680                     ; 362   tmpcntrl = TIM5->CNTRL;
 682  0007 c6530d        	ld	a,21261
 683  000a 6b01          	ld	(OFST-3,sp),a
 684                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 686  000c 7b01          	ld	a,(OFST-3,sp)
 687  000e 5f            	clrw	x
 688  000f 97            	ld	xl,a
 689  0010 1f03          	ldw	(OFST-1,sp),x
 690                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 692  0012 7b02          	ld	a,(OFST-2,sp)
 693  0014 5f            	clrw	x
 694  0015 97            	ld	xl,a
 695  0016 4f            	clr	a
 696  0017 02            	rlwa	x,a
 697  0018 01            	rrwa	x,a
 698  0019 1a04          	or	a,(OFST+0,sp)
 699  001b 01            	rrwa	x,a
 700  001c 1a03          	or	a,(OFST-1,sp)
 701  001e 01            	rrwa	x,a
 702  001f 1f03          	ldw	(OFST-1,sp),x
 703                     ; 367   return ((uint16_t)tmpcnt);
 705  0021 1e03          	ldw	x,(OFST-1,sp)
 708  0023 5b04          	addw	sp,#4
 709  0025 81            	ret
 733                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 733                     ; 384 {
 734                     .text:	section	.text,new
 735  0000               _TIM5_GetPrescaler:
 739                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 741  0000 c6530e        	ld	a,21262
 744  0003 81            	ret
 800                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 800                     ; 397 {
 801                     .text:	section	.text,new
 802  0000               _TIM5_UpdateDisableConfig:
 806                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 808                     ; 402   if (NewState != DISABLE)
 810  0000 4d            	tnz	a
 811  0001 2706          	jreq	L513
 812                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 814  0003 72125300      	bset	21248,#1
 816  0007 2004          	jra	L713
 817  0009               L513:
 818                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 820  0009 72135300      	bres	21248,#1
 821  000d               L713:
 822                     ; 410 }
 825  000d 81            	ret
 883                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 883                     ; 421 {
 884                     .text:	section	.text,new
 885  0000               _TIM5_UpdateRequestConfig:
 889                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 891                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 893  0000 a101          	cp	a,#1
 894  0002 2606          	jrne	L743
 895                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 897  0004 72145300      	bset	21248,#2
 899  0008 2004          	jra	L153
 900  000a               L743:
 901                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 903  000a 72155300      	bres	21248,#2
 904  000e               L153:
 905                     ; 434 }
 908  000e 81            	ret
 944                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 944                     ; 443 {
 945                     .text:	section	.text,new
 946  0000               _TIM5_ARRPreloadConfig:
 950                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 952                     ; 448   if (NewState != DISABLE)
 954  0000 4d            	tnz	a
 955  0001 2706          	jreq	L173
 956                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 958  0003 721e5300      	bset	21248,#7
 960  0007 2004          	jra	L373
 961  0009               L173:
 962                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 964  0009 721f5300      	bres	21248,#7
 965  000d               L373:
 966                     ; 456 }
 969  000d 81            	ret
1026                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1026                     ; 467 {
1027                     .text:	section	.text,new
1028  0000               _TIM5_SelectOnePulseMode:
1032                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1034                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1036  0000 a101          	cp	a,#1
1037  0002 2606          	jrne	L324
1038                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1040  0004 72165300      	bset	21248,#3
1042  0008 2004          	jra	L524
1043  000a               L324:
1044                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1046  000a 72175300      	bres	21248,#3
1047  000e               L524:
1048                     ; 480 }
1051  000e 81            	ret
1086                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1086                     ; 489 {
1087                     .text:	section	.text,new
1088  0000               _TIM5_Cmd:
1092                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1094                     ; 494   if (NewState != DISABLE)
1096  0000 4d            	tnz	a
1097  0001 2706          	jreq	L544
1098                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1100  0003 72105300      	bset	21248,#0
1102  0007 2004          	jra	L744
1103  0009               L544:
1104                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1106  0009 72115300      	bres	21248,#0
1107  000d               L744:
1108                     ; 502 }
1111  000d 81            	ret
1309                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1309                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1309                     ; 580                   uint16_t TIM5_Pulse,
1309                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1309                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1309                     ; 583 {
1310                     .text:	section	.text,new
1311  0000               _TIM5_OC1Init:
1313  0000 89            	pushw	x
1314  0001 88            	push	a
1315       00000001      OFST:	set	1
1318                     ; 584   uint8_t tmpccmr1 = 0;
1320                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1322                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1324                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1326                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1328                     ; 592   tmpccmr1 = TIM5->CCMR1;
1330  0002 c65309        	ld	a,21257
1331  0005 6b01          	ld	(OFST+0,sp),a
1332                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1334  0007 7211530b      	bres	21259,#0
1335                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1337  000b 7b01          	ld	a,(OFST+0,sp)
1338  000d a48f          	and	a,#143
1339  000f 6b01          	ld	(OFST+0,sp),a
1340                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1342  0011 9e            	ld	a,xh
1343  0012 1a01          	or	a,(OFST+0,sp)
1344  0014 6b01          	ld	(OFST+0,sp),a
1345                     ; 602   TIM5->CCMR1 = tmpccmr1;
1347  0016 7b01          	ld	a,(OFST+0,sp)
1348  0018 c75309        	ld	21257,a
1349                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1351  001b 9f            	ld	a,xl
1352  001c a101          	cp	a,#1
1353  001e 2606          	jrne	L365
1354                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1356  0020 7210530b      	bset	21259,#0
1358  0024 2004          	jra	L565
1359  0026               L365:
1360                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1362  0026 7211530b      	bres	21259,#0
1363  002a               L565:
1364                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1366  002a 7b08          	ld	a,(OFST+7,sp)
1367  002c a101          	cp	a,#1
1368  002e 2606          	jrne	L765
1369                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1371  0030 7212530b      	bset	21259,#1
1373  0034 2004          	jra	L175
1374  0036               L765:
1375                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1377  0036 7213530b      	bres	21259,#1
1378  003a               L175:
1379                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1381  003a 7b09          	ld	a,(OFST+8,sp)
1382  003c a101          	cp	a,#1
1383  003e 2606          	jrne	L375
1384                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1386  0040 72105316      	bset	21270,#0
1388  0044 2004          	jra	L575
1389  0046               L375:
1390                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1392  0046 72115316      	bres	21270,#0
1393  004a               L575:
1394                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1396  004a 7b06          	ld	a,(OFST+5,sp)
1397  004c c75311        	ld	21265,a
1398                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1400  004f 7b07          	ld	a,(OFST+6,sp)
1401  0051 c75312        	ld	21266,a
1402                     ; 637 }
1405  0054 5b03          	addw	sp,#3
1406  0056 81            	ret
1489                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1489                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1489                     ; 666                   uint16_t TIM5_Pulse,
1489                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1489                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1489                     ; 669 {
1490                     .text:	section	.text,new
1491  0000               _TIM5_OC2Init:
1493  0000 89            	pushw	x
1494  0001 88            	push	a
1495       00000001      OFST:	set	1
1498                     ; 670   uint8_t tmpccmr2 = 0;
1500                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1502                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1504                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1506                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1508                     ; 678   tmpccmr2 = TIM5->CCMR2;
1510  0002 c6530a        	ld	a,21258
1511  0005 6b01          	ld	(OFST+0,sp),a
1512                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1514  0007 7219530b      	bres	21259,#4
1515                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1517  000b 7b01          	ld	a,(OFST+0,sp)
1518  000d a48f          	and	a,#143
1519  000f 6b01          	ld	(OFST+0,sp),a
1520                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1522  0011 9e            	ld	a,xh
1523  0012 1a01          	or	a,(OFST+0,sp)
1524  0014 6b01          	ld	(OFST+0,sp),a
1525                     ; 689   TIM5->CCMR2 = tmpccmr2;
1527  0016 7b01          	ld	a,(OFST+0,sp)
1528  0018 c7530a        	ld	21258,a
1529                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1531  001b 9f            	ld	a,xl
1532  001c a101          	cp	a,#1
1533  001e 2606          	jrne	L146
1534                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1536  0020 7218530b      	bset	21259,#4
1538  0024 2004          	jra	L346
1539  0026               L146:
1540                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1542  0026 7219530b      	bres	21259,#4
1543  002a               L346:
1544                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1546  002a 7b08          	ld	a,(OFST+7,sp)
1547  002c a101          	cp	a,#1
1548  002e 2606          	jrne	L546
1549                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1551  0030 721a530b      	bset	21259,#5
1553  0034 2004          	jra	L746
1554  0036               L546:
1555                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1557  0036 721b530b      	bres	21259,#5
1558  003a               L746:
1559                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1561  003a 7b09          	ld	a,(OFST+8,sp)
1562  003c a101          	cp	a,#1
1563  003e 2606          	jrne	L156
1564                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1566  0040 72145316      	bset	21270,#2
1568  0044 2004          	jra	L356
1569  0046               L156:
1570                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1572  0046 72155316      	bres	21270,#2
1573  004a               L356:
1574                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1576  004a 7b06          	ld	a,(OFST+5,sp)
1577  004c c75313        	ld	21267,a
1578                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1580  004f 7b07          	ld	a,(OFST+6,sp)
1581  0051 c75314        	ld	21268,a
1582                     ; 725 }
1585  0054 5b03          	addw	sp,#3
1586  0056 81            	ret
1784                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1784                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1784                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1784                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1784                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1784                     ; 759 
1784                     ; 760 {
1785                     .text:	section	.text,new
1786  0000               _TIM5_BKRConfig:
1788  0000 89            	pushw	x
1789  0001 88            	push	a
1790       00000001      OFST:	set	1
1793                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1795                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1797                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1799                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1801                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1803                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1803                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1803                     ; 774                                   TIM5_AutomaticOutput));
1805  0002 7b06          	ld	a,(OFST+5,sp)
1806  0004 1a07          	or	a,(OFST+6,sp)
1807  0006 6b01          	ld	(OFST+0,sp),a
1808  0008 9f            	ld	a,xl
1809  0009 1a02          	or	a,(OFST+1,sp)
1810  000b 1a01          	or	a,(OFST+0,sp)
1811  000d 1a08          	or	a,(OFST+7,sp)
1812  000f c75315        	ld	21269,a
1813                     ; 775 }
1816  0012 5b03          	addw	sp,#3
1817  0014 81            	ret
1853                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1853                     ; 784 {
1854                     .text:	section	.text,new
1855  0000               _TIM5_CtrlPWMOutputs:
1859                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1861                     ; 790   if (NewState != DISABLE)
1863  0000 4d            	tnz	a
1864  0001 2706          	jreq	L5001
1865                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1867  0003 721e5315      	bset	21269,#7
1869  0007 2004          	jra	L7001
1870  0009               L5001:
1871                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1873  0009 721f5315      	bres	21269,#7
1874  000d               L7001:
1875                     ; 798 }
1878  000d 81            	ret
1943                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1943                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1943                     ; 820 {
1944                     .text:	section	.text,new
1945  0000               _TIM5_SelectOCxM:
1947  0000 89            	pushw	x
1948       00000000      OFST:	set	0
1951                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1953                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1955                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1957  0001 9e            	ld	a,xh
1958  0002 4d            	tnz	a
1959  0003 2615          	jrne	L3401
1960                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1962  0005 7211530b      	bres	21259,#0
1963                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1965  0009 c65309        	ld	a,21257
1966  000c a48f          	and	a,#143
1967  000e c75309        	ld	21257,a
1968                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1970  0011 9f            	ld	a,xl
1971  0012 ca5309        	or	a,21257
1972  0015 c75309        	ld	21257,a
1974  0018 2014          	jra	L5401
1975  001a               L3401:
1976                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1978  001a 7219530b      	bres	21259,#4
1979                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1981  001e c6530a        	ld	a,21258
1982  0021 a48f          	and	a,#143
1983  0023 c7530a        	ld	21258,a
1984                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1986  0026 c6530a        	ld	a,21258
1987  0029 1a02          	or	a,(OFST+2,sp)
1988  002b c7530a        	ld	21258,a
1989  002e               L5401:
1990                     ; 847 }
1993  002e 85            	popw	x
1994  002f 81            	ret
2028                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2028                     ; 856 {
2029                     .text:	section	.text,new
2030  0000               _TIM5_SetCompare1:
2034                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2036  0000 9e            	ld	a,xh
2037  0001 c75311        	ld	21265,a
2038                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2040  0004 9f            	ld	a,xl
2041  0005 c75312        	ld	21266,a
2042                     ; 860 }
2045  0008 81            	ret
2079                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2079                     ; 869 {
2080                     .text:	section	.text,new
2081  0000               _TIM5_SetCompare2:
2085                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2087  0000 9e            	ld	a,xh
2088  0001 c75313        	ld	21267,a
2089                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2091  0004 9f            	ld	a,xl
2092  0005 c75314        	ld	21268,a
2093                     ; 873 }
2096  0008 81            	ret
2163                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2163                     ; 884 {
2164                     .text:	section	.text,new
2165  0000               _TIM5_ForcedOC1Config:
2167  0000 88            	push	a
2168  0001 88            	push	a
2169       00000001      OFST:	set	1
2172                     ; 885   uint8_t tmpccmr1 = 0;
2174                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2176                     ; 890   tmpccmr1 = TIM5->CCMR1;
2178  0002 c65309        	ld	a,21257
2179  0005 6b01          	ld	(OFST+0,sp),a
2180                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2182  0007 7b01          	ld	a,(OFST+0,sp)
2183  0009 a48f          	and	a,#143
2184  000b 6b01          	ld	(OFST+0,sp),a
2185                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2187  000d 7b01          	ld	a,(OFST+0,sp)
2188  000f 1a02          	or	a,(OFST+1,sp)
2189  0011 6b01          	ld	(OFST+0,sp),a
2190                     ; 898   TIM5->CCMR1 = tmpccmr1;
2192  0013 7b01          	ld	a,(OFST+0,sp)
2193  0015 c75309        	ld	21257,a
2194                     ; 899 }
2197  0018 85            	popw	x
2198  0019 81            	ret
2243                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2243                     ; 910 {
2244                     .text:	section	.text,new
2245  0000               _TIM5_ForcedOC2Config:
2247  0000 88            	push	a
2248  0001 88            	push	a
2249       00000001      OFST:	set	1
2252                     ; 911   uint8_t tmpccmr2 = 0;
2254                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2256                     ; 916   tmpccmr2 = TIM5->CCMR2;
2258  0002 c6530a        	ld	a,21258
2259  0005 6b01          	ld	(OFST+0,sp),a
2260                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2262  0007 7b01          	ld	a,(OFST+0,sp)
2263  0009 a48f          	and	a,#143
2264  000b 6b01          	ld	(OFST+0,sp),a
2265                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2267  000d 7b01          	ld	a,(OFST+0,sp)
2268  000f 1a02          	or	a,(OFST+1,sp)
2269  0011 6b01          	ld	(OFST+0,sp),a
2270                     ; 924   TIM5->CCMR2 = tmpccmr2;
2272  0013 7b01          	ld	a,(OFST+0,sp)
2273  0015 c7530a        	ld	21258,a
2274                     ; 925 }
2277  0018 85            	popw	x
2278  0019 81            	ret
2314                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2314                     ; 934 {
2315                     .text:	section	.text,new
2316  0000               _TIM5_OC1PreloadConfig:
2320                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2322                     ; 939   if (NewState != DISABLE)
2324  0000 4d            	tnz	a
2325  0001 2706          	jreq	L5711
2326                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2328  0003 72165309      	bset	21257,#3
2330  0007 2004          	jra	L7711
2331  0009               L5711:
2332                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2334  0009 72175309      	bres	21257,#3
2335  000d               L7711:
2336                     ; 947 }
2339  000d 81            	ret
2375                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2375                     ; 956 {
2376                     .text:	section	.text,new
2377  0000               _TIM5_OC2PreloadConfig:
2381                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2383                     ; 961   if (NewState != DISABLE)
2385  0000 4d            	tnz	a
2386  0001 2706          	jreq	L7121
2387                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2389  0003 7216530a      	bset	21258,#3
2391  0007 2004          	jra	L1221
2392  0009               L7121:
2393                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2395  0009 7217530a      	bres	21258,#3
2396  000d               L1221:
2397                     ; 969 }
2400  000d 81            	ret
2435                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2435                     ; 978 {
2436                     .text:	section	.text,new
2437  0000               _TIM5_OC1FastConfig:
2441                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2443                     ; 983   if (NewState != DISABLE)
2445  0000 4d            	tnz	a
2446  0001 2706          	jreq	L1421
2447                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2449  0003 72145309      	bset	21257,#2
2451  0007 2004          	jra	L3421
2452  0009               L1421:
2453                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2455  0009 72155309      	bres	21257,#2
2456  000d               L3421:
2457                     ; 991 }
2460  000d 81            	ret
2495                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2495                     ; 1001 {
2496                     .text:	section	.text,new
2497  0000               _TIM5_OC2FastConfig:
2501                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2503                     ; 1006   if (NewState != DISABLE)
2505  0000 4d            	tnz	a
2506  0001 2706          	jreq	L3621
2507                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2509  0003 7214530a      	bset	21258,#2
2511  0007 2004          	jra	L5621
2512  0009               L3621:
2513                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2515  0009 7215530a      	bres	21258,#2
2516  000d               L5621:
2517                     ; 1014 }
2520  000d 81            	ret
2556                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2556                     ; 1025 {
2557                     .text:	section	.text,new
2558  0000               _TIM5_OC1PolarityConfig:
2562                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2564                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2566  0000 a101          	cp	a,#1
2567  0002 2606          	jrne	L5031
2568                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2570  0004 7212530b      	bset	21259,#1
2572  0008 2004          	jra	L7031
2573  000a               L5031:
2574                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2576  000a 7213530b      	bres	21259,#1
2577  000e               L7031:
2578                     ; 1038 }
2581  000e 81            	ret
2617                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2617                     ; 1049 {
2618                     .text:	section	.text,new
2619  0000               _TIM5_OC2PolarityConfig:
2623                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2625                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2627  0000 a101          	cp	a,#1
2628  0002 2606          	jrne	L7231
2629                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2631  0004 721a530b      	bset	21259,#5
2633  0008 2004          	jra	L1331
2634  000a               L7231:
2635                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2637  000a 721b530b      	bres	21259,#5
2638  000e               L1331:
2639                     ; 1062 }
2642  000e 81            	ret
2687                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2687                     ; 1075                  FunctionalState NewState)
2687                     ; 1076 {
2688                     .text:	section	.text,new
2689  0000               _TIM5_CCxCmd:
2691  0000 89            	pushw	x
2692       00000000      OFST:	set	0
2695                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2697                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2699                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2701  0001 9e            	ld	a,xh
2702  0002 4d            	tnz	a
2703  0003 2610          	jrne	L5531
2704                     ; 1084     if (NewState != DISABLE)
2706  0005 9f            	ld	a,xl
2707  0006 4d            	tnz	a
2708  0007 2706          	jreq	L7531
2709                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2711  0009 7210530b      	bset	21259,#0
2713  000d 2014          	jra	L3631
2714  000f               L7531:
2715                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2717  000f 7211530b      	bres	21259,#0
2718  0013 200e          	jra	L3631
2719  0015               L5531:
2720                     ; 1097     if (NewState != DISABLE)
2722  0015 0d02          	tnz	(OFST+2,sp)
2723  0017 2706          	jreq	L5631
2724                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2726  0019 7218530b      	bset	21259,#4
2728  001d 2004          	jra	L3631
2729  001f               L5631:
2730                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2732  001f 7219530b      	bres	21259,#4
2733  0023               L3631:
2734                     ; 1106 }
2737  0023 85            	popw	x
2738  0024 81            	ret
2902                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2902                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2902                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2902                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2902                     ; 1188                  uint8_t TIM5_ICFilter)
2902                     ; 1189 {
2903                     .text:	section	.text,new
2904  0000               _TIM5_ICInit:
2906  0000 89            	pushw	x
2907       00000000      OFST:	set	0
2910                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2912                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2914  0001 9e            	ld	a,xh
2915  0002 4d            	tnz	a
2916  0003 2614          	jrne	L5641
2917                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2919  0005 7b07          	ld	a,(OFST+7,sp)
2920  0007 88            	push	a
2921  0008 7b06          	ld	a,(OFST+6,sp)
2922  000a 97            	ld	xl,a
2923  000b 7b03          	ld	a,(OFST+3,sp)
2924  000d 95            	ld	xh,a
2925  000e cd0000        	call	L3_TI1_Config
2927  0011 84            	pop	a
2928                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2930  0012 7b06          	ld	a,(OFST+6,sp)
2931  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2934  0017 2012          	jra	L7641
2935  0019               L5641:
2936                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2938  0019 7b07          	ld	a,(OFST+7,sp)
2939  001b 88            	push	a
2940  001c 7b06          	ld	a,(OFST+6,sp)
2941  001e 97            	ld	xl,a
2942  001f 7b03          	ld	a,(OFST+3,sp)
2943  0021 95            	ld	xh,a
2944  0022 cd0000        	call	L5_TI2_Config
2946  0025 84            	pop	a
2947                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2949  0026 7b06          	ld	a,(OFST+6,sp)
2950  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2952  002b               L7641:
2953                     ; 1209 }
2956  002b 85            	popw	x
2957  002c 81            	ret
3053                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3053                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3053                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3053                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3053                     ; 1239                      uint8_t TIM5_ICFilter)
3053                     ; 1240 {
3054                     .text:	section	.text,new
3055  0000               _TIM5_PWMIConfig:
3057  0000 89            	pushw	x
3058  0001 89            	pushw	x
3059       00000002      OFST:	set	2
3062                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3064                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3066                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3068                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3070  0002 9f            	ld	a,xl
3071  0003 4d            	tnz	a
3072  0004 2606          	jrne	L7351
3073                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3075  0006 a601          	ld	a,#1
3076  0008 6b01          	ld	(OFST-1,sp),a
3078  000a 2002          	jra	L1451
3079  000c               L7351:
3080                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3082  000c 0f01          	clr	(OFST-1,sp)
3083  000e               L1451:
3084                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3086  000e 7b07          	ld	a,(OFST+5,sp)
3087  0010 a101          	cp	a,#1
3088  0012 2606          	jrne	L3451
3089                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3091  0014 a602          	ld	a,#2
3092  0016 6b02          	ld	(OFST+0,sp),a
3094  0018 2004          	jra	L5451
3095  001a               L3451:
3096                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3098  001a a601          	ld	a,#1
3099  001c 6b02          	ld	(OFST+0,sp),a
3100  001e               L5451:
3101                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3103  001e 0d03          	tnz	(OFST+1,sp)
3104  0020 2626          	jrne	L7451
3105                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3105                     ; 1271                TIM5_ICFilter);
3107  0022 7b09          	ld	a,(OFST+7,sp)
3108  0024 88            	push	a
3109  0025 7b08          	ld	a,(OFST+6,sp)
3110  0027 97            	ld	xl,a
3111  0028 7b05          	ld	a,(OFST+3,sp)
3112  002a 95            	ld	xh,a
3113  002b cd0000        	call	L3_TI1_Config
3115  002e 84            	pop	a
3116                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3118  002f 7b08          	ld	a,(OFST+6,sp)
3119  0031 cd0000        	call	_TIM5_SetIC1Prescaler
3121                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3123  0034 7b09          	ld	a,(OFST+7,sp)
3124  0036 88            	push	a
3125  0037 7b03          	ld	a,(OFST+1,sp)
3126  0039 97            	ld	xl,a
3127  003a 7b02          	ld	a,(OFST+0,sp)
3128  003c 95            	ld	xh,a
3129  003d cd0000        	call	L5_TI2_Config
3131  0040 84            	pop	a
3132                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3134  0041 7b08          	ld	a,(OFST+6,sp)
3135  0043 cd0000        	call	_TIM5_SetIC2Prescaler
3138  0046 2024          	jra	L1551
3139  0048               L7451:
3140                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3140                     ; 1286                TIM5_ICFilter);
3142  0048 7b09          	ld	a,(OFST+7,sp)
3143  004a 88            	push	a
3144  004b 7b08          	ld	a,(OFST+6,sp)
3145  004d 97            	ld	xl,a
3146  004e 7b05          	ld	a,(OFST+3,sp)
3147  0050 95            	ld	xh,a
3148  0051 cd0000        	call	L5_TI2_Config
3150  0054 84            	pop	a
3151                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3153  0055 7b08          	ld	a,(OFST+6,sp)
3154  0057 cd0000        	call	_TIM5_SetIC2Prescaler
3156                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3158  005a 7b09          	ld	a,(OFST+7,sp)
3159  005c 88            	push	a
3160  005d 7b03          	ld	a,(OFST+1,sp)
3161  005f 97            	ld	xl,a
3162  0060 7b02          	ld	a,(OFST+0,sp)
3163  0062 95            	ld	xh,a
3164  0063 cd0000        	call	L3_TI1_Config
3166  0066 84            	pop	a
3167                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3169  0067 7b08          	ld	a,(OFST+6,sp)
3170  0069 cd0000        	call	_TIM5_SetIC1Prescaler
3172  006c               L1551:
3173                     ; 1297 }
3176  006c 5b04          	addw	sp,#4
3177  006e 81            	ret
3229                     ; 1304 uint16_t TIM5_GetCapture1(void)
3229                     ; 1305 {
3230                     .text:	section	.text,new
3231  0000               _TIM5_GetCapture1:
3233  0000 5204          	subw	sp,#4
3234       00000004      OFST:	set	4
3237                     ; 1306   uint16_t tmpccr1 = 0;
3239                     ; 1309   tmpccr1h = TIM5->CCR1H;
3241  0002 c65311        	ld	a,21265
3242  0005 6b02          	ld	(OFST-2,sp),a
3243                     ; 1310   tmpccr1l = TIM5->CCR1L;
3245  0007 c65312        	ld	a,21266
3246  000a 6b01          	ld	(OFST-3,sp),a
3247                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3249  000c 7b01          	ld	a,(OFST-3,sp)
3250  000e 5f            	clrw	x
3251  000f 97            	ld	xl,a
3252  0010 1f03          	ldw	(OFST-1,sp),x
3253                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3255  0012 7b02          	ld	a,(OFST-2,sp)
3256  0014 5f            	clrw	x
3257  0015 97            	ld	xl,a
3258  0016 4f            	clr	a
3259  0017 02            	rlwa	x,a
3260  0018 01            	rrwa	x,a
3261  0019 1a04          	or	a,(OFST+0,sp)
3262  001b 01            	rrwa	x,a
3263  001c 1a03          	or	a,(OFST-1,sp)
3264  001e 01            	rrwa	x,a
3265  001f 1f03          	ldw	(OFST-1,sp),x
3266                     ; 1315   return ((uint16_t)tmpccr1);
3268  0021 1e03          	ldw	x,(OFST-1,sp)
3271  0023 5b04          	addw	sp,#4
3272  0025 81            	ret
3324                     ; 1323 uint16_t TIM5_GetCapture2(void)
3324                     ; 1324 {
3325                     .text:	section	.text,new
3326  0000               _TIM5_GetCapture2:
3328  0000 5204          	subw	sp,#4
3329       00000004      OFST:	set	4
3332                     ; 1325   uint16_t tmpccr2 = 0;
3334                     ; 1328   tmpccr2h = TIM5->CCR2H;
3336  0002 c65313        	ld	a,21267
3337  0005 6b02          	ld	(OFST-2,sp),a
3338                     ; 1329   tmpccr2l = TIM5->CCR2L;
3340  0007 c65314        	ld	a,21268
3341  000a 6b01          	ld	(OFST-3,sp),a
3342                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3344  000c 7b01          	ld	a,(OFST-3,sp)
3345  000e 5f            	clrw	x
3346  000f 97            	ld	xl,a
3347  0010 1f03          	ldw	(OFST-1,sp),x
3348                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3350  0012 7b02          	ld	a,(OFST-2,sp)
3351  0014 5f            	clrw	x
3352  0015 97            	ld	xl,a
3353  0016 4f            	clr	a
3354  0017 02            	rlwa	x,a
3355  0018 01            	rrwa	x,a
3356  0019 1a04          	or	a,(OFST+0,sp)
3357  001b 01            	rrwa	x,a
3358  001c 1a03          	or	a,(OFST-1,sp)
3359  001e 01            	rrwa	x,a
3360  001f 1f03          	ldw	(OFST-1,sp),x
3361                     ; 1334   return ((uint16_t)tmpccr2);
3363  0021 1e03          	ldw	x,(OFST-1,sp)
3366  0023 5b04          	addw	sp,#4
3367  0025 81            	ret
3412                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3412                     ; 1348 {
3413                     .text:	section	.text,new
3414  0000               _TIM5_SetIC1Prescaler:
3416  0000 88            	push	a
3417  0001 88            	push	a
3418       00000001      OFST:	set	1
3421                     ; 1349   uint8_t tmpccmr1 = 0;
3423                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3425                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3427  0002 c65309        	ld	a,21257
3428  0005 6b01          	ld	(OFST+0,sp),a
3429                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3431  0007 7b01          	ld	a,(OFST+0,sp)
3432  0009 a4f3          	and	a,#243
3433  000b 6b01          	ld	(OFST+0,sp),a
3434                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3436  000d 7b01          	ld	a,(OFST+0,sp)
3437  000f 1a02          	or	a,(OFST+1,sp)
3438  0011 6b01          	ld	(OFST+0,sp),a
3439                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3441  0013 7b01          	ld	a,(OFST+0,sp)
3442  0015 c75309        	ld	21257,a
3443                     ; 1363 }
3446  0018 85            	popw	x
3447  0019 81            	ret
3492                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3492                     ; 1376 {
3493                     .text:	section	.text,new
3494  0000               _TIM5_SetIC2Prescaler:
3496  0000 88            	push	a
3497  0001 88            	push	a
3498       00000001      OFST:	set	1
3501                     ; 1377   uint8_t tmpccmr2 = 0;
3503                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3505                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3507  0002 c6530a        	ld	a,21258
3508  0005 6b01          	ld	(OFST+0,sp),a
3509                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3511  0007 7b01          	ld	a,(OFST+0,sp)
3512  0009 a4f3          	and	a,#243
3513  000b 6b01          	ld	(OFST+0,sp),a
3514                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3516  000d 7b01          	ld	a,(OFST+0,sp)
3517  000f 1a02          	or	a,(OFST+1,sp)
3518  0011 6b01          	ld	(OFST+0,sp),a
3519                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3521  0013 7b01          	ld	a,(OFST+0,sp)
3522  0015 c7530a        	ld	21258,a
3523                     ; 1391 }
3526  0018 85            	popw	x
3527  0019 81            	ret
3613                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3613                     ; 1423 {
3614                     .text:	section	.text,new
3615  0000               _TIM5_ITConfig:
3617  0000 89            	pushw	x
3618       00000000      OFST:	set	0
3621                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3623                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3625                     ; 1428   if (NewState != DISABLE)
3627  0001 9f            	ld	a,xl
3628  0002 4d            	tnz	a
3629  0003 2709          	jreq	L3371
3630                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3632  0005 9e            	ld	a,xh
3633  0006 ca5305        	or	a,21253
3634  0009 c75305        	ld	21253,a
3636  000c 2009          	jra	L5371
3637  000e               L3371:
3638                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3640  000e 7b01          	ld	a,(OFST+1,sp)
3641  0010 43            	cpl	a
3642  0011 c45305        	and	a,21253
3643  0014 c75305        	ld	21253,a
3644  0017               L5371:
3645                     ; 1438 }
3648  0017 85            	popw	x
3649  0018 81            	ret
3730                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3730                     ; 1452 {
3731                     .text:	section	.text,new
3732  0000               _TIM5_GenerateEvent:
3736                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3738                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3740  0000 ca5308        	or	a,21256
3741  0003 c75308        	ld	21256,a
3742                     ; 1458 }
3745  0006 81            	ret
3884                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3884                     ; 1474 {
3885                     .text:	section	.text,new
3886  0000               _TIM5_GetFlagStatus:
3888  0000 89            	pushw	x
3889  0001 89            	pushw	x
3890       00000002      OFST:	set	2
3893                     ; 1475   FlagStatus bitstatus = RESET;
3895                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3899                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3901                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3903  0002 9f            	ld	a,xl
3904  0003 c45306        	and	a,21254
3905  0006 6b01          	ld	(OFST-1,sp),a
3906                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3908  0008 c65307        	ld	a,21255
3909  000b 1403          	and	a,(OFST+1,sp)
3910  000d 6b02          	ld	(OFST+0,sp),a
3911                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3913  000f 7b01          	ld	a,(OFST-1,sp)
3914  0011 1a02          	or	a,(OFST+0,sp)
3915  0013 2706          	jreq	L7502
3916                     ; 1486     bitstatus = SET;
3918  0015 a601          	ld	a,#1
3919  0017 6b02          	ld	(OFST+0,sp),a
3921  0019 2002          	jra	L1602
3922  001b               L7502:
3923                     ; 1490     bitstatus = RESET;
3925  001b 0f02          	clr	(OFST+0,sp)
3926  001d               L1602:
3927                     ; 1492   return ((FlagStatus)bitstatus);
3929  001d 7b02          	ld	a,(OFST+0,sp)
3932  001f 5b04          	addw	sp,#4
3933  0021 81            	ret
3968                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3968                     ; 1507 {
3969                     .text:	section	.text,new
3970  0000               _TIM5_ClearFlag:
3972  0000 89            	pushw	x
3973       00000000      OFST:	set	0
3976                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3978                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3980  0001 9f            	ld	a,xl
3981  0002 43            	cpl	a
3982  0003 c75306        	ld	21254,a
3983                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3985  0006 7b01          	ld	a,(OFST+1,sp)
3986  0008 43            	cpl	a
3987  0009 c75307        	ld	21255,a
3988                     ; 1513 }
3991  000c 85            	popw	x
3992  000d 81            	ret
4056                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4056                     ; 1527 {
4057                     .text:	section	.text,new
4058  0000               _TIM5_GetITStatus:
4060  0000 88            	push	a
4061  0001 89            	pushw	x
4062       00000002      OFST:	set	2
4065                     ; 1528   ITStatus bitstatus = RESET;
4067                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4071                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4073                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4075  0002 c45306        	and	a,21254
4076  0005 6b01          	ld	(OFST-1,sp),a
4077                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4079  0007 c65305        	ld	a,21253
4080  000a 1403          	and	a,(OFST+1,sp)
4081  000c 6b02          	ld	(OFST+0,sp),a
4082                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4084  000e 0d01          	tnz	(OFST-1,sp)
4085  0010 270a          	jreq	L3312
4087  0012 0d02          	tnz	(OFST+0,sp)
4088  0014 2706          	jreq	L3312
4089                     ; 1541     bitstatus = (ITStatus)SET;
4091  0016 a601          	ld	a,#1
4092  0018 6b02          	ld	(OFST+0,sp),a
4094  001a 2002          	jra	L5312
4095  001c               L3312:
4096                     ; 1545     bitstatus = (ITStatus)RESET;
4098  001c 0f02          	clr	(OFST+0,sp)
4099  001e               L5312:
4100                     ; 1547   return ((ITStatus)bitstatus);
4102  001e 7b02          	ld	a,(OFST+0,sp)
4105  0020 5b03          	addw	sp,#3
4106  0022 81            	ret
4142                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4142                     ; 1562 {
4143                     .text:	section	.text,new
4144  0000               _TIM5_ClearITPendingBit:
4148                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4150                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4152  0000 43            	cpl	a
4153  0001 c75306        	ld	21254,a
4154                     ; 1568 }
4157  0004 81            	ret
4230                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4230                     ; 1582 {
4231                     .text:	section	.text,new
4232  0000               _TIM5_DMACmd:
4234  0000 89            	pushw	x
4235       00000000      OFST:	set	0
4238                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4240                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4242                     ; 1587   if (NewState != DISABLE)
4244  0001 9f            	ld	a,xl
4245  0002 4d            	tnz	a
4246  0003 2709          	jreq	L1122
4247                     ; 1590     TIM5->DER |= TIM5_DMASource;
4249  0005 9e            	ld	a,xh
4250  0006 ca5304        	or	a,21252
4251  0009 c75304        	ld	21252,a
4253  000c 2009          	jra	L3122
4254  000e               L1122:
4255                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4257  000e 7b01          	ld	a,(OFST+1,sp)
4258  0010 43            	cpl	a
4259  0011 c45304        	and	a,21252
4260  0014 c75304        	ld	21252,a
4261  0017               L3122:
4262                     ; 1597 }
4265  0017 85            	popw	x
4266  0018 81            	ret
4301                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4301                     ; 1606 {
4302                     .text:	section	.text,new
4303  0000               _TIM5_SelectCCDMA:
4307                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4309                     ; 1610   if (NewState != DISABLE)
4311  0000 4d            	tnz	a
4312  0001 2706          	jreq	L3322
4313                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4315  0003 72165301      	bset	21249,#3
4317  0007 2004          	jra	L5322
4318  0009               L3322:
4319                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4321  0009 72175301      	bres	21249,#3
4322  000d               L5322:
4323                     ; 1620 }
4326  000d 81            	ret
4350                     ; 1644 void TIM5_InternalClockConfig(void)
4350                     ; 1645 {
4351                     .text:	section	.text,new
4352  0000               _TIM5_InternalClockConfig:
4356                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4358  0000 c65302        	ld	a,21250
4359  0003 a4f8          	and	a,#248
4360  0005 c75302        	ld	21250,a
4361                     ; 1648 }
4364  0008 81            	ret
4453                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4453                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4453                     ; 1667                                  uint8_t ICFilter)
4453                     ; 1668 {
4454                     .text:	section	.text,new
4455  0000               _TIM5_TIxExternalClockConfig:
4457  0000 89            	pushw	x
4458       00000000      OFST:	set	0
4461                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4463                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4465                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4467                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4469  0001 9e            	ld	a,xh
4470  0002 a160          	cp	a,#96
4471  0004 260f          	jrne	L7032
4472                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4474  0006 7b05          	ld	a,(OFST+5,sp)
4475  0008 88            	push	a
4476  0009 ae0001        	ldw	x,#1
4477  000c 7b03          	ld	a,(OFST+3,sp)
4478  000e 95            	ld	xh,a
4479  000f cd0000        	call	L5_TI2_Config
4481  0012 84            	pop	a
4483  0013 200d          	jra	L1132
4484  0015               L7032:
4485                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4487  0015 7b05          	ld	a,(OFST+5,sp)
4488  0017 88            	push	a
4489  0018 ae0001        	ldw	x,#1
4490  001b 7b03          	ld	a,(OFST+3,sp)
4491  001d 95            	ld	xh,a
4492  001e cd0000        	call	L3_TI1_Config
4494  0021 84            	pop	a
4495  0022               L1132:
4496                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4498  0022 7b01          	ld	a,(OFST+1,sp)
4499  0024 cd0000        	call	_TIM5_SelectInputTrigger
4501                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4503  0027 c65302        	ld	a,21250
4504  002a aa07          	or	a,#7
4505  002c c75302        	ld	21250,a
4506                     ; 1689 }
4509  002f 85            	popw	x
4510  0030 81            	ret
4627                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4627                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4627                     ; 1709                               uint8_t ExtTRGFilter)
4627                     ; 1710 {
4628                     .text:	section	.text,new
4629  0000               _TIM5_ETRClockMode1Config:
4631  0000 89            	pushw	x
4632       00000000      OFST:	set	0
4635                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4637  0001 7b05          	ld	a,(OFST+5,sp)
4638  0003 88            	push	a
4639  0004 9f            	ld	a,xl
4640  0005 97            	ld	xl,a
4641  0006 7b02          	ld	a,(OFST+2,sp)
4642  0008 95            	ld	xh,a
4643  0009 cd0000        	call	_TIM5_ETRConfig
4645  000c 84            	pop	a
4646                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4648  000d c65302        	ld	a,21250
4649  0010 a4f8          	and	a,#248
4650  0012 c75302        	ld	21250,a
4651                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4653  0015 c65302        	ld	a,21250
4654  0018 aa07          	or	a,#7
4655  001a c75302        	ld	21250,a
4656                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4658  001d c65302        	ld	a,21250
4659  0020 a48f          	and	a,#143
4660  0022 c75302        	ld	21250,a
4661                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4663  0025 c65302        	ld	a,21250
4664  0028 aa70          	or	a,#112
4665  002a c75302        	ld	21250,a
4666                     ; 1721 }
4669  002d 85            	popw	x
4670  002e 81            	ret
4728                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4728                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4728                     ; 1741                               uint8_t ExtTRGFilter)
4728                     ; 1742 {
4729                     .text:	section	.text,new
4730  0000               _TIM5_ETRClockMode2Config:
4732  0000 89            	pushw	x
4733       00000000      OFST:	set	0
4736                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4738  0001 7b05          	ld	a,(OFST+5,sp)
4739  0003 88            	push	a
4740  0004 9f            	ld	a,xl
4741  0005 97            	ld	xl,a
4742  0006 7b02          	ld	a,(OFST+2,sp)
4743  0008 95            	ld	xh,a
4744  0009 cd0000        	call	_TIM5_ETRConfig
4746  000c 84            	pop	a
4747                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4749  000d 721c5303      	bset	21251,#6
4750                     ; 1748 }
4753  0011 85            	popw	x
4754  0012 81            	ret
4870                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4870                     ; 1800 {
4871                     .text:	section	.text,new
4872  0000               _TIM5_SelectInputTrigger:
4874  0000 88            	push	a
4875  0001 88            	push	a
4876       00000001      OFST:	set	1
4879                     ; 1801   uint8_t tmpsmcr = 0;
4881                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4883                     ; 1806   tmpsmcr = TIM5->SMCR;
4885  0002 c65302        	ld	a,21250
4886  0005 6b01          	ld	(OFST+0,sp),a
4887                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4889  0007 7b01          	ld	a,(OFST+0,sp)
4890  0009 a48f          	and	a,#143
4891  000b 6b01          	ld	(OFST+0,sp),a
4892                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4894  000d 7b01          	ld	a,(OFST+0,sp)
4895  000f 1a02          	or	a,(OFST+1,sp)
4896  0011 6b01          	ld	(OFST+0,sp),a
4897                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4899  0013 7b01          	ld	a,(OFST+0,sp)
4900  0015 c75302        	ld	21250,a
4901                     ; 1813 }
4904  0018 85            	popw	x
4905  0019 81            	ret
5004                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
5004                     ; 1828 {
5005                     .text:	section	.text,new
5006  0000               _TIM5_SelectOutputTrigger:
5008  0000 88            	push	a
5009  0001 88            	push	a
5010       00000001      OFST:	set	1
5013                     ; 1829   uint8_t tmpcr2 = 0;
5015                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
5017                     ; 1834   tmpcr2 = TIM5->CR2;
5019  0002 c65301        	ld	a,21249
5020  0005 6b01          	ld	(OFST+0,sp),a
5021                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5023  0007 7b01          	ld	a,(OFST+0,sp)
5024  0009 a48f          	and	a,#143
5025  000b 6b01          	ld	(OFST+0,sp),a
5026                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
5028  000d 7b01          	ld	a,(OFST+0,sp)
5029  000f 1a02          	or	a,(OFST+1,sp)
5030  0011 6b01          	ld	(OFST+0,sp),a
5031                     ; 1842   TIM5->CR2 = tmpcr2;
5033  0013 7b01          	ld	a,(OFST+0,sp)
5034  0015 c75301        	ld	21249,a
5035                     ; 1843 }
5038  0018 85            	popw	x
5039  0019 81            	ret
5122                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5122                     ; 1856 {
5123                     .text:	section	.text,new
5124  0000               _TIM5_SelectSlaveMode:
5126  0000 88            	push	a
5127  0001 88            	push	a
5128       00000001      OFST:	set	1
5131                     ; 1857   uint8_t tmpsmcr = 0;
5133                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5135                     ; 1862   tmpsmcr = TIM5->SMCR;
5137  0002 c65302        	ld	a,21250
5138  0005 6b01          	ld	(OFST+0,sp),a
5139                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5141  0007 7b01          	ld	a,(OFST+0,sp)
5142  0009 a4f8          	and	a,#248
5143  000b 6b01          	ld	(OFST+0,sp),a
5144                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5146  000d 7b01          	ld	a,(OFST+0,sp)
5147  000f 1a02          	or	a,(OFST+1,sp)
5148  0011 6b01          	ld	(OFST+0,sp),a
5149                     ; 1870   TIM5->SMCR = tmpsmcr;
5151  0013 7b01          	ld	a,(OFST+0,sp)
5152  0015 c75302        	ld	21250,a
5153                     ; 1871 }
5156  0018 85            	popw	x
5157  0019 81            	ret
5193                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5193                     ; 1880 {
5194                     .text:	section	.text,new
5195  0000               _TIM5_SelectMasterSlaveMode:
5199                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5201                     ; 1885   if (NewState != DISABLE)
5203  0000 4d            	tnz	a
5204  0001 2706          	jreq	L7752
5205                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5207  0003 721e5302      	bset	21250,#7
5209  0007 2004          	jra	L1062
5210  0009               L7752:
5211                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5213  0009 721f5302      	bres	21250,#7
5214  000d               L1062:
5215                     ; 1893 }
5218  000d 81            	ret
5274                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5274                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5274                     ; 1913                     uint8_t ExtTRGFilter)
5274                     ; 1914 {
5275                     .text:	section	.text,new
5276  0000               _TIM5_ETRConfig:
5278  0000 89            	pushw	x
5279       00000000      OFST:	set	0
5282                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5284                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5286                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5288                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5288                     ; 1922                          | (uint8_t)ExtTRGFilter);
5290  0001 9f            	ld	a,xl
5291  0002 1a01          	or	a,(OFST+1,sp)
5292  0004 1a05          	or	a,(OFST+5,sp)
5293  0006 ca5303        	or	a,21251
5294  0009 c75303        	ld	21251,a
5295                     ; 1923 }
5298  000c 85            	popw	x
5299  000d 81            	ret
5412                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5412                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5412                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5412                     ; 1961 {
5413                     .text:	section	.text,new
5414  0000               _TIM5_EncoderInterfaceConfig:
5416  0000 89            	pushw	x
5417  0001 5203          	subw	sp,#3
5418       00000003      OFST:	set	3
5421                     ; 1962   uint8_t tmpsmcr = 0;
5423                     ; 1963   uint8_t tmpccmr1 = 0;
5425                     ; 1964   uint8_t tmpccmr2 = 0;
5427                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5429                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5431                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5433                     ; 1971   tmpsmcr = TIM5->SMCR;
5435  0003 c65302        	ld	a,21250
5436  0006 6b01          	ld	(OFST-2,sp),a
5437                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5439  0008 c65309        	ld	a,21257
5440  000b 6b02          	ld	(OFST-1,sp),a
5441                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5443  000d c6530a        	ld	a,21258
5444  0010 6b03          	ld	(OFST+0,sp),a
5445                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5447  0012 7b01          	ld	a,(OFST-2,sp)
5448  0014 a4f0          	and	a,#240
5449  0016 6b01          	ld	(OFST-2,sp),a
5450                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5452  0018 9e            	ld	a,xh
5453  0019 1a01          	or	a,(OFST-2,sp)
5454  001b 6b01          	ld	(OFST-2,sp),a
5455                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5457  001d 7b02          	ld	a,(OFST-1,sp)
5458  001f a4fc          	and	a,#252
5459  0021 6b02          	ld	(OFST-1,sp),a
5460                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5462  0023 7b03          	ld	a,(OFST+0,sp)
5463  0025 a4fc          	and	a,#252
5464  0027 6b03          	ld	(OFST+0,sp),a
5465                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5467  0029 7b02          	ld	a,(OFST-1,sp)
5468  002b aa01          	or	a,#1
5469  002d 6b02          	ld	(OFST-1,sp),a
5470                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5472  002f 7b03          	ld	a,(OFST+0,sp)
5473  0031 aa01          	or	a,#1
5474  0033 6b03          	ld	(OFST+0,sp),a
5475                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5477  0035 9f            	ld	a,xl
5478  0036 a101          	cp	a,#1
5479  0038 2606          	jrne	L5072
5480                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5482  003a 7212530b      	bset	21259,#1
5484  003e 2004          	jra	L7072
5485  0040               L5072:
5486                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5488  0040 7213530b      	bres	21259,#1
5489  0044               L7072:
5490                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5492  0044 7b08          	ld	a,(OFST+5,sp)
5493  0046 a101          	cp	a,#1
5494  0048 2606          	jrne	L1172
5495                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5497  004a 721a530b      	bset	21259,#5
5499  004e 2004          	jra	L3172
5500  0050               L1172:
5501                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5503  0050 721b530b      	bres	21259,#5
5504  0054               L3172:
5505                     ; 2004   TIM5->SMCR = tmpsmcr;
5507  0054 7b01          	ld	a,(OFST-2,sp)
5508  0056 c75302        	ld	21250,a
5509                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5511  0059 7b02          	ld	a,(OFST-1,sp)
5512  005b c75309        	ld	21257,a
5513                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5515  005e 7b03          	ld	a,(OFST+0,sp)
5516  0060 c7530a        	ld	21258,a
5517                     ; 2007 }
5520  0063 5b05          	addw	sp,#5
5521  0065 81            	ret
5557                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5557                     ; 2016 {
5558                     .text:	section	.text,new
5559  0000               _TIM5_SelectHallSensor:
5563                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5565                     ; 2021   if (NewState != DISABLE)
5567  0000 4d            	tnz	a
5568  0001 2706          	jreq	L3372
5569                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5571  0003 721e5301      	bset	21249,#7
5573  0007 2004          	jra	L5372
5574  0009               L3372:
5575                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5577  0009 721f5301      	bres	21249,#7
5578  000d               L5372:
5579                     ; 2029 }
5582  000d 81            	ret
5654                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5654                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5654                     ; 2052                        uint8_t TIM5_ICFilter)
5654                     ; 2053 {
5655                     .text:	section	.text,new
5656  0000               L3_TI1_Config:
5658  0000 89            	pushw	x
5659  0001 89            	pushw	x
5660       00000002      OFST:	set	2
5663                     ; 2054   uint8_t tmpccmr1 = 0;
5665                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5667  0002 9e            	ld	a,xh
5668  0003 6b01          	ld	(OFST-1,sp),a
5669                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5671  0005 c65309        	ld	a,21257
5672  0008 6b02          	ld	(OFST+0,sp),a
5673                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5675                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5677                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5679                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5681  000a 7211530b      	bres	21259,#0
5682                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5684  000e 7b02          	ld	a,(OFST+0,sp)
5685  0010 a40c          	and	a,#12
5686  0012 6b02          	ld	(OFST+0,sp),a
5687                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5689  0014 7b07          	ld	a,(OFST+5,sp)
5690  0016 97            	ld	xl,a
5691  0017 a610          	ld	a,#16
5692  0019 42            	mul	x,a
5693  001a 9f            	ld	a,xl
5694  001b 1a04          	or	a,(OFST+2,sp)
5695  001d 1a02          	or	a,(OFST+0,sp)
5696  001f 6b02          	ld	(OFST+0,sp),a
5697                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5699  0021 7b02          	ld	a,(OFST+0,sp)
5700  0023 c75309        	ld	21257,a
5701                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5703  0026 7b01          	ld	a,(OFST-1,sp)
5704  0028 a101          	cp	a,#1
5705  002a 2606          	jrne	L5772
5706                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5708  002c 7212530b      	bset	21259,#1
5710  0030 2004          	jra	L7772
5711  0032               L5772:
5712                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5714  0032 7213530b      	bres	21259,#1
5715  0036               L7772:
5716                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5718  0036 7210530b      	bset	21259,#0
5719                     ; 2084 }
5722  003a 5b04          	addw	sp,#4
5723  003c 81            	ret
5795                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5795                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5795                     ; 2103                        uint8_t TIM5_ICFilter)
5795                     ; 2104 {
5796                     .text:	section	.text,new
5797  0000               L5_TI2_Config:
5799  0000 89            	pushw	x
5800  0001 89            	pushw	x
5801       00000002      OFST:	set	2
5804                     ; 2105   uint8_t tmpccmr2 = 0;
5806                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5808  0002 9e            	ld	a,xh
5809  0003 6b01          	ld	(OFST-1,sp),a
5810                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5812                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5814                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5816                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5818  0005 c6530a        	ld	a,21258
5819  0008 6b02          	ld	(OFST+0,sp),a
5820                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5822  000a 7219530b      	bres	21259,#4
5823                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5825  000e 7b02          	ld	a,(OFST+0,sp)
5826  0010 a40c          	and	a,#12
5827  0012 6b02          	ld	(OFST+0,sp),a
5828                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5830  0014 7b07          	ld	a,(OFST+5,sp)
5831  0016 97            	ld	xl,a
5832  0017 a610          	ld	a,#16
5833  0019 42            	mul	x,a
5834  001a 9f            	ld	a,xl
5835  001b 1a04          	or	a,(OFST+2,sp)
5836  001d 1a02          	or	a,(OFST+0,sp)
5837  001f 6b02          	ld	(OFST+0,sp),a
5838                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5840  0021 7b02          	ld	a,(OFST+0,sp)
5841  0023 c7530a        	ld	21258,a
5842                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5844  0026 7b01          	ld	a,(OFST-1,sp)
5845  0028 a101          	cp	a,#1
5846  002a 2606          	jrne	L7303
5847                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5849  002c 721a530b      	bset	21259,#5
5851  0030 2004          	jra	L1403
5852  0032               L7303:
5853                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5855  0032 721b530b      	bres	21259,#5
5856  0036               L1403:
5857                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5859  0036 7218530b      	bset	21259,#4
5860                     ; 2136 }
5863  003a 5b04          	addw	sp,#4
5864  003c 81            	ret
5877                     	xdef	_TIM5_SelectHallSensor
5878                     	xdef	_TIM5_EncoderInterfaceConfig
5879                     	xdef	_TIM5_ETRConfig
5880                     	xdef	_TIM5_SelectMasterSlaveMode
5881                     	xdef	_TIM5_SelectSlaveMode
5882                     	xdef	_TIM5_SelectOutputTrigger
5883                     	xdef	_TIM5_SelectInputTrigger
5884                     	xdef	_TIM5_ETRClockMode2Config
5885                     	xdef	_TIM5_ETRClockMode1Config
5886                     	xdef	_TIM5_TIxExternalClockConfig
5887                     	xdef	_TIM5_InternalClockConfig
5888                     	xdef	_TIM5_SelectCCDMA
5889                     	xdef	_TIM5_DMACmd
5890                     	xdef	_TIM5_ClearITPendingBit
5891                     	xdef	_TIM5_GetITStatus
5892                     	xdef	_TIM5_ClearFlag
5893                     	xdef	_TIM5_GetFlagStatus
5894                     	xdef	_TIM5_GenerateEvent
5895                     	xdef	_TIM5_ITConfig
5896                     	xdef	_TIM5_SetIC2Prescaler
5897                     	xdef	_TIM5_SetIC1Prescaler
5898                     	xdef	_TIM5_GetCapture2
5899                     	xdef	_TIM5_GetCapture1
5900                     	xdef	_TIM5_PWMIConfig
5901                     	xdef	_TIM5_ICInit
5902                     	xdef	_TIM5_CCxCmd
5903                     	xdef	_TIM5_OC2PolarityConfig
5904                     	xdef	_TIM5_OC1PolarityConfig
5905                     	xdef	_TIM5_OC2FastConfig
5906                     	xdef	_TIM5_OC1FastConfig
5907                     	xdef	_TIM5_OC2PreloadConfig
5908                     	xdef	_TIM5_OC1PreloadConfig
5909                     	xdef	_TIM5_ForcedOC2Config
5910                     	xdef	_TIM5_ForcedOC1Config
5911                     	xdef	_TIM5_SetCompare2
5912                     	xdef	_TIM5_SetCompare1
5913                     	xdef	_TIM5_SelectOCxM
5914                     	xdef	_TIM5_CtrlPWMOutputs
5915                     	xdef	_TIM5_BKRConfig
5916                     	xdef	_TIM5_OC2Init
5917                     	xdef	_TIM5_OC1Init
5918                     	xdef	_TIM5_Cmd
5919                     	xdef	_TIM5_SelectOnePulseMode
5920                     	xdef	_TIM5_ARRPreloadConfig
5921                     	xdef	_TIM5_UpdateRequestConfig
5922                     	xdef	_TIM5_UpdateDisableConfig
5923                     	xdef	_TIM5_GetPrescaler
5924                     	xdef	_TIM5_GetCounter
5925                     	xdef	_TIM5_SetAutoreload
5926                     	xdef	_TIM5_SetCounter
5927                     	xdef	_TIM5_CounterModeConfig
5928                     	xdef	_TIM5_PrescalerConfig
5929                     	xdef	_TIM5_TimeBaseInit
5930                     	xdef	_TIM5_DeInit
5949                     	end
