   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     .const:	section	.text
  17  0000               _SYSDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004 10            	dc.b	16
  51                     ; 120 void CLK_DeInit(void)
  51                     ; 121 {
  53                     .text:	section	.text,new
  54  0000               _CLK_DeInit:
  58                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  60  0000 351150c2      	mov	20674,#17
  61                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  63  0004 725f50c6      	clr	20678
  64                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  66  0008 725f50c1      	clr	20673
  67                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  69  000c 725f50cb      	clr	20683
  70                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  72  0010 350150c8      	mov	20680,#1
  73                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  75  0014 725f50c9      	clr	20681
  76                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  78  0018 350350c0      	mov	20672,#3
  79                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  81  001c 725f50c3      	clr	20675
  82                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  84  0020 358050c4      	mov	20676,#128
  85                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  87  0024 725f50d0      	clr	20688
  88                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  90  0028 725f50ca      	clr	20682
  91                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  002c 725f50c5      	clr	20677
  94                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  96  0030 725f50cd      	clr	20685
  97                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  99  0034 725f50cc      	clr	20684
 100                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 102  0038 725f50ce      	clr	20686
 103                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 105  003c 35b950cf      	mov	20687,#185
 106                     ; 138 }
 109  0040 81            	ret
 164                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 164                     ; 161 {
 165                     .text:	section	.text,new
 166  0000               _CLK_HSICmd:
 170                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 172                     ; 165   if (NewState != DISABLE)
 174  0000 4d            	tnz	a
 175  0001 2706          	jreq	L74
 176                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 178  0003 721050c2      	bset	20674,#0
 180  0007 2004          	jra	L15
 181  0009               L74:
 182                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 184  0009 721150c2      	bres	20674,#0
 185  000d               L15:
 186                     ; 175 }
 189  000d 81            	ret
 225                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 225                     ; 189 {
 226                     .text:	section	.text,new
 227  0000               _CLK_AdjustHSICalibrationValue:
 231                     ; 191   CLK->HSIUNLCKR = 0xAC;
 233  0000 35ac50ce      	mov	20686,#172
 234                     ; 192   CLK->HSIUNLCKR = 0x35;
 236  0004 353550ce      	mov	20686,#53
 237                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 239  0008 c750cd        	ld	20685,a
 240                     ; 196 }
 243  000b 81            	ret
 278                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 278                     ; 213 {
 279                     .text:	section	.text,new
 280  0000               _CLK_LSICmd:
 284                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 286                     ; 218   if (NewState != DISABLE)
 288  0000 4d            	tnz	a
 289  0001 2706          	jreq	L701
 290                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 292  0003 721450c2      	bset	20674,#2
 294  0007 2004          	jra	L111
 295  0009               L701:
 296                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 298  0009 721550c2      	bres	20674,#2
 299  000d               L111:
 300                     ; 228 }
 303  000d 81            	ret
 365                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 365                     ; 250 {
 366                     .text:	section	.text,new
 367  0000               _CLK_HSEConfig:
 371                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 373                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 375  0000 721150c6      	bres	20678,#0
 376                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 378  0004 721950c6      	bres	20678,#4
 379                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 381  0008 ca50c6        	or	a,20678
 382  000b c750c6        	ld	20678,a
 383                     ; 263 }
 386  000e 81            	ret
 448                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 448                     ; 281 {
 449                     .text:	section	.text,new
 450  0000               _CLK_LSEConfig:
 454                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 456                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 458  0000 721550c6      	bres	20678,#2
 459                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 461  0004 721b50c6      	bres	20678,#5
 462                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 464  0008 ca50c6        	or	a,20678
 465  000b c750c6        	ld	20678,a
 466                     ; 295 }
 469  000e 81            	ret
 493                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 493                     ; 307 {
 494                     .text:	section	.text,new
 495  0000               _CLK_ClockSecuritySystemEnable:
 499                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 501  0000 721050ca      	bset	20682,#0
 502                     ; 310 }
 505  0004 81            	ret
 541                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 541                     ; 318 {
 542                     .text:	section	.text,new
 543  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 547                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 549                     ; 322   if (NewState != DISABLE)
 551  0000 4d            	tnz	a
 552  0001 2706          	jreq	L122
 553                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 555  0003 721850ca      	bset	20682,#4
 557  0007 2004          	jra	L322
 558  0009               L122:
 559                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 561  0009 721950ca      	bres	20682,#4
 562  000d               L322:
 563                     ; 332 }
 566  000d 81            	ret
 707                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 707                     ; 357 {
 708                     .text:	section	.text,new
 709  0000               _CLK_CCOConfig:
 711  0000 89            	pushw	x
 712       00000000      OFST:	set	0
 715                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 717                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 719                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 721  0001 9f            	ld	a,xl
 722  0002 1a01          	or	a,(OFST+1,sp)
 723  0004 c750c5        	ld	20677,a
 724                     ; 364 }
 727  0007 85            	popw	x
 728  0008 81            	ret
 802                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 802                     ; 417 {
 803                     .text:	section	.text,new
 804  0000               _CLK_SYSCLKSourceConfig:
 808                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 810                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 812  0000 c750c8        	ld	20680,a
 813                     ; 423 }
 816  0003 81            	ret
 841                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 841                     ; 436 {
 842                     .text:	section	.text,new
 843  0000               _CLK_GetSYSCLKSource:
 847                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 849  0000 c650c7        	ld	a,20679
 852  0003 81            	ret
 924                     ; 478 uint32_t CLK_GetClockFreq(void)
 924                     ; 479 {
 925                     .text:	section	.text,new
 926  0000               _CLK_GetClockFreq:
 928  0000 5209          	subw	sp,#9
 929       00000009      OFST:	set	9
 932                     ; 480   uint32_t clockfrequency = 0;
 934                     ; 481   uint32_t sourcefrequency = 0;
 936  0002 ae0000        	ldw	x,#0
 937  0005 1f07          	ldw	(OFST-2,sp),x
 938  0007 ae0000        	ldw	x,#0
 939  000a 1f05          	ldw	(OFST-4,sp),x
 940                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 942                     ; 483   uint8_t tmp = 0, presc = 0;
 946                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 948  000c c650c7        	ld	a,20679
 949  000f 6b09          	ld	(OFST+0,sp),a
 950                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 952  0011 7b09          	ld	a,(OFST+0,sp)
 953  0013 a101          	cp	a,#1
 954  0015 260c          	jrne	L704
 955                     ; 490     sourcefrequency = HSI_VALUE;
 957  0017 ae2400        	ldw	x,#9216
 958  001a 1f07          	ldw	(OFST-2,sp),x
 959  001c ae00f4        	ldw	x,#244
 960  001f 1f05          	ldw	(OFST-4,sp),x
 962  0021 2022          	jra	L114
 963  0023               L704:
 964                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 966  0023 7b09          	ld	a,(OFST+0,sp)
 967  0025 a102          	cp	a,#2
 968  0027 260c          	jrne	L314
 969                     ; 494     sourcefrequency = LSI_VALUE;
 971  0029 ae9470        	ldw	x,#38000
 972  002c 1f07          	ldw	(OFST-2,sp),x
 973  002e ae0000        	ldw	x,#0
 974  0031 1f05          	ldw	(OFST-4,sp),x
 976  0033 2010          	jra	L114
 977  0035               L314:
 978                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 980  0035 7b09          	ld	a,(OFST+0,sp)
 981  0037 a104          	cp	a,#4
 982  0039 260a          	jrne	L714
 983                     ; 498     sourcefrequency = HSE_VALUE;
 985  003b ae2400        	ldw	x,#9216
 986  003e 1f07          	ldw	(OFST-2,sp),x
 987  0040 ae00f4        	ldw	x,#244
 988  0043 1f05          	ldw	(OFST-4,sp),x
 990  0045               L714:
 991                     ; 502     clockfrequency = LSE_VALUE;
 993  0045               L114:
 994                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 996  0045 c650c0        	ld	a,20672
 997  0048 a407          	and	a,#7
 998  004a 6b09          	ld	(OFST+0,sp),a
 999                     ; 507   presc = SYSDivFactor[tmp];
1001  004c 7b09          	ld	a,(OFST+0,sp)
1002  004e 5f            	clrw	x
1003  004f 97            	ld	xl,a
1004  0050 d60000        	ld	a,(_SYSDivFactor,x)
1005  0053 6b09          	ld	(OFST+0,sp),a
1006                     ; 510   clockfrequency = sourcefrequency / presc;
1008  0055 7b09          	ld	a,(OFST+0,sp)
1009  0057 b703          	ld	c_lreg+3,a
1010  0059 3f02          	clr	c_lreg+2
1011  005b 3f01          	clr	c_lreg+1
1012  005d 3f00          	clr	c_lreg
1013  005f 96            	ldw	x,sp
1014  0060 1c0001        	addw	x,#OFST-8
1015  0063 cd0000        	call	c_rtol
1017  0066 96            	ldw	x,sp
1018  0067 1c0005        	addw	x,#OFST-4
1019  006a cd0000        	call	c_ltor
1021  006d 96            	ldw	x,sp
1022  006e 1c0001        	addw	x,#OFST-8
1023  0071 cd0000        	call	c_ludv
1025  0074 96            	ldw	x,sp
1026  0075 1c0005        	addw	x,#OFST-4
1027  0078 cd0000        	call	c_rtol
1029                     ; 512   return((uint32_t)clockfrequency);
1031  007b 96            	ldw	x,sp
1032  007c 1c0005        	addw	x,#OFST-4
1033  007f cd0000        	call	c_ltor
1037  0082 5b09          	addw	sp,#9
1038  0084 81            	ret
1136                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1136                     ; 529 {
1137                     .text:	section	.text,new
1138  0000               _CLK_SYSCLKDivConfig:
1142                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1144                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1146  0000 c750c0        	ld	20672,a
1147                     ; 534 }
1150  0003 81            	ret
1186                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1186                     ; 542 {
1187                     .text:	section	.text,new
1188  0000               _CLK_SYSCLKSourceSwitchCmd:
1192                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1194                     ; 546   if (NewState != DISABLE)
1196  0000 4d            	tnz	a
1197  0001 2706          	jreq	L305
1198                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1200  0003 721250c9      	bset	20681,#1
1202  0007 2004          	jra	L505
1203  0009               L305:
1204                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1206  0009 721350c9      	bres	20681,#1
1207  000d               L505:
1208                     ; 556 }
1211  000d 81            	ret
1357                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1357                     ; 617 {
1358                     .text:	section	.text,new
1359  0000               _CLK_RTCClockConfig:
1361  0000 89            	pushw	x
1362       00000000      OFST:	set	0
1365                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1367                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1369                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1371  0001 9f            	ld	a,xl
1372  0002 1a01          	or	a,(OFST+1,sp)
1373  0004 c750c1        	ld	20673,a
1374                     ; 624 }
1377  0007 85            	popw	x
1378  0008 81            	ret
1444                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1444                     ; 636 {
1445                     .text:	section	.text,new
1446  0000               _CLK_BEEPClockConfig:
1450                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1452                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1454  0000 c750cb        	ld	20683,a
1455                     ; 643 }
1458  0003 81            	ret
1683                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1683                     ; 678 {
1684                     .text:	section	.text,new
1685  0000               _CLK_PeripheralClockConfig:
1687  0000 89            	pushw	x
1688  0001 88            	push	a
1689       00000001      OFST:	set	1
1692                     ; 679   uint8_t reg = 0;
1694                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1696                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1698                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1700  0002 9e            	ld	a,xh
1701  0003 a4f0          	and	a,#240
1702  0005 6b01          	ld	(OFST+0,sp),a
1703                     ; 688   if ( reg == 0x00)
1705  0007 0d01          	tnz	(OFST+0,sp)
1706  0009 2635          	jrne	L527
1707                     ; 690     if (NewState != DISABLE)
1709  000b 0d03          	tnz	(OFST+2,sp)
1710  000d 2719          	jreq	L727
1711                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1713  000f 7b02          	ld	a,(OFST+1,sp)
1714  0011 a40f          	and	a,#15
1715  0013 5f            	clrw	x
1716  0014 97            	ld	xl,a
1717  0015 a601          	ld	a,#1
1718  0017 5d            	tnzw	x
1719  0018 2704          	jreq	L64
1720  001a               L05:
1721  001a 48            	sll	a
1722  001b 5a            	decw	x
1723  001c 26fc          	jrne	L05
1724  001e               L64:
1725  001e ca50c3        	or	a,20675
1726  0021 c750c3        	ld	20675,a
1728  0024 acaa00aa      	jpf	L337
1729  0028               L727:
1730                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1732  0028 7b02          	ld	a,(OFST+1,sp)
1733  002a a40f          	and	a,#15
1734  002c 5f            	clrw	x
1735  002d 97            	ld	xl,a
1736  002e a601          	ld	a,#1
1737  0030 5d            	tnzw	x
1738  0031 2704          	jreq	L25
1739  0033               L45:
1740  0033 48            	sll	a
1741  0034 5a            	decw	x
1742  0035 26fc          	jrne	L45
1743  0037               L25:
1744  0037 43            	cpl	a
1745  0038 c450c3        	and	a,20675
1746  003b c750c3        	ld	20675,a
1747  003e 206a          	jra	L337
1748  0040               L527:
1749                     ; 701   else if (reg == 0x10)
1751  0040 7b01          	ld	a,(OFST+0,sp)
1752  0042 a110          	cp	a,#16
1753  0044 2633          	jrne	L537
1754                     ; 703     if (NewState != DISABLE)
1756  0046 0d03          	tnz	(OFST+2,sp)
1757  0048 2717          	jreq	L737
1758                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1760  004a 7b02          	ld	a,(OFST+1,sp)
1761  004c a40f          	and	a,#15
1762  004e 5f            	clrw	x
1763  004f 97            	ld	xl,a
1764  0050 a601          	ld	a,#1
1765  0052 5d            	tnzw	x
1766  0053 2704          	jreq	L65
1767  0055               L06:
1768  0055 48            	sll	a
1769  0056 5a            	decw	x
1770  0057 26fc          	jrne	L06
1771  0059               L65:
1772  0059 ca50c4        	or	a,20676
1773  005c c750c4        	ld	20676,a
1775  005f 2049          	jra	L337
1776  0061               L737:
1777                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1779  0061 7b02          	ld	a,(OFST+1,sp)
1780  0063 a40f          	and	a,#15
1781  0065 5f            	clrw	x
1782  0066 97            	ld	xl,a
1783  0067 a601          	ld	a,#1
1784  0069 5d            	tnzw	x
1785  006a 2704          	jreq	L26
1786  006c               L46:
1787  006c 48            	sll	a
1788  006d 5a            	decw	x
1789  006e 26fc          	jrne	L46
1790  0070               L26:
1791  0070 43            	cpl	a
1792  0071 c450c4        	and	a,20676
1793  0074 c750c4        	ld	20676,a
1794  0077 2031          	jra	L337
1795  0079               L537:
1796                     ; 716     if (NewState != DISABLE)
1798  0079 0d03          	tnz	(OFST+2,sp)
1799  007b 2717          	jreq	L547
1800                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1802  007d 7b02          	ld	a,(OFST+1,sp)
1803  007f a40f          	and	a,#15
1804  0081 5f            	clrw	x
1805  0082 97            	ld	xl,a
1806  0083 a601          	ld	a,#1
1807  0085 5d            	tnzw	x
1808  0086 2704          	jreq	L66
1809  0088               L07:
1810  0088 48            	sll	a
1811  0089 5a            	decw	x
1812  008a 26fc          	jrne	L07
1813  008c               L66:
1814  008c ca50d0        	or	a,20688
1815  008f c750d0        	ld	20688,a
1817  0092 2016          	jra	L337
1818  0094               L547:
1819                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1821  0094 7b02          	ld	a,(OFST+1,sp)
1822  0096 a40f          	and	a,#15
1823  0098 5f            	clrw	x
1824  0099 97            	ld	xl,a
1825  009a a601          	ld	a,#1
1826  009c 5d            	tnzw	x
1827  009d 2704          	jreq	L27
1828  009f               L47:
1829  009f 48            	sll	a
1830  00a0 5a            	decw	x
1831  00a1 26fc          	jrne	L47
1832  00a3               L27:
1833  00a3 43            	cpl	a
1834  00a4 c450d0        	and	a,20688
1835  00a7 c750d0        	ld	20688,a
1836  00aa               L337:
1837                     ; 727 }
1840  00aa 5b03          	addw	sp,#3
1841  00ac 81            	ret
1865                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1865                     ; 766 {
1866                     .text:	section	.text,new
1867  0000               _CLK_LSEClockSecuritySystemEnable:
1871                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1873  0000 72105190      	bset	20880,#0
1874                     ; 769 }
1877  0004 81            	ret
1901                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1901                     ; 778 {
1902                     .text:	section	.text,new
1903  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1907                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1909  0000 72125190      	bset	20880,#1
1910                     ; 781 }
1913  0004 81            	ret
1988                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1988                     ; 808 {
1989                     .text:	section	.text,new
1990  0000               _CLK_HaltConfig:
1992  0000 89            	pushw	x
1993       00000000      OFST:	set	0
1996                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1998                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
2000                     ; 813   if (NewState != DISABLE)
2002  0001 9f            	ld	a,xl
2003  0002 4d            	tnz	a
2004  0003 2709          	jreq	L5201
2005                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2007  0005 9e            	ld	a,xh
2008  0006 ca50c2        	or	a,20674
2009  0009 c750c2        	ld	20674,a
2011  000c 2009          	jra	L7201
2012  000e               L5201:
2013                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2015  000e 7b01          	ld	a,(OFST+1,sp)
2016  0010 43            	cpl	a
2017  0011 c450c2        	and	a,20674
2018  0014 c750c2        	ld	20674,a
2019  0017               L7201:
2020                     ; 821 }
2023  0017 85            	popw	x
2024  0018 81            	ret
2060                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2060                     ; 832 {
2061                     .text:	section	.text,new
2062  0000               _CLK_MainRegulatorCmd:
2066                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2068                     ; 836   if (NewState != DISABLE)
2070  0000 4d            	tnz	a
2071  0001 2706          	jreq	L7401
2072                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2074  0003 721350cf      	bres	20687,#1
2076  0007 2004          	jra	L1501
2077  0009               L7401:
2078                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2080  0009 721250cf      	bset	20687,#1
2081  000d               L1501:
2082                     ; 846 }
2085  000d 81            	ret
2157                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2157                     ; 876 {
2158                     .text:	section	.text,new
2159  0000               _CLK_ITConfig:
2161  0000 89            	pushw	x
2162       00000000      OFST:	set	0
2165                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2167                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2169                     ; 882   if (NewState != DISABLE)
2171  0001 9f            	ld	a,xl
2172  0002 4d            	tnz	a
2173  0003 271d          	jreq	L7011
2174                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2176  0005 9e            	ld	a,xh
2177  0006 a11c          	cp	a,#28
2178  0008 2606          	jrne	L1111
2179                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2181  000a 721450c9      	bset	20681,#2
2183  000e 202e          	jra	L1211
2184  0010               L1111:
2185                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2187  0010 7b01          	ld	a,(OFST+1,sp)
2188  0012 a12c          	cp	a,#44
2189  0014 2606          	jrne	L5111
2190                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2192  0016 72145190      	bset	20880,#2
2194  001a 2022          	jra	L1211
2195  001c               L5111:
2196                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2198  001c 721450ca      	bset	20682,#2
2199  0020 201c          	jra	L1211
2200  0022               L7011:
2201                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2203  0022 7b01          	ld	a,(OFST+1,sp)
2204  0024 a11c          	cp	a,#28
2205  0026 2606          	jrne	L3211
2206                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2208  0028 721550c9      	bres	20681,#2
2210  002c 2010          	jra	L1211
2211  002e               L3211:
2212                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2214  002e 7b01          	ld	a,(OFST+1,sp)
2215  0030 a12c          	cp	a,#44
2216  0032 2606          	jrne	L7211
2217                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2219  0034 72155190      	bres	20880,#2
2221  0038 2004          	jra	L1211
2222  003a               L7211:
2223                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2225  003a 721550ca      	bres	20682,#2
2226  003e               L1211:
2227                     ; 918 }
2230  003e 85            	popw	x
2231  003f 81            	ret
2454                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2454                     ; 946 {
2455                     .text:	section	.text,new
2456  0000               _CLK_GetFlagStatus:
2458  0000 88            	push	a
2459  0001 89            	pushw	x
2460       00000002      OFST:	set	2
2463                     ; 947   uint8_t reg = 0;
2465                     ; 948   uint8_t pos = 0;
2467                     ; 949   FlagStatus bitstatus = RESET;
2469                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2471                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2473  0002 a4f0          	and	a,#240
2474  0004 6b02          	ld	(OFST+0,sp),a
2475                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2477  0006 7b03          	ld	a,(OFST+1,sp)
2478  0008 a40f          	and	a,#15
2479  000a 6b01          	ld	(OFST-1,sp),a
2480                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2482  000c 0d02          	tnz	(OFST+0,sp)
2483  000e 2607          	jrne	L7421
2484                     ; 962     reg = CLK->CRTCR;
2486  0010 c650c1        	ld	a,20673
2487  0013 6b02          	ld	(OFST+0,sp),a
2489  0015 2060          	jra	L1521
2490  0017               L7421:
2491                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2493  0017 7b02          	ld	a,(OFST+0,sp)
2494  0019 a110          	cp	a,#16
2495  001b 2607          	jrne	L3521
2496                     ; 966     reg = CLK->ICKCR;
2498  001d c650c2        	ld	a,20674
2499  0020 6b02          	ld	(OFST+0,sp),a
2501  0022 2053          	jra	L1521
2502  0024               L3521:
2503                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2505  0024 7b02          	ld	a,(OFST+0,sp)
2506  0026 a120          	cp	a,#32
2507  0028 2607          	jrne	L7521
2508                     ; 970     reg = CLK->CCOR;
2510  002a c650c5        	ld	a,20677
2511  002d 6b02          	ld	(OFST+0,sp),a
2513  002f 2046          	jra	L1521
2514  0031               L7521:
2515                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2517  0031 7b02          	ld	a,(OFST+0,sp)
2518  0033 a130          	cp	a,#48
2519  0035 2607          	jrne	L3621
2520                     ; 974     reg = CLK->ECKCR;
2522  0037 c650c6        	ld	a,20678
2523  003a 6b02          	ld	(OFST+0,sp),a
2525  003c 2039          	jra	L1521
2526  003e               L3621:
2527                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2529  003e 7b02          	ld	a,(OFST+0,sp)
2530  0040 a140          	cp	a,#64
2531  0042 2607          	jrne	L7621
2532                     ; 978     reg = CLK->SWCR;
2534  0044 c650c9        	ld	a,20681
2535  0047 6b02          	ld	(OFST+0,sp),a
2537  0049 202c          	jra	L1521
2538  004b               L7621:
2539                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2541  004b 7b02          	ld	a,(OFST+0,sp)
2542  004d a150          	cp	a,#80
2543  004f 2607          	jrne	L3721
2544                     ; 982     reg = CLK->CSSR;
2546  0051 c650ca        	ld	a,20682
2547  0054 6b02          	ld	(OFST+0,sp),a
2549  0056 201f          	jra	L1521
2550  0058               L3721:
2551                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2553  0058 7b02          	ld	a,(OFST+0,sp)
2554  005a a170          	cp	a,#112
2555  005c 2607          	jrne	L7721
2556                     ; 986     reg = CLK->REGCSR;
2558  005e c650cf        	ld	a,20687
2559  0061 6b02          	ld	(OFST+0,sp),a
2561  0063 2012          	jra	L1521
2562  0065               L7721:
2563                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2565  0065 7b02          	ld	a,(OFST+0,sp)
2566  0067 a180          	cp	a,#128
2567  0069 2607          	jrne	L3031
2568                     ; 990     reg = CSSLSE->CSR;
2570  006b c65190        	ld	a,20880
2571  006e 6b02          	ld	(OFST+0,sp),a
2573  0070 2005          	jra	L1521
2574  0072               L3031:
2575                     ; 994     reg = CLK->CBEEPR;
2577  0072 c650cb        	ld	a,20683
2578  0075 6b02          	ld	(OFST+0,sp),a
2579  0077               L1521:
2580                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2582  0077 7b01          	ld	a,(OFST-1,sp)
2583  0079 5f            	clrw	x
2584  007a 97            	ld	xl,a
2585  007b a601          	ld	a,#1
2586  007d 5d            	tnzw	x
2587  007e 2704          	jreq	L211
2588  0080               L411:
2589  0080 48            	sll	a
2590  0081 5a            	decw	x
2591  0082 26fc          	jrne	L411
2592  0084               L211:
2593  0084 1402          	and	a,(OFST+0,sp)
2594  0086 2706          	jreq	L7031
2595                     ; 1000     bitstatus = SET;
2597  0088 a601          	ld	a,#1
2598  008a 6b02          	ld	(OFST+0,sp),a
2600  008c 2002          	jra	L1131
2601  008e               L7031:
2602                     ; 1004     bitstatus = RESET;
2604  008e 0f02          	clr	(OFST+0,sp)
2605  0090               L1131:
2606                     ; 1008   return((FlagStatus)bitstatus);
2608  0090 7b02          	ld	a,(OFST+0,sp)
2611  0092 5b03          	addw	sp,#3
2612  0094 81            	ret
2635                     ; 1016 void CLK_ClearFlag(void)
2635                     ; 1017 {
2636                     .text:	section	.text,new
2637  0000               _CLK_ClearFlag:
2641                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2643  0000 72175190      	bres	20880,#3
2644                     ; 1021 }
2647  0004 81            	ret
2693                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2693                     ; 1033 {
2694                     .text:	section	.text,new
2695  0000               _CLK_GetITStatus:
2697  0000 88            	push	a
2698  0001 88            	push	a
2699       00000001      OFST:	set	1
2702                     ; 1035   ITStatus bitstatus = RESET;
2704                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2706                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2708  0002 a11c          	cp	a,#28
2709  0004 2611          	jrne	L5431
2710                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2712  0006 c450c9        	and	a,20681
2713  0009 a10c          	cp	a,#12
2714  000b 2606          	jrne	L7431
2715                     ; 1045       bitstatus = SET;
2717  000d a601          	ld	a,#1
2718  000f 6b01          	ld	(OFST+0,sp),a
2720  0011 202e          	jra	L3531
2721  0013               L7431:
2722                     ; 1049       bitstatus = RESET;
2724  0013 0f01          	clr	(OFST+0,sp)
2725  0015 202a          	jra	L3531
2726  0017               L5431:
2727                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2729  0017 7b02          	ld	a,(OFST+1,sp)
2730  0019 a12c          	cp	a,#44
2731  001b 2613          	jrne	L5531
2732                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2734  001d c65190        	ld	a,20880
2735  0020 1402          	and	a,(OFST+1,sp)
2736  0022 a10c          	cp	a,#12
2737  0024 2606          	jrne	L7531
2738                     ; 1057       bitstatus = SET;
2740  0026 a601          	ld	a,#1
2741  0028 6b01          	ld	(OFST+0,sp),a
2743  002a 2015          	jra	L3531
2744  002c               L7531:
2745                     ; 1061       bitstatus = RESET;
2747  002c 0f01          	clr	(OFST+0,sp)
2748  002e 2011          	jra	L3531
2749  0030               L5531:
2750                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2752  0030 c650ca        	ld	a,20682
2753  0033 1402          	and	a,(OFST+1,sp)
2754  0035 a10c          	cp	a,#12
2755  0037 2606          	jrne	L5631
2756                     ; 1069       bitstatus = SET;
2758  0039 a601          	ld	a,#1
2759  003b 6b01          	ld	(OFST+0,sp),a
2761  003d 2002          	jra	L3531
2762  003f               L5631:
2763                     ; 1073       bitstatus = RESET;
2765  003f 0f01          	clr	(OFST+0,sp)
2766  0041               L3531:
2767                     ; 1078   return bitstatus;
2769  0041 7b01          	ld	a,(OFST+0,sp)
2772  0043 85            	popw	x
2773  0044 81            	ret
2809                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2809                     ; 1090 {
2810                     .text:	section	.text,new
2811  0000               _CLK_ClearITPendingBit:
2815                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2817                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2819  0000 a4f0          	and	a,#240
2820  0002 a120          	cp	a,#32
2821  0004 2606          	jrne	L7041
2822                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2824  0006 72175190      	bres	20880,#3
2826  000a 2004          	jra	L1141
2827  000c               L7041:
2828                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2830  000c 721750c9      	bres	20681,#3
2831  0010               L1141:
2832                     ; 1105 }
2835  0010 81            	ret
2860                     	xdef	_SYSDivFactor
2861                     	xdef	_CLK_ClearITPendingBit
2862                     	xdef	_CLK_GetITStatus
2863                     	xdef	_CLK_ClearFlag
2864                     	xdef	_CLK_GetFlagStatus
2865                     	xdef	_CLK_ITConfig
2866                     	xdef	_CLK_MainRegulatorCmd
2867                     	xdef	_CLK_HaltConfig
2868                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2869                     	xdef	_CLK_LSEClockSecuritySystemEnable
2870                     	xdef	_CLK_PeripheralClockConfig
2871                     	xdef	_CLK_BEEPClockConfig
2872                     	xdef	_CLK_RTCClockConfig
2873                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2874                     	xdef	_CLK_SYSCLKDivConfig
2875                     	xdef	_CLK_GetClockFreq
2876                     	xdef	_CLK_GetSYSCLKSource
2877                     	xdef	_CLK_SYSCLKSourceConfig
2878                     	xdef	_CLK_CCOConfig
2879                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2880                     	xdef	_CLK_ClockSecuritySystemEnable
2881                     	xdef	_CLK_LSEConfig
2882                     	xdef	_CLK_HSEConfig
2883                     	xdef	_CLK_LSICmd
2884                     	xdef	_CLK_AdjustHSICalibrationValue
2885                     	xdef	_CLK_HSICmd
2886                     	xdef	_CLK_DeInit
2887                     	xref.b	c_lreg
2888                     	xref.b	c_x
2907                     	xref	c_ludv
2908                     	xref	c_rtol
2909                     	xref	c_ltor
2910                     	end
