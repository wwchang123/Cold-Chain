   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 175                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 175                     ; 136 {
 177                     .text:	section	.text,new
 178  0000               _ADC_DeInit:
 182                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 184  0000 7f            	clr	(x)
 185                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 187  0001 6f01          	clr	(1,x)
 188                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 190  0003 a61f          	ld	a,#31
 191  0005 e702          	ld	(2,x),a
 192                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 194  0007 a6ff          	ld	a,#255
 195  0009 e703          	ld	(3,x),a
 196                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 198  000b a60f          	ld	a,#15
 199  000d e706          	ld	(6,x),a
 200                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 202  000f a6ff          	ld	a,#255
 203  0011 e707          	ld	(7,x),a
 204                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 206  0013 6f08          	clr	(8,x)
 207                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 209  0015 6f09          	clr	(9,x)
 210                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 212  0017 6f0a          	clr	(10,x)
 213                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 215  0019 6f0b          	clr	(11,x)
 216                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 218  001b 6f0c          	clr	(12,x)
 219                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 221  001d 6f0d          	clr	(13,x)
 222                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 224  001f 6f0e          	clr	(14,x)
 225                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 227  0021 6f0f          	clr	(15,x)
 228                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 230  0023 6f10          	clr	(16,x)
 231                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 233  0025 6f11          	clr	(17,x)
 234                     ; 164 }
 237  0027 81            	ret
 384                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 384                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 384                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 384                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 384                     ; 190 {
 385                     .text:	section	.text,new
 386  0000               _ADC_Init:
 388  0000 89            	pushw	x
 389       00000000      OFST:	set	0
 392                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 394                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 396                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 398                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 400  0001 f6            	ld	a,(x)
 401  0002 a49b          	and	a,#155
 402  0004 f7            	ld	(x),a
 403                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 405  0005 7b05          	ld	a,(OFST+5,sp)
 406  0007 1a06          	or	a,(OFST+6,sp)
 407  0009 fa            	or	a,(x)
 408  000a f7            	ld	(x),a
 409                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 411  000b e601          	ld	a,(1,x)
 412  000d a47f          	and	a,#127
 413  000f e701          	ld	(1,x),a
 414                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 416  0011 e601          	ld	a,(1,x)
 417  0013 1a07          	or	a,(OFST+7,sp)
 418  0015 e701          	ld	(1,x),a
 419                     ; 207 }
 422  0017 85            	popw	x
 423  0018 81            	ret
 490                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 490                     ; 217              FunctionalState NewState)
 490                     ; 218 {
 491                     .text:	section	.text,new
 492  0000               _ADC_Cmd:
 494  0000 89            	pushw	x
 495       00000000      OFST:	set	0
 498                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 500                     ; 222   if (NewState != DISABLE)
 502  0001 0d05          	tnz	(OFST+5,sp)
 503  0003 2706          	jreq	L142
 504                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 506  0005 f6            	ld	a,(x)
 507  0006 aa01          	or	a,#1
 508  0008 f7            	ld	(x),a
 510  0009 2006          	jra	L342
 511  000b               L142:
 512                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 514  000b 1e01          	ldw	x,(OFST+1,sp)
 515  000d f6            	ld	a,(x)
 516  000e a4fe          	and	a,#254
 517  0010 f7            	ld	(x),a
 518  0011               L342:
 519                     ; 232 }
 522  0011 85            	popw	x
 523  0012 81            	ret
 561                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 561                     ; 240 {
 562                     .text:	section	.text,new
 563  0000               _ADC_SoftwareStartConv:
 567                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 569  0000 f6            	ld	a,(x)
 570  0001 aa02          	or	a,#2
 571  0003 f7            	ld	(x),a
 572                     ; 243 }
 575  0004 81            	ret
 703                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 703                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 703                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 703                     ; 264 {
 704                     .text:	section	.text,new
 705  0000               _ADC_ExternalTrigConfig:
 707  0000 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 713                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 715                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 717  0001 e601          	ld	a,(1,x)
 718  0003 a487          	and	a,#135
 719  0005 e701          	ld	(1,x),a
 720                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 720                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 722  0007 7b06          	ld	a,(OFST+6,sp)
 723  0009 1a05          	or	a,(OFST+5,sp)
 724  000b ea01          	or	a,(1,x)
 725  000d e701          	ld	(1,x),a
 726                     ; 276 }
 729  000f 85            	popw	x
 730  0010 81            	ret
1044                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1044                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1044                     ; 341 {
1045                     .text:	section	.text,new
1046  0000               _ADC_AnalogWatchdogChannelSelect:
1048  0000 89            	pushw	x
1049       00000000      OFST:	set	0
1052                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1054                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1056  0001 e602          	ld	a,(2,x)
1057  0003 a4e0          	and	a,#224
1058  0005 e702          	ld	(2,x),a
1059                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1061  0007 e602          	ld	a,(2,x)
1062  0009 1a05          	or	a,(OFST+5,sp)
1063  000b e702          	ld	(2,x),a
1064                     ; 350 }
1067  000d 85            	popw	x
1068  000e 81            	ret
1124                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1124                     ; 362 {
1125                     .text:	section	.text,new
1126  0000               _ADC_AnalogWatchdogThresholdsConfig:
1128  0000 89            	pushw	x
1129       00000000      OFST:	set	0
1132                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1134                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1136                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1138  0001 7b05          	ld	a,(OFST+5,sp)
1139  0003 1e01          	ldw	x,(OFST+1,sp)
1140  0005 e706          	ld	(6,x),a
1141                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1143  0007 7b06          	ld	a,(OFST+6,sp)
1144  0009 1e01          	ldw	x,(OFST+1,sp)
1145  000b e707          	ld	(7,x),a
1146                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1148  000d 7b07          	ld	a,(OFST+7,sp)
1149  000f 1e01          	ldw	x,(OFST+1,sp)
1150  0011 e708          	ld	(8,x),a
1151                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1153  0013 7b08          	ld	a,(OFST+8,sp)
1154  0015 1e01          	ldw	x,(OFST+1,sp)
1155  0017 e709          	ld	(9,x),a
1156                     ; 374 }
1159  0019 85            	popw	x
1160  001a 81            	ret
1227                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1227                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1227                     ; 414                               uint16_t HighThreshold,
1227                     ; 415                               uint16_t LowThreshold)
1227                     ; 416 {
1228                     .text:	section	.text,new
1229  0000               _ADC_AnalogWatchdogConfig:
1231  0000 89            	pushw	x
1232       00000000      OFST:	set	0
1235                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1237                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1239                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1241                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1243  0001 e602          	ld	a,(2,x)
1244  0003 a4e0          	and	a,#224
1245  0005 e702          	ld	(2,x),a
1246                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1248  0007 e602          	ld	a,(2,x)
1249  0009 1a05          	or	a,(OFST+5,sp)
1250  000b e702          	ld	(2,x),a
1251                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1253  000d 7b06          	ld	a,(OFST+6,sp)
1254  000f 1e01          	ldw	x,(OFST+1,sp)
1255  0011 e706          	ld	(6,x),a
1256                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1258  0013 7b07          	ld	a,(OFST+7,sp)
1259  0015 1e01          	ldw	x,(OFST+1,sp)
1260  0017 e707          	ld	(7,x),a
1261                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1263  0019 7b08          	ld	a,(OFST+8,sp)
1264  001b 1e01          	ldw	x,(OFST+1,sp)
1265  001d e708          	ld	(8,x),a
1266                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1268  001f 7b09          	ld	a,(OFST+9,sp)
1269  0021 1e01          	ldw	x,(OFST+1,sp)
1270  0023 e709          	ld	(9,x),a
1271                     ; 435 }
1274  0025 85            	popw	x
1275  0026 81            	ret
1310                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1310                     ; 475 {
1311                     .text:	section	.text,new
1312  0000               _ADC_TempSensorCmd:
1316                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1318                     ; 479   if (NewState != DISABLE)
1320  0000 4d            	tnz	a
1321  0001 2706          	jreq	L175
1322                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1324  0003 721a534e      	bset	21326,#5
1326  0007 2004          	jra	L375
1327  0009               L175:
1328                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1330  0009 721b534e      	bres	21326,#5
1331  000d               L375:
1332                     ; 489 }
1335  000d 81            	ret
1370                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1370                     ; 498 {
1371                     .text:	section	.text,new
1372  0000               _ADC_VrefintCmd:
1376                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1378                     ; 502   if (NewState != DISABLE)
1380  0000 4d            	tnz	a
1381  0001 2706          	jreq	L316
1382                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1384  0003 7218534e      	bset	21326,#4
1386  0007 2004          	jra	L516
1387  0009               L316:
1388                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1390  0009 7219534e      	bres	21326,#4
1391  000d               L516:
1392                     ; 512 }
1395  000d 81            	ret
1707                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1707                     ; 584 {
1708                     .text:	section	.text,new
1709  0000               _ADC_ChannelCmd:
1711  0000 89            	pushw	x
1712  0001 88            	push	a
1713       00000001      OFST:	set	1
1716                     ; 585   uint8_t regindex = 0;
1718                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1720                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1722  0002 7b06          	ld	a,(OFST+5,sp)
1723  0004 6b01          	ld	(OFST+0,sp),a
1724                     ; 591   if (NewState != DISABLE)
1726  0006 0d08          	tnz	(OFST+7,sp)
1727  0008 270f          	jreq	L367
1728                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1730  000a 01            	rrwa	x,a
1731  000b 1b01          	add	a,(OFST+0,sp)
1732  000d 2401          	jrnc	L23
1733  000f 5c            	incw	x
1734  0010               L23:
1735  0010 02            	rlwa	x,a
1736  0011 e60a          	ld	a,(10,x)
1737  0013 1a07          	or	a,(OFST+6,sp)
1738  0015 e70a          	ld	(10,x),a
1740  0017 2012          	jra	L567
1741  0019               L367:
1742                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1744  0019 7b02          	ld	a,(OFST+1,sp)
1745  001b 97            	ld	xl,a
1746  001c 7b03          	ld	a,(OFST+2,sp)
1747  001e 1b01          	add	a,(OFST+0,sp)
1748  0020 2401          	jrnc	L43
1749  0022 5c            	incw	x
1750  0023               L43:
1751  0023 02            	rlwa	x,a
1752  0024 7b07          	ld	a,(OFST+6,sp)
1753  0026 43            	cpl	a
1754  0027 e40a          	and	a,(10,x)
1755  0029 e70a          	ld	(10,x),a
1756  002b               L567:
1757                     ; 601 }
1760  002b 5b03          	addw	sp,#3
1761  002d 81            	ret
1911                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1911                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1911                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1911                     ; 628 {
1912                     .text:	section	.text,new
1913  0000               _ADC_SamplingTimeConfig:
1915  0000 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1921                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1923                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1925  0001 0d05          	tnz	(OFST+5,sp)
1926  0003 2712          	jreq	L3501
1927                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1929  0005 e602          	ld	a,(2,x)
1930  0007 a41f          	and	a,#31
1931  0009 e702          	ld	(2,x),a
1932                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1934  000b 7b06          	ld	a,(OFST+6,sp)
1935  000d 4e            	swap	a
1936  000e 48            	sll	a
1937  000f a4e0          	and	a,#224
1938  0011 ea02          	or	a,(2,x)
1939  0013 e702          	ld	(2,x),a
1941  0015 2010          	jra	L5501
1942  0017               L3501:
1943                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1945  0017 1e01          	ldw	x,(OFST+1,sp)
1946  0019 e601          	ld	a,(1,x)
1947  001b a4f8          	and	a,#248
1948  001d e701          	ld	(1,x),a
1949                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1951  001f 1e01          	ldw	x,(OFST+1,sp)
1952  0021 e601          	ld	a,(1,x)
1953  0023 1a06          	or	a,(OFST+6,sp)
1954  0025 e701          	ld	(1,x),a
1955  0027               L5501:
1956                     ; 645 }
1959  0027 85            	popw	x
1960  0028 81            	ret
2027                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2027                     ; 692                               FunctionalState NewState)
2027                     ; 693 {
2028                     .text:	section	.text,new
2029  0000               _ADC_SchmittTriggerConfig:
2031  0000 89            	pushw	x
2032  0001 88            	push	a
2033       00000001      OFST:	set	1
2036                     ; 694   uint8_t regindex = 0;
2038                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2040                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2042  0002 7b06          	ld	a,(OFST+5,sp)
2043  0004 6b01          	ld	(OFST+0,sp),a
2044                     ; 700   if (NewState != DISABLE)
2046  0006 0d08          	tnz	(OFST+7,sp)
2047  0008 2710          	jreq	L3111
2048                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2050  000a 01            	rrwa	x,a
2051  000b 1b01          	add	a,(OFST+0,sp)
2052  000d 2401          	jrnc	L24
2053  000f 5c            	incw	x
2054  0010               L24:
2055  0010 02            	rlwa	x,a
2056  0011 7b07          	ld	a,(OFST+6,sp)
2057  0013 43            	cpl	a
2058  0014 e40e          	and	a,(14,x)
2059  0016 e70e          	ld	(14,x),a
2061  0018 2011          	jra	L5111
2062  001a               L3111:
2063                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2065  001a 7b02          	ld	a,(OFST+1,sp)
2066  001c 97            	ld	xl,a
2067  001d 7b03          	ld	a,(OFST+2,sp)
2068  001f 1b01          	add	a,(OFST+0,sp)
2069  0021 2401          	jrnc	L44
2070  0023 5c            	incw	x
2071  0024               L44:
2072  0024 02            	rlwa	x,a
2073  0025 e60e          	ld	a,(14,x)
2074  0027 1a07          	or	a,(OFST+6,sp)
2075  0029 e70e          	ld	(14,x),a
2076  002b               L5111:
2077                     ; 710 }
2080  002b 5b03          	addw	sp,#3
2081  002d 81            	ret
2128                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2128                     ; 718 {
2129                     .text:	section	.text,new
2130  0000               _ADC_GetConversionValue:
2132  0000 89            	pushw	x
2133  0001 89            	pushw	x
2134       00000002      OFST:	set	2
2137                     ; 719   uint16_t tmpreg = 0;
2139                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2141  0002 e604          	ld	a,(4,x)
2142  0004 5f            	clrw	x
2143  0005 97            	ld	xl,a
2144  0006 1f01          	ldw	(OFST-1,sp),x
2145                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2147  0008 1e01          	ldw	x,(OFST-1,sp)
2148  000a 1603          	ldw	y,(OFST+1,sp)
2149  000c 90e605        	ld	a,(5,y)
2150  000f 02            	rlwa	x,a
2151  0010 1f01          	ldw	(OFST-1,sp),x
2152                     ; 726   return (uint16_t)(tmpreg) ;
2154  0012 1e01          	ldw	x,(OFST-1,sp)
2157  0014 5b04          	addw	sp,#4
2158  0016 81            	ret
2205                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2205                     ; 761 {
2206                     .text:	section	.text,new
2207  0000               _ADC_DMACmd:
2209  0000 89            	pushw	x
2210       00000000      OFST:	set	0
2213                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2215                     ; 765   if (NewState != DISABLE)
2217  0001 0d05          	tnz	(OFST+5,sp)
2218  0003 2708          	jreq	L7611
2219                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2221  0005 e60a          	ld	a,(10,x)
2222  0007 a47f          	and	a,#127
2223  0009 e70a          	ld	(10,x),a
2225  000b 2008          	jra	L1711
2226  000d               L7611:
2227                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2229  000d 1e01          	ldw	x,(OFST+1,sp)
2230  000f e60a          	ld	a,(10,x)
2231  0011 aa80          	or	a,#128
2232  0013 e70a          	ld	(10,x),a
2233  0015               L1711:
2234                     ; 775 }
2237  0015 85            	popw	x
2238  0016 81            	ret
2322                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2322                     ; 832 {
2323                     .text:	section	.text,new
2324  0000               _ADC_ITConfig:
2326  0000 89            	pushw	x
2327       00000000      OFST:	set	0
2330                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2332                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2334                     ; 837   if (NewState != DISABLE)
2336  0001 0d06          	tnz	(OFST+6,sp)
2337  0003 2706          	jreq	L5321
2338                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2340  0005 f6            	ld	a,(x)
2341  0006 1a05          	or	a,(OFST+5,sp)
2342  0008 f7            	ld	(x),a
2344  0009 2007          	jra	L7321
2345  000b               L5321:
2346                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2348  000b 1e01          	ldw	x,(OFST+1,sp)
2349  000d 7b05          	ld	a,(OFST+5,sp)
2350  000f 43            	cpl	a
2351  0010 f4            	and	a,(x)
2352  0011 f7            	ld	(x),a
2353  0012               L7321:
2354                     ; 847 }
2357  0012 85            	popw	x
2358  0013 81            	ret
2463                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2463                     ; 860 {
2464                     .text:	section	.text,new
2465  0000               _ADC_GetFlagStatus:
2467  0000 89            	pushw	x
2468  0001 88            	push	a
2469       00000001      OFST:	set	1
2472                     ; 861   FlagStatus flagstatus = RESET;
2474                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2476                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2478  0002 e603          	ld	a,(3,x)
2479  0004 1506          	bcp	a,(OFST+5,sp)
2480  0006 2706          	jreq	L3131
2481                     ; 870     flagstatus = SET;
2483  0008 a601          	ld	a,#1
2484  000a 6b01          	ld	(OFST+0,sp),a
2486  000c 2002          	jra	L5131
2487  000e               L3131:
2488                     ; 875     flagstatus = RESET;
2490  000e 0f01          	clr	(OFST+0,sp)
2491  0010               L5131:
2492                     ; 879   return  flagstatus;
2494  0010 7b01          	ld	a,(OFST+0,sp)
2497  0012 5b03          	addw	sp,#3
2498  0014 81            	ret
2545                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2545                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2545                     ; 894 {
2546                     .text:	section	.text,new
2547  0000               _ADC_ClearFlag:
2549  0000 89            	pushw	x
2550       00000000      OFST:	set	0
2553                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2555                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2557  0001 7b05          	ld	a,(OFST+5,sp)
2558  0003 43            	cpl	a
2559  0004 1e01          	ldw	x,(OFST+1,sp)
2560  0006 e703          	ld	(3,x),a
2561                     ; 900 }
2564  0008 85            	popw	x
2565  0009 81            	ret
2641                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2641                     ; 913                          ADC_IT_TypeDef ADC_IT)
2641                     ; 914 {
2642                     .text:	section	.text,new
2643  0000               _ADC_GetITStatus:
2645  0000 89            	pushw	x
2646  0001 5203          	subw	sp,#3
2647       00000003      OFST:	set	3
2650                     ; 915   ITStatus itstatus = RESET;
2652                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2656                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2658                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2660  0003 7b08          	ld	a,(OFST+5,sp)
2661  0005 44            	srl	a
2662  0006 44            	srl	a
2663  0007 44            	srl	a
2664  0008 6b03          	ld	(OFST+0,sp),a
2665                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2665                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2667  000a 7b03          	ld	a,(OFST+0,sp)
2668  000c a403          	and	a,#3
2669  000e 6b01          	ld	(OFST-2,sp),a
2670  0010 7b03          	ld	a,(OFST+0,sp)
2671  0012 a410          	and	a,#16
2672  0014 44            	srl	a
2673  0015 44            	srl	a
2674  0016 1a01          	or	a,(OFST-2,sp)
2675  0018 6b03          	ld	(OFST+0,sp),a
2676                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2678  001a f6            	ld	a,(x)
2679  001b 1408          	and	a,(OFST+5,sp)
2680  001d 6b02          	ld	(OFST-1,sp),a
2681                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2683  001f e603          	ld	a,(3,x)
2684  0021 1503          	bcp	a,(OFST+0,sp)
2685  0023 270a          	jreq	L3041
2687  0025 0d02          	tnz	(OFST-1,sp)
2688  0027 2706          	jreq	L3041
2689                     ; 933     itstatus = SET;
2691  0029 a601          	ld	a,#1
2692  002b 6b03          	ld	(OFST+0,sp),a
2694  002d 2002          	jra	L5041
2695  002f               L3041:
2696                     ; 938     itstatus = RESET;
2698  002f 0f03          	clr	(OFST+0,sp)
2699  0031               L5041:
2700                     ; 942   return  itstatus;
2702  0031 7b03          	ld	a,(OFST+0,sp)
2705  0033 5b05          	addw	sp,#5
2706  0035 81            	ret
2763                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2763                     ; 956                            ADC_IT_TypeDef ADC_IT)
2763                     ; 957 {
2764                     .text:	section	.text,new
2765  0000               _ADC_ClearITPendingBit:
2767  0000 89            	pushw	x
2768  0001 89            	pushw	x
2769       00000002      OFST:	set	2
2772                     ; 958   uint8_t itmask = 0;
2774                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2776                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2778  0002 7b07          	ld	a,(OFST+5,sp)
2779  0004 44            	srl	a
2780  0005 44            	srl	a
2781  0006 44            	srl	a
2782  0007 6b02          	ld	(OFST+0,sp),a
2783                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2783                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2785  0009 7b02          	ld	a,(OFST+0,sp)
2786  000b a403          	and	a,#3
2787  000d 6b01          	ld	(OFST-1,sp),a
2788  000f 7b02          	ld	a,(OFST+0,sp)
2789  0011 a410          	and	a,#16
2790  0013 44            	srl	a
2791  0014 44            	srl	a
2792  0015 1a01          	or	a,(OFST-1,sp)
2793  0017 6b02          	ld	(OFST+0,sp),a
2794                     ; 969   ADCx->SR = (uint8_t)~itmask;
2796  0019 7b02          	ld	a,(OFST+0,sp)
2797  001b 43            	cpl	a
2798  001c 1e03          	ldw	x,(OFST+1,sp)
2799  001e e703          	ld	(3,x),a
2800                     ; 970 }
2803  0020 5b04          	addw	sp,#4
2804  0022 81            	ret
2817                     	xdef	_ADC_ClearITPendingBit
2818                     	xdef	_ADC_GetITStatus
2819                     	xdef	_ADC_ClearFlag
2820                     	xdef	_ADC_GetFlagStatus
2821                     	xdef	_ADC_ITConfig
2822                     	xdef	_ADC_DMACmd
2823                     	xdef	_ADC_GetConversionValue
2824                     	xdef	_ADC_SchmittTriggerConfig
2825                     	xdef	_ADC_SamplingTimeConfig
2826                     	xdef	_ADC_ChannelCmd
2827                     	xdef	_ADC_VrefintCmd
2828                     	xdef	_ADC_TempSensorCmd
2829                     	xdef	_ADC_AnalogWatchdogConfig
2830                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2831                     	xdef	_ADC_AnalogWatchdogChannelSelect
2832                     	xdef	_ADC_ExternalTrigConfig
2833                     	xdef	_ADC_SoftwareStartConv
2834                     	xdef	_ADC_Cmd
2835                     	xdef	_ADC_Init
2836                     	xdef	_ADC_DeInit
2855                     	end
