   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 130 void TIM4_DeInit(void)
  44                     ; 131 {
  46                     .text:	section	.text,new
  47  0000               _TIM4_DeInit:
  51                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  53  0000 725f52e0      	clr	21216
  54                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  56  0004 725f52e1      	clr	21217
  57                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  59  0008 725f52e2      	clr	21218
  60                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  62  000c 725f52e4      	clr	21220
  63                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  65  0010 725f52e7      	clr	21223
  66                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  68  0014 725f52e8      	clr	21224
  69                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  71  0018 35ff52e9      	mov	21225,#255
  72                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  74  001c 725f52e5      	clr	21221
  75                     ; 140 }
  78  0020 81            	ret
 246                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 246                     ; 166                        uint8_t TIM4_Period)
 246                     ; 167 {
 247                     .text:	section	.text,new
 248  0000               _TIM4_TimeBaseInit:
 252                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 254                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 256  0000 9f            	ld	a,xl
 257  0001 c752e9        	ld	21225,a
 258                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 260  0004 9e            	ld	a,xh
 261  0005 c752e8        	ld	21224,a
 262                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 264  0008 350152e6      	mov	21222,#1
 265                     ; 177 }
 268  000c 81            	ret
 336                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 336                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 336                     ; 207 {
 337                     .text:	section	.text,new
 338  0000               _TIM4_PrescalerConfig:
 342                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 344                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 346                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 348  0000 9e            	ld	a,xh
 349  0001 c752e8        	ld	21224,a
 350                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 352  0004 9f            	ld	a,xl
 353  0005 a101          	cp	a,#1
 354  0007 2606          	jrne	L141
 355                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 357  0009 721052e6      	bset	21222,#0
 359  000d 2004          	jra	L341
 360  000f               L141:
 361                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 363  000f 721152e6      	bres	21222,#0
 364  0013               L341:
 365                     ; 224 }
 368  0013 81            	ret
 402                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 402                     ; 233 {
 403                     .text:	section	.text,new
 404  0000               _TIM4_SetCounter:
 408                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 410  0000 c752e7        	ld	21223,a
 411                     ; 236 }
 414  0003 81            	ret
 448                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 448                     ; 245 {
 449                     .text:	section	.text,new
 450  0000               _TIM4_SetAutoreload:
 454                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 456  0000 c752e9        	ld	21225,a
 457                     ; 248 }
 460  0003 81            	ret
 494                     ; 255 uint8_t TIM4_GetCounter(void)
 494                     ; 256 {
 495                     .text:	section	.text,new
 496  0000               _TIM4_GetCounter:
 498  0000 88            	push	a
 499       00000001      OFST:	set	1
 502                     ; 257   uint8_t tmpcntr = 0;
 504                     ; 258   tmpcntr = TIM4->CNTR;
 506  0001 c652e7        	ld	a,21223
 507  0004 6b01          	ld	(OFST+0,sp),a
 508                     ; 260   return ((uint8_t)tmpcntr);
 510  0006 7b01          	ld	a,(OFST+0,sp)
 513  0008 5b01          	addw	sp,#1
 514  000a 81            	ret
 538                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 538                     ; 285 {
 539                     .text:	section	.text,new
 540  0000               _TIM4_GetPrescaler:
 544                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 546  0000 c652e8        	ld	a,21224
 549  0003 81            	ret
 605                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 605                     ; 297 {
 606                     .text:	section	.text,new
 607  0000               _TIM4_UpdateDisableConfig:
 611                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 613                     ; 302   if (NewState != DISABLE)
 615  0000 4d            	tnz	a
 616  0001 2706          	jreq	L552
 617                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 619  0003 721252e0      	bset	21216,#1
 621  0007 2004          	jra	L752
 622  0009               L552:
 623                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 625  0009 721352e0      	bres	21216,#1
 626  000d               L752:
 627                     ; 310 }
 630  000d 81            	ret
 688                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 688                     ; 321 {
 689                     .text:	section	.text,new
 690  0000               _TIM4_UpdateRequestConfig:
 694                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 696                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 698  0000 a101          	cp	a,#1
 699  0002 2606          	jrne	L703
 700                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 702  0004 721452e0      	bset	21216,#2
 704  0008 2004          	jra	L113
 705  000a               L703:
 706                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 708  000a 721552e0      	bres	21216,#2
 709  000e               L113:
 710                     ; 334 }
 713  000e 81            	ret
 749                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 749                     ; 343 {
 750                     .text:	section	.text,new
 751  0000               _TIM4_ARRPreloadConfig:
 755                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 757                     ; 348   if (NewState != DISABLE)
 759  0000 4d            	tnz	a
 760  0001 2706          	jreq	L133
 761                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 763  0003 721e52e0      	bset	21216,#7
 765  0007 2004          	jra	L333
 766  0009               L133:
 767                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 769  0009 721f52e0      	bres	21216,#7
 770  000d               L333:
 771                     ; 356 }
 774  000d 81            	ret
 831                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 831                     ; 367 {
 832                     .text:	section	.text,new
 833  0000               _TIM4_SelectOnePulseMode:
 837                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 839                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 841  0000 a101          	cp	a,#1
 842  0002 2606          	jrne	L363
 843                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 845  0004 721652e0      	bset	21216,#3
 847  0008 2004          	jra	L563
 848  000a               L363:
 849                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 851  000a 721752e0      	bres	21216,#3
 852  000e               L563:
 853                     ; 380 }
 856  000e 81            	ret
 891                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 891                     ; 389 {
 892                     .text:	section	.text,new
 893  0000               _TIM4_Cmd:
 897                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 899                     ; 394   if (NewState != DISABLE)
 901  0000 4d            	tnz	a
 902  0001 2706          	jreq	L504
 903                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 905  0003 721052e0      	bset	21216,#0
 907  0007 2004          	jra	L704
 908  0009               L504:
 909                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 911  0009 721152e0      	bres	21216,#0
 912  000d               L704:
 913                     ; 402 }
 916  000d 81            	ret
 981                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 981                     ; 431 {
 982                     .text:	section	.text,new
 983  0000               _TIM4_ITConfig:
 985  0000 89            	pushw	x
 986       00000000      OFST:	set	0
 989                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 991                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 993                     ; 436   if (NewState != DISABLE)
 995  0001 9f            	ld	a,xl
 996  0002 4d            	tnz	a
 997  0003 2709          	jreq	L344
 998                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
1000  0005 9e            	ld	a,xh
1001  0006 ca52e4        	or	a,21220
1002  0009 c752e4        	ld	21220,a
1004  000c 2009          	jra	L544
1005  000e               L344:
1006                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1008  000e 7b01          	ld	a,(OFST+1,sp)
1009  0010 43            	cpl	a
1010  0011 c452e4        	and	a,21220
1011  0014 c752e4        	ld	21220,a
1012  0017               L544:
1013                     ; 446 }
1016  0017 85            	popw	x
1017  0018 81            	ret
1074                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1074                     ; 457 {
1075                     .text:	section	.text,new
1076  0000               _TIM4_GenerateEvent:
1080                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1082                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1084  0000 ca52e6        	or	a,21222
1085  0003 c752e6        	ld	21222,a
1086                     ; 463 }
1089  0006 81            	ret
1175                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1175                     ; 475 {
1176                     .text:	section	.text,new
1177  0000               _TIM4_GetFlagStatus:
1179  0000 88            	push	a
1180       00000001      OFST:	set	1
1183                     ; 476   FlagStatus bitstatus = RESET;
1185                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1187                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1189  0001 c452e5        	and	a,21221
1190  0004 2706          	jreq	L735
1191                     ; 483     bitstatus = SET;
1193  0006 a601          	ld	a,#1
1194  0008 6b01          	ld	(OFST+0,sp),a
1196  000a 2002          	jra	L145
1197  000c               L735:
1198                     ; 487     bitstatus = RESET;
1200  000c 0f01          	clr	(OFST+0,sp)
1201  000e               L145:
1202                     ; 489   return ((FlagStatus)bitstatus);
1204  000e 7b01          	ld	a,(OFST+0,sp)
1207  0010 5b01          	addw	sp,#1
1208  0012 81            	ret
1243                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1243                     ; 501 {
1244                     .text:	section	.text,new
1245  0000               _TIM4_ClearFlag:
1249                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1251                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1253  0000 43            	cpl	a
1254  0001 c752e5        	ld	21221,a
1255                     ; 506 }
1258  0004 81            	ret
1322                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1322                     ; 519 {
1323                     .text:	section	.text,new
1324  0000               _TIM4_GetITStatus:
1326  0000 88            	push	a
1327  0001 89            	pushw	x
1328       00000002      OFST:	set	2
1331                     ; 520   ITStatus bitstatus = RESET;
1333                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1337                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1339                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1341  0002 c452e5        	and	a,21221
1342  0005 6b01          	ld	(OFST-1,sp),a
1343                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1345  0007 c652e4        	ld	a,21220
1346  000a 1403          	and	a,(OFST+1,sp)
1347  000c 6b02          	ld	(OFST+0,sp),a
1348                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1350  000e 0d01          	tnz	(OFST-1,sp)
1351  0010 270a          	jreq	L316
1353  0012 0d02          	tnz	(OFST+0,sp)
1354  0014 2706          	jreq	L316
1355                     ; 533     bitstatus = (ITStatus)SET;
1357  0016 a601          	ld	a,#1
1358  0018 6b02          	ld	(OFST+0,sp),a
1360  001a 2002          	jra	L516
1361  001c               L316:
1362                     ; 537     bitstatus = (ITStatus)RESET;
1364  001c 0f02          	clr	(OFST+0,sp)
1365  001e               L516:
1366                     ; 539   return ((ITStatus)bitstatus);
1368  001e 7b02          	ld	a,(OFST+0,sp)
1371  0020 5b03          	addw	sp,#3
1372  0022 81            	ret
1408                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1408                     ; 551 {
1409                     .text:	section	.text,new
1410  0000               _TIM4_ClearITPendingBit:
1414                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1416                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1418  0000 43            	cpl	a
1419  0001 c752e5        	ld	21221,a
1420                     ; 557 }
1423  0004 81            	ret
1482                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1482                     ; 569 {
1483                     .text:	section	.text,new
1484  0000               _TIM4_DMACmd:
1486  0000 89            	pushw	x
1487       00000000      OFST:	set	0
1490                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1492                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1494                     ; 574   if (NewState != DISABLE)
1496  0001 9f            	ld	a,xl
1497  0002 4d            	tnz	a
1498  0003 2709          	jreq	L566
1499                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1501  0005 9e            	ld	a,xh
1502  0006 ca52e3        	or	a,21219
1503  0009 c752e3        	ld	21219,a
1505  000c 2009          	jra	L766
1506  000e               L566:
1507                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1509  000e 7b01          	ld	a,(OFST+1,sp)
1510  0010 43            	cpl	a
1511  0011 c452e3        	and	a,21219
1512  0014 c752e3        	ld	21219,a
1513  0017               L766:
1514                     ; 584 }
1517  0017 85            	popw	x
1518  0018 81            	ret
1542                     ; 607 void TIM4_InternalClockConfig(void)
1542                     ; 608 {
1543                     .text:	section	.text,new
1544  0000               _TIM4_InternalClockConfig:
1548                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1550  0000 c652e2        	ld	a,21218
1551  0003 a4f8          	and	a,#248
1552  0005 c752e2        	ld	21218,a
1553                     ; 611 }
1556  0008 81            	ret
1640                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1640                     ; 652 {
1641                     .text:	section	.text,new
1642  0000               _TIM4_SelectInputTrigger:
1644  0000 88            	push	a
1645  0001 88            	push	a
1646       00000001      OFST:	set	1
1649                     ; 653   uint8_t tmpsmcr = 0;
1651                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1653                     ; 658   tmpsmcr = TIM4->SMCR;
1655  0002 c652e2        	ld	a,21218
1656  0005 6b01          	ld	(OFST+0,sp),a
1657                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1659  0007 7b01          	ld	a,(OFST+0,sp)
1660  0009 a48f          	and	a,#143
1661  000b 6b01          	ld	(OFST+0,sp),a
1662                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1664  000d 7b01          	ld	a,(OFST+0,sp)
1665  000f 1a02          	or	a,(OFST+1,sp)
1666  0011 6b01          	ld	(OFST+0,sp),a
1667                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1669  0013 7b01          	ld	a,(OFST+0,sp)
1670  0015 c752e2        	ld	21218,a
1671                     ; 665 }
1674  0018 85            	popw	x
1675  0019 81            	ret
1750                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1750                     ; 677 {
1751                     .text:	section	.text,new
1752  0000               _TIM4_SelectOutputTrigger:
1754  0000 88            	push	a
1755  0001 88            	push	a
1756       00000001      OFST:	set	1
1759                     ; 678   uint8_t tmpcr2 = 0;
1761                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1763                     ; 683   tmpcr2 = TIM4->CR2;
1765  0002 c652e1        	ld	a,21217
1766  0005 6b01          	ld	(OFST+0,sp),a
1767                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1769  0007 7b01          	ld	a,(OFST+0,sp)
1770  0009 a48f          	and	a,#143
1771  000b 6b01          	ld	(OFST+0,sp),a
1772                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1774  000d 7b01          	ld	a,(OFST+0,sp)
1775  000f 1a02          	or	a,(OFST+1,sp)
1776  0011 6b01          	ld	(OFST+0,sp),a
1777                     ; 691   TIM4->CR2 = tmpcr2;
1779  0013 7b01          	ld	a,(OFST+0,sp)
1780  0015 c752e1        	ld	21217,a
1781                     ; 692 }
1784  0018 85            	popw	x
1785  0019 81            	ret
1876                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1876                     ; 707 {
1877                     .text:	section	.text,new
1878  0000               _TIM4_SelectSlaveMode:
1880  0000 88            	push	a
1881  0001 88            	push	a
1882       00000001      OFST:	set	1
1885                     ; 708   uint8_t tmpsmcr = 0;
1887                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1889                     ; 713   tmpsmcr = TIM4->SMCR;
1891  0002 c652e2        	ld	a,21218
1892  0005 6b01          	ld	(OFST+0,sp),a
1893                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1895  0007 7b01          	ld	a,(OFST+0,sp)
1896  0009 a4f8          	and	a,#248
1897  000b 6b01          	ld	(OFST+0,sp),a
1898                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1900  000d 7b01          	ld	a,(OFST+0,sp)
1901  000f 1a02          	or	a,(OFST+1,sp)
1902  0011 6b01          	ld	(OFST+0,sp),a
1903                     ; 721   TIM4->SMCR = tmpsmcr;
1905  0013 7b01          	ld	a,(OFST+0,sp)
1906  0015 c752e2        	ld	21218,a
1907                     ; 722 }
1910  0018 85            	popw	x
1911  0019 81            	ret
1947                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1947                     ; 731 {
1948                     .text:	section	.text,new
1949  0000               _TIM4_SelectMasterSlaveMode:
1953                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1955                     ; 736   if (NewState != DISABLE)
1957  0000 4d            	tnz	a
1958  0001 2706          	jreq	L1501
1959                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1961  0003 721e52e2      	bset	21218,#7
1963  0007 2004          	jra	L3501
1964  0009               L1501:
1965                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1967  0009 721f52e2      	bres	21218,#7
1968  000d               L3501:
1969                     ; 744 }
1972  000d 81            	ret
1985                     	xdef	_TIM4_SelectMasterSlaveMode
1986                     	xdef	_TIM4_SelectSlaveMode
1987                     	xdef	_TIM4_SelectOutputTrigger
1988                     	xdef	_TIM4_SelectInputTrigger
1989                     	xdef	_TIM4_InternalClockConfig
1990                     	xdef	_TIM4_DMACmd
1991                     	xdef	_TIM4_ClearITPendingBit
1992                     	xdef	_TIM4_GetITStatus
1993                     	xdef	_TIM4_ClearFlag
1994                     	xdef	_TIM4_GetFlagStatus
1995                     	xdef	_TIM4_GenerateEvent
1996                     	xdef	_TIM4_ITConfig
1997                     	xdef	_TIM4_Cmd
1998                     	xdef	_TIM4_SelectOnePulseMode
1999                     	xdef	_TIM4_ARRPreloadConfig
2000                     	xdef	_TIM4_UpdateRequestConfig
2001                     	xdef	_TIM4_UpdateDisableConfig
2002                     	xdef	_TIM4_GetPrescaler
2003                     	xdef	_TIM4_GetCounter
2004                     	xdef	_TIM4_SetAutoreload
2005                     	xdef	_TIM4_SetCounter
2006                     	xdef	_TIM4_PrescalerConfig
2007                     	xdef	_TIM4_TimeBaseInit
2008                     	xdef	_TIM4_DeInit
2027                     	end
