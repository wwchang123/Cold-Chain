   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 140 void DMA_GlobalDeInit(void)
  44                     ; 141 {
  46                     .text:	section	.text,new
  47  0000               _DMA_GlobalDeInit:
  51                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  53  0000 72115070      	bres	20592,#0
  54                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  56  0004 35fc5070      	mov	20592,#252
  57                     ; 147 }
  60  0008 81            	ret
 176                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 176                     ; 156 {
 177                     .text:	section	.text,new
 178  0000               _DMA_DeInit:
 180  0000 89            	pushw	x
 181       00000000      OFST:	set	0
 184                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 186                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 188  0001 f6            	ld	a,(x)
 189  0002 a4fe          	and	a,#254
 190  0004 f7            	ld	(x),a
 191                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 193  0005 7f            	clr	(x)
 194                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 196  0006 6f02          	clr	(2,x)
 197                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 199  0008 a35093        	cpw	x,#20627
 200  000b 2608          	jrne	L501
 201                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 203  000d a640          	ld	a,#64
 204  000f e703          	ld	(3,x),a
 205                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 207  0011 6f05          	clr	(5,x)
 209  0013 2006          	jra	L701
 210  0015               L501:
 211                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 213  0015 1e01          	ldw	x,(OFST+1,sp)
 214  0017 a652          	ld	a,#82
 215  0019 e703          	ld	(3,x),a
 216  001b               L701:
 217                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 219  001b 1e01          	ldw	x,(OFST+1,sp)
 220  001d 6f04          	clr	(4,x)
 221                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 223  001f 1e01          	ldw	x,(OFST+1,sp)
 224  0021 6f06          	clr	(6,x)
 225                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 227  0023 1e01          	ldw	x,(OFST+1,sp)
 228  0025 6f07          	clr	(7,x)
 229                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 231  0027 1e01          	ldw	x,(OFST+1,sp)
 232  0029 6f01          	clr	(1,x)
 233                     ; 187 }
 236  002b 85            	popw	x
 237  002c 81            	ret
 483                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 483                     ; 225               uint32_t DMA_Memory0BaseAddr,
 483                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 483                     ; 227               uint8_t DMA_BufferSize,
 483                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 483                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 483                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 483                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 483                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 483                     ; 233 {
 484                     .text:	section	.text,new
 485  0000               _DMA_Init:
 487  0000 89            	pushw	x
 488       00000000      OFST:	set	0
 491                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 493                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 495                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 497                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 499                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 501                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 503                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 505  0001 f6            	ld	a,(x)
 506  0002 a4fe          	and	a,#254
 507  0004 f7            	ld	(x),a
 508                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 510  0005 7f            	clr	(x)
 511                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 511                     ; 251                                            (uint8_t)DMA_Mode) | \
 511                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 513  0006 7b0c          	ld	a,(OFST+12,sp)
 514  0008 1a0d          	or	a,(OFST+13,sp)
 515  000a 1a0e          	or	a,(OFST+14,sp)
 516  000c fa            	or	a,(x)
 517  000d f7            	ld	(x),a
 518                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 520  000e e601          	ld	a,(1,x)
 521  0010 a4c7          	and	a,#199
 522  0012 e701          	ld	(1,x),a
 523                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 523                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 525  0014 7b0f          	ld	a,(OFST+15,sp)
 526  0016 1a10          	or	a,(OFST+16,sp)
 527  0018 ea01          	or	a,(1,x)
 528  001a e701          	ld	(1,x),a
 529                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 531  001c 7b0b          	ld	a,(OFST+11,sp)
 532  001e 1e01          	ldw	x,(OFST+1,sp)
 533  0020 e702          	ld	(2,x),a
 534                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 536  0022 7b09          	ld	a,(OFST+9,sp)
 537  0024 1e01          	ldw	x,(OFST+1,sp)
 538  0026 e703          	ld	(3,x),a
 539                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 541  0028 7b0a          	ld	a,(OFST+10,sp)
 542  002a 1e01          	ldw	x,(OFST+1,sp)
 543  002c e704          	ld	(4,x),a
 544                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 546  002e 1e01          	ldw	x,(OFST+1,sp)
 547  0030 a35093        	cpw	x,#20627
 548  0033 2606          	jrne	L742
 549                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 551  0035 7b06          	ld	a,(OFST+6,sp)
 552  0037 1e01          	ldw	x,(OFST+1,sp)
 553  0039 e705          	ld	(5,x),a
 554  003b               L742:
 555                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 557  003b 7b07          	ld	a,(OFST+7,sp)
 558  003d 1e01          	ldw	x,(OFST+1,sp)
 559  003f e706          	ld	(6,x),a
 560                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 562  0041 7b08          	ld	a,(OFST+8,sp)
 563  0043 1e01          	ldw	x,(OFST+1,sp)
 564  0045 e707          	ld	(7,x),a
 565                     ; 280 }
 568  0047 85            	popw	x
 569  0048 81            	ret
 624                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 624                     ; 289 {
 625                     .text:	section	.text,new
 626  0000               _DMA_GlobalCmd:
 630                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 632                     ; 293   if (NewState != DISABLE)
 634  0000 4d            	tnz	a
 635  0001 2706          	jreq	L772
 636                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 638  0003 72105070      	bset	20592,#0
 640  0007 2004          	jra	L103
 641  0009               L772:
 642                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 644  0009 72115070      	bres	20592,#0
 645  000d               L103:
 646                     ; 303 }
 649  000d 81            	ret
 696                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 696                     ; 315 {
 697                     .text:	section	.text,new
 698  0000               _DMA_Cmd:
 700  0000 89            	pushw	x
 701       00000000      OFST:	set	0
 704                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 706                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 708                     ; 320   if (NewState != DISABLE)
 710  0001 0d05          	tnz	(OFST+5,sp)
 711  0003 2706          	jreq	L723
 712                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 714  0005 f6            	ld	a,(x)
 715  0006 aa01          	or	a,#1
 716  0008 f7            	ld	(x),a
 718  0009 2006          	jra	L133
 719  000b               L723:
 720                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 722  000b 1e01          	ldw	x,(OFST+1,sp)
 723  000d f6            	ld	a,(x)
 724  000e a4fe          	and	a,#254
 725  0010 f7            	ld	(x),a
 726  0011               L133:
 727                     ; 330 }
 730  0011 85            	popw	x
 731  0012 81            	ret
 765                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 765                     ; 343 {
 766                     .text:	section	.text,new
 767  0000               _DMA_SetTimeOut:
 771                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 773                     ; 348   DMA1->GCSR = 0;
 775  0000 725f5070      	clr	20592
 776                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 778  0004 48            	sll	a
 779  0005 48            	sll	a
 780  0006 c75070        	ld	20592,a
 781                     ; 351 }
 784  0009 81            	ret
 831                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 831                     ; 402 {
 832                     .text:	section	.text,new
 833  0000               _DMA_SetCurrDataCounter:
 835  0000 89            	pushw	x
 836       00000000      OFST:	set	0
 839                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 841                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 843  0001 7b05          	ld	a,(OFST+5,sp)
 844  0003 1e01          	ldw	x,(OFST+1,sp)
 845  0005 e702          	ld	(2,x),a
 846                     ; 408 }
 849  0007 85            	popw	x
 850  0008 81            	ret
 888                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 888                     ; 416 {
 889                     .text:	section	.text,new
 890  0000               _DMA_GetCurrDataCounter:
 894                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 896                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 898  0000 e602          	ld	a,(2,x)
 901  0002 81            	ret
 978                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 978                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 978                     ; 484                   FunctionalState NewState)
 978                     ; 485 {
 979                     .text:	section	.text,new
 980  0000               _DMA_ITConfig:
 982  0000 89            	pushw	x
 983       00000000      OFST:	set	0
 986                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 988                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 990                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 992                     ; 491   if (NewState != DISABLE)
 994  0001 0d06          	tnz	(OFST+6,sp)
 995  0003 2706          	jreq	L554
 996                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 998  0005 f6            	ld	a,(x)
 999  0006 1a05          	or	a,(OFST+5,sp)
1000  0008 f7            	ld	(x),a
1002  0009 2007          	jra	L754
1003  000b               L554:
1004                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1006  000b 1e01          	ldw	x,(OFST+1,sp)
1007  000d 7b05          	ld	a,(OFST+5,sp)
1008  000f 43            	cpl	a
1009  0010 f4            	and	a,(x)
1010  0011 f7            	ld	(x),a
1011  0012               L754:
1012                     ; 501 }
1015  0012 85            	popw	x
1016  0013 81            	ret
1265                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1265                     ; 531 {
1266                     .text:	section	.text,new
1267  0000               _DMA_GetFlagStatus:
1269  0000 89            	pushw	x
1270  0001 5204          	subw	sp,#4
1271       00000004      OFST:	set	4
1274                     ; 532   FlagStatus flagstatus = RESET;
1276                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1278                     ; 534   uint8_t tmpgir1 = 0;
1280                     ; 535   uint8_t tmpgcsr = 0;
1282                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1284                     ; 541   tmpgcsr = DMA1->GCSR;
1286  0003 c65070        	ld	a,20592
1287  0006 6b04          	ld	(OFST+0,sp),a
1288                     ; 542   tmpgir1 = DMA1->GIR1;
1290  0008 c65071        	ld	a,20593
1291  000b 6b01          	ld	(OFST-3,sp),a
1292                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1294  000d 01            	rrwa	x,a
1295  000e 9f            	ld	a,xl
1296  000f a40f          	and	a,#15
1297  0011 97            	ld	xl,a
1298  0012 4f            	clr	a
1299  0013 02            	rlwa	x,a
1300  0014 5d            	tnzw	x
1301  0015 2736          	jreq	L706
1302                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1304  0017 7b05          	ld	a,(OFST+1,sp)
1305  0019 a501          	bcp	a,#1
1306  001b 2707          	jreq	L116
1307                     ; 549       DMA_Channelx = DMA1_Channel0;
1309  001d ae5075        	ldw	x,#20597
1310  0020 1f02          	ldw	(OFST-2,sp),x
1312  0022 201f          	jra	L316
1313  0024               L116:
1314                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1316  0024 7b05          	ld	a,(OFST+1,sp)
1317  0026 a502          	bcp	a,#2
1318  0028 2707          	jreq	L516
1319                     ; 553       DMA_Channelx = DMA1_Channel1;
1321  002a ae507f        	ldw	x,#20607
1322  002d 1f02          	ldw	(OFST-2,sp),x
1324  002f 2012          	jra	L316
1325  0031               L516:
1326                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1328  0031 7b05          	ld	a,(OFST+1,sp)
1329  0033 a504          	bcp	a,#4
1330  0035 2707          	jreq	L126
1331                     ; 557       DMA_Channelx = DMA1_Channel2;
1333  0037 ae5089        	ldw	x,#20617
1334  003a 1f02          	ldw	(OFST-2,sp),x
1336  003c 2005          	jra	L316
1337  003e               L126:
1338                     ; 561       DMA_Channelx = DMA1_Channel3;
1340  003e ae5093        	ldw	x,#20627
1341  0041 1f02          	ldw	(OFST-2,sp),x
1342  0043               L316:
1343                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1345  0043 1e02          	ldw	x,(OFST-2,sp)
1346  0045 e601          	ld	a,(1,x)
1347  0047 1406          	and	a,(OFST+2,sp)
1348  0049 6b04          	ld	(OFST+0,sp),a
1350  004b 2014          	jra	L526
1351  004d               L706:
1352                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1354  004d 7b05          	ld	a,(OFST+1,sp)
1355  004f a510          	bcp	a,#16
1356  0051 2708          	jreq	L726
1357                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1359  0053 7b06          	ld	a,(OFST+2,sp)
1360  0055 1401          	and	a,(OFST-3,sp)
1361  0057 6b04          	ld	(OFST+0,sp),a
1363  0059 2006          	jra	L526
1364  005b               L726:
1365                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1367  005b 7b04          	ld	a,(OFST+0,sp)
1368  005d a402          	and	a,#2
1369  005f 6b04          	ld	(OFST+0,sp),a
1370  0061               L526:
1371                     ; 579   return (flagstatus);
1373  0061 7b04          	ld	a,(OFST+0,sp)
1376  0063 5b06          	addw	sp,#6
1377  0065 81            	ret
1424                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1424                     ; 598 {
1425                     .text:	section	.text,new
1426  0000               _DMA_ClearFlag:
1428  0000 89            	pushw	x
1429  0001 89            	pushw	x
1430       00000002      OFST:	set	2
1433                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1435                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1437                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1439  0002 01            	rrwa	x,a
1440  0003 9f            	ld	a,xl
1441  0004 a401          	and	a,#1
1442  0006 97            	ld	xl,a
1443  0007 4f            	clr	a
1444  0008 02            	rlwa	x,a
1445  0009 5d            	tnzw	x
1446  000a 2707          	jreq	L756
1447                     ; 607     DMA_Channelx = DMA1_Channel0;
1449  000c ae5075        	ldw	x,#20597
1450  000f 1f01          	ldw	(OFST-1,sp),x
1452  0011 201f          	jra	L166
1453  0013               L756:
1454                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1456  0013 7b03          	ld	a,(OFST+1,sp)
1457  0015 a502          	bcp	a,#2
1458  0017 2707          	jreq	L366
1459                     ; 613       DMA_Channelx = DMA1_Channel1;
1461  0019 ae507f        	ldw	x,#20607
1462  001c 1f01          	ldw	(OFST-1,sp),x
1464  001e 2012          	jra	L166
1465  0020               L366:
1466                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1468  0020 7b03          	ld	a,(OFST+1,sp)
1469  0022 a504          	bcp	a,#4
1470  0024 2707          	jreq	L766
1471                     ; 619         DMA_Channelx = DMA1_Channel2;
1473  0026 ae5089        	ldw	x,#20617
1474  0029 1f01          	ldw	(OFST-1,sp),x
1476  002b 2005          	jra	L166
1477  002d               L766:
1478                     ; 623         DMA_Channelx = DMA1_Channel3;
1480  002d ae5093        	ldw	x,#20627
1481  0030 1f01          	ldw	(OFST-1,sp),x
1482  0032               L166:
1483                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1485  0032 1e01          	ldw	x,(OFST-1,sp)
1486  0034 7b04          	ld	a,(OFST+2,sp)
1487  0036 a406          	and	a,#6
1488  0038 43            	cpl	a
1489  0039 e401          	and	a,(1,x)
1490  003b e701          	ld	(1,x),a
1491                     ; 630 }
1494  003d 5b04          	addw	sp,#4
1495  003f 81            	ret
1633                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1633                     ; 647 {
1634                     .text:	section	.text,new
1635  0000               _DMA_GetITStatus:
1637  0000 88            	push	a
1638  0001 5204          	subw	sp,#4
1639       00000004      OFST:	set	4
1642                     ; 648   ITStatus itstatus = RESET;
1644                     ; 649   uint8_t tmpreg = 0;
1646                     ; 650   uint8_t tmp2 = 0;
1648                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1650                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1652                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1654  0003 a510          	bcp	a,#16
1655  0005 2707          	jreq	L757
1656                     ; 659     DMA_Channelx = DMA1_Channel0;
1658  0007 ae5075        	ldw	x,#20597
1659  000a 1f03          	ldw	(OFST-1,sp),x
1661  000c 201f          	jra	L167
1662  000e               L757:
1663                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1665  000e 7b05          	ld	a,(OFST+1,sp)
1666  0010 a520          	bcp	a,#32
1667  0012 2707          	jreq	L367
1668                     ; 665       DMA_Channelx = DMA1_Channel1;
1670  0014 ae507f        	ldw	x,#20607
1671  0017 1f03          	ldw	(OFST-1,sp),x
1673  0019 2012          	jra	L167
1674  001b               L367:
1675                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1677  001b 7b05          	ld	a,(OFST+1,sp)
1678  001d a540          	bcp	a,#64
1679  001f 2707          	jreq	L767
1680                     ; 671         DMA_Channelx = DMA1_Channel2;
1682  0021 ae5089        	ldw	x,#20617
1683  0024 1f03          	ldw	(OFST-1,sp),x
1685  0026 2005          	jra	L167
1686  0028               L767:
1687                     ; 675         DMA_Channelx = DMA1_Channel3;
1689  0028 ae5093        	ldw	x,#20627
1690  002b 1f03          	ldw	(OFST-1,sp),x
1691  002d               L167:
1692                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1694  002d 1e03          	ldw	x,(OFST-1,sp)
1695  002f e601          	ld	a,(1,x)
1696  0031 6b01          	ld	(OFST-3,sp),a
1697                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1699  0033 1e03          	ldw	x,(OFST-1,sp)
1700  0035 7b01          	ld	a,(OFST-3,sp)
1701  0037 f4            	and	a,(x)
1702  0038 6b01          	ld	(OFST-3,sp),a
1703                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1705  003a 7b05          	ld	a,(OFST+1,sp)
1706  003c a406          	and	a,#6
1707  003e 6b02          	ld	(OFST-2,sp),a
1708                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1710  0040 7b01          	ld	a,(OFST-3,sp)
1711  0042 1402          	and	a,(OFST-2,sp)
1712  0044 6b02          	ld	(OFST-2,sp),a
1713                     ; 686   return (itstatus);
1715  0046 7b02          	ld	a,(OFST-2,sp)
1718  0048 5b05          	addw	sp,#5
1719  004a 81            	ret
1767                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1767                     ; 705 {
1768                     .text:	section	.text,new
1769  0000               _DMA_ClearITPendingBit:
1771  0000 88            	push	a
1772  0001 89            	pushw	x
1773       00000002      OFST:	set	2
1776                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1778                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1780                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1782  0002 a510          	bcp	a,#16
1783  0004 2707          	jreq	L7101
1784                     ; 713     DMA_Channelx = DMA1_Channel0;
1786  0006 ae5075        	ldw	x,#20597
1787  0009 1f01          	ldw	(OFST-1,sp),x
1789  000b 201f          	jra	L1201
1790  000d               L7101:
1791                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1793  000d 7b03          	ld	a,(OFST+1,sp)
1794  000f a520          	bcp	a,#32
1795  0011 2707          	jreq	L3201
1796                     ; 719       DMA_Channelx = DMA1_Channel1;
1798  0013 ae507f        	ldw	x,#20607
1799  0016 1f01          	ldw	(OFST-1,sp),x
1801  0018 2012          	jra	L1201
1802  001a               L3201:
1803                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1805  001a 7b03          	ld	a,(OFST+1,sp)
1806  001c a540          	bcp	a,#64
1807  001e 2707          	jreq	L7201
1808                     ; 725         DMA_Channelx = DMA1_Channel2;
1810  0020 ae5089        	ldw	x,#20617
1811  0023 1f01          	ldw	(OFST-1,sp),x
1813  0025 2005          	jra	L1201
1814  0027               L7201:
1815                     ; 729         DMA_Channelx = DMA1_Channel3;
1817  0027 ae5093        	ldw	x,#20627
1818  002a 1f01          	ldw	(OFST-1,sp),x
1819  002c               L1201:
1820                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1822  002c 1e01          	ldw	x,(OFST-1,sp)
1823  002e 7b03          	ld	a,(OFST+1,sp)
1824  0030 a406          	and	a,#6
1825  0032 43            	cpl	a
1826  0033 e401          	and	a,(1,x)
1827  0035 e701          	ld	(1,x),a
1828                     ; 735 }
1831  0037 5b03          	addw	sp,#3
1832  0039 81            	ret
1845                     	xdef	_DMA_ClearITPendingBit
1846                     	xdef	_DMA_GetITStatus
1847                     	xdef	_DMA_ClearFlag
1848                     	xdef	_DMA_GetFlagStatus
1849                     	xdef	_DMA_ITConfig
1850                     	xdef	_DMA_GetCurrDataCounter
1851                     	xdef	_DMA_SetCurrDataCounter
1852                     	xdef	_DMA_SetTimeOut
1853                     	xdef	_DMA_Cmd
1854                     	xdef	_DMA_GlobalCmd
1855                     	xdef	_DMA_Init
1856                     	xdef	_DMA_DeInit
1857                     	xdef	_DMA_GlobalDeInit
1876                     	end
