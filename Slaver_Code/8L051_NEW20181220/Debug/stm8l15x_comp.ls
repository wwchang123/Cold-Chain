   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 111 void COMP_DeInit(void)
  44                     ; 112 {
  46                     .text:	section	.text,new
  47  0000               _COMP_DeInit:
  51                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  53  0000 725f5440      	clr	21568
  54                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  56  0004 725f5441      	clr	21569
  57                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  59  0008 35c05442      	mov	21570,#192
  60                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  62  000c 725f5443      	clr	21571
  63                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  65  0010 725f5444      	clr	21572
  66                     ; 127 }
  69  0014 81            	ret
 245                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 245                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 245                     ; 155 {
 246                     .text:	section	.text,new
 247  0000               _COMP_Init:
 249  0000 89            	pushw	x
 250       00000000      OFST:	set	0
 253                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 255                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 257                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 259                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 261  0001 c65442        	ld	a,21570
 262  0004 a4c7          	and	a,#199
 263  0006 c75442        	ld	21570,a
 264                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 266  0009 9e            	ld	a,xh
 267  000a ca5442        	or	a,21570
 268  000d c75442        	ld	21570,a
 269                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 271  0010 c65442        	ld	a,21570
 272  0013 a43f          	and	a,#63
 273  0015 c75442        	ld	21570,a
 274                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 276  0018 9f            	ld	a,xl
 277  0019 ca5442        	or	a,21570
 278  001c c75442        	ld	21570,a
 279                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 281  001f 72155441      	bres	21569,#2
 282                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 284  0023 c65441        	ld	a,21569
 285  0026 1a05          	or	a,(OFST+5,sp)
 286  0028 c75441        	ld	21569,a
 287                     ; 175 }
 290  002b 85            	popw	x
 291  002c 81            	ret
 347                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 347                     ; 184 {
 348                     .text:	section	.text,new
 349  0000               _COMP_VrefintToCOMP1Connect:
 353                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 355                     ; 188   if (NewState != DISABLE)
 357  0000 4d            	tnz	a
 358  0001 2706          	jreq	L341
 359                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 361  0003 72145442      	bset	21570,#2
 363  0007 2004          	jra	L541
 364  0009               L341:
 365                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 367  0009 72155442      	bres	21570,#2
 368  000d               L541:
 369                     ; 198 }
 372  000d 81            	ret
 467                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 467                     ; 213 {
 468                     .text:	section	.text,new
 469  0000               _COMP_EdgeConfig:
 471  0000 89            	pushw	x
 472       00000000      OFST:	set	0
 475                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 477                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 479                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 481  0001 9e            	ld	a,xh
 482  0002 a101          	cp	a,#1
 483  0004 2611          	jrne	L312
 484                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 486  0006 c65440        	ld	a,21568
 487  0009 a4fc          	and	a,#252
 488  000b c75440        	ld	21568,a
 489                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 491  000e 9f            	ld	a,xl
 492  000f ca5440        	or	a,21568
 493  0012 c75440        	ld	21568,a
 495  0015 2010          	jra	L512
 496  0017               L312:
 497                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 499  0017 c65441        	ld	a,21569
 500  001a a4fc          	and	a,#252
 501  001c c75441        	ld	21569,a
 502                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 504  001f c65441        	ld	a,21569
 505  0022 1a02          	or	a,(OFST+2,sp)
 506  0024 c75441        	ld	21569,a
 507  0027               L512:
 508                     ; 236 }
 511  0027 85            	popw	x
 512  0028 81            	ret
 580                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 580                     ; 252 {
 581                     .text:	section	.text,new
 582  0000               _COMP_GetOutputLevel:
 584  0000 88            	push	a
 585       00000001      OFST:	set	1
 588                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 590                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 592  0001 a101          	cp	a,#1
 593  0003 2611          	jrne	L152
 594                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 596  0005 c65440        	ld	a,21568
 597  0008 a508          	bcp	a,#8
 598  000a 2706          	jreq	L352
 599                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 601  000c a601          	ld	a,#1
 602  000e 6b01          	ld	(OFST+0,sp),a
 604  0010 2013          	jra	L752
 605  0012               L352:
 606                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 608  0012 0f01          	clr	(OFST+0,sp)
 609  0014 200f          	jra	L752
 610  0016               L152:
 611                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 613  0016 c65441        	ld	a,21569
 614  0019 a508          	bcp	a,#8
 615  001b 2706          	jreq	L162
 616                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 618  001d a601          	ld	a,#1
 619  001f 6b01          	ld	(OFST+0,sp),a
 621  0021 2002          	jra	L752
 622  0023               L162:
 623                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 625  0023 0f01          	clr	(OFST+0,sp)
 626  0025               L752:
 627                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 629  0025 7b01          	ld	a,(OFST+0,sp)
 632  0027 5b01          	addw	sp,#1
 633  0029 81            	ret
 668                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 668                     ; 325 {
 669                     .text:	section	.text,new
 670  0000               _COMP_WindowCmd:
 674                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 676                     ; 329   if (NewState != DISABLE)
 678  0000 4d            	tnz	a
 679  0001 2706          	jreq	L303
 680                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 682  0003 72125442      	bset	21570,#1
 684  0007 2004          	jra	L503
 685  0009               L303:
 686                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 688  0009 72135442      	bres	21570,#1
 689  000d               L503:
 690                     ; 339 }
 693  000d 81            	ret
 729                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 729                     ; 363 {
 730                     .text:	section	.text,new
 731  0000               _COMP_VrefintOutputCmd:
 735                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 737                     ; 367   if (NewState != DISABLE)
 739  0000 4d            	tnz	a
 740  0001 2706          	jreq	L523
 741                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 743  0003 72105442      	bset	21570,#0
 745  0007 2004          	jra	L723
 746  0009               L523:
 747                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 749  0009 72115442      	bres	21570,#0
 750  000d               L723:
 751                     ; 377 }
 754  000d 81            	ret
 790                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 790                     ; 402 {
 791                     .text:	section	.text,new
 792  0000               _COMP_SchmittTriggerCmd:
 796                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 798                     ; 406   if (NewState != DISABLE)
 800  0000 4d            	tnz	a
 801  0001 2706          	jreq	L743
 802                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 804  0003 72145440      	bset	21568,#2
 806  0007 2004          	jra	L153
 807  0009               L743:
 808                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 810  0009 72155440      	bres	21568,#2
 811  000d               L153:
 812                     ; 416 }
 815  000d 81            	ret
 935                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 935                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 935                     ; 437                         FunctionalState NewState)
 935                     ; 438 {
 936                     .text:	section	.text,new
 937  0000               _COMP_TriggerConfig:
 939  0000 89            	pushw	x
 940       00000000      OFST:	set	0
 943                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 945                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 947                     ; 443   switch (COMP_TriggerGroup)
 949  0001 9e            	ld	a,xh
 951                     ; 490     default:
 951                     ; 491       break;
 952  0002 4a            	dec	a
 953  0003 270b          	jreq	L353
 954  0005 4a            	dec	a
 955  0006 2721          	jreq	L553
 956  0008 4a            	dec	a
 957  0009 273d          	jreq	L753
 958  000b 4a            	dec	a
 959  000c 2753          	jreq	L163
 960  000e 206e          	jra	L344
 961  0010               L353:
 962                     ; 445     case COMP_TriggerGroup_InvertingInput:
 962                     ; 446 
 962                     ; 447       if (NewState != DISABLE)
 964  0010 0d05          	tnz	(OFST+5,sp)
 965  0012 270b          	jreq	L544
 966                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 968  0014 7b02          	ld	a,(OFST+2,sp)
 969  0016 43            	cpl	a
 970  0017 c45443        	and	a,21571
 971  001a c75443        	ld	21571,a
 973  001d 205f          	jra	L344
 974  001f               L544:
 975                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 977  001f c65443        	ld	a,21571
 978  0022 1a02          	or	a,(OFST+2,sp)
 979  0024 c75443        	ld	21571,a
 980  0027 2055          	jra	L344
 981  0029               L553:
 982                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 982                     ; 458       if (NewState != DISABLE)
 984  0029 0d05          	tnz	(OFST+5,sp)
 985  002b 270e          	jreq	L154
 986                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 988  002d 7b02          	ld	a,(OFST+2,sp)
 989  002f 48            	sll	a
 990  0030 48            	sll	a
 991  0031 48            	sll	a
 992  0032 43            	cpl	a
 993  0033 c45443        	and	a,21571
 994  0036 c75443        	ld	21571,a
 996  0039 2043          	jra	L344
 997  003b               L154:
 998                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1000  003b 7b02          	ld	a,(OFST+2,sp)
1001  003d 48            	sll	a
1002  003e 48            	sll	a
1003  003f 48            	sll	a
1004  0040 ca5443        	or	a,21571
1005  0043 c75443        	ld	21571,a
1006  0046 2036          	jra	L344
1007  0048               L753:
1008                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1008                     ; 469       if (NewState != DISABLE)
1010  0048 0d05          	tnz	(OFST+5,sp)
1011  004a 270b          	jreq	L554
1012                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1014  004c 7b02          	ld	a,(OFST+2,sp)
1015  004e 43            	cpl	a
1016  004f c45444        	and	a,21572
1017  0052 c75444        	ld	21572,a
1019  0055 2027          	jra	L344
1020  0057               L554:
1021                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1023  0057 c65444        	ld	a,21572
1024  005a 1a02          	or	a,(OFST+2,sp)
1025  005c c75444        	ld	21572,a
1026  005f 201d          	jra	L344
1027  0061               L163:
1028                     ; 479     case COMP_TriggerGroup_DACOutput:
1028                     ; 480       if (NewState != DISABLE)
1030  0061 0d05          	tnz	(OFST+5,sp)
1031  0063 270e          	jreq	L164
1032                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1034  0065 7b02          	ld	a,(OFST+2,sp)
1035  0067 48            	sll	a
1036  0068 48            	sll	a
1037  0069 48            	sll	a
1038  006a 43            	cpl	a
1039  006b c45444        	and	a,21572
1040  006e c75444        	ld	21572,a
1042  0071 200b          	jra	L344
1043  0073               L164:
1044                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1046  0073 7b02          	ld	a,(OFST+2,sp)
1047  0075 48            	sll	a
1048  0076 48            	sll	a
1049  0077 48            	sll	a
1050  0078 ca5444        	or	a,21572
1051  007b c75444        	ld	21572,a
1052  007e               L363:
1053                     ; 490     default:
1053                     ; 491       break;
1055  007e               L344:
1056                     ; 493 }
1059  007e 85            	popw	x
1060  007f 81            	ret
1105                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1105                     ; 522 {
1106                     .text:	section	.text,new
1107  0000               _COMP_ITConfig:
1109  0000 89            	pushw	x
1110       00000000      OFST:	set	0
1113                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1115                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1117                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1119  0001 9e            	ld	a,xh
1120  0002 a101          	cp	a,#1
1121  0004 2610          	jrne	L705
1122                     ; 530     if (NewState != DISABLE)
1124  0006 9f            	ld	a,xl
1125  0007 4d            	tnz	a
1126  0008 2706          	jreq	L115
1127                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1129  000a 721a5440      	bset	21568,#5
1131  000e 2014          	jra	L515
1132  0010               L115:
1133                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1135  0010 721b5440      	bres	21568,#5
1136  0014 200e          	jra	L515
1137  0016               L705:
1138                     ; 543     if (NewState != DISABLE)
1140  0016 0d02          	tnz	(OFST+2,sp)
1141  0018 2706          	jreq	L715
1142                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1144  001a 721a5441      	bset	21569,#5
1146  001e 2004          	jra	L515
1147  0020               L715:
1148                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1150  0020 721b5441      	bres	21569,#5
1151  0024               L515:
1152                     ; 554 }
1155  0024 85            	popw	x
1156  0025 81            	ret
1222                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1222                     ; 565 {
1223                     .text:	section	.text,new
1224  0000               _COMP_GetFlagStatus:
1226  0000 88            	push	a
1227       00000001      OFST:	set	1
1230                     ; 566   FlagStatus bitstatus = RESET;
1232                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1234                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1236  0001 a101          	cp	a,#1
1237  0003 2611          	jrne	L555
1238                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1240  0005 c65440        	ld	a,21568
1241  0008 a510          	bcp	a,#16
1242  000a 2706          	jreq	L755
1243                     ; 577       bitstatus = SET;
1245  000c a601          	ld	a,#1
1246  000e 6b01          	ld	(OFST+0,sp),a
1248  0010 2013          	jra	L365
1249  0012               L755:
1250                     ; 582       bitstatus = RESET;
1252  0012 0f01          	clr	(OFST+0,sp)
1253  0014 200f          	jra	L365
1254  0016               L555:
1255                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1257  0016 c65441        	ld	a,21569
1258  0019 a510          	bcp	a,#16
1259  001b 2706          	jreq	L565
1260                     ; 590       bitstatus = SET;
1262  001d a601          	ld	a,#1
1263  001f 6b01          	ld	(OFST+0,sp),a
1265  0021 2002          	jra	L365
1266  0023               L565:
1267                     ; 595       bitstatus = RESET;
1269  0023 0f01          	clr	(OFST+0,sp)
1270  0025               L365:
1271                     ; 600   return (FlagStatus)(bitstatus);
1273  0025 7b01          	ld	a,(OFST+0,sp)
1276  0027 5b01          	addw	sp,#1
1277  0029 81            	ret
1312                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1312                     ; 612 {
1313                     .text:	section	.text,new
1314  0000               _COMP_ClearFlag:
1318                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1320                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1322  0000 a101          	cp	a,#1
1323  0002 2606          	jrne	L706
1324                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1326  0004 72195440      	bres	21568,#4
1328  0008 2004          	jra	L116
1329  000a               L706:
1330                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1332  000a 72195441      	bres	21569,#4
1333  000e               L116:
1334                     ; 626 }
1337  000e 81            	ret
1401                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1401                     ; 637 {
1402                     .text:	section	.text,new
1403  0000               _COMP_GetITStatus:
1405  0000 89            	pushw	x
1406       00000002      OFST:	set	2
1409                     ; 638   ITStatus bitstatus = RESET;
1411                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1415                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1417                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1419  0001 a101          	cp	a,#1
1420  0003 2620          	jrne	L546
1421                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1423  0005 c65440        	ld	a,21568
1424  0008 a410          	and	a,#16
1425  000a 6b01          	ld	(OFST-1,sp),a
1426                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1428  000c c65440        	ld	a,21568
1429  000f a420          	and	a,#32
1430  0011 6b02          	ld	(OFST+0,sp),a
1431                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1433  0013 0d01          	tnz	(OFST-1,sp)
1434  0015 270a          	jreq	L746
1436  0017 0d02          	tnz	(OFST+0,sp)
1437  0019 2706          	jreq	L746
1438                     ; 655       bitstatus = SET;
1440  001b a601          	ld	a,#1
1441  001d 6b02          	ld	(OFST+0,sp),a
1443  001f 2022          	jra	L356
1444  0021               L746:
1445                     ; 660       bitstatus = RESET;
1447  0021 0f02          	clr	(OFST+0,sp)
1448  0023 201e          	jra	L356
1449  0025               L546:
1450                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1452  0025 c65441        	ld	a,21569
1453  0028 a410          	and	a,#16
1454  002a 6b01          	ld	(OFST-1,sp),a
1455                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1457  002c c65441        	ld	a,21569
1458  002f a420          	and	a,#32
1459  0031 6b02          	ld	(OFST+0,sp),a
1460                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1462  0033 0d01          	tnz	(OFST-1,sp)
1463  0035 270a          	jreq	L556
1465  0037 0d02          	tnz	(OFST+0,sp)
1466  0039 2706          	jreq	L556
1467                     ; 674       bitstatus = SET;
1469  003b a601          	ld	a,#1
1470  003d 6b02          	ld	(OFST+0,sp),a
1472  003f 2002          	jra	L356
1473  0041               L556:
1474                     ; 679       bitstatus = RESET;
1476  0041 0f02          	clr	(OFST+0,sp)
1477  0043               L356:
1478                     ; 684   return (ITStatus) bitstatus;
1480  0043 7b02          	ld	a,(OFST+0,sp)
1483  0045 85            	popw	x
1484  0046 81            	ret
1520                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1520                     ; 696 {
1521                     .text:	section	.text,new
1522  0000               _COMP_ClearITPendingBit:
1526                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1528                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1530  0000 a101          	cp	a,#1
1531  0002 2606          	jrne	L776
1532                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1534  0004 72195440      	bres	21568,#4
1536  0008 2004          	jra	L107
1537  000a               L776:
1538                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1540  000a 72195441      	bres	21569,#4
1541  000e               L107:
1542                     ; 710 }
1545  000e 81            	ret
1558                     	xdef	_COMP_ClearITPendingBit
1559                     	xdef	_COMP_GetITStatus
1560                     	xdef	_COMP_ClearFlag
1561                     	xdef	_COMP_GetFlagStatus
1562                     	xdef	_COMP_ITConfig
1563                     	xdef	_COMP_TriggerConfig
1564                     	xdef	_COMP_SchmittTriggerCmd
1565                     	xdef	_COMP_VrefintOutputCmd
1566                     	xdef	_COMP_WindowCmd
1567                     	xdef	_COMP_GetOutputLevel
1568                     	xdef	_COMP_EdgeConfig
1569                     	xdef	_COMP_VrefintToCOMP1Connect
1570                     	xdef	_COMP_Init
1571                     	xdef	_COMP_DeInit
1590                     	end
