   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 142 void DAC_DeInit(void)
  44                     ; 143 {
  46                     .text:	section	.text,new
  47  0000               _DAC_DeInit:
  51                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  53  0000 725f5380      	clr	21376
  54                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  56  0004 725f5381      	clr	21377
  57                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  59  0008 725f5382      	clr	21378
  60                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  62  000c 725f5383      	clr	21379
  63                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  65  0010 725f5384      	clr	21380
  66                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  68  0014 35ff5385      	mov	21381,#255
  69                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  71  0018 725f5388      	clr	21384
  72                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  74  001c 725f5389      	clr	21385
  75                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  77  0020 725f538c      	clr	21388
  78                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  80  0024 725f538d      	clr	21389
  81                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  83  0028 725f5390      	clr	21392
  84                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  86  002c 725f5394      	clr	21396
  87                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  89  0030 725f5395      	clr	21397
  90                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  92  0034 725f5398      	clr	21400
  93                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  95  0038 725f5399      	clr	21401
  96                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  98  003c 725f539c      	clr	21404
  99                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 101  0040 725f53a0      	clr	21408
 102                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 104  0044 725f53a1      	clr	21409
 105                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 107  0048 725f53a2      	clr	21410
 108                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 110  004c 725f53a3      	clr	21411
 111                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 113  0050 725f53a4      	clr	21412
 114                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 116  0054 725f53a5      	clr	21413
 117                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 119  0058 725f53a6      	clr	21414
 120                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 122  005c 725f53a7      	clr	21415
 123                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 125  0060 725f53a8      	clr	21416
 126                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 128  0064 725f53a9      	clr	21417
 129                     ; 187 }
 132  0068 81            	ret
 291                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 291                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 291                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 291                     ; 211 {
 292                     .text:	section	.text,new
 293  0000               _DAC_Init:
 295  0000 89            	pushw	x
 296  0001 5203          	subw	sp,#3
 297       00000003      OFST:	set	3
 300                     ; 212   uint8_t tmpreg = 0;
 302                     ; 213   uint16_t tmpreg2 = 0;
 304                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 306                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 308                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 310                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 312  0003 9e            	ld	a,xh
 313  0004 48            	sll	a
 314  0005 5f            	clrw	x
 315  0006 97            	ld	xl,a
 316  0007 1f01          	ldw	(OFST-2,sp),x
 317                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 319  0009 1e01          	ldw	x,(OFST-2,sp)
 320  000b d65380        	ld	a,(21376,x)
 321  000e 6b03          	ld	(OFST+0,sp),a
 322                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 324  0010 7b03          	ld	a,(OFST+0,sp)
 325  0012 a4c1          	and	a,#193
 326  0014 6b03          	ld	(OFST+0,sp),a
 327                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 329  0016 7b03          	ld	a,(OFST+0,sp)
 330  0018 1a08          	or	a,(OFST+5,sp)
 331  001a 6b03          	ld	(OFST+0,sp),a
 332                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 334  001c 7b05          	ld	a,(OFST+2,sp)
 335  001e a130          	cp	a,#48
 336  0020 2708          	jreq	L511
 337                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 339  0022 7b05          	ld	a,(OFST+2,sp)
 340  0024 aa04          	or	a,#4
 341  0026 1a03          	or	a,(OFST+0,sp)
 342  0028 6b03          	ld	(OFST+0,sp),a
 343  002a               L511:
 344                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 346  002a 7b03          	ld	a,(OFST+0,sp)
 347  002c 1e01          	ldw	x,(OFST-2,sp)
 348  002e d75380        	ld	(21376,x),a
 349                     ; 240 }
 352  0031 5b05          	addw	sp,#5
 353  0033 81            	ret
 427                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 427                     ; 255 {
 428                     .text:	section	.text,new
 429  0000               _DAC_Cmd:
 431  0000 89            	pushw	x
 432  0001 89            	pushw	x
 433       00000002      OFST:	set	2
 436                     ; 256   uint16_t cr1addr = 0;
 438                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 440                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 442                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 444  0002 9e            	ld	a,xh
 445  0003 48            	sll	a
 446  0004 5f            	clrw	x
 447  0005 97            	ld	xl,a
 448  0006 1c5380        	addw	x,#21376
 449  0009 1f01          	ldw	(OFST-1,sp),x
 450                     ; 264   if (NewState != DISABLE)
 452  000b 0d04          	tnz	(OFST+2,sp)
 453  000d 2708          	jreq	L551
 454                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 456  000f 1e01          	ldw	x,(OFST-1,sp)
 457  0011 f6            	ld	a,(x)
 458  0012 aa01          	or	a,#1
 459  0014 f7            	ld	(x),a
 461  0015 2006          	jra	L751
 462  0017               L551:
 463                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 465  0017 1e01          	ldw	x,(OFST-1,sp)
 466  0019 f6            	ld	a,(x)
 467  001a a4fe          	and	a,#254
 468  001c f7            	ld	(x),a
 469  001d               L751:
 470                     ; 274 }
 473  001d 5b04          	addw	sp,#4
 474  001f 81            	ret
 520                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 520                     ; 287 {
 521                     .text:	section	.text,new
 522  0000               _DAC_SoftwareTriggerCmd:
 524  0000 89            	pushw	x
 525       00000000      OFST:	set	0
 528                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 530                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 532                     ; 292   if (NewState != DISABLE)
 534  0001 9f            	ld	a,xl
 535  0002 4d            	tnz	a
 536  0003 2714          	jreq	L302
 537                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 539  0005 9e            	ld	a,xh
 540  0006 5f            	clrw	x
 541  0007 97            	ld	xl,a
 542  0008 a601          	ld	a,#1
 543  000a 5d            	tnzw	x
 544  000b 2704          	jreq	L41
 545  000d               L61:
 546  000d 48            	sll	a
 547  000e 5a            	decw	x
 548  000f 26fc          	jrne	L61
 549  0011               L41:
 550  0011 ca5384        	or	a,21380
 551  0014 c75384        	ld	21380,a
 553  0017 2014          	jra	L502
 554  0019               L302:
 555                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 557  0019 7b01          	ld	a,(OFST+1,sp)
 558  001b 5f            	clrw	x
 559  001c 97            	ld	xl,a
 560  001d a601          	ld	a,#1
 561  001f 5d            	tnzw	x
 562  0020 2704          	jreq	L02
 563  0022               L22:
 564  0022 48            	sll	a
 565  0023 5a            	decw	x
 566  0024 26fc          	jrne	L22
 567  0026               L02:
 568  0026 43            	cpl	a
 569  0027 c45384        	and	a,21380
 570  002a c75384        	ld	21380,a
 571  002d               L502:
 572                     ; 302 }
 575  002d 85            	popw	x
 576  002e 81            	ret
 612                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 612                     ; 312 {
 613                     .text:	section	.text,new
 614  0000               _DAC_DualSoftwareTriggerCmd:
 618                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 620                     ; 316   if (NewState != DISABLE)
 622  0000 4d            	tnz	a
 623  0001 270a          	jreq	L522
 624                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 626  0003 c65384        	ld	a,21380
 627  0006 aa03          	or	a,#3
 628  0008 c75384        	ld	21380,a
 630  000b 2008          	jra	L722
 631  000d               L522:
 632                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 634  000d c65384        	ld	a,21380
 635  0010 a4fc          	and	a,#252
 636  0012 c75384        	ld	21380,a
 637  0015               L722:
 638                     ; 326 }
 641  0015 81            	ret
 726                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 726                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 726                     ; 344                            FunctionalState NewState)
 726                     ; 345 {
 727                     .text:	section	.text,new
 728  0000               _DAC_WaveGenerationCmd:
 730  0000 89            	pushw	x
 731  0001 88            	push	a
 732       00000001      OFST:	set	1
 735                     ; 346   uint8_t tmpreg = 0;
 737                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 739                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 741                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 743                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 745  0002 9e            	ld	a,xh
 746  0003 48            	sll	a
 747  0004 5f            	clrw	x
 748  0005 97            	ld	xl,a
 749  0006 d65380        	ld	a,(21376,x)
 750  0009 a43f          	and	a,#63
 751  000b 6b01          	ld	(OFST+0,sp),a
 752                     ; 356   if (NewState != DISABLE)
 754  000d 0d06          	tnz	(OFST+5,sp)
 755  000f 2706          	jreq	L372
 756                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 758  0011 7b01          	ld	a,(OFST+0,sp)
 759  0013 1a03          	or	a,(OFST+2,sp)
 760  0015 6b01          	ld	(OFST+0,sp),a
 761  0017               L372:
 762                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 764  0017 7b02          	ld	a,(OFST+1,sp)
 765  0019 48            	sll	a
 766  001a 5f            	clrw	x
 767  001b 97            	ld	xl,a
 768  001c 7b01          	ld	a,(OFST+0,sp)
 769  001e d75380        	ld	(21376,x),a
 770                     ; 364 }
 773  0021 5b03          	addw	sp,#3
 774  0023 81            	ret
 940                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 940                     ; 389 {
 941                     .text:	section	.text,new
 942  0000               _DAC_SetNoiseWaveLFSR:
 944  0000 89            	pushw	x
 945  0001 5203          	subw	sp,#3
 946       00000003      OFST:	set	3
 949                     ; 390   uint8_t tmpreg = 0;
 951                     ; 391   uint16_t cr2addr = 0;
 953                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 955                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 957                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 959  0003 9e            	ld	a,xh
 960  0004 48            	sll	a
 961  0005 5f            	clrw	x
 962  0006 97            	ld	xl,a
 963  0007 1c5381        	addw	x,#21377
 964  000a 1f02          	ldw	(OFST-1,sp),x
 965                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 967  000c 1e02          	ldw	x,(OFST-1,sp)
 968  000e f6            	ld	a,(x)
 969  000f a4f0          	and	a,#240
 970  0011 6b01          	ld	(OFST-2,sp),a
 971                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 973  0013 7b01          	ld	a,(OFST-2,sp)
 974  0015 1a05          	or	a,(OFST+2,sp)
 975  0017 1e02          	ldw	x,(OFST-1,sp)
 976  0019 f7            	ld	(x),a
 977                     ; 403 }
 980  001a 5b05          	addw	sp,#5
 981  001c 81            	ret
1148                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1148                     ; 428 {
1149                     .text:	section	.text,new
1150  0000               _DAC_SetTriangleWaveAmplitude:
1152  0000 89            	pushw	x
1153  0001 5203          	subw	sp,#3
1154       00000003      OFST:	set	3
1157                     ; 429   uint8_t tmpreg = 0;
1159                     ; 430   uint16_t cr2addr = 0;
1161                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1163                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1165                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1167  0003 9e            	ld	a,xh
1168  0004 48            	sll	a
1169  0005 5f            	clrw	x
1170  0006 97            	ld	xl,a
1171  0007 1c5381        	addw	x,#21377
1172  000a 1f02          	ldw	(OFST-1,sp),x
1173                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1175  000c 1e02          	ldw	x,(OFST-1,sp)
1176  000e f6            	ld	a,(x)
1177  000f a4f0          	and	a,#240
1178  0011 6b01          	ld	(OFST-2,sp),a
1179                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1181  0013 7b01          	ld	a,(OFST-2,sp)
1182  0015 1a05          	or	a,(OFST+2,sp)
1183  0017 1e02          	ldw	x,(OFST-1,sp)
1184  0019 f7            	ld	(x),a
1185                     ; 443 }
1188  001a 5b05          	addw	sp,#5
1189  001c 81            	ret
1261                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1261                     ; 456 {
1262                     .text:	section	.text,new
1263  0000               _DAC_SetChannel1Data:
1265  0000 88            	push	a
1266       00000000      OFST:	set	0
1269                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1271                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1273  0001 a108          	cp	a,#8
1274  0003 2712          	jreq	L505
1275                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1277  0005 5f            	clrw	x
1278  0006 97            	ld	xl,a
1279  0007 7b04          	ld	a,(OFST+4,sp)
1280  0009 d75388        	ld	(21384,x),a
1281                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1283  000c 7b01          	ld	a,(OFST+1,sp)
1284  000e 5f            	clrw	x
1285  000f 97            	ld	xl,a
1286  0010 7b05          	ld	a,(OFST+5,sp)
1287  0012 d75389        	ld	(21385,x),a
1289  0015 2005          	jra	L705
1290  0017               L505:
1291                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1293                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1295  0017 7b05          	ld	a,(OFST+5,sp)
1296  0019 c75390        	ld	21392,a
1297  001c               L705:
1298                     ; 474 }
1301  001c 84            	pop	a
1302  001d 81            	ret
1347                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1347                     ; 487 {
1348                     .text:	section	.text,new
1349  0000               _DAC_SetChannel2Data:
1351  0000 88            	push	a
1352       00000000      OFST:	set	0
1355                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1357                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1359  0001 a108          	cp	a,#8
1360  0003 2712          	jreq	L335
1361                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1363  0005 5f            	clrw	x
1364  0006 97            	ld	xl,a
1365  0007 7b04          	ld	a,(OFST+4,sp)
1366  0009 d75394        	ld	(21396,x),a
1367                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1369  000c 7b01          	ld	a,(OFST+1,sp)
1370  000e 5f            	clrw	x
1371  000f 97            	ld	xl,a
1372  0010 7b05          	ld	a,(OFST+5,sp)
1373  0012 d75395        	ld	(21397,x),a
1375  0015 2005          	jra	L535
1376  0017               L335:
1377                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1379                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1381  0017 7b05          	ld	a,(OFST+5,sp)
1382  0019 c7539c        	ld	21404,a
1383  001c               L535:
1384                     ; 505 }
1387  001c 84            	pop	a
1388  001d 81            	ret
1451                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1451                     ; 523 {
1452                     .text:	section	.text,new
1453  0000               _DAC_SetDualChannelData:
1455  0000 88            	push	a
1456  0001 89            	pushw	x
1457       00000002      OFST:	set	2
1460                     ; 524   uint16_t dchxrdhrhaddr = 0;
1462                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1464                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1466  0002 a108          	cp	a,#8
1467  0004 2727          	jreq	L175
1468                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1470  0006 a653          	ld	a,#83
1471  0008 97            	ld	xl,a
1472  0009 a6a0          	ld	a,#160
1473  000b 1b03          	add	a,(OFST+1,sp)
1474  000d 2401          	jrnc	L24
1475  000f 5c            	incw	x
1476  0010               L24:
1477  0010 02            	rlwa	x,a
1478  0011 1f01          	ldw	(OFST-1,sp),x
1479  0013 01            	rrwa	x,a
1480                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1482  0014 7b08          	ld	a,(OFST+6,sp)
1483  0016 1e01          	ldw	x,(OFST-1,sp)
1484  0018 f7            	ld	(x),a
1485                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1487  0019 7b09          	ld	a,(OFST+7,sp)
1488  001b 1e01          	ldw	x,(OFST-1,sp)
1489  001d e701          	ld	(1,x),a
1490                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1492  001f 7b06          	ld	a,(OFST+4,sp)
1493  0021 1e01          	ldw	x,(OFST-1,sp)
1494  0023 e702          	ld	(2,x),a
1495                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1497  0025 7b07          	ld	a,(OFST+5,sp)
1498  0027 1e01          	ldw	x,(OFST-1,sp)
1499  0029 e703          	ld	(3,x),a
1501  002b 200a          	jra	L375
1502  002d               L175:
1503                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1505                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1507  002d 7b09          	ld	a,(OFST+7,sp)
1508  002f c753a8        	ld	21416,a
1509                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1511  0032 7b07          	ld	a,(OFST+5,sp)
1512  0034 c753a9        	ld	21417,a
1513  0037               L375:
1514                     ; 549 }
1517  0037 5b03          	addw	sp,#3
1518  0039 81            	ret
1572                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1572                     ; 560 {
1573                     .text:	section	.text,new
1574  0000               _DAC_GetDataOutputValue:
1576  0000 89            	pushw	x
1577       00000002      OFST:	set	2
1580                     ; 561   uint16_t outputdata = 0;
1582                     ; 562   uint16_t tmp = 0;
1584                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1586                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1588  0001 4d            	tnz	a
1589  0002 2619          	jrne	L326
1590                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1592  0004 c653ac        	ld	a,21420
1593  0007 5f            	clrw	x
1594  0008 97            	ld	xl,a
1595  0009 4f            	clr	a
1596  000a 02            	rlwa	x,a
1597  000b 1f01          	ldw	(OFST-1,sp),x
1598                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1600  000d c653ad        	ld	a,21421
1601  0010 5f            	clrw	x
1602  0011 97            	ld	xl,a
1603  0012 01            	rrwa	x,a
1604  0013 1a02          	or	a,(OFST+0,sp)
1605  0015 01            	rrwa	x,a
1606  0016 1a01          	or	a,(OFST-1,sp)
1607  0018 01            	rrwa	x,a
1608  0019 1f01          	ldw	(OFST-1,sp),x
1610  001b 2017          	jra	L526
1611  001d               L326:
1612                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1614  001d c653b0        	ld	a,21424
1615  0020 5f            	clrw	x
1616  0021 97            	ld	xl,a
1617  0022 4f            	clr	a
1618  0023 02            	rlwa	x,a
1619  0024 1f01          	ldw	(OFST-1,sp),x
1620                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1622  0026 c653b1        	ld	a,21425
1623  0029 5f            	clrw	x
1624  002a 97            	ld	xl,a
1625  002b 01            	rrwa	x,a
1626  002c 1a02          	or	a,(OFST+0,sp)
1627  002e 01            	rrwa	x,a
1628  002f 1a01          	or	a,(OFST-1,sp)
1629  0031 01            	rrwa	x,a
1630  0032 1f01          	ldw	(OFST-1,sp),x
1631  0034               L526:
1632                     ; 581   return (uint16_t)outputdata;
1634  0034 1e01          	ldw	x,(OFST-1,sp)
1637  0036 5b02          	addw	sp,#2
1638  0038 81            	ret
1692                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1692                     ; 614 {
1693                     .text:	section	.text,new
1694  0000               _DAC_DMACmd:
1696  0000 89            	pushw	x
1697  0001 89            	pushw	x
1698       00000002      OFST:	set	2
1701                     ; 615   uint16_t cr2addr = 0;
1703                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1705                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1707                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1709  0002 9e            	ld	a,xh
1710  0003 48            	sll	a
1711  0004 5f            	clrw	x
1712  0005 97            	ld	xl,a
1713  0006 1c5381        	addw	x,#21377
1714  0009 1f01          	ldw	(OFST-1,sp),x
1715                     ; 624   if (NewState != DISABLE)
1717  000b 0d04          	tnz	(OFST+2,sp)
1718  000d 2708          	jreq	L556
1719                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1721  000f 1e01          	ldw	x,(OFST-1,sp)
1722  0011 f6            	ld	a,(x)
1723  0012 aa10          	or	a,#16
1724  0014 f7            	ld	(x),a
1726  0015 2006          	jra	L756
1727  0017               L556:
1728                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1730  0017 1e01          	ldw	x,(OFST-1,sp)
1731  0019 f6            	ld	a,(x)
1732  001a a4ef          	and	a,#239
1733  001c f7            	ld	(x),a
1734  001d               L756:
1735                     ; 634 }
1738  001d 5b04          	addw	sp,#4
1739  001f 81            	ret
1816                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1816                     ; 668 {
1817                     .text:	section	.text,new
1818  0000               _DAC_ITConfig:
1820  0000 89            	pushw	x
1821  0001 89            	pushw	x
1822       00000002      OFST:	set	2
1825                     ; 669   uint16_t cr2addr = 0;
1827                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1829                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1831                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1833                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1835  0002 9e            	ld	a,xh
1836  0003 48            	sll	a
1837  0004 5f            	clrw	x
1838  0005 97            	ld	xl,a
1839  0006 1c5381        	addw	x,#21377
1840  0009 1f01          	ldw	(OFST-1,sp),x
1841                     ; 679   if (NewState != DISABLE)
1843  000b 0d07          	tnz	(OFST+5,sp)
1844  000d 2708          	jreq	L127
1845                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1847  000f 1e01          	ldw	x,(OFST-1,sp)
1848  0011 f6            	ld	a,(x)
1849  0012 1a04          	or	a,(OFST+2,sp)
1850  0014 f7            	ld	(x),a
1852  0015 2007          	jra	L327
1853  0017               L127:
1854                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1856  0017 1e01          	ldw	x,(OFST-1,sp)
1857  0019 7b04          	ld	a,(OFST+2,sp)
1858  001b 43            	cpl	a
1859  001c f4            	and	a,(x)
1860  001d f7            	ld	(x),a
1861  001e               L327:
1862                     ; 689 }
1865  001e 5b04          	addw	sp,#4
1866  0020 81            	ret
1964                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1964                     ; 705 {
1965                     .text:	section	.text,new
1966  0000               _DAC_GetFlagStatus:
1968  0000 89            	pushw	x
1969  0001 88            	push	a
1970       00000001      OFST:	set	1
1973                     ; 706   FlagStatus flagstatus = RESET;
1975                     ; 707   uint8_t flag = 0;
1977                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1979                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1981                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1983  0002 9e            	ld	a,xh
1984  0003 5f            	clrw	x
1985  0004 97            	ld	xl,a
1986  0005 7b03          	ld	a,(OFST+2,sp)
1987  0007 5d            	tnzw	x
1988  0008 2704          	jreq	L45
1989  000a               L65:
1990  000a 48            	sll	a
1991  000b 5a            	decw	x
1992  000c 26fc          	jrne	L65
1993  000e               L45:
1994  000e 6b01          	ld	(OFST+0,sp),a
1995                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1997  0010 c65385        	ld	a,21381
1998  0013 1501          	bcp	a,(OFST+0,sp)
1999  0015 2706          	jreq	L577
2000                     ; 719     flagstatus = SET;
2002  0017 a601          	ld	a,#1
2003  0019 6b01          	ld	(OFST+0,sp),a
2005  001b 2002          	jra	L777
2006  001d               L577:
2007                     ; 724     flagstatus = RESET;
2009  001d 0f01          	clr	(OFST+0,sp)
2010  001f               L777:
2011                     ; 728   return  flagstatus;
2013  001f 7b01          	ld	a,(OFST+0,sp)
2016  0021 5b03          	addw	sp,#3
2017  0023 81            	ret
2071                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2071                     ; 743 {
2072                     .text:	section	.text,new
2073  0000               _DAC_ClearFlag:
2075  0000 89            	pushw	x
2076  0001 88            	push	a
2077       00000001      OFST:	set	1
2080                     ; 744   uint8_t flag = 0;
2082                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2084                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2086                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2088  0002 9e            	ld	a,xh
2089  0003 5f            	clrw	x
2090  0004 97            	ld	xl,a
2091  0005 7b03          	ld	a,(OFST+2,sp)
2092  0007 5d            	tnzw	x
2093  0008 2704          	jreq	L26
2094  000a               L46:
2095  000a 48            	sll	a
2096  000b 5a            	decw	x
2097  000c 26fc          	jrne	L46
2098  000e               L26:
2099  000e 6b01          	ld	(OFST+0,sp),a
2100                     ; 754   DAC->SR = (uint8_t)(~flag);
2102  0010 7b01          	ld	a,(OFST+0,sp)
2103  0012 43            	cpl	a
2104  0013 c75385        	ld	21381,a
2105                     ; 755 }
2108  0016 5b03          	addw	sp,#3
2109  0018 81            	ret
2192                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2192                     ; 771 {
2193                     .text:	section	.text,new
2194  0000               _DAC_GetITStatus:
2196  0000 89            	pushw	x
2197  0001 89            	pushw	x
2198       00000002      OFST:	set	2
2201                     ; 772   ITStatus itstatus = RESET;
2203                     ; 773   uint8_t enablestatus = 0;
2205                     ; 774   uint8_t flagstatus = 0;
2207                     ; 775   uint8_t tempreg = 0;
2209                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2211                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2213                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2215  0002 9e            	ld	a,xh
2216  0003 48            	sll	a
2217  0004 48            	sll	a
2218  0005 5f            	clrw	x
2219  0006 97            	ld	xl,a
2220  0007 d65381        	ld	a,(21377,x)
2221  000a 6b02          	ld	(OFST+0,sp),a
2222                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2224  000c 7b03          	ld	a,(OFST+1,sp)
2225  000e 5f            	clrw	x
2226  000f 97            	ld	xl,a
2227  0010 7b04          	ld	a,(OFST+2,sp)
2228  0012 5d            	tnzw	x
2229  0013 2704          	jreq	L07
2230  0015               L27:
2231  0015 48            	sll	a
2232  0016 5a            	decw	x
2233  0017 26fc          	jrne	L27
2234  0019               L07:
2235  0019 1402          	and	a,(OFST+0,sp)
2236  001b 6b01          	ld	(OFST-1,sp),a
2237                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2239  001d a605          	ld	a,#5
2240  001f 1003          	sub	a,(OFST+1,sp)
2241  0021 5f            	clrw	x
2242  0022 97            	ld	xl,a
2243  0023 7b04          	ld	a,(OFST+2,sp)
2244  0025 5d            	tnzw	x
2245  0026 2704          	jreq	L47
2246  0028               L67:
2247  0028 44            	srl	a
2248  0029 5a            	decw	x
2249  002a 26fc          	jrne	L67
2250  002c               L47:
2251  002c c45385        	and	a,21381
2252  002f 6b02          	ld	(OFST+0,sp),a
2253                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2255  0031 0d02          	tnz	(OFST+0,sp)
2256  0033 270a          	jreq	L1701
2258  0035 0d01          	tnz	(OFST-1,sp)
2259  0037 2706          	jreq	L1701
2260                     ; 790     itstatus = SET;
2262  0039 a601          	ld	a,#1
2263  003b 6b02          	ld	(OFST+0,sp),a
2265  003d 2002          	jra	L3701
2266  003f               L1701:
2267                     ; 795     itstatus = RESET;
2269  003f 0f02          	clr	(OFST+0,sp)
2270  0041               L3701:
2271                     ; 799   return  itstatus;
2273  0041 7b02          	ld	a,(OFST+0,sp)
2276  0043 5b04          	addw	sp,#4
2277  0045 81            	ret
2323                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2323                     ; 814 {
2324                     .text:	section	.text,new
2325  0000               _DAC_ClearITPendingBit:
2327  0000 89            	pushw	x
2328       00000000      OFST:	set	0
2331                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2333                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2335                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2337  0001 9e            	ld	a,xh
2338  0002 a005          	sub	a,#5
2339  0004 40            	neg	a
2340  0005 5f            	clrw	x
2341  0006 97            	ld	xl,a
2342  0007 7b02          	ld	a,(OFST+2,sp)
2343  0009 5d            	tnzw	x
2344  000a 2704          	jreq	L201
2345  000c               L401:
2346  000c 44            	srl	a
2347  000d 5a            	decw	x
2348  000e 26fc          	jrne	L401
2349  0010               L201:
2350  0010 43            	cpl	a
2351  0011 c75385        	ld	21381,a
2352                     ; 821 }
2355  0014 85            	popw	x
2356  0015 81            	ret
2369                     	xdef	_DAC_ClearITPendingBit
2370                     	xdef	_DAC_GetITStatus
2371                     	xdef	_DAC_ClearFlag
2372                     	xdef	_DAC_GetFlagStatus
2373                     	xdef	_DAC_ITConfig
2374                     	xdef	_DAC_DMACmd
2375                     	xdef	_DAC_GetDataOutputValue
2376                     	xdef	_DAC_SetDualChannelData
2377                     	xdef	_DAC_SetChannel2Data
2378                     	xdef	_DAC_SetChannel1Data
2379                     	xdef	_DAC_SetTriangleWaveAmplitude
2380                     	xdef	_DAC_SetNoiseWaveLFSR
2381                     	xdef	_DAC_WaveGenerationCmd
2382                     	xdef	_DAC_DualSoftwareTriggerCmd
2383                     	xdef	_DAC_SoftwareTriggerCmd
2384                     	xdef	_DAC_Cmd
2385                     	xdef	_DAC_Init
2386                     	xdef	_DAC_DeInit
2405                     	end
