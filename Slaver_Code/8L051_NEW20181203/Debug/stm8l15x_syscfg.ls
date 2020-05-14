   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 119 void SYSCFG_RIDeInit(void)
  44                     ; 120 {
  46                     .text:	section	.text,new
  47  0000               _SYSCFG_RIDeInit:
  51                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  53  0000 725f5431      	clr	21553
  54                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  56  0004 725f5432      	clr	21554
  57                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  59  0008 725f5439      	clr	21561
  60                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  62  000c 725f543a      	clr	21562
  63                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  65  0010 725f543b      	clr	21563
  66                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  68  0014 725f5457      	clr	21591
  69                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  71  0018 725f543d      	clr	21565
  72                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  74  001c 725f543e      	clr	21566
  75                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  77  0020 725f543f      	clr	21567
  78                     ; 130 }
  81  0024 81            	ret
 340                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 340                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 340                     ; 144 {
 341                     .text:	section	.text,new
 342  0000               _SYSCFG_RITIMInputCaptureConfig:
 344  0000 89            	pushw	x
 345       00000000      OFST:	set	0
 348                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 350                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 352                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 354  0001 9e            	ld	a,xh
 355  0002 a102          	cp	a,#2
 356  0004 2606          	jrne	L531
 357                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 359  0006 9f            	ld	a,xl
 360  0007 c75431        	ld	21553,a
 362  000a 2005          	jra	L731
 363  000c               L531:
 364                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 366  000c 7b02          	ld	a,(OFST+2,sp)
 367  000e c75432        	ld	21554,a
 368  0011               L731:
 369                     ; 161 }
 372  0011 85            	popw	x
 373  0012 81            	ret
 555                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 555                     ; 185                                  FunctionalState NewState)
 555                     ; 186 {
 556                     .text:	section	.text,new
 557  0000               _SYSCFG_RIAnalogSwitchConfig:
 559  0000 89            	pushw	x
 560  0001 89            	pushw	x
 561       00000002      OFST:	set	2
 564                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 566                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 568                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 570                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 572  0002 9e            	ld	a,xh
 573  0003 a4f0          	and	a,#240
 574  0005 6b01          	ld	(OFST-1,sp),a
 575                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 577  0007 7b03          	ld	a,(OFST+1,sp)
 578  0009 a40f          	and	a,#15
 579  000b 6b02          	ld	(OFST+0,sp),a
 580                     ; 199   if (NewState != DISABLE)
 582  000d 0d04          	tnz	(OFST+2,sp)
 583  000f 2730          	jreq	L142
 584                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 586  0011 7b01          	ld	a,(OFST-1,sp)
 587  0013 a110          	cp	a,#16
 588  0015 2615          	jrne	L342
 589                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 591  0017 7b02          	ld	a,(OFST+0,sp)
 592  0019 5f            	clrw	x
 593  001a 97            	ld	xl,a
 594  001b a601          	ld	a,#1
 595  001d 5d            	tnzw	x
 596  001e 2704          	jreq	L21
 597  0020               L41:
 598  0020 48            	sll	a
 599  0021 5a            	decw	x
 600  0022 26fc          	jrne	L41
 601  0024               L21:
 602  0024 ca543d        	or	a,21565
 603  0027 c7543d        	ld	21565,a
 605  002a 2045          	jra	L742
 606  002c               L342:
 607                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 609  002c 7b02          	ld	a,(OFST+0,sp)
 610  002e 5f            	clrw	x
 611  002f 97            	ld	xl,a
 612  0030 a601          	ld	a,#1
 613  0032 5d            	tnzw	x
 614  0033 2704          	jreq	L61
 615  0035               L02:
 616  0035 48            	sll	a
 617  0036 5a            	decw	x
 618  0037 26fc          	jrne	L02
 619  0039               L61:
 620  0039 ca543e        	or	a,21566
 621  003c c7543e        	ld	21566,a
 622  003f 2030          	jra	L742
 623  0041               L142:
 624                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 626  0041 7b01          	ld	a,(OFST-1,sp)
 627  0043 a110          	cp	a,#16
 628  0045 2616          	jrne	L152
 629                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 631  0047 7b02          	ld	a,(OFST+0,sp)
 632  0049 5f            	clrw	x
 633  004a 97            	ld	xl,a
 634  004b a601          	ld	a,#1
 635  004d 5d            	tnzw	x
 636  004e 2704          	jreq	L22
 637  0050               L42:
 638  0050 48            	sll	a
 639  0051 5a            	decw	x
 640  0052 26fc          	jrne	L42
 641  0054               L22:
 642  0054 43            	cpl	a
 643  0055 c4543d        	and	a,21565
 644  0058 c7543d        	ld	21565,a
 646  005b 2014          	jra	L742
 647  005d               L152:
 648                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 650  005d 7b02          	ld	a,(OFST+0,sp)
 651  005f 5f            	clrw	x
 652  0060 97            	ld	xl,a
 653  0061 a601          	ld	a,#1
 654  0063 5d            	tnzw	x
 655  0064 2704          	jreq	L62
 656  0066               L03:
 657  0066 48            	sll	a
 658  0067 5a            	decw	x
 659  0068 26fc          	jrne	L03
 660  006a               L62:
 661  006a 43            	cpl	a
 662  006b c4543e        	and	a,21566
 663  006e c7543e        	ld	21566,a
 664  0071               L742:
 665                     ; 225 }
 668  0071 5b04          	addw	sp,#4
 669  0073 81            	ret
 935                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 935                     ; 235                              FunctionalState NewState)
 935                     ; 236 {
 936                     .text:	section	.text,new
 937  0000               _SYSCFG_RIIOSwitchConfig:
 939  0000 89            	pushw	x
 940  0001 89            	pushw	x
 941       00000002      OFST:	set	2
 944                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 946                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 948                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 950                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 952  0002 9e            	ld	a,xh
 953  0003 a40f          	and	a,#15
 954  0005 6b02          	ld	(OFST+0,sp),a
 955                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 957  0007 7b03          	ld	a,(OFST+1,sp)
 958  0009 a4f0          	and	a,#240
 959  000b 6b01          	ld	(OFST-1,sp),a
 960                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 962  000d 7b01          	ld	a,(OFST-1,sp)
 963  000f a110          	cp	a,#16
 964  0011 2633          	jrne	L304
 965                     ; 252     if (NewState != DISABLE)
 967  0013 0d04          	tnz	(OFST+2,sp)
 968  0015 2717          	jreq	L504
 969                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 971  0017 7b02          	ld	a,(OFST+0,sp)
 972  0019 5f            	clrw	x
 973  001a 97            	ld	xl,a
 974  001b a601          	ld	a,#1
 975  001d 5d            	tnzw	x
 976  001e 2704          	jreq	L43
 977  0020               L63:
 978  0020 48            	sll	a
 979  0021 5a            	decw	x
 980  0022 26fc          	jrne	L63
 981  0024               L43:
 982  0024 ca5439        	or	a,21561
 983  0027 c75439        	ld	21561,a
 985  002a acdd00dd      	jpf	L114
 986  002e               L504:
 987                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 989  002e 7b02          	ld	a,(OFST+0,sp)
 990  0030 5f            	clrw	x
 991  0031 97            	ld	xl,a
 992  0032 a601          	ld	a,#1
 993  0034 5d            	tnzw	x
 994  0035 2704          	jreq	L04
 995  0037               L24:
 996  0037 48            	sll	a
 997  0038 5a            	decw	x
 998  0039 26fc          	jrne	L24
 999  003b               L04:
1000  003b 43            	cpl	a
1001  003c c45439        	and	a,21561
1002  003f c75439        	ld	21561,a
1003  0042 acdd00dd      	jpf	L114
1004  0046               L304:
1005                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1007  0046 7b01          	ld	a,(OFST-1,sp)
1008  0048 a120          	cp	a,#32
1009  004a 262f          	jrne	L314
1010                     ; 267     if (NewState != DISABLE)
1012  004c 0d04          	tnz	(OFST+2,sp)
1013  004e 2715          	jreq	L514
1014                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1016  0050 7b02          	ld	a,(OFST+0,sp)
1017  0052 5f            	clrw	x
1018  0053 97            	ld	xl,a
1019  0054 a601          	ld	a,#1
1020  0056 5d            	tnzw	x
1021  0057 2704          	jreq	L44
1022  0059               L64:
1023  0059 48            	sll	a
1024  005a 5a            	decw	x
1025  005b 26fc          	jrne	L64
1026  005d               L44:
1027  005d ca543a        	or	a,21562
1028  0060 c7543a        	ld	21562,a
1030  0063 2078          	jra	L114
1031  0065               L514:
1032                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1034  0065 7b02          	ld	a,(OFST+0,sp)
1035  0067 5f            	clrw	x
1036  0068 97            	ld	xl,a
1037  0069 a601          	ld	a,#1
1038  006b 5d            	tnzw	x
1039  006c 2704          	jreq	L05
1040  006e               L25:
1041  006e 48            	sll	a
1042  006f 5a            	decw	x
1043  0070 26fc          	jrne	L25
1044  0072               L05:
1045  0072 43            	cpl	a
1046  0073 c4543a        	and	a,21562
1047  0076 c7543a        	ld	21562,a
1048  0079 2062          	jra	L114
1049  007b               L314:
1050                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1052  007b 7b01          	ld	a,(OFST-1,sp)
1053  007d a130          	cp	a,#48
1054  007f 262f          	jrne	L324
1055                     ; 282     if (NewState != DISABLE)
1057  0081 0d04          	tnz	(OFST+2,sp)
1058  0083 2715          	jreq	L524
1059                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1061  0085 7b02          	ld	a,(OFST+0,sp)
1062  0087 5f            	clrw	x
1063  0088 97            	ld	xl,a
1064  0089 a601          	ld	a,#1
1065  008b 5d            	tnzw	x
1066  008c 2704          	jreq	L45
1067  008e               L65:
1068  008e 48            	sll	a
1069  008f 5a            	decw	x
1070  0090 26fc          	jrne	L65
1071  0092               L45:
1072  0092 ca543b        	or	a,21563
1073  0095 c7543b        	ld	21563,a
1075  0098 2043          	jra	L114
1076  009a               L524:
1077                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1079  009a 7b02          	ld	a,(OFST+0,sp)
1080  009c 5f            	clrw	x
1081  009d 97            	ld	xl,a
1082  009e a601          	ld	a,#1
1083  00a0 5d            	tnzw	x
1084  00a1 2704          	jreq	L06
1085  00a3               L26:
1086  00a3 48            	sll	a
1087  00a4 5a            	decw	x
1088  00a5 26fc          	jrne	L26
1089  00a7               L06:
1090  00a7 43            	cpl	a
1091  00a8 c4543b        	and	a,21563
1092  00ab c7543b        	ld	21563,a
1093  00ae 202d          	jra	L114
1094  00b0               L324:
1095                     ; 297     if (NewState != DISABLE)
1097  00b0 0d04          	tnz	(OFST+2,sp)
1098  00b2 2715          	jreq	L334
1099                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1101  00b4 7b02          	ld	a,(OFST+0,sp)
1102  00b6 5f            	clrw	x
1103  00b7 97            	ld	xl,a
1104  00b8 a601          	ld	a,#1
1105  00ba 5d            	tnzw	x
1106  00bb 2704          	jreq	L46
1107  00bd               L66:
1108  00bd 48            	sll	a
1109  00be 5a            	decw	x
1110  00bf 26fc          	jrne	L66
1111  00c1               L46:
1112  00c1 ca5457        	or	a,21591
1113  00c4 c75457        	ld	21591,a
1115  00c7 2014          	jra	L114
1116  00c9               L334:
1117                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1119  00c9 7b02          	ld	a,(OFST+0,sp)
1120  00cb 5f            	clrw	x
1121  00cc 97            	ld	xl,a
1122  00cd a601          	ld	a,#1
1123  00cf 5d            	tnzw	x
1124  00d0 2704          	jreq	L07
1125  00d2               L27:
1126  00d2 48            	sll	a
1127  00d3 5a            	decw	x
1128  00d4 26fc          	jrne	L27
1129  00d6               L07:
1130  00d6 43            	cpl	a
1131  00d7 c45457        	and	a,21591
1132  00da c75457        	ld	21591,a
1133  00dd               L114:
1134                     ; 308 }
1137  00dd 5b04          	addw	sp,#4
1138  00df 81            	ret
1218                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1218                     ; 321 {
1219                     .text:	section	.text,new
1220  0000               _SYSCFG_RIResistorConfig:
1222  0000 89            	pushw	x
1223       00000000      OFST:	set	0
1226                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1228                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1230                     ; 326   if (NewState != DISABLE)
1232  0001 9f            	ld	a,xl
1233  0002 4d            	tnz	a
1234  0003 2709          	jreq	L574
1235                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1237  0005 9e            	ld	a,xh
1238  0006 ca543f        	or	a,21567
1239  0009 c7543f        	ld	21567,a
1241  000c 2009          	jra	L774
1242  000e               L574:
1243                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1245  000e 7b01          	ld	a,(OFST+1,sp)
1246  0010 43            	cpl	a
1247  0011 c4543f        	and	a,21567
1248  0014 c7543f        	ld	21567,a
1249  0017               L774:
1250                     ; 336 }
1253  0017 85            	popw	x
1254  0018 81            	ret
1277                     ; 368 void SYSCFG_REMAPDeInit(void)
1277                     ; 369 {
1278                     .text:	section	.text,new
1279  0000               _SYSCFG_REMAPDeInit:
1283                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1285  0000 350c509e      	mov	20638,#12
1286                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1288  0004 725f509f      	clr	20639
1289                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1291  0008 725f509d      	clr	20637
1292                     ; 378 }
1295  000c 81            	ret
1513                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1513                     ; 412 {
1514                     .text:	section	.text,new
1515  0000               _SYSCFG_REMAPPinConfig:
1517  0000 89            	pushw	x
1518  0001 88            	push	a
1519       00000001      OFST:	set	1
1522                     ; 413   uint8_t regindex = 0;
1524                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1526                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1528                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1530  0002 9e            	ld	a,xh
1531  0003 6b01          	ld	(OFST+0,sp),a
1532                     ; 422   if (regindex == 0x01)
1534  0005 7b01          	ld	a,(OFST+0,sp)
1535  0007 a101          	cp	a,#1
1536  0009 261e          	jrne	L316
1537                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1539  000b 9f            	ld	a,xl
1540  000c 97            	ld	xl,a
1541  000d a610          	ld	a,#16
1542  000f 42            	mul	x,a
1543  0010 9f            	ld	a,xl
1544  0011 aa0f          	or	a,#15
1545  0013 c4509e        	and	a,20638
1546  0016 c7509e        	ld	20638,a
1547                     ; 425     if (NewState != DISABLE)
1549  0019 0d06          	tnz	(OFST+5,sp)
1550  001b 2742          	jreq	L716
1551                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1553  001d 7b03          	ld	a,(OFST+2,sp)
1554  001f a4f0          	and	a,#240
1555  0021 ca509e        	or	a,20638
1556  0024 c7509e        	ld	20638,a
1557  0027 2036          	jra	L716
1558  0029               L316:
1559                     ; 431   else if (regindex == 0x02)
1561  0029 7b01          	ld	a,(OFST+0,sp)
1562  002b a102          	cp	a,#2
1563  002d 2619          	jrne	L126
1564                     ; 433     if (NewState != DISABLE)
1566  002f 0d06          	tnz	(OFST+5,sp)
1567  0031 270a          	jreq	L326
1568                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1570  0033 c6509f        	ld	a,20639
1571  0036 1a03          	or	a,(OFST+2,sp)
1572  0038 c7509f        	ld	20639,a
1574  003b 2022          	jra	L716
1575  003d               L326:
1576                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1578  003d 7b03          	ld	a,(OFST+2,sp)
1579  003f 43            	cpl	a
1580  0040 c4509f        	and	a,20639
1581  0043 c7509f        	ld	20639,a
1582  0046 2017          	jra	L716
1583  0048               L126:
1584                     ; 445     if (NewState != DISABLE)
1586  0048 0d06          	tnz	(OFST+5,sp)
1587  004a 270a          	jreq	L136
1588                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1590  004c c6509d        	ld	a,20637
1591  004f 1a03          	or	a,(OFST+2,sp)
1592  0051 c7509d        	ld	20637,a
1594  0054 2009          	jra	L716
1595  0056               L136:
1596                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1598  0056 7b03          	ld	a,(OFST+2,sp)
1599  0058 43            	cpl	a
1600  0059 c4509d        	and	a,20637
1601  005c c7509d        	ld	20637,a
1602  005f               L716:
1603                     ; 454 }
1606  005f 5b03          	addw	sp,#3
1607  0061 81            	ret
1713                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1713                     ; 471 {
1714                     .text:	section	.text,new
1715  0000               _SYSCFG_REMAPDMAChannelConfig:
1717  0000 88            	push	a
1718       00000000      OFST:	set	0
1721                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1723                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1725  0001 a5f0          	bcp	a,#240
1726  0003 270a          	jreq	L776
1727                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1729  0005 c6509e        	ld	a,20638
1730  0008 a4f3          	and	a,#243
1731  000a c7509e        	ld	20638,a
1733  000d 2008          	jra	L107
1734  000f               L776:
1735                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1737  000f c6509e        	ld	a,20638
1738  0012 a4fc          	and	a,#252
1739  0014 c7509e        	ld	20638,a
1740  0017               L107:
1741                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1743  0017 7b01          	ld	a,(OFST+1,sp)
1744  0019 a40f          	and	a,#15
1745  001b ca509e        	or	a,20638
1746  001e c7509e        	ld	20638,a
1747                     ; 489 }
1750  0021 84            	pop	a
1751  0022 81            	ret
1764                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1765                     	xdef	_SYSCFG_REMAPPinConfig
1766                     	xdef	_SYSCFG_REMAPDeInit
1767                     	xdef	_SYSCFG_RIResistorConfig
1768                     	xdef	_SYSCFG_RIIOSwitchConfig
1769                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1770                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1771                     	xdef	_SYSCFG_RIDeInit
1790                     	end
