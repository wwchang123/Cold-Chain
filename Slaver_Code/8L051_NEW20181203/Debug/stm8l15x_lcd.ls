   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  55                     ; 121 void LCD_DeInit(void)
  55                     ; 122 {
  57                     .text:	section	.text,new
  58  0000               _LCD_DeInit:
  60  0000 88            	push	a
  61       00000001      OFST:	set	1
  64                     ; 123   uint8_t counter = 0;
  66                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  68  0001 725f5400      	clr	21504
  69                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  71  0005 725f5401      	clr	21505
  72                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  74  0009 725f5402      	clr	21506
  75                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  77  000d 725f5403      	clr	21507
  78                     ; 130   for (counter = 0;counter < 0x05; counter++)
  80  0011 0f01          	clr	(OFST+0,sp)
  81  0013               L72:
  82                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  84  0013 7b01          	ld	a,(OFST+0,sp)
  85  0015 5f            	clrw	x
  86  0016 97            	ld	xl,a
  87  0017 724f5404      	clr	(21508,x)
  88                     ; 130   for (counter = 0;counter < 0x05; counter++)
  90  001b 0c01          	inc	(OFST+0,sp)
  93  001d 7b01          	ld	a,(OFST+0,sp)
  94  001f a105          	cp	a,#5
  95  0021 25f0          	jrult	L72
  96                     ; 135   for (counter = 0;counter < 0x16; counter++)
  98  0023 0f01          	clr	(OFST+0,sp)
  99  0025               L53:
 100                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 102  0025 7b01          	ld	a,(OFST+0,sp)
 103  0027 5f            	clrw	x
 104  0028 97            	ld	xl,a
 105  0029 724f540c      	clr	(21516,x)
 106                     ; 135   for (counter = 0;counter < 0x16; counter++)
 108  002d 0c01          	inc	(OFST+0,sp)
 111  002f 7b01          	ld	a,(OFST+0,sp)
 112  0031 a116          	cp	a,#22
 113  0033 25f0          	jrult	L53
 114                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 116  0035 725f542f      	clr	21551
 117                     ; 142 }
 120  0039 84            	pop	a
 121  003a 81            	ret
 524                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 524                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 524                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 524                     ; 203 {
 525                     .text:	section	.text,new
 526  0000               _LCD_Init:
 528  0000 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 534                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 536                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 538                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 540                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 542                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 544  0001 c65403        	ld	a,21507
 545  0004 a40f          	and	a,#15
 546  0006 c75403        	ld	21507,a
 547                     ; 212   LCD->FRQ |= LCD_Prescaler;
 549  0009 9e            	ld	a,xh
 550  000a ca5403        	or	a,21507
 551  000d c75403        	ld	21507,a
 552                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 554  0010 c65403        	ld	a,21507
 555  0013 a4f0          	and	a,#240
 556  0015 c75403        	ld	21507,a
 557                     ; 215   LCD->FRQ |= LCD_Divider;
 559  0018 9f            	ld	a,xl
 560  0019 ca5403        	or	a,21507
 561  001c c75403        	ld	21507,a
 562                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 564  001f c65400        	ld	a,21504
 565  0022 a4f9          	and	a,#249
 566  0024 c75400        	ld	21504,a
 567                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 569  0027 7213542f      	bres	21551,#1
 570                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 572  002b 7b05          	ld	a,(OFST+5,sp)
 573  002d a120          	cp	a,#32
 574  002f 260f          	jrne	L152
 575                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 577  0031 7b05          	ld	a,(OFST+5,sp)
 578  0033 a4f0          	and	a,#240
 579  0035 4e            	swap	a
 580  0036 a40f          	and	a,#15
 581  0038 ca542f        	or	a,21551
 582  003b c7542f        	ld	21551,a
 584  003e 200a          	jra	L352
 585  0040               L152:
 586                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 588  0040 7b05          	ld	a,(OFST+5,sp)
 589  0042 a40f          	and	a,#15
 590  0044 ca5400        	or	a,21504
 591  0047 c75400        	ld	21504,a
 592  004a               L352:
 593                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 595  004a 72115400      	bres	21504,#0
 596                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 598  004e 7211542f      	bres	21551,#0
 599                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 601  0052 7b06          	ld	a,(OFST+6,sp)
 602  0054 a110          	cp	a,#16
 603  0056 2619          	jrne	L552
 604                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 606  0058 7b06          	ld	a,(OFST+6,sp)
 607  005a a40f          	and	a,#15
 608  005c ca5400        	or	a,21504
 609  005f c75400        	ld	21504,a
 610                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 612  0062 7b06          	ld	a,(OFST+6,sp)
 613  0064 a4f0          	and	a,#240
 614  0066 4e            	swap	a
 615  0067 a40f          	and	a,#15
 616  0069 ca542f        	or	a,21551
 617  006c c7542f        	ld	21551,a
 619  006f 200a          	jra	L752
 620  0071               L552:
 621                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 623  0071 7b06          	ld	a,(OFST+6,sp)
 624  0073 a40f          	and	a,#15
 625  0075 ca5400        	or	a,21504
 626  0078 c75400        	ld	21504,a
 627  007b               L752:
 628                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 630  007b 72115401      	bres	21505,#0
 631                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 633  007f c65401        	ld	a,21505
 634  0082 1a07          	or	a,(OFST+7,sp)
 635  0084 c75401        	ld	21505,a
 636                     ; 247 }
 639  0087 85            	popw	x
 640  0088 81            	ret
 739                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 739                     ; 263 {
 740                     .text:	section	.text,new
 741  0000               _LCD_PortMaskConfig:
 743  0000 89            	pushw	x
 744       00000000      OFST:	set	0
 747                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 749                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 751  0001 9e            	ld	a,xh
 752  0002 5f            	clrw	x
 753  0003 97            	ld	xl,a
 754  0004 7b02          	ld	a,(OFST+2,sp)
 755  0006 d75404        	ld	(21508,x),a
 756                     ; 270 }
 759  0009 85            	popw	x
 760  000a 81            	ret
 815                     ; 279 void LCD_Cmd(FunctionalState NewState)
 815                     ; 280 {
 816                     .text:	section	.text,new
 817  0000               _LCD_Cmd:
 821                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 823                     ; 284   if (NewState != DISABLE)
 825  0000 4d            	tnz	a
 826  0001 2706          	jreq	L153
 827                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 829  0003 721c5402      	bset	21506,#6
 831  0007 2004          	jra	L353
 832  0009               L153:
 833                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 835  0009 721d5402      	bres	21506,#6
 836  000d               L353:
 837                     ; 292 }
 840  000d 81            	ret
 875                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 875                     ; 306 {
 876                     .text:	section	.text,new
 877  0000               _LCD_HighDriveCmd:
 881                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 883                     ; 310   if (NewState != DISABLE)
 885  0000 4d            	tnz	a
 886  0001 2706          	jreq	L373
 887                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 889  0003 72185401      	bset	21505,#4
 891  0007 2004          	jra	L573
 892  0009               L373:
 893                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 895  0009 72195401      	bres	21505,#4
 896  000d               L573:
 897                     ; 318 }
 900  000d 81            	ret
1007                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1007                     ; 336 {
1008                     .text:	section	.text,new
1009  0000               _LCD_PulseOnDurationConfig:
1011  0000 88            	push	a
1012       00000000      OFST:	set	0
1015                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1017                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1019  0001 c65401        	ld	a,21505
1020  0004 a41f          	and	a,#31
1021  0006 c75401        	ld	21505,a
1022                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1024  0009 c65401        	ld	a,21505
1025  000c 1a01          	or	a,(OFST+1,sp)
1026  000e c75401        	ld	21505,a
1027                     ; 342 }
1030  0011 84            	pop	a
1031  0012 81            	ret
1128                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1128                     ; 359 {
1129                     .text:	section	.text,new
1130  0000               _LCD_DeadTimeConfig:
1132  0000 88            	push	a
1133       00000000      OFST:	set	0
1136                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1138                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1140  0001 c65402        	ld	a,21506
1141  0004 a4f8          	and	a,#248
1142  0006 c75402        	ld	21506,a
1143                     ; 365   LCD->CR3 |= LCD_DeadTime;
1145  0009 c65402        	ld	a,21506
1146  000c 1a01          	or	a,(OFST+1,sp)
1147  000e c75402        	ld	21506,a
1148                     ; 367 }
1151  0011 84            	pop	a
1152  0012 81            	ret
1304                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1304                     ; 392 {
1305                     .text:	section	.text,new
1306  0000               _LCD_BlinkConfig:
1310                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1312                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1314                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1316  0000 c65400        	ld	a,21504
1317  0003 a43f          	and	a,#63
1318  0005 c75400        	ld	21504,a
1319                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1321  0008 9e            	ld	a,xh
1322  0009 ca5400        	or	a,21504
1323  000c c75400        	ld	21504,a
1324                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1326  000f c65400        	ld	a,21504
1327  0012 a4c7          	and	a,#199
1328  0014 c75400        	ld	21504,a
1329                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1331  0017 9f            	ld	a,xl
1332  0018 ca5400        	or	a,21504
1333  001b c75400        	ld	21504,a
1334                     ; 403 }
1337  001e 81            	ret
1442                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1442                     ; 420 {
1443                     .text:	section	.text,new
1444  0000               _LCD_ContrastConfig:
1446  0000 88            	push	a
1447       00000000      OFST:	set	0
1450                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1452                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1454  0001 c65401        	ld	a,21505
1455  0004 a4f1          	and	a,#241
1456  0006 c75401        	ld	21505,a
1457                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1459  0009 c65401        	ld	a,21505
1460  000c 1a01          	or	a,(OFST+1,sp)
1461  000e c75401        	ld	21505,a
1462                     ; 427 }
1465  0011 84            	pop	a
1466  0012 81            	ret
1670                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1670                     ; 475 {
1671                     .text:	section	.text,new
1672  0000               _LCD_WriteRAM:
1674  0000 89            	pushw	x
1675       00000000      OFST:	set	0
1678                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1680                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1682  0001 9e            	ld	a,xh
1683  0002 5f            	clrw	x
1684  0003 97            	ld	xl,a
1685  0004 7b02          	ld	a,(OFST+2,sp)
1686  0006 d7540c        	ld	(21516,x),a
1687                     ; 482 }
1690  0009 85            	popw	x
1691  000a 81            	ret
1748                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1748                     ; 493 {
1749                     .text:	section	.text,new
1750  0000               _LCD_PageSelect:
1754                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1756                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1758  0000 7215542f      	bres	21551,#2
1759                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1761  0004 ca542f        	or	a,21551
1762  0007 c7542f        	ld	21551,a
1763                     ; 500 }
1766  000a 81            	ret
1801                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1801                     ; 526 {
1802                     .text:	section	.text,new
1803  0000               _LCD_ITConfig:
1807                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1809                     ; 530   if (NewState != DISABLE)
1811  0000 4d            	tnz	a
1812  0001 2706          	jreq	L577
1813                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1815  0003 721a5402      	bset	21506,#5
1817  0007 2004          	jra	L777
1818  0009               L577:
1819                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1821  0009 721b5402      	bres	21506,#5
1822  000d               L777:
1823                     ; 539 }
1826  000d 81            	ret
1882                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1882                     ; 547 {
1883                     .text:	section	.text,new
1884  0000               _LCD_GetFlagStatus:
1886  0000 88            	push	a
1887       00000001      OFST:	set	1
1890                     ; 548   FlagStatus status = RESET;
1892                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1894  0001 c65402        	ld	a,21506
1895  0004 a510          	bcp	a,#16
1896  0006 2706          	jreq	L7201
1897                     ; 553     status = SET; /* Flag is set */
1899  0008 a601          	ld	a,#1
1900  000a 6b01          	ld	(OFST+0,sp),a
1902  000c 2002          	jra	L1301
1903  000e               L7201:
1904                     ; 557     status = RESET; /* Flag is reset*/
1906  000e 0f01          	clr	(OFST+0,sp)
1907  0010               L1301:
1908                     ; 560   return status;
1910  0010 7b01          	ld	a,(OFST+0,sp)
1913  0012 5b01          	addw	sp,#1
1914  0014 81            	ret
1937                     ; 569 void LCD_ClearFlag(void)
1937                     ; 570 {
1938                     .text:	section	.text,new
1939  0000               _LCD_ClearFlag:
1943                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1945  0000 72165402      	bset	21506,#3
1946                     ; 574 }
1949  0004 81            	ret
1994                     ; 582 ITStatus LCD_GetITStatus(void)
1994                     ; 583 {
1995                     .text:	section	.text,new
1996  0000               _LCD_GetITStatus:
1998  0000 88            	push	a
1999       00000001      OFST:	set	1
2002                     ; 584   ITStatus pendingbitstatus = RESET;
2004                     ; 585   uint8_t enablestatus = 0;
2006                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2008  0001 c65402        	ld	a,21506
2009  0004 a420          	and	a,#32
2010  0006 6b01          	ld	(OFST+0,sp),a
2011                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2013  0008 c65402        	ld	a,21506
2014  000b a510          	bcp	a,#16
2015  000d 270a          	jreq	L5601
2017  000f 0d01          	tnz	(OFST+0,sp)
2018  0011 2706          	jreq	L5601
2019                     ; 592     pendingbitstatus = SET;
2021  0013 a601          	ld	a,#1
2022  0015 6b01          	ld	(OFST+0,sp),a
2024  0017 2002          	jra	L7601
2025  0019               L5601:
2026                     ; 597     pendingbitstatus = RESET;
2028  0019 0f01          	clr	(OFST+0,sp)
2029  001b               L7601:
2030                     ; 600   return  pendingbitstatus;
2032  001b 7b01          	ld	a,(OFST+0,sp)
2035  001d 5b01          	addw	sp,#1
2036  001f 81            	ret
2060                     ; 609 void LCD_ClearITPendingBit(void)
2060                     ; 610 {
2061                     .text:	section	.text,new
2062  0000               _LCD_ClearITPendingBit:
2066                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2068  0000 72165402      	bset	21506,#3
2069                     ; 614 }
2072  0004 81            	ret
2085                     	xdef	_LCD_ClearITPendingBit
2086                     	xdef	_LCD_GetITStatus
2087                     	xdef	_LCD_ClearFlag
2088                     	xdef	_LCD_GetFlagStatus
2089                     	xdef	_LCD_ITConfig
2090                     	xdef	_LCD_PageSelect
2091                     	xdef	_LCD_WriteRAM
2092                     	xdef	_LCD_ContrastConfig
2093                     	xdef	_LCD_BlinkConfig
2094                     	xdef	_LCD_DeadTimeConfig
2095                     	xdef	_LCD_PulseOnDurationConfig
2096                     	xdef	_LCD_HighDriveCmd
2097                     	xdef	_LCD_Cmd
2098                     	xdef	_LCD_PortMaskConfig
2099                     	xdef	_LCD_Init
2100                     	xdef	_LCD_DeInit
2119                     	end
