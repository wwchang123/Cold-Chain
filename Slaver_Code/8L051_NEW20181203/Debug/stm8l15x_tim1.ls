   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 181 void TIM1_DeInit(void)
  44                     ; 182 {
  46                     .text:	section	.text,new
  47  0000               _TIM1_DeInit:
  51                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f52b0      	clr	21168
  54                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f52b1      	clr	21169
  57                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f52b2      	clr	21170
  60                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f52b3      	clr	21171
  63                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f52b5      	clr	21173
  66                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  68  0014 725f52bd      	clr	21181
  69                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  71  0018 725f52be      	clr	21182
  72                     ; 193   TIM1->CCMR1 = 0x01;
  74  001c 350152b9      	mov	21177,#1
  75                     ; 194   TIM1->CCMR2 = 0x01;
  77  0020 350152ba      	mov	21178,#1
  78                     ; 195   TIM1->CCMR3 = 0x01;
  80  0024 350152bb      	mov	21179,#1
  81                     ; 196   TIM1->CCMR4 = 0x01;
  83  0028 350152bc      	mov	21180,#1
  84                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  86  002c 725f52bd      	clr	21181
  87                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  89  0030 725f52be      	clr	21182
  90                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  92  0034 725f52b9      	clr	21177
  93                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  95  0038 725f52ba      	clr	21178
  96                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  98  003c 725f52bb      	clr	21179
  99                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 101  0040 725f52bc      	clr	21180
 102                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 104  0044 725f52bf      	clr	21183
 105                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 107  0048 725f52c0      	clr	21184
 108                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 110  004c 725f52c1      	clr	21185
 111                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 113  0050 725f52c2      	clr	21186
 114                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 116  0054 35ff52c3      	mov	21187,#255
 117                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 119  0058 35ff52c4      	mov	21188,#255
 120                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 122  005c 725f52c6      	clr	21190
 123                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 125  0060 725f52c7      	clr	21191
 126                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 128  0064 725f52c8      	clr	21192
 129                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 131  0068 725f52c9      	clr	21193
 132                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 134  006c 725f52ca      	clr	21194
 135                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 137  0070 725f52cb      	clr	21195
 138                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 140  0074 725f52cc      	clr	21196
 141                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 143  0078 725f52cd      	clr	21197
 144                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 146  007c 725f52d0      	clr	21200
 147                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 149  0080 350152b8      	mov	21176,#1
 150                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 152  0084 725f52cf      	clr	21199
 153                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 155  0088 725f52ce      	clr	21198
 156                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 158  008c 725f52c5      	clr	21189
 159                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 161  0090 725f52b6      	clr	21174
 162                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 164  0094 725f52b7      	clr	21175
 165                     ; 225 }
 168  0098 81            	ret
 277                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 243                        uint16_t TIM1_Period,
 277                     ; 244                        uint8_t TIM1_RepetitionCounter)
 277                     ; 245 {
 278                     .text:	section	.text,new
 279  0000               _TIM1_TimeBaseInit:
 281  0000 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 287                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 289  0001 7b06          	ld	a,(OFST+6,sp)
 290  0003 c752c3        	ld	21187,a
 291                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 293  0006 7b07          	ld	a,(OFST+7,sp)
 294  0008 c752c4        	ld	21188,a
 295                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 297  000b 9e            	ld	a,xh
 298  000c c752c1        	ld	21185,a
 299                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 301  000f 9f            	ld	a,xl
 302  0010 c752c2        	ld	21186,a
 303                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 303                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 305  0013 c652b0        	ld	a,21168
 306  0016 a48f          	and	a,#143
 307  0018 1a05          	or	a,(OFST+5,sp)
 308  001a c752b0        	ld	21168,a
 309                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 311  001d 7b08          	ld	a,(OFST+8,sp)
 312  001f c752c5        	ld	21189,a
 313                     ; 265 }
 316  0022 85            	popw	x
 317  0023 81            	ret
 384                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 384                     ; 280 {
 385                     .text:	section	.text,new
 386  0000               _TIM1_PrescalerConfig:
 388  0000 89            	pushw	x
 389       00000000      OFST:	set	0
 392                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 394                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 396  0001 9e            	ld	a,xh
 397  0002 c752c1        	ld	21185,a
 398                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 400  0005 9f            	ld	a,xl
 401  0006 c752c2        	ld	21186,a
 402                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 404  0009 7b05          	ld	a,(OFST+5,sp)
 405  000b c752b8        	ld	21176,a
 406                     ; 290 }
 409  000e 85            	popw	x
 410  000f 81            	ret
 446                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 446                     ; 304 {
 447                     .text:	section	.text,new
 448  0000               _TIM1_CounterModeConfig:
 450  0000 88            	push	a
 451       00000000      OFST:	set	0
 454                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 456                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 456                     ; 311                         | (uint8_t)TIM1_CounterMode);
 458  0001 c652b0        	ld	a,21168
 459  0004 a48f          	and	a,#143
 460  0006 1a01          	or	a,(OFST+1,sp)
 461  0008 c752b0        	ld	21168,a
 462                     ; 312 }
 465  000b 84            	pop	a
 466  000c 81            	ret
 500                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 500                     ; 321 {
 501                     .text:	section	.text,new
 502  0000               _TIM1_SetCounter:
 506                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 508  0000 9e            	ld	a,xh
 509  0001 c752bf        	ld	21183,a
 510                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 512  0004 9f            	ld	a,xl
 513  0005 c752c0        	ld	21184,a
 514                     ; 325 }
 517  0008 81            	ret
 551                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 551                     ; 334 {
 552                     .text:	section	.text,new
 553  0000               _TIM1_SetAutoreload:
 557                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 559  0000 9e            	ld	a,xh
 560  0001 c752c3        	ld	21187,a
 561                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 563  0004 9f            	ld	a,xl
 564  0005 c752c4        	ld	21188,a
 565                     ; 338 }
 568  0008 81            	ret
 620                     ; 345 uint16_t TIM1_GetCounter(void)
 620                     ; 346 {
 621                     .text:	section	.text,new
 622  0000               _TIM1_GetCounter:
 624  0000 5204          	subw	sp,#4
 625       00000004      OFST:	set	4
 628                     ; 348   uint16_t tmpcntr = 0;
 630                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 634                     ; 351   tmpcntrh = TIM1->CNTRH;
 636  0002 c652bf        	ld	a,21183
 637  0005 6b02          	ld	(OFST-2,sp),a
 638                     ; 352   tmpcntrl = TIM1->CNTRL;
 640  0007 c652c0        	ld	a,21184
 641  000a 6b01          	ld	(OFST-3,sp),a
 642                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 644  000c 7b01          	ld	a,(OFST-3,sp)
 645  000e 5f            	clrw	x
 646  000f 97            	ld	xl,a
 647  0010 1f03          	ldw	(OFST-1,sp),x
 648                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 650  0012 7b02          	ld	a,(OFST-2,sp)
 651  0014 5f            	clrw	x
 652  0015 97            	ld	xl,a
 653  0016 4f            	clr	a
 654  0017 02            	rlwa	x,a
 655  0018 01            	rrwa	x,a
 656  0019 1a04          	or	a,(OFST+0,sp)
 657  001b 01            	rrwa	x,a
 658  001c 1a03          	or	a,(OFST-1,sp)
 659  001e 01            	rrwa	x,a
 660  001f 1f03          	ldw	(OFST-1,sp),x
 661                     ; 358   return (uint16_t)tmpcntr;
 663  0021 1e03          	ldw	x,(OFST-1,sp)
 666  0023 5b04          	addw	sp,#4
 667  0025 81            	ret
 701                     ; 366 uint16_t TIM1_GetPrescaler(void)
 701                     ; 367 {
 702                     .text:	section	.text,new
 703  0000               _TIM1_GetPrescaler:
 705  0000 89            	pushw	x
 706       00000002      OFST:	set	2
 709                     ; 368   uint16_t tmpreg = 0;
 711                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 713  0001 c652c1        	ld	a,21185
 714  0004 5f            	clrw	x
 715  0005 97            	ld	xl,a
 716  0006 4f            	clr	a
 717  0007 02            	rlwa	x,a
 718  0008 1f01          	ldw	(OFST-1,sp),x
 719                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 721  000a c652c2        	ld	a,21186
 722  000d 5f            	clrw	x
 723  000e 97            	ld	xl,a
 724  000f 01            	rrwa	x,a
 725  0010 1a02          	or	a,(OFST+0,sp)
 726  0012 01            	rrwa	x,a
 727  0013 1a01          	or	a,(OFST-1,sp)
 728  0015 01            	rrwa	x,a
 731  0016 5b02          	addw	sp,#2
 732  0018 81            	ret
 788                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 788                     ; 381 {
 789                     .text:	section	.text,new
 790  0000               _TIM1_UpdateDisableConfig:
 794                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 796                     ; 386   if (NewState != DISABLE)
 798  0000 4d            	tnz	a
 799  0001 2706          	jreq	L772
 800                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 802  0003 721252b0      	bset	21168,#1
 804  0007 2004          	jra	L103
 805  0009               L772:
 806                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 808  0009 721352b0      	bres	21168,#1
 809  000d               L103:
 810                     ; 394 }
 813  000d 81            	ret
 871                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 871                     ; 405 {
 872                     .text:	section	.text,new
 873  0000               _TIM1_UpdateRequestConfig:
 877                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 879                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 881  0000 4d            	tnz	a
 882  0001 2706          	jreq	L133
 883                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 885  0003 721452b0      	bset	21168,#2
 887  0007 2004          	jra	L333
 888  0009               L133:
 889                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 891  0009 721552b0      	bres	21168,#2
 892  000d               L333:
 893                     ; 418 }
 896  000d 81            	ret
 932                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 932                     ; 427 {
 933                     .text:	section	.text,new
 934  0000               _TIM1_ARRPreloadConfig:
 938                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 940                     ; 432   if (NewState != DISABLE)
 942  0000 4d            	tnz	a
 943  0001 2706          	jreq	L353
 944                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 946  0003 721e52b0      	bset	21168,#7
 948  0007 2004          	jra	L553
 949  0009               L353:
 950                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 952  0009 721f52b0      	bres	21168,#7
 953  000d               L553:
 954                     ; 440 }
 957  000d 81            	ret
1014                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1014                     ; 451 {
1015                     .text:	section	.text,new
1016  0000               _TIM1_SelectOnePulseMode:
1020                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1022                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1024  0000 4d            	tnz	a
1025  0001 2706          	jreq	L504
1026                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1028  0003 721652b0      	bset	21168,#3
1030  0007 2004          	jra	L704
1031  0009               L504:
1032                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1034  0009 721752b0      	bres	21168,#3
1035  000d               L704:
1036                     ; 464 }
1039  000d 81            	ret
1074                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1074                     ; 473 {
1075                     .text:	section	.text,new
1076  0000               _TIM1_Cmd:
1080                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1082                     ; 478   if (NewState != DISABLE)
1084  0000 4d            	tnz	a
1085  0001 2706          	jreq	L724
1086                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1088  0003 721052b0      	bset	21168,#0
1090  0007 2004          	jra	L134
1091  0009               L724:
1092                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1094  0009 721152b0      	bres	21168,#0
1095  000d               L134:
1096                     ; 486 }
1099  000d 81            	ret
1384                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1384                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1384                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1384                     ; 580                   uint16_t TIM1_Pulse,
1384                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1384                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1384                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1384                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1384                     ; 585 {
1385                     .text:	section	.text,new
1386  0000               _TIM1_OC1Init:
1388  0000 89            	pushw	x
1389  0001 5203          	subw	sp,#3
1390       00000003      OFST:	set	3
1393                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1395                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1397                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1399                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1401                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1403                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1405                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1407                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1407                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1409  0003 c652bd        	ld	a,21181
1410  0006 a4f0          	and	a,#240
1411  0008 c752bd        	ld	21181,a
1412                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1412                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1412                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1412                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1414  000b 7b0c          	ld	a,(OFST+9,sp)
1415  000d a408          	and	a,#8
1416  000f 6b03          	ld	(OFST+0,sp),a
1417  0011 7b0b          	ld	a,(OFST+8,sp)
1418  0013 a402          	and	a,#2
1419  0015 1a03          	or	a,(OFST+0,sp)
1420  0017 6b02          	ld	(OFST-1,sp),a
1421  0019 7b08          	ld	a,(OFST+5,sp)
1422  001b a404          	and	a,#4
1423  001d 6b01          	ld	(OFST-2,sp),a
1424  001f 9f            	ld	a,xl
1425  0020 a401          	and	a,#1
1426  0022 1a01          	or	a,(OFST-2,sp)
1427  0024 1a02          	or	a,(OFST-1,sp)
1428  0026 ca52bd        	or	a,21181
1429  0029 c752bd        	ld	21181,a
1430                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1430                     ; 608                           | (uint8_t)TIM1_OCMode);
1432  002c c652b9        	ld	a,21177
1433  002f a48f          	and	a,#143
1434  0031 1a04          	or	a,(OFST+1,sp)
1435  0033 c752b9        	ld	21177,a
1436                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1438  0036 c652d0        	ld	a,21200
1439  0039 a4fc          	and	a,#252
1440  003b c752d0        	ld	21200,a
1441                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1441                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1443  003e 7b0e          	ld	a,(OFST+11,sp)
1444  0040 a402          	and	a,#2
1445  0042 6b03          	ld	(OFST+0,sp),a
1446  0044 7b0d          	ld	a,(OFST+10,sp)
1447  0046 a401          	and	a,#1
1448  0048 1a03          	or	a,(OFST+0,sp)
1449  004a ca52d0        	or	a,21200
1450  004d c752d0        	ld	21200,a
1451                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1453  0050 7b09          	ld	a,(OFST+6,sp)
1454  0052 c752c6        	ld	21190,a
1455                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1457  0055 7b0a          	ld	a,(OFST+7,sp)
1458  0057 c752c7        	ld	21191,a
1459                     ; 619 }
1462  005a 5b05          	addw	sp,#5
1463  005c 81            	ret
1567                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1567                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1567                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1567                     ; 661                   uint16_t TIM1_Pulse,
1567                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1567                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1567                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1567                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1567                     ; 666 {
1568                     .text:	section	.text,new
1569  0000               _TIM1_OC2Init:
1571  0000 89            	pushw	x
1572  0001 5203          	subw	sp,#3
1573       00000003      OFST:	set	3
1576                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1578                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1580                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1582                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1584                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1586                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1588                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1590                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1592  0003 c652bd        	ld	a,21181
1593  0006 a40f          	and	a,#15
1594  0008 c752bd        	ld	21181,a
1595                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1595                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1597  000b 7b0c          	ld	a,(OFST+9,sp)
1598  000d a480          	and	a,#128
1599  000f 6b03          	ld	(OFST+0,sp),a
1600  0011 7b0b          	ld	a,(OFST+8,sp)
1601  0013 a420          	and	a,#32
1602  0015 1a03          	or	a,(OFST+0,sp)
1603  0017 6b02          	ld	(OFST-1,sp),a
1604  0019 7b08          	ld	a,(OFST+5,sp)
1605  001b a440          	and	a,#64
1606  001d 6b01          	ld	(OFST-2,sp),a
1607  001f 9f            	ld	a,xl
1608  0020 a410          	and	a,#16
1609  0022 1a01          	or	a,(OFST-2,sp)
1610  0024 1a02          	or	a,(OFST-1,sp)
1611  0026 ca52bd        	or	a,21181
1612  0029 c752bd        	ld	21181,a
1613                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1615  002c c652ba        	ld	a,21178
1616  002f a48f          	and	a,#143
1617  0031 1a04          	or	a,(OFST+1,sp)
1618  0033 c752ba        	ld	21178,a
1619                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1621  0036 c652d0        	ld	a,21200
1622  0039 a4f3          	and	a,#243
1623  003b c752d0        	ld	21200,a
1624                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1626  003e 7b0e          	ld	a,(OFST+11,sp)
1627  0040 a408          	and	a,#8
1628  0042 6b03          	ld	(OFST+0,sp),a
1629  0044 7b0d          	ld	a,(OFST+10,sp)
1630  0046 a404          	and	a,#4
1631  0048 1a03          	or	a,(OFST+0,sp)
1632  004a ca52d0        	or	a,21200
1633  004d c752d0        	ld	21200,a
1634                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1636  0050 7b09          	ld	a,(OFST+6,sp)
1637  0052 c752c8        	ld	21192,a
1638                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1640  0055 7b0a          	ld	a,(OFST+7,sp)
1641  0057 c752c9        	ld	21193,a
1642                     ; 696 }
1645  005a 5b05          	addw	sp,#5
1646  005c 81            	ret
1750                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1750                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1750                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1750                     ; 738                   uint16_t TIM1_Pulse,
1750                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1750                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1750                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1750                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1750                     ; 743 {
1751                     .text:	section	.text,new
1752  0000               _TIM1_OC3Init:
1754  0000 89            	pushw	x
1755  0001 5203          	subw	sp,#3
1756       00000003      OFST:	set	3
1759                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1761                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1763                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1765                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1767                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1769                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1771                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1773                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1775  0003 c652be        	ld	a,21182
1776  0006 a4f0          	and	a,#240
1777  0008 c752be        	ld	21182,a
1778                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1778                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1780  000b 7b0c          	ld	a,(OFST+9,sp)
1781  000d a408          	and	a,#8
1782  000f 6b03          	ld	(OFST+0,sp),a
1783  0011 7b0b          	ld	a,(OFST+8,sp)
1784  0013 a402          	and	a,#2
1785  0015 1a03          	or	a,(OFST+0,sp)
1786  0017 6b02          	ld	(OFST-1,sp),a
1787  0019 7b08          	ld	a,(OFST+5,sp)
1788  001b a404          	and	a,#4
1789  001d 6b01          	ld	(OFST-2,sp),a
1790  001f 9f            	ld	a,xl
1791  0020 a401          	and	a,#1
1792  0022 1a01          	or	a,(OFST-2,sp)
1793  0024 1a02          	or	a,(OFST-1,sp)
1794  0026 ca52be        	or	a,21182
1795  0029 c752be        	ld	21182,a
1796                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1798  002c c652bb        	ld	a,21179
1799  002f a48f          	and	a,#143
1800  0031 1a04          	or	a,(OFST+1,sp)
1801  0033 c752bb        	ld	21179,a
1802                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1804  0036 c652d0        	ld	a,21200
1805  0039 a4cf          	and	a,#207
1806  003b c752d0        	ld	21200,a
1807                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1809  003e 7b0e          	ld	a,(OFST+11,sp)
1810  0040 a420          	and	a,#32
1811  0042 6b03          	ld	(OFST+0,sp),a
1812  0044 7b0d          	ld	a,(OFST+10,sp)
1813  0046 a410          	and	a,#16
1814  0048 1a03          	or	a,(OFST+0,sp)
1815  004a ca52d0        	or	a,21200
1816  004d c752d0        	ld	21200,a
1817                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1819  0050 7b09          	ld	a,(OFST+6,sp)
1820  0052 c752ca        	ld	21194,a
1821                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1823  0055 7b0a          	ld	a,(OFST+7,sp)
1824  0057 c752cb        	ld	21195,a
1825                     ; 773 }
1828  005a 5b05          	addw	sp,#5
1829  005c 81            	ret
2036                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2036                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2036                     ; 805                      uint8_t TIM1_DeadTime,
2036                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2036                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2036                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2036                     ; 809 {
2037                     .text:	section	.text,new
2038  0000               _TIM1_BDTRConfig:
2040  0000 89            	pushw	x
2041  0001 88            	push	a
2042       00000001      OFST:	set	1
2045                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2047                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2049                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2051                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2053                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2055                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2057  0002 7b06          	ld	a,(OFST+5,sp)
2058  0004 c752cf        	ld	21199,a
2059                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2059                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2059                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2061  0007 7b07          	ld	a,(OFST+6,sp)
2062  0009 1a08          	or	a,(OFST+7,sp)
2063  000b 1a09          	or	a,(OFST+8,sp)
2064  000d 6b01          	ld	(OFST+0,sp),a
2065  000f 9f            	ld	a,xl
2066  0010 1a02          	or	a,(OFST+1,sp)
2067  0012 1a01          	or	a,(OFST+0,sp)
2068  0014 c752ce        	ld	21198,a
2069                     ; 826 }
2072  0017 5b03          	addw	sp,#3
2073  0019 81            	ret
2109                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2109                     ; 835 {
2110                     .text:	section	.text,new
2111  0000               _TIM1_CtrlPWMOutputs:
2115                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2117                     ; 841   if (NewState != DISABLE)
2119  0000 4d            	tnz	a
2120  0001 2706          	jreq	L5601
2121                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2123  0003 721e52ce      	bset	21198,#7
2125  0007 2004          	jra	L7601
2126  0009               L5601:
2127                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2129  0009 721f52ce      	bres	21198,#7
2130  000d               L7601:
2131                     ; 849 }
2134  000d 81            	ret
2213                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2213                     ; 872 {
2214                     .text:	section	.text,new
2215  0000               _TIM1_SelectOCxM:
2217  0000 89            	pushw	x
2218       00000000      OFST:	set	0
2221                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2223                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2225                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2227  0001 9e            	ld	a,xh
2228  0002 4d            	tnz	a
2229  0003 2610          	jrne	L7211
2230                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2232  0005 721152bd      	bres	21181,#0
2233                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2235  0009 c652b9        	ld	a,21177
2236  000c a48f          	and	a,#143
2237  000e 1a02          	or	a,(OFST+2,sp)
2238  0010 c752b9        	ld	21177,a
2240  0013 2024          	jra	L1311
2241  0015               L7211:
2242                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2244  0015 7b01          	ld	a,(OFST+1,sp)
2245  0017 a101          	cp	a,#1
2246  0019 2610          	jrne	L3311
2247                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2249  001b 721952bd      	bres	21181,#4
2250                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2252  001f c652ba        	ld	a,21178
2253  0022 a48f          	and	a,#143
2254  0024 1a02          	or	a,(OFST+2,sp)
2255  0026 c752ba        	ld	21178,a
2257  0029 200e          	jra	L1311
2258  002b               L3311:
2259                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2261  002b 721152be      	bres	21182,#0
2262                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2264  002f c652bb        	ld	a,21179
2265  0032 a48f          	and	a,#143
2266  0034 1a02          	or	a,(OFST+2,sp)
2267  0036 c752bb        	ld	21179,a
2268  0039               L1311:
2269                     ; 902 }
2272  0039 85            	popw	x
2273  003a 81            	ret
2307                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2307                     ; 911 {
2308                     .text:	section	.text,new
2309  0000               _TIM1_SetCompare1:
2313                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2315  0000 9e            	ld	a,xh
2316  0001 c752c6        	ld	21190,a
2317                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2319  0004 9f            	ld	a,xl
2320  0005 c752c7        	ld	21191,a
2321                     ; 916 }
2324  0008 81            	ret
2358                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2358                     ; 925 {
2359                     .text:	section	.text,new
2360  0000               _TIM1_SetCompare2:
2364                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2366  0000 9e            	ld	a,xh
2367  0001 c752c8        	ld	21192,a
2368                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2370  0004 9f            	ld	a,xl
2371  0005 c752c9        	ld	21193,a
2372                     ; 929 }
2375  0008 81            	ret
2409                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2409                     ; 938 {
2410                     .text:	section	.text,new
2411  0000               _TIM1_SetCompare3:
2415                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2417  0000 9e            	ld	a,xh
2418  0001 c752ca        	ld	21194,a
2419                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2421  0004 9f            	ld	a,xl
2422  0005 c752cb        	ld	21195,a
2423                     ; 942 }
2426  0008 81            	ret
2460                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2460                     ; 951 {
2461                     .text:	section	.text,new
2462  0000               _TIM1_SetCompare4:
2466                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2468  0000 9e            	ld	a,xh
2469  0001 c752cc        	ld	21196,a
2470                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2472  0004 9f            	ld	a,xl
2473  0005 c752cd        	ld	21197,a
2474                     ; 955 }
2477  0008 81            	ret
2513                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2513                     ; 964 {
2514                     .text:	section	.text,new
2515  0000               _TIM1_CCPreloadControl:
2519                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2521                     ; 969   if (NewState != DISABLE)
2523  0000 4d            	tnz	a
2524  0001 2706          	jreq	L5421
2525                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2527  0003 721052b1      	bset	21169,#0
2529  0007 2004          	jra	L7421
2530  0009               L5421:
2531                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2533  0009 721152b1      	bres	21169,#0
2534  000d               L7421:
2535                     ; 977 }
2538  000d 81            	ret
2596                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2596                     ; 988 {
2597                     .text:	section	.text,new
2598  0000               _TIM1_ForcedOC1Config:
2600  0000 88            	push	a
2601       00000000      OFST:	set	0
2604                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2606                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2608  0001 c652b9        	ld	a,21177
2609  0004 a48f          	and	a,#143
2610  0006 1a01          	or	a,(OFST+1,sp)
2611  0008 c752b9        	ld	21177,a
2612                     ; 994 }
2615  000b 84            	pop	a
2616  000c 81            	ret
2652                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2652                     ; 1005 {
2653                     .text:	section	.text,new
2654  0000               _TIM1_ForcedOC2Config:
2656  0000 88            	push	a
2657       00000000      OFST:	set	0
2660                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2662                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2664  0001 c652ba        	ld	a,21178
2665  0004 a48f          	and	a,#143
2666  0006 1a01          	or	a,(OFST+1,sp)
2667  0008 c752ba        	ld	21178,a
2668                     ; 1011 }
2671  000b 84            	pop	a
2672  000c 81            	ret
2708                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2708                     ; 1022 {
2709                     .text:	section	.text,new
2710  0000               _TIM1_ForcedOC3Config:
2712  0000 88            	push	a
2713       00000000      OFST:	set	0
2716                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2718                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2720  0001 c652bb        	ld	a,21179
2721  0004 a48f          	and	a,#143
2722  0006 1a01          	or	a,(OFST+1,sp)
2723  0008 c752bb        	ld	21179,a
2724                     ; 1028 }
2727  000b 84            	pop	a
2728  000c 81            	ret
2764                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2764                     ; 1037 {
2765                     .text:	section	.text,new
2766  0000               _TIM1_OC1PreloadConfig:
2770                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2772                     ; 1042   if (NewState != DISABLE)
2774  0000 4d            	tnz	a
2775  0001 2706          	jreq	L1531
2776                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2778  0003 721652b9      	bset	21177,#3
2780  0007 2004          	jra	L3531
2781  0009               L1531:
2782                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2784  0009 721752b9      	bres	21177,#3
2785  000d               L3531:
2786                     ; 1050 }
2789  000d 81            	ret
2825                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2825                     ; 1059 {
2826                     .text:	section	.text,new
2827  0000               _TIM1_OC2PreloadConfig:
2831                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2833                     ; 1064   if (NewState != DISABLE)
2835  0000 4d            	tnz	a
2836  0001 2706          	jreq	L3731
2837                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2839  0003 721652ba      	bset	21178,#3
2841  0007 2004          	jra	L5731
2842  0009               L3731:
2843                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2845  0009 721752ba      	bres	21178,#3
2846  000d               L5731:
2847                     ; 1072 }
2850  000d 81            	ret
2886                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2886                     ; 1081 {
2887                     .text:	section	.text,new
2888  0000               _TIM1_OC3PreloadConfig:
2892                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2894                     ; 1086   if (NewState != DISABLE)
2896  0000 4d            	tnz	a
2897  0001 2706          	jreq	L5141
2898                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2900  0003 721652bb      	bset	21179,#3
2902  0007 2004          	jra	L7141
2903  0009               L5141:
2904                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2906  0009 721752bb      	bres	21179,#3
2907  000d               L7141:
2908                     ; 1094 }
2911  000d 81            	ret
2947                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2947                     ; 1103 {
2948                     .text:	section	.text,new
2949  0000               _TIM1_OC4PreloadConfig:
2953                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2955                     ; 1108   if (NewState != DISABLE)
2957  0000 4d            	tnz	a
2958  0001 2706          	jreq	L7341
2959                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2961  0003 721652bc      	bset	21180,#3
2963  0007 2004          	jra	L1441
2964  0009               L7341:
2965                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2967  0009 721752bc      	bres	21180,#3
2968  000d               L1441:
2969                     ; 1116 }
2972  000d 81            	ret
3007                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3007                     ; 1125 {
3008                     .text:	section	.text,new
3009  0000               _TIM1_OC1FastConfig:
3013                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3015                     ; 1130   if (NewState != DISABLE)
3017  0000 4d            	tnz	a
3018  0001 2706          	jreq	L1641
3019                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3021  0003 721452b9      	bset	21177,#2
3023  0007 2004          	jra	L3641
3024  0009               L1641:
3025                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3027  0009 721552b9      	bres	21177,#2
3028  000d               L3641:
3029                     ; 1138 }
3032  000d 81            	ret
3067                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3067                     ; 1147 {
3068                     .text:	section	.text,new
3069  0000               _TIM1_OC2FastConfig:
3073                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3075                     ; 1152   if (NewState != DISABLE)
3077  0000 4d            	tnz	a
3078  0001 2706          	jreq	L3051
3079                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3081  0003 721452ba      	bset	21178,#2
3083  0007 2004          	jra	L5051
3084  0009               L3051:
3085                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3087  0009 721552ba      	bres	21178,#2
3088  000d               L5051:
3089                     ; 1160 }
3092  000d 81            	ret
3127                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3127                     ; 1169 {
3128                     .text:	section	.text,new
3129  0000               _TIM1_OC3FastConfig:
3133                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3135                     ; 1174   if (NewState != DISABLE)
3137  0000 4d            	tnz	a
3138  0001 2706          	jreq	L5251
3139                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3141  0003 721452bb      	bset	21179,#2
3143  0007 2004          	jra	L7251
3144  0009               L5251:
3145                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3147  0009 721552bb      	bres	21179,#2
3148  000d               L7251:
3149                     ; 1182 }
3152  000d 81            	ret
3187                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3187                     ; 1191 {
3188                     .text:	section	.text,new
3189  0000               _TIM1_ClearOC1Ref:
3193                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3195                     ; 1196   if (NewState != DISABLE)
3197  0000 4d            	tnz	a
3198  0001 2706          	jreq	L7451
3199                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3201  0003 721e52b9      	bset	21177,#7
3203  0007 2004          	jra	L1551
3204  0009               L7451:
3205                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3207  0009 721f52b9      	bres	21177,#7
3208  000d               L1551:
3209                     ; 1204 }
3212  000d 81            	ret
3247                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3247                     ; 1213 {
3248                     .text:	section	.text,new
3249  0000               _TIM1_ClearOC2Ref:
3253                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3255                     ; 1218   if (NewState != DISABLE)
3257  0000 4d            	tnz	a
3258  0001 2706          	jreq	L1751
3259                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3261  0003 721e52ba      	bset	21178,#7
3263  0007 2004          	jra	L3751
3264  0009               L1751:
3265                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3267  0009 721f52ba      	bres	21178,#7
3268  000d               L3751:
3269                     ; 1226 }
3272  000d 81            	ret
3307                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3307                     ; 1235 {
3308                     .text:	section	.text,new
3309  0000               _TIM1_ClearOC3Ref:
3313                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3315                     ; 1240   if (NewState != DISABLE)
3317  0000 4d            	tnz	a
3318  0001 2706          	jreq	L3161
3319                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3321  0003 721e52bb      	bset	21179,#7
3323  0007 2004          	jra	L5161
3324  0009               L3161:
3325                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3327  0009 721f52bb      	bres	21179,#7
3328  000d               L5161:
3329                     ; 1248 }
3332  000d 81            	ret
3367                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3367                     ; 1257 {
3368                     .text:	section	.text,new
3369  0000               _TIM1_ClearOC4Ref:
3373                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3375                     ; 1262   if (NewState != DISABLE)
3377  0000 4d            	tnz	a
3378  0001 2706          	jreq	L5361
3379                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3381  0003 721e52bc      	bset	21180,#7
3383  0007 2004          	jra	L7361
3384  0009               L5361:
3385                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3387  0009 721f52bc      	bres	21180,#7
3388  000d               L7361:
3389                     ; 1270 }
3392  000d 81            	ret
3428                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3428                     ; 1281 {
3429                     .text:	section	.text,new
3430  0000               _TIM1_OC1PolarityConfig:
3434                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3436                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3438  0000 4d            	tnz	a
3439  0001 2706          	jreq	L7561
3440                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3442  0003 721252bd      	bset	21181,#1
3444  0007 2004          	jra	L1661
3445  0009               L7561:
3446                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3448  0009 721352bd      	bres	21181,#1
3449  000d               L1661:
3450                     ; 1294 }
3453  000d 81            	ret
3489                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3489                     ; 1305 {
3490                     .text:	section	.text,new
3491  0000               _TIM1_OC1NPolarityConfig:
3495                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3497                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3499  0000 4d            	tnz	a
3500  0001 2706          	jreq	L1071
3501                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3503  0003 721652bd      	bset	21181,#3
3505  0007 2004          	jra	L3071
3506  0009               L1071:
3507                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3509  0009 721752bd      	bres	21181,#3
3510  000d               L3071:
3511                     ; 1318 }
3514  000d 81            	ret
3550                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3550                     ; 1329 {
3551                     .text:	section	.text,new
3552  0000               _TIM1_OC2PolarityConfig:
3556                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3558                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3560  0000 4d            	tnz	a
3561  0001 2706          	jreq	L3271
3562                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3564  0003 721a52bd      	bset	21181,#5
3566  0007 2004          	jra	L5271
3567  0009               L3271:
3568                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3570  0009 721b52bd      	bres	21181,#5
3571  000d               L5271:
3572                     ; 1342 }
3575  000d 81            	ret
3611                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3611                     ; 1353 {
3612                     .text:	section	.text,new
3613  0000               _TIM1_OC2NPolarityConfig:
3617                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3619                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3621  0000 4d            	tnz	a
3622  0001 2706          	jreq	L5471
3623                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3625  0003 721e52bd      	bset	21181,#7
3627  0007 2004          	jra	L7471
3628  0009               L5471:
3629                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3631  0009 721f52bd      	bres	21181,#7
3632  000d               L7471:
3633                     ; 1366 }
3636  000d 81            	ret
3672                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3672                     ; 1377 {
3673                     .text:	section	.text,new
3674  0000               _TIM1_OC3PolarityConfig:
3678                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3680                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3682  0000 4d            	tnz	a
3683  0001 2706          	jreq	L7671
3684                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3686  0003 721252be      	bset	21182,#1
3688  0007 2004          	jra	L1771
3689  0009               L7671:
3690                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3692  0009 721352be      	bres	21182,#1
3693  000d               L1771:
3694                     ; 1390 }
3697  000d 81            	ret
3733                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3733                     ; 1401 {
3734                     .text:	section	.text,new
3735  0000               _TIM1_OC3NPolarityConfig:
3739                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3741                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3743  0000 4d            	tnz	a
3744  0001 2706          	jreq	L1102
3745                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3747  0003 721652be      	bset	21182,#3
3749  0007 2004          	jra	L3102
3750  0009               L1102:
3751                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3753  0009 721752be      	bres	21182,#3
3754  000d               L3102:
3755                     ; 1414 }
3758  000d 81            	ret
3817                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3817                     ; 1425 {
3818                     .text:	section	.text,new
3819  0000               _TIM1_SelectOCREFClear:
3823                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3825                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3827  0000 721752b2      	bres	21170,#3
3828                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3830  0004 ca52b2        	or	a,21170
3831  0007 c752b2        	ld	21170,a
3832                     ; 1432 }
3835  000a 81            	ret
3870                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3870                     ; 1441 {
3871                     .text:	section	.text,new
3872  0000               _TIM1_SelectCOM:
3876                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3878                     ; 1446   if (NewState != DISABLE)
3880  0000 4d            	tnz	a
3881  0001 2706          	jreq	L1602
3882                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3884  0003 721452b1      	bset	21169,#2
3886  0007 2004          	jra	L3602
3887  0009               L1602:
3888                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3890  0009 721552b1      	bres	21169,#2
3891  000d               L3602:
3892                     ; 1454 }
3895  000d 81            	ret
3940                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3940                     ; 1469 {
3941                     .text:	section	.text,new
3942  0000               _TIM1_CCxCmd:
3944  0000 89            	pushw	x
3945       00000000      OFST:	set	0
3948                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3950                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3952                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3954  0001 9e            	ld	a,xh
3955  0002 4d            	tnz	a
3956  0003 2610          	jrne	L7012
3957                     ; 1477     if (NewState != DISABLE)
3959  0005 9f            	ld	a,xl
3960  0006 4d            	tnz	a
3961  0007 2706          	jreq	L1112
3962                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3964  0009 721052bd      	bset	21181,#0
3966  000d 2040          	jra	L5112
3967  000f               L1112:
3968                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3970  000f 721152bd      	bres	21181,#0
3971  0013 203a          	jra	L5112
3972  0015               L7012:
3973                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3975  0015 7b01          	ld	a,(OFST+1,sp)
3976  0017 a101          	cp	a,#1
3977  0019 2610          	jrne	L7112
3978                     ; 1489     if (NewState != DISABLE)
3980  001b 0d02          	tnz	(OFST+2,sp)
3981  001d 2706          	jreq	L1212
3982                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3984  001f 721852bd      	bset	21181,#4
3986  0023 202a          	jra	L5112
3987  0025               L1212:
3988                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3990  0025 721952bd      	bres	21181,#4
3991  0029 2024          	jra	L5112
3992  002b               L7112:
3993                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3995  002b 7b01          	ld	a,(OFST+1,sp)
3996  002d a102          	cp	a,#2
3997  002f 2610          	jrne	L7212
3998                     ; 1501     if (NewState != DISABLE)
4000  0031 0d02          	tnz	(OFST+2,sp)
4001  0033 2706          	jreq	L1312
4002                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4004  0035 721052be      	bset	21182,#0
4006  0039 2014          	jra	L5112
4007  003b               L1312:
4008                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4010  003b 721152be      	bres	21182,#0
4011  003f 200e          	jra	L5112
4012  0041               L7212:
4013                     ; 1513     if (NewState != DISABLE)
4015  0041 0d02          	tnz	(OFST+2,sp)
4016  0043 2706          	jreq	L7312
4017                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4019  0045 721852be      	bset	21182,#4
4021  0049 2004          	jra	L5112
4022  004b               L7312:
4023                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4025  004b 721952be      	bres	21182,#4
4026  004f               L5112:
4027                     ; 1522 }
4030  004f 85            	popw	x
4031  0050 81            	ret
4076                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4076                     ; 1536 {
4077                     .text:	section	.text,new
4078  0000               _TIM1_CCxNCmd:
4080  0000 89            	pushw	x
4081       00000000      OFST:	set	0
4084                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4086                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4088                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4090  0001 9e            	ld	a,xh
4091  0002 4d            	tnz	a
4092  0003 2610          	jrne	L5612
4093                     ; 1544     if (NewState != DISABLE)
4095  0005 9f            	ld	a,xl
4096  0006 4d            	tnz	a
4097  0007 2706          	jreq	L7612
4098                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4100  0009 721452bd      	bset	21181,#2
4102  000d 202a          	jra	L3712
4103  000f               L7612:
4104                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4106  000f 721552bd      	bres	21181,#2
4107  0013 2024          	jra	L3712
4108  0015               L5612:
4109                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4111  0015 7b01          	ld	a,(OFST+1,sp)
4112  0017 a101          	cp	a,#1
4113  0019 2610          	jrne	L5712
4114                     ; 1556     if (NewState != DISABLE)
4116  001b 0d02          	tnz	(OFST+2,sp)
4117  001d 2706          	jreq	L7712
4118                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4120  001f 721c52bd      	bset	21181,#6
4122  0023 2014          	jra	L3712
4123  0025               L7712:
4124                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4126  0025 721d52bd      	bres	21181,#6
4127  0029 200e          	jra	L3712
4128  002b               L5712:
4129                     ; 1568     if (NewState != DISABLE)
4131  002b 0d02          	tnz	(OFST+2,sp)
4132  002d 2706          	jreq	L5022
4133                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4135  002f 721452be      	bset	21182,#2
4137  0033 2004          	jra	L3712
4138  0035               L5022:
4139                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4141  0035 721552be      	bres	21182,#2
4142  0039               L3712:
4143                     ; 1577 }
4146  0039 85            	popw	x
4147  003a 81            	ret
4315                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4315                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4315                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4315                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4315                     ; 1668                  uint8_t TIM1_ICFilter)
4315                     ; 1669 {
4316                     .text:	section	.text,new
4317  0000               _TIM1_ICInit:
4319  0000 89            	pushw	x
4320       00000000      OFST:	set	0
4323                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4325                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4327                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4329                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4331                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4333                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4335  0001 9e            	ld	a,xh
4336  0002 4d            	tnz	a
4337  0003 2614          	jrne	L5032
4338                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4340  0005 7b07          	ld	a,(OFST+7,sp)
4341  0007 88            	push	a
4342  0008 7b06          	ld	a,(OFST+6,sp)
4343  000a 97            	ld	xl,a
4344  000b 7b03          	ld	a,(OFST+3,sp)
4345  000d 95            	ld	xh,a
4346  000e cd0000        	call	L3_TI1_Config
4348  0011 84            	pop	a
4349                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4351  0012 7b06          	ld	a,(OFST+6,sp)
4352  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4355  0017 2046          	jra	L7032
4356  0019               L5032:
4357                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4359  0019 7b01          	ld	a,(OFST+1,sp)
4360  001b a101          	cp	a,#1
4361  001d 2614          	jrne	L1132
4362                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4364  001f 7b07          	ld	a,(OFST+7,sp)
4365  0021 88            	push	a
4366  0022 7b06          	ld	a,(OFST+6,sp)
4367  0024 97            	ld	xl,a
4368  0025 7b03          	ld	a,(OFST+3,sp)
4369  0027 95            	ld	xh,a
4370  0028 cd0000        	call	L5_TI2_Config
4372  002b 84            	pop	a
4373                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4375  002c 7b06          	ld	a,(OFST+6,sp)
4376  002e cd0000        	call	_TIM1_SetIC2Prescaler
4379  0031 202c          	jra	L7032
4380  0033               L1132:
4381                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4383  0033 7b01          	ld	a,(OFST+1,sp)
4384  0035 a102          	cp	a,#2
4385  0037 2614          	jrne	L5132
4386                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4388  0039 7b07          	ld	a,(OFST+7,sp)
4389  003b 88            	push	a
4390  003c 7b06          	ld	a,(OFST+6,sp)
4391  003e 97            	ld	xl,a
4392  003f 7b03          	ld	a,(OFST+3,sp)
4393  0041 95            	ld	xh,a
4394  0042 cd0000        	call	L7_TI3_Config
4396  0045 84            	pop	a
4397                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4399  0046 7b06          	ld	a,(OFST+6,sp)
4400  0048 cd0000        	call	_TIM1_SetIC3Prescaler
4403  004b 2012          	jra	L7032
4404  004d               L5132:
4405                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4407  004d 7b07          	ld	a,(OFST+7,sp)
4408  004f 88            	push	a
4409  0050 7b06          	ld	a,(OFST+6,sp)
4410  0052 97            	ld	xl,a
4411  0053 7b03          	ld	a,(OFST+3,sp)
4412  0055 95            	ld	xh,a
4413  0056 cd0000        	call	L11_TI4_Config
4415  0059 84            	pop	a
4416                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4418  005a 7b06          	ld	a,(OFST+6,sp)
4419  005c cd0000        	call	_TIM1_SetIC4Prescaler
4421  005f               L7032:
4422                     ; 1706 }
4425  005f 85            	popw	x
4426  0060 81            	ret
4524                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4524                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4524                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4524                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4524                     ; 1737                      uint8_t TIM1_ICFilter)
4524                     ; 1738 {
4525                     .text:	section	.text,new
4526  0000               _TIM1_PWMIConfig:
4528  0000 89            	pushw	x
4529  0001 89            	pushw	x
4530       00000002      OFST:	set	2
4533                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4535                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4537                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4539                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4541                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4543                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4545                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4547  0002 9f            	ld	a,xl
4548  0003 a101          	cp	a,#1
4549  0005 2706          	jreq	L7632
4550                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4552  0007 a601          	ld	a,#1
4553  0009 6b01          	ld	(OFST-1,sp),a
4555  000b 2002          	jra	L1732
4556  000d               L7632:
4557                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4559  000d 0f01          	clr	(OFST-1,sp)
4560  000f               L1732:
4561                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4563  000f 7b07          	ld	a,(OFST+5,sp)
4564  0011 a101          	cp	a,#1
4565  0013 2606          	jrne	L3732
4566                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4568  0015 a602          	ld	a,#2
4569  0017 6b02          	ld	(OFST+0,sp),a
4571  0019 2004          	jra	L5732
4572  001b               L3732:
4573                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4575  001b a601          	ld	a,#1
4576  001d 6b02          	ld	(OFST+0,sp),a
4577  001f               L5732:
4578                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4580  001f 0d03          	tnz	(OFST+1,sp)
4581  0021 2626          	jrne	L7732
4582                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4584  0023 7b09          	ld	a,(OFST+7,sp)
4585  0025 88            	push	a
4586  0026 7b08          	ld	a,(OFST+6,sp)
4587  0028 97            	ld	xl,a
4588  0029 7b05          	ld	a,(OFST+3,sp)
4589  002b 95            	ld	xh,a
4590  002c cd0000        	call	L3_TI1_Config
4592  002f 84            	pop	a
4593                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4595  0030 7b08          	ld	a,(OFST+6,sp)
4596  0032 cd0000        	call	_TIM1_SetIC1Prescaler
4598                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4600  0035 7b09          	ld	a,(OFST+7,sp)
4601  0037 88            	push	a
4602  0038 7b03          	ld	a,(OFST+1,sp)
4603  003a 97            	ld	xl,a
4604  003b 7b02          	ld	a,(OFST+0,sp)
4605  003d 95            	ld	xh,a
4606  003e cd0000        	call	L5_TI2_Config
4608  0041 84            	pop	a
4609                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4611  0042 7b08          	ld	a,(OFST+6,sp)
4612  0044 cd0000        	call	_TIM1_SetIC2Prescaler
4615  0047 2024          	jra	L1042
4616  0049               L7732:
4617                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4619  0049 7b09          	ld	a,(OFST+7,sp)
4620  004b 88            	push	a
4621  004c 7b08          	ld	a,(OFST+6,sp)
4622  004e 97            	ld	xl,a
4623  004f 7b05          	ld	a,(OFST+3,sp)
4624  0051 95            	ld	xh,a
4625  0052 cd0000        	call	L5_TI2_Config
4627  0055 84            	pop	a
4628                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4630  0056 7b08          	ld	a,(OFST+6,sp)
4631  0058 cd0000        	call	_TIM1_SetIC2Prescaler
4633                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4635  005b 7b09          	ld	a,(OFST+7,sp)
4636  005d 88            	push	a
4637  005e 7b03          	ld	a,(OFST+1,sp)
4638  0060 97            	ld	xl,a
4639  0061 7b02          	ld	a,(OFST+0,sp)
4640  0063 95            	ld	xh,a
4641  0064 cd0000        	call	L3_TI1_Config
4643  0067 84            	pop	a
4644                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4646  0068 7b08          	ld	a,(OFST+6,sp)
4647  006a cd0000        	call	_TIM1_SetIC1Prescaler
4649  006d               L1042:
4650                     ; 1796 }
4653  006d 5b04          	addw	sp,#4
4654  006f 81            	ret
4706                     ; 1803 uint16_t TIM1_GetCapture1(void)
4706                     ; 1804 {
4707                     .text:	section	.text,new
4708  0000               _TIM1_GetCapture1:
4710  0000 5204          	subw	sp,#4
4711       00000004      OFST:	set	4
4714                     ; 1807   uint16_t tmpccr1 = 0;
4716                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4720                     ; 1810   tmpccr1h = TIM1->CCR1H;
4722  0002 c652c6        	ld	a,21190
4723  0005 6b02          	ld	(OFST-2,sp),a
4724                     ; 1811   tmpccr1l = TIM1->CCR1L;
4726  0007 c652c7        	ld	a,21191
4727  000a 6b01          	ld	(OFST-3,sp),a
4728                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4730  000c 7b01          	ld	a,(OFST-3,sp)
4731  000e 5f            	clrw	x
4732  000f 97            	ld	xl,a
4733  0010 1f03          	ldw	(OFST-1,sp),x
4734                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4736  0012 7b02          	ld	a,(OFST-2,sp)
4737  0014 5f            	clrw	x
4738  0015 97            	ld	xl,a
4739  0016 4f            	clr	a
4740  0017 02            	rlwa	x,a
4741  0018 01            	rrwa	x,a
4742  0019 1a04          	or	a,(OFST+0,sp)
4743  001b 01            	rrwa	x,a
4744  001c 1a03          	or	a,(OFST-1,sp)
4745  001e 01            	rrwa	x,a
4746  001f 1f03          	ldw	(OFST-1,sp),x
4747                     ; 1816   return (uint16_t)tmpccr1;
4749  0021 1e03          	ldw	x,(OFST-1,sp)
4752  0023 5b04          	addw	sp,#4
4753  0025 81            	ret
4805                     ; 1824 uint16_t TIM1_GetCapture2(void)
4805                     ; 1825 {
4806                     .text:	section	.text,new
4807  0000               _TIM1_GetCapture2:
4809  0000 5204          	subw	sp,#4
4810       00000004      OFST:	set	4
4813                     ; 1828   uint16_t tmpccr2 = 0;
4815                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4819                     ; 1831   tmpccr2h = TIM1->CCR2H;
4821  0002 c652c8        	ld	a,21192
4822  0005 6b02          	ld	(OFST-2,sp),a
4823                     ; 1832   tmpccr2l = TIM1->CCR2L;
4825  0007 c652c9        	ld	a,21193
4826  000a 6b01          	ld	(OFST-3,sp),a
4827                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4829  000c 7b01          	ld	a,(OFST-3,sp)
4830  000e 5f            	clrw	x
4831  000f 97            	ld	xl,a
4832  0010 1f03          	ldw	(OFST-1,sp),x
4833                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4835  0012 7b02          	ld	a,(OFST-2,sp)
4836  0014 5f            	clrw	x
4837  0015 97            	ld	xl,a
4838  0016 4f            	clr	a
4839  0017 02            	rlwa	x,a
4840  0018 01            	rrwa	x,a
4841  0019 1a04          	or	a,(OFST+0,sp)
4842  001b 01            	rrwa	x,a
4843  001c 1a03          	or	a,(OFST-1,sp)
4844  001e 01            	rrwa	x,a
4845  001f 1f03          	ldw	(OFST-1,sp),x
4846                     ; 1837   return (uint16_t)tmpccr2;
4848  0021 1e03          	ldw	x,(OFST-1,sp)
4851  0023 5b04          	addw	sp,#4
4852  0025 81            	ret
4904                     ; 1845 uint16_t TIM1_GetCapture3(void)
4904                     ; 1846 {
4905                     .text:	section	.text,new
4906  0000               _TIM1_GetCapture3:
4908  0000 5204          	subw	sp,#4
4909       00000004      OFST:	set	4
4912                     ; 1848   uint16_t tmpccr3 = 0;
4914                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4918                     ; 1851   tmpccr3h = TIM1->CCR3H;
4920  0002 c652ca        	ld	a,21194
4921  0005 6b02          	ld	(OFST-2,sp),a
4922                     ; 1852   tmpccr3l = TIM1->CCR3L;
4924  0007 c652cb        	ld	a,21195
4925  000a 6b01          	ld	(OFST-3,sp),a
4926                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4928  000c 7b01          	ld	a,(OFST-3,sp)
4929  000e 5f            	clrw	x
4930  000f 97            	ld	xl,a
4931  0010 1f03          	ldw	(OFST-1,sp),x
4932                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4934  0012 7b02          	ld	a,(OFST-2,sp)
4935  0014 5f            	clrw	x
4936  0015 97            	ld	xl,a
4937  0016 4f            	clr	a
4938  0017 02            	rlwa	x,a
4939  0018 01            	rrwa	x,a
4940  0019 1a04          	or	a,(OFST+0,sp)
4941  001b 01            	rrwa	x,a
4942  001c 1a03          	or	a,(OFST-1,sp)
4943  001e 01            	rrwa	x,a
4944  001f 1f03          	ldw	(OFST-1,sp),x
4945                     ; 1857   return (uint16_t)tmpccr3;
4947  0021 1e03          	ldw	x,(OFST-1,sp)
4950  0023 5b04          	addw	sp,#4
4951  0025 81            	ret
5003                     ; 1865 uint16_t TIM1_GetCapture4(void)
5003                     ; 1866 {
5004                     .text:	section	.text,new
5005  0000               _TIM1_GetCapture4:
5007  0000 5204          	subw	sp,#4
5008       00000004      OFST:	set	4
5011                     ; 1868   uint16_t tmpccr4 = 0;
5013                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5017                     ; 1871   tmpccr4h = TIM1->CCR4H;
5019  0002 c652cc        	ld	a,21196
5020  0005 6b02          	ld	(OFST-2,sp),a
5021                     ; 1872   tmpccr4l = TIM1->CCR4L;
5023  0007 c652cd        	ld	a,21197
5024  000a 6b01          	ld	(OFST-3,sp),a
5025                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5027  000c 7b01          	ld	a,(OFST-3,sp)
5028  000e 5f            	clrw	x
5029  000f 97            	ld	xl,a
5030  0010 1f03          	ldw	(OFST-1,sp),x
5031                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5033  0012 7b02          	ld	a,(OFST-2,sp)
5034  0014 5f            	clrw	x
5035  0015 97            	ld	xl,a
5036  0016 4f            	clr	a
5037  0017 02            	rlwa	x,a
5038  0018 01            	rrwa	x,a
5039  0019 1a04          	or	a,(OFST+0,sp)
5040  001b 01            	rrwa	x,a
5041  001c 1a03          	or	a,(OFST-1,sp)
5042  001e 01            	rrwa	x,a
5043  001f 1f03          	ldw	(OFST-1,sp),x
5044                     ; 1877   return (uint16_t)tmpccr4;
5046  0021 1e03          	ldw	x,(OFST-1,sp)
5049  0023 5b04          	addw	sp,#4
5050  0025 81            	ret
5086                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5086                     ; 1891 {
5087                     .text:	section	.text,new
5088  0000               _TIM1_SetIC1Prescaler:
5090  0000 88            	push	a
5091       00000000      OFST:	set	0
5094                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5096                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5098  0001 c652b9        	ld	a,21177
5099  0004 a4f3          	and	a,#243
5100  0006 1a01          	or	a,(OFST+1,sp)
5101  0008 c752b9        	ld	21177,a
5102                     ; 1897 }
5105  000b 84            	pop	a
5106  000c 81            	ret
5142                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5142                     ; 1910 {
5143                     .text:	section	.text,new
5144  0000               _TIM1_SetIC2Prescaler:
5146  0000 88            	push	a
5147       00000000      OFST:	set	0
5150                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5152                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5154  0001 c652ba        	ld	a,21178
5155  0004 a4f3          	and	a,#243
5156  0006 1a01          	or	a,(OFST+1,sp)
5157  0008 c752ba        	ld	21178,a
5158                     ; 1916 }
5161  000b 84            	pop	a
5162  000c 81            	ret
5198                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5198                     ; 1929 {
5199                     .text:	section	.text,new
5200  0000               _TIM1_SetIC3Prescaler:
5202  0000 88            	push	a
5203       00000000      OFST:	set	0
5206                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5208                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5210  0001 c652bb        	ld	a,21179
5211  0004 a4f3          	and	a,#243
5212  0006 1a01          	or	a,(OFST+1,sp)
5213  0008 c752bb        	ld	21179,a
5214                     ; 1936 }
5217  000b 84            	pop	a
5218  000c 81            	ret
5254                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5254                     ; 1949 {
5255                     .text:	section	.text,new
5256  0000               _TIM1_SetIC4Prescaler:
5258  0000 88            	push	a
5259       00000000      OFST:	set	0
5262                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5264                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5266  0001 c652bc        	ld	a,21180
5267  0004 a4f3          	and	a,#243
5268  0006 1a01          	or	a,(OFST+1,sp)
5269  0008 c752bc        	ld	21180,a
5270                     ; 1956 }
5273  000b 84            	pop	a
5274  000c 81            	ret
5381                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5381                     ; 1992 {
5382                     .text:	section	.text,new
5383  0000               _TIM1_ITConfig:
5385  0000 89            	pushw	x
5386       00000000      OFST:	set	0
5389                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5391                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5393                     ; 1997   if (NewState != DISABLE)
5395  0001 9f            	ld	a,xl
5396  0002 4d            	tnz	a
5397  0003 2709          	jreq	L1762
5398                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5400  0005 9e            	ld	a,xh
5401  0006 ca52b5        	or	a,21173
5402  0009 c752b5        	ld	21173,a
5404  000c 2009          	jra	L3762
5405  000e               L1762:
5406                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5408  000e 7b01          	ld	a,(OFST+1,sp)
5409  0010 43            	cpl	a
5410  0011 c452b5        	and	a,21173
5411  0014 c752b5        	ld	21173,a
5412  0017               L3762:
5413                     ; 2007 }
5416  0017 85            	popw	x
5417  0018 81            	ret
5522                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5522                     ; 2024 {
5523                     .text:	section	.text,new
5524  0000               _TIM1_GenerateEvent:
5528                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5530                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5532  0000 c752b8        	ld	21176,a
5533                     ; 2030 }
5536  0003 81            	ret
5710                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5710                     ; 2050 {
5711                     .text:	section	.text,new
5712  0000               _TIM1_GetFlagStatus:
5714  0000 89            	pushw	x
5715  0001 89            	pushw	x
5716       00000002      OFST:	set	2
5719                     ; 2051   FlagStatus bitstatus = RESET;
5721                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5725                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5727                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5729  0002 9f            	ld	a,xl
5730  0003 c452b6        	and	a,21174
5731  0006 6b01          	ld	(OFST-1,sp),a
5732                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5734  0008 c652b7        	ld	a,21175
5735  000b 1403          	and	a,(OFST+1,sp)
5736  000d 6b02          	ld	(OFST+0,sp),a
5737                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5739  000f 7b01          	ld	a,(OFST-1,sp)
5740  0011 1a02          	or	a,(OFST+0,sp)
5741  0013 2706          	jreq	L5303
5742                     ; 2062     bitstatus = SET;
5744  0015 a601          	ld	a,#1
5745  0017 6b02          	ld	(OFST+0,sp),a
5747  0019 2002          	jra	L7303
5748  001b               L5303:
5749                     ; 2066     bitstatus = RESET;
5751  001b 0f02          	clr	(OFST+0,sp)
5752  001d               L7303:
5753                     ; 2068   return (FlagStatus)(bitstatus);
5755  001d 7b02          	ld	a,(OFST+0,sp)
5758  001f 5b04          	addw	sp,#4
5759  0021 81            	ret
5794                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5794                     ; 2090 {
5795                     .text:	section	.text,new
5796  0000               _TIM1_ClearFlag:
5798  0000 89            	pushw	x
5799       00000000      OFST:	set	0
5802                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5804                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5806  0001 9f            	ld	a,xl
5807  0002 43            	cpl	a
5808  0003 c752b6        	ld	21174,a
5809                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5811  0006 7b01          	ld	a,(OFST+1,sp)
5812  0008 43            	cpl	a
5813  0009 a41e          	and	a,#30
5814  000b c752b7        	ld	21175,a
5815                     ; 2097 }
5818  000e 85            	popw	x
5819  000f 81            	ret
5883                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5883                     ; 2115 {
5884                     .text:	section	.text,new
5885  0000               _TIM1_GetITStatus:
5887  0000 88            	push	a
5888  0001 89            	pushw	x
5889       00000002      OFST:	set	2
5892                     ; 2116   ITStatus bitstatus = RESET;
5894                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5898                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5900                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5902  0002 c452b6        	and	a,21174
5903  0005 6b01          	ld	(OFST-1,sp),a
5904                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5906  0007 c652b5        	ld	a,21173
5907  000a 1403          	and	a,(OFST+1,sp)
5908  000c 6b02          	ld	(OFST+0,sp),a
5909                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5911  000e 0d01          	tnz	(OFST-1,sp)
5912  0010 270a          	jreq	L1113
5914  0012 0d02          	tnz	(OFST+0,sp)
5915  0014 2706          	jreq	L1113
5916                     ; 2129     bitstatus = SET;
5918  0016 a601          	ld	a,#1
5919  0018 6b02          	ld	(OFST+0,sp),a
5921  001a 2002          	jra	L3113
5922  001c               L1113:
5923                     ; 2133     bitstatus = RESET;
5925  001c 0f02          	clr	(OFST+0,sp)
5926  001e               L3113:
5927                     ; 2135   return (ITStatus)(bitstatus);
5929  001e 7b02          	ld	a,(OFST+0,sp)
5932  0020 5b03          	addw	sp,#3
5933  0022 81            	ret
5969                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5969                     ; 2153 {
5970                     .text:	section	.text,new
5971  0000               _TIM1_ClearITPendingBit:
5975                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5977                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5979  0000 43            	cpl	a
5980  0001 c752b6        	ld	21174,a
5981                     ; 2159 }
5984  0004 81            	ret
6522                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6522                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6522                     ; 2169 {
6523                     .text:	section	.text,new
6524  0000               _TIM1_DMAConfig:
6528                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6530                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6532                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6534  0000 9e            	ld	a,xh
6535  0001 c752d1        	ld	21201,a
6536                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6538  0004 9f            	ld	a,xl
6539  0005 c752d2        	ld	21202,a
6540                     ; 2177 }
6543  0008 81            	ret
6637                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6637                     ; 2190 {
6638                     .text:	section	.text,new
6639  0000               _TIM1_DMACmd:
6641  0000 89            	pushw	x
6642       00000000      OFST:	set	0
6645                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6647                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6649                     ; 2195   if (NewState != DISABLE)
6651  0001 9f            	ld	a,xl
6652  0002 4d            	tnz	a
6653  0003 2709          	jreq	L7243
6654                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6656  0005 9e            	ld	a,xh
6657  0006 ca52b4        	or	a,21172
6658  0009 c752b4        	ld	21172,a
6660  000c 2009          	jra	L1343
6661  000e               L7243:
6662                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6664  000e 7b01          	ld	a,(OFST+1,sp)
6665  0010 43            	cpl	a
6666  0011 c452b4        	and	a,21172
6667  0014 c752b4        	ld	21172,a
6668  0017               L1343:
6669                     ; 2205 }
6672  0017 85            	popw	x
6673  0018 81            	ret
6708                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6708                     ; 2214 {
6709                     .text:	section	.text,new
6710  0000               _TIM1_SelectCCDMA:
6714                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6716                     ; 2218   if (NewState != DISABLE)
6718  0000 4d            	tnz	a
6719  0001 2706          	jreq	L1543
6720                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6722  0003 721652b1      	bset	21169,#3
6724  0007 2004          	jra	L3543
6725  0009               L1543:
6726                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6728  0009 721752b1      	bres	21169,#3
6729  000d               L3543:
6730                     ; 2228 }
6733  000d 81            	ret
6757                     ; 2251 void TIM1_InternalClockConfig(void)
6757                     ; 2252 {
6758                     .text:	section	.text,new
6759  0000               _TIM1_InternalClockConfig:
6763                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6765  0000 c652b2        	ld	a,21170
6766  0003 a4f8          	and	a,#248
6767  0005 c752b2        	ld	21170,a
6768                     ; 2255 }
6771  0008 81            	ret
6860                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6860                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6860                     ; 2274                                  uint8_t ICFilter)
6860                     ; 2275 {
6861                     .text:	section	.text,new
6862  0000               _TIM1_TIxExternalClockConfig:
6864  0000 89            	pushw	x
6865       00000000      OFST:	set	0
6868                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6870                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6872                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6874                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6876  0001 9e            	ld	a,xh
6877  0002 a160          	cp	a,#96
6878  0004 260f          	jrne	L5253
6879                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6881  0006 7b05          	ld	a,(OFST+5,sp)
6882  0008 88            	push	a
6883  0009 ae0001        	ldw	x,#1
6884  000c 7b03          	ld	a,(OFST+3,sp)
6885  000e 95            	ld	xh,a
6886  000f cd0000        	call	L5_TI2_Config
6888  0012 84            	pop	a
6890  0013 200d          	jra	L7253
6891  0015               L5253:
6892                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6894  0015 7b05          	ld	a,(OFST+5,sp)
6895  0017 88            	push	a
6896  0018 ae0001        	ldw	x,#1
6897  001b 7b03          	ld	a,(OFST+3,sp)
6898  001d 95            	ld	xh,a
6899  001e cd0000        	call	L3_TI1_Config
6901  0021 84            	pop	a
6902  0022               L7253:
6903                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6905  0022 7b01          	ld	a,(OFST+1,sp)
6906  0024 cd0000        	call	_TIM1_SelectInputTrigger
6908                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6910  0027 c652b2        	ld	a,21170
6911  002a aa07          	or	a,#7
6912  002c c752b2        	ld	21170,a
6913                     ; 2296 }
6916  002f 85            	popw	x
6917  0030 81            	ret
7034                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7034                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7034                     ; 2316                               uint8_t ExtTRGFilter)
7034                     ; 2317 {
7035                     .text:	section	.text,new
7036  0000               _TIM1_ETRClockMode1Config:
7038  0000 89            	pushw	x
7039       00000000      OFST:	set	0
7042                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7044                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7046                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7048                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7050  0001 7b05          	ld	a,(OFST+5,sp)
7051  0003 88            	push	a
7052  0004 9f            	ld	a,xl
7053  0005 97            	ld	xl,a
7054  0006 7b02          	ld	a,(OFST+2,sp)
7055  0008 95            	ld	xh,a
7056  0009 cd0000        	call	_TIM1_ETRConfig
7058  000c 84            	pop	a
7059                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7059                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7061  000d c652b2        	ld	a,21170
7062  0010 a488          	and	a,#136
7063  0012 aa77          	or	a,#119
7064  0014 c752b2        	ld	21170,a
7065                     ; 2329 }
7068  0017 85            	popw	x
7069  0018 81            	ret
7127                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7127                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7127                     ; 2349                               uint8_t ExtTRGFilter)
7127                     ; 2350 {
7128                     .text:	section	.text,new
7129  0000               _TIM1_ETRClockMode2Config:
7131  0000 89            	pushw	x
7132       00000000      OFST:	set	0
7135                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7137                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7139                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7141  0001 7b05          	ld	a,(OFST+5,sp)
7142  0003 88            	push	a
7143  0004 9f            	ld	a,xl
7144  0005 97            	ld	xl,a
7145  0006 7b02          	ld	a,(OFST+2,sp)
7146  0008 95            	ld	xh,a
7147  0009 cd0000        	call	_TIM1_ETRConfig
7149  000c 84            	pop	a
7150                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7152  000d 721c52b3      	bset	21171,#6
7153                     ; 2360 }
7156  0011 85            	popw	x
7157  0012 81            	ret
7264                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7264                     ; 2411 {
7265                     .text:	section	.text,new
7266  0000               _TIM1_SelectInputTrigger:
7268  0000 88            	push	a
7269       00000000      OFST:	set	0
7272                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7274                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7276  0001 c652b2        	ld	a,21170
7277  0004 a48f          	and	a,#143
7278  0006 1a01          	or	a,(OFST+1,sp)
7279  0008 c752b2        	ld	21170,a
7280                     ; 2417 }
7283  000b 84            	pop	a
7284  000c 81            	ret
7390                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7390                     ; 2434 {
7391                     .text:	section	.text,new
7392  0000               _TIM1_SelectOutputTrigger:
7394  0000 88            	push	a
7395       00000000      OFST:	set	0
7398                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7400                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7402  0001 c652b1        	ld	a,21169
7403  0004 a48f          	and	a,#143
7404  0006 1a01          	or	a,(OFST+1,sp)
7405  0008 c752b1        	ld	21169,a
7406                     ; 2439 }
7409  000b 84            	pop	a
7410  000c 81            	ret
7484                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7484                     ; 2452 {
7485                     .text:	section	.text,new
7486  0000               _TIM1_SelectSlaveMode:
7488  0000 88            	push	a
7489       00000000      OFST:	set	0
7492                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7494                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7496  0001 c652b2        	ld	a,21170
7497  0004 a4f8          	and	a,#248
7498  0006 1a01          	or	a,(OFST+1,sp)
7499  0008 c752b2        	ld	21170,a
7500                     ; 2459 }
7503  000b 84            	pop	a
7504  000c 81            	ret
7540                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7540                     ; 2468 {
7541                     .text:	section	.text,new
7542  0000               _TIM1_SelectMasterSlaveMode:
7546                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7548                     ; 2473   if (NewState != DISABLE)
7550  0000 4d            	tnz	a
7551  0001 2706          	jreq	L5004
7552                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7554  0003 721e52b2      	bset	21170,#7
7556  0007 2004          	jra	L7004
7557  0009               L5004:
7558                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7560  0009 721f52b2      	bres	21170,#7
7561  000d               L7004:
7562                     ; 2481 }
7565  000d 81            	ret
7621                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7621                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7621                     ; 2501                     uint8_t ExtTRGFilter)
7621                     ; 2502 {
7622                     .text:	section	.text,new
7623  0000               _TIM1_ETRConfig:
7625  0000 89            	pushw	x
7626       00000000      OFST:	set	0
7629                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7631                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7631                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7631                     ; 2508                          | (uint8_t) ExtTRGFilter);
7633  0001 9f            	ld	a,xl
7634  0002 1a01          	or	a,(OFST+1,sp)
7635  0004 1a05          	or	a,(OFST+5,sp)
7636  0006 ca52b3        	or	a,21171
7637  0009 c752b3        	ld	21171,a
7638                     ; 2509 }
7641  000c 85            	popw	x
7642  000d 81            	ret
7728                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7728                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7728                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7728                     ; 2550 {
7729                     .text:	section	.text,new
7730  0000               _TIM1_EncoderInterfaceConfig:
7732  0000 89            	pushw	x
7733       00000000      OFST:	set	0
7736                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7738                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7740                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7742                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7744  0001 9f            	ld	a,xl
7745  0002 4d            	tnz	a
7746  0003 2706          	jreq	L7704
7747                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7749  0005 721252bd      	bset	21181,#1
7751  0009 2004          	jra	L1014
7752  000b               L7704:
7753                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7755  000b 721352bd      	bres	21181,#1
7756  000f               L1014:
7757                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7759  000f 0d05          	tnz	(OFST+5,sp)
7760  0011 2706          	jreq	L3014
7761                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7763  0013 721a52bd      	bset	21181,#5
7765  0017 2004          	jra	L5014
7766  0019               L3014:
7767                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7769  0019 721b52bd      	bres	21181,#5
7770  001d               L5014:
7771                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7773  001d c652b2        	ld	a,21170
7774  0020 a4f0          	and	a,#240
7775  0022 1a01          	or	a,(OFST+1,sp)
7776  0024 c752b2        	ld	21170,a
7777                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7779  0027 c652b9        	ld	a,21177
7780  002a a4fc          	and	a,#252
7781  002c aa01          	or	a,#1
7782  002e c752b9        	ld	21177,a
7783                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7785  0031 c652ba        	ld	a,21178
7786  0034 a4fc          	and	a,#252
7787  0036 aa01          	or	a,#1
7788  0038 c752ba        	ld	21178,a
7789                     ; 2581 }
7792  003b 85            	popw	x
7793  003c 81            	ret
7829                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7829                     ; 2590 {
7830                     .text:	section	.text,new
7831  0000               _TIM1_SelectHallSensor:
7835                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7837                     ; 2595   if (NewState != DISABLE)
7839  0000 4d            	tnz	a
7840  0001 2706          	jreq	L5214
7841                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7843  0003 721e52b1      	bset	21169,#7
7845  0007 2004          	jra	L7214
7846  0009               L5214:
7847                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7849  0009 721f52b1      	bres	21169,#7
7850  000d               L7214:
7851                     ; 2603 }
7854  000d 81            	ret
7906                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7906                     ; 2624 {
7907                     .text:	section	.text,new
7908  0000               L3_TI1_Config:
7910  0000 89            	pushw	x
7911  0001 88            	push	a
7912       00000001      OFST:	set	1
7915                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7917  0002 721152bd      	bres	21181,#0
7918                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7918                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7920  0006 7b06          	ld	a,(OFST+5,sp)
7921  0008 97            	ld	xl,a
7922  0009 a610          	ld	a,#16
7923  000b 42            	mul	x,a
7924  000c 9f            	ld	a,xl
7925  000d 1a03          	or	a,(OFST+2,sp)
7926  000f 6b01          	ld	(OFST+0,sp),a
7927  0011 c652b9        	ld	a,21177
7928  0014 a40c          	and	a,#12
7929  0016 1a01          	or	a,(OFST+0,sp)
7930  0018 c752b9        	ld	21177,a
7931                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7933  001b 0d02          	tnz	(OFST+1,sp)
7934  001d 2706          	jreq	L7514
7935                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7937  001f 721252bd      	bset	21181,#1
7939  0023 2004          	jra	L1614
7940  0025               L7514:
7941                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7943  0025 721352bd      	bres	21181,#1
7944  0029               L1614:
7945                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7947  0029 721052bd      	bset	21181,#0
7948                     ; 2647 }
7951  002d 5b03          	addw	sp,#3
7952  002f 81            	ret
8004                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8004                     ; 2664 {
8005                     .text:	section	.text,new
8006  0000               L5_TI2_Config:
8008  0000 89            	pushw	x
8009  0001 88            	push	a
8010       00000001      OFST:	set	1
8013                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8015  0002 721952bd      	bres	21181,#4
8016                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8016                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8018  0006 7b06          	ld	a,(OFST+5,sp)
8019  0008 97            	ld	xl,a
8020  0009 a610          	ld	a,#16
8021  000b 42            	mul	x,a
8022  000c 9f            	ld	a,xl
8023  000d 1a03          	or	a,(OFST+2,sp)
8024  000f 6b01          	ld	(OFST+0,sp),a
8025  0011 c652ba        	ld	a,21178
8026  0014 a40c          	and	a,#12
8027  0016 1a01          	or	a,(OFST+0,sp)
8028  0018 c752ba        	ld	21178,a
8029                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8031  001b 0d02          	tnz	(OFST+1,sp)
8032  001d 2706          	jreq	L1124
8033                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8035  001f 721a52bd      	bset	21181,#5
8037  0023 2004          	jra	L3124
8038  0025               L1124:
8039                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8041  0025 721b52bd      	bres	21181,#5
8042  0029               L3124:
8043                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8045  0029 721852bd      	bset	21181,#4
8046                     ; 2682 }
8049  002d 5b03          	addw	sp,#3
8050  002f 81            	ret
8102                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8102                     ; 2699 {
8103                     .text:	section	.text,new
8104  0000               L7_TI3_Config:
8106  0000 89            	pushw	x
8107  0001 88            	push	a
8108       00000001      OFST:	set	1
8111                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8113  0002 721152be      	bres	21182,#0
8114                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8114                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8116  0006 7b06          	ld	a,(OFST+5,sp)
8117  0008 97            	ld	xl,a
8118  0009 a610          	ld	a,#16
8119  000b 42            	mul	x,a
8120  000c 9f            	ld	a,xl
8121  000d 1a03          	or	a,(OFST+2,sp)
8122  000f 6b01          	ld	(OFST+0,sp),a
8123  0011 c652bb        	ld	a,21179
8124  0014 a40c          	and	a,#12
8125  0016 1a01          	or	a,(OFST+0,sp)
8126  0018 c752bb        	ld	21179,a
8127                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8129  001b 0d02          	tnz	(OFST+1,sp)
8130  001d 2706          	jreq	L3424
8131                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8133  001f 721252be      	bset	21182,#1
8135  0023 2004          	jra	L5424
8136  0025               L3424:
8137                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8139  0025 721352be      	bres	21182,#1
8140  0029               L5424:
8141                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8143  0029 721052be      	bset	21182,#0
8144                     ; 2718 }
8147  002d 5b03          	addw	sp,#3
8148  002f 81            	ret
8200                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8200                     ; 2734 {
8201                     .text:	section	.text,new
8202  0000               L11_TI4_Config:
8204  0000 89            	pushw	x
8205  0001 88            	push	a
8206       00000001      OFST:	set	1
8209                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8211  0002 721952be      	bres	21182,#4
8212                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8212                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8214  0006 7b06          	ld	a,(OFST+5,sp)
8215  0008 97            	ld	xl,a
8216  0009 a610          	ld	a,#16
8217  000b 42            	mul	x,a
8218  000c 9f            	ld	a,xl
8219  000d 1a03          	or	a,(OFST+2,sp)
8220  000f 6b01          	ld	(OFST+0,sp),a
8221  0011 c652bc        	ld	a,21180
8222  0014 a40c          	and	a,#12
8223  0016 1a01          	or	a,(OFST+0,sp)
8224  0018 c752bc        	ld	21180,a
8225                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8227  001b 0d02          	tnz	(OFST+1,sp)
8228  001d 2706          	jreq	L5724
8229                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8231  001f 721a52be      	bset	21182,#5
8233  0023 2004          	jra	L7724
8234  0025               L5724:
8235                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8237  0025 721b52be      	bres	21182,#5
8238  0029               L7724:
8239                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8241  0029 721852be      	bset	21182,#4
8242                     ; 2755 }
8245  002d 5b03          	addw	sp,#3
8246  002f 81            	ret
8259                     	xdef	_TIM1_SelectHallSensor
8260                     	xdef	_TIM1_EncoderInterfaceConfig
8261                     	xdef	_TIM1_ETRConfig
8262                     	xdef	_TIM1_SelectMasterSlaveMode
8263                     	xdef	_TIM1_SelectSlaveMode
8264                     	xdef	_TIM1_SelectOutputTrigger
8265                     	xdef	_TIM1_SelectInputTrigger
8266                     	xdef	_TIM1_ETRClockMode2Config
8267                     	xdef	_TIM1_ETRClockMode1Config
8268                     	xdef	_TIM1_TIxExternalClockConfig
8269                     	xdef	_TIM1_InternalClockConfig
8270                     	xdef	_TIM1_SelectCCDMA
8271                     	xdef	_TIM1_DMACmd
8272                     	xdef	_TIM1_DMAConfig
8273                     	xdef	_TIM1_ClearITPendingBit
8274                     	xdef	_TIM1_GetITStatus
8275                     	xdef	_TIM1_ClearFlag
8276                     	xdef	_TIM1_GetFlagStatus
8277                     	xdef	_TIM1_GenerateEvent
8278                     	xdef	_TIM1_ITConfig
8279                     	xdef	_TIM1_SetIC4Prescaler
8280                     	xdef	_TIM1_SetIC3Prescaler
8281                     	xdef	_TIM1_SetIC2Prescaler
8282                     	xdef	_TIM1_SetIC1Prescaler
8283                     	xdef	_TIM1_GetCapture4
8284                     	xdef	_TIM1_GetCapture3
8285                     	xdef	_TIM1_GetCapture2
8286                     	xdef	_TIM1_GetCapture1
8287                     	xdef	_TIM1_PWMIConfig
8288                     	xdef	_TIM1_ICInit
8289                     	xdef	_TIM1_CCxNCmd
8290                     	xdef	_TIM1_CCxCmd
8291                     	xdef	_TIM1_SelectCOM
8292                     	xdef	_TIM1_SelectOCREFClear
8293                     	xdef	_TIM1_OC3NPolarityConfig
8294                     	xdef	_TIM1_OC3PolarityConfig
8295                     	xdef	_TIM1_OC2NPolarityConfig
8296                     	xdef	_TIM1_OC2PolarityConfig
8297                     	xdef	_TIM1_OC1NPolarityConfig
8298                     	xdef	_TIM1_OC1PolarityConfig
8299                     	xdef	_TIM1_ClearOC4Ref
8300                     	xdef	_TIM1_ClearOC3Ref
8301                     	xdef	_TIM1_ClearOC2Ref
8302                     	xdef	_TIM1_ClearOC1Ref
8303                     	xdef	_TIM1_OC3FastConfig
8304                     	xdef	_TIM1_OC2FastConfig
8305                     	xdef	_TIM1_OC1FastConfig
8306                     	xdef	_TIM1_OC4PreloadConfig
8307                     	xdef	_TIM1_OC3PreloadConfig
8308                     	xdef	_TIM1_OC2PreloadConfig
8309                     	xdef	_TIM1_OC1PreloadConfig
8310                     	xdef	_TIM1_ForcedOC3Config
8311                     	xdef	_TIM1_ForcedOC2Config
8312                     	xdef	_TIM1_ForcedOC1Config
8313                     	xdef	_TIM1_CCPreloadControl
8314                     	xdef	_TIM1_SetCompare4
8315                     	xdef	_TIM1_SetCompare3
8316                     	xdef	_TIM1_SetCompare2
8317                     	xdef	_TIM1_SetCompare1
8318                     	xdef	_TIM1_SelectOCxM
8319                     	xdef	_TIM1_CtrlPWMOutputs
8320                     	xdef	_TIM1_BDTRConfig
8321                     	xdef	_TIM1_OC3Init
8322                     	xdef	_TIM1_OC2Init
8323                     	xdef	_TIM1_OC1Init
8324                     	xdef	_TIM1_Cmd
8325                     	xdef	_TIM1_SelectOnePulseMode
8326                     	xdef	_TIM1_ARRPreloadConfig
8327                     	xdef	_TIM1_UpdateRequestConfig
8328                     	xdef	_TIM1_UpdateDisableConfig
8329                     	xdef	_TIM1_GetPrescaler
8330                     	xdef	_TIM1_GetCounter
8331                     	xdef	_TIM1_SetAutoreload
8332                     	xdef	_TIM1_SetCounter
8333                     	xdef	_TIM1_CounterModeConfig
8334                     	xdef	_TIM1_PrescalerConfig
8335                     	xdef	_TIM1_TimeBaseInit
8336                     	xdef	_TIM1_DeInit
8355                     	end
