   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 137                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 137                     ; 129 {
 139                     .text:	section	.text,new
 140  0000               _SPI_DeInit:
 144                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 146  0000 7f            	clr	(x)
 147                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 149  0001 6f01          	clr	(1,x)
 150                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 152  0003 6f02          	clr	(2,x)
 153                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 155  0005 a602          	ld	a,#2
 156  0007 e703          	ld	(3,x),a
 157                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 159  0009 a607          	ld	a,#7
 160  000b e705          	ld	(5,x),a
 161                     ; 135 }
 164  000d 81            	ret
 490                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 490                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 490                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 490                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 490                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 490                     ; 182 {
 491                     .text:	section	.text,new
 492  0000               _SPI_Init:
 494  0000 89            	pushw	x
 495  0001 88            	push	a
 496       00000001      OFST:	set	1
 499                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 501                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 503                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 505                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 507                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 509                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 511                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 513                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 515                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 515                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 515                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 515                     ; 197                                   SPI_CPHA));
 517  0002 7b09          	ld	a,(OFST+8,sp)
 518  0004 1a0a          	or	a,(OFST+9,sp)
 519  0006 6b01          	ld	(OFST+0,sp),a
 520  0008 7b06          	ld	a,(OFST+5,sp)
 521  000a 1a07          	or	a,(OFST+6,sp)
 522  000c 1a01          	or	a,(OFST+0,sp)
 523  000e 1e02          	ldw	x,(OFST+1,sp)
 524  0010 f7            	ld	(x),a
 525                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 527  0011 7b0b          	ld	a,(OFST+10,sp)
 528  0013 1a0c          	or	a,(OFST+11,sp)
 529  0015 1e02          	ldw	x,(OFST+1,sp)
 530  0017 e701          	ld	(1,x),a
 531                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 533  0019 7b08          	ld	a,(OFST+7,sp)
 534  001b a104          	cp	a,#4
 535  001d 260a          	jrne	L562
 536                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 538  001f 1e02          	ldw	x,(OFST+1,sp)
 539  0021 e601          	ld	a,(1,x)
 540  0023 aa01          	or	a,#1
 541  0025 e701          	ld	(1,x),a
 543  0027 2008          	jra	L762
 544  0029               L562:
 545                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0029 1e02          	ldw	x,(OFST+1,sp)
 548  002b e601          	ld	a,(1,x)
 549  002d a4fe          	and	a,#254
 550  002f e701          	ld	(1,x),a
 551  0031               L762:
 552                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 554  0031 1e02          	ldw	x,(OFST+1,sp)
 555  0033 f6            	ld	a,(x)
 556  0034 1a08          	or	a,(OFST+7,sp)
 557  0036 f7            	ld	(x),a
 558                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  0037 7b0d          	ld	a,(OFST+12,sp)
 561  0039 1e02          	ldw	x,(OFST+1,sp)
 562  003b e705          	ld	(5,x),a
 563                     ; 216 }
 566  003d 5b03          	addw	sp,#3
 567  003f 81            	ret
 634                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 634                     ; 226 {
 635                     .text:	section	.text,new
 636  0000               _SPI_Cmd:
 638  0000 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 644                     ; 230   if (NewState != DISABLE)
 646  0001 0d05          	tnz	(OFST+5,sp)
 647  0003 2706          	jreq	L523
 648                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 650  0005 f6            	ld	a,(x)
 651  0006 aa40          	or	a,#64
 652  0008 f7            	ld	(x),a
 654  0009 2006          	jra	L723
 655  000b               L523:
 656                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 658  000b 1e01          	ldw	x,(OFST+1,sp)
 659  000d f6            	ld	a,(x)
 660  000e a4bf          	and	a,#191
 661  0010 f7            	ld	(x),a
 662  0011               L723:
 663                     ; 238 }
 666  0011 85            	popw	x
 667  0012 81            	ret
 715                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 715                     ; 248 {
 716                     .text:	section	.text,new
 717  0000               _SPI_NSSInternalSoftwareCmd:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 725                     ; 252   if (NewState != DISABLE)
 727  0001 0d05          	tnz	(OFST+5,sp)
 728  0003 2708          	jreq	L553
 729                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 731  0005 e601          	ld	a,(1,x)
 732  0007 aa01          	or	a,#1
 733  0009 e701          	ld	(1,x),a
 735  000b 2008          	jra	L753
 736  000d               L553:
 737                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 739  000d 1e01          	ldw	x,(OFST+1,sp)
 740  000f e601          	ld	a,(1,x)
 741  0011 a4fe          	and	a,#254
 742  0013 e701          	ld	(1,x),a
 743  0015               L753:
 744                     ; 260 }
 747  0015 85            	popw	x
 748  0016 81            	ret
 816                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 816                     ; 272 {
 817                     .text:	section	.text,new
 818  0000               _SPI_BiDirectionalLineConfig:
 820  0000 89            	pushw	x
 821       00000000      OFST:	set	0
 824                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 826                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 828  0001 0d05          	tnz	(OFST+5,sp)
 829  0003 2708          	jreq	L514
 830                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 832  0005 e601          	ld	a,(1,x)
 833  0007 aa40          	or	a,#64
 834  0009 e701          	ld	(1,x),a
 836  000b 2008          	jra	L714
 837  000d               L514:
 838                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 840  000d 1e01          	ldw	x,(OFST+1,sp)
 841  000f e601          	ld	a,(1,x)
 842  0011 a4bf          	and	a,#191
 843  0013 e701          	ld	(1,x),a
 844  0015               L714:
 845                     ; 284 }
 848  0015 85            	popw	x
 849  0016 81            	ret
 895                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 895                     ; 320 {
 896                     .text:	section	.text,new
 897  0000               _SPI_SendData:
 899  0000 89            	pushw	x
 900       00000000      OFST:	set	0
 903                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 905  0001 7b05          	ld	a,(OFST+5,sp)
 906  0003 1e01          	ldw	x,(OFST+1,sp)
 907  0005 e704          	ld	(4,x),a
 908                     ; 322 }
 911  0007 85            	popw	x
 912  0008 81            	ret
 949                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 949                     ; 330 {
 950                     .text:	section	.text,new
 951  0000               _SPI_ReceiveData:
 955                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 957  0000 e604          	ld	a,(4,x)
 960  0002 81            	ret
 997                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 997                     ; 415 {
 998                     .text:	section	.text,new
 999  0000               _SPI_TransmitCRC:
1003                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1005  0000 e601          	ld	a,(1,x)
1006  0002 aa10          	or	a,#16
1007  0004 e701          	ld	(1,x),a
1008                     ; 417 }
1011  0006 81            	ret
1060                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1060                     ; 427 {
1061                     .text:	section	.text,new
1062  0000               _SPI_CalculateCRCCmd:
1064  0000 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 432   SPI_Cmd(SPI1, DISABLE);
1072  0001 4b00          	push	#0
1073  0003 ae5200        	ldw	x,#20992
1074  0006 cd0000        	call	_SPI_Cmd
1076  0009 84            	pop	a
1077                     ; 434   if (NewState != DISABLE)
1079  000a 0d05          	tnz	(OFST+5,sp)
1080  000c 270a          	jreq	L135
1081                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1083  000e 1e01          	ldw	x,(OFST+1,sp)
1084  0010 e601          	ld	a,(1,x)
1085  0012 aa20          	or	a,#32
1086  0014 e701          	ld	(1,x),a
1088  0016 2008          	jra	L335
1089  0018               L135:
1090                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1092  0018 1e01          	ldw	x,(OFST+1,sp)
1093  001a e601          	ld	a,(1,x)
1094  001c a4df          	and	a,#223
1095  001e e701          	ld	(1,x),a
1096  0020               L335:
1097                     ; 442 }
1100  0020 85            	popw	x
1101  0021 81            	ret
1177                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1177                     ; 454 {
1178                     .text:	section	.text,new
1179  0000               _SPI_GetCRC:
1181  0000 89            	pushw	x
1182  0001 88            	push	a
1183       00000001      OFST:	set	1
1186                     ; 455   uint8_t crcreg = 0;
1188                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1190                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1192  0002 0d06          	tnz	(OFST+5,sp)
1193  0004 2706          	jreq	L575
1194                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1196  0006 e607          	ld	a,(7,x)
1197  0008 6b01          	ld	(OFST+0,sp),a
1199  000a 2006          	jra	L775
1200  000c               L575:
1201                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1203  000c 1e02          	ldw	x,(OFST+1,sp)
1204  000e e606          	ld	a,(6,x)
1205  0010 6b01          	ld	(OFST+0,sp),a
1206  0012               L775:
1207                     ; 470   return crcreg;
1209  0012 7b01          	ld	a,(OFST+0,sp)
1212  0014 5b03          	addw	sp,#3
1213  0016 81            	ret
1252                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1252                     ; 479 {
1253                     .text:	section	.text,new
1254  0000               _SPI_ResetCRC:
1256  0000 89            	pushw	x
1257       00000000      OFST:	set	0
1260                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1262  0001 4b01          	push	#1
1263  0003 cd0000        	call	_SPI_CalculateCRCCmd
1265  0006 84            	pop	a
1266                     ; 485   SPI_Cmd(SPIx, ENABLE);
1268  0007 4b01          	push	#1
1269  0009 1e02          	ldw	x,(OFST+2,sp)
1270  000b cd0000        	call	_SPI_Cmd
1272  000e 84            	pop	a
1273                     ; 486 }
1276  000f 85            	popw	x
1277  0010 81            	ret
1315                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1315                     ; 494 {
1316                     .text:	section	.text,new
1317  0000               _SPI_GetCRCPolynomial:
1321                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1323  0000 e605          	ld	a,(5,x)
1326  0002 81            	ret
1403                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1403                     ; 526 {
1404                     .text:	section	.text,new
1405  0000               _SPI_DMACmd:
1407  0000 89            	pushw	x
1408       00000000      OFST:	set	0
1411                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1413                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1415                     ; 531   if (NewState != DISABLE)
1417  0001 0d06          	tnz	(OFST+6,sp)
1418  0003 2708          	jreq	L107
1419                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1421  0005 e602          	ld	a,(2,x)
1422  0007 1a05          	or	a,(OFST+5,sp)
1423  0009 e702          	ld	(2,x),a
1425  000b 2009          	jra	L307
1426  000d               L107:
1427                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1429  000d 1e01          	ldw	x,(OFST+1,sp)
1430  000f 7b05          	ld	a,(OFST+5,sp)
1431  0011 43            	cpl	a
1432  0012 e402          	and	a,(2,x)
1433  0014 e702          	ld	(2,x),a
1434  0016               L307:
1435                     ; 541 }
1438  0016 85            	popw	x
1439  0017 81            	ret
1560                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1560                     ; 627 {
1561                     .text:	section	.text,new
1562  0000               _SPI_ITConfig:
1564  0000 89            	pushw	x
1565  0001 88            	push	a
1566       00000001      OFST:	set	1
1569                     ; 628   uint8_t itpos = 0;
1571                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1573                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1575                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1577  0002 7b06          	ld	a,(OFST+5,sp)
1578  0004 a40f          	and	a,#15
1579  0006 5f            	clrw	x
1580  0007 97            	ld	xl,a
1581  0008 a601          	ld	a,#1
1582  000a 5d            	tnzw	x
1583  000b 2704          	jreq	L04
1584  000d               L24:
1585  000d 48            	sll	a
1586  000e 5a            	decw	x
1587  000f 26fc          	jrne	L24
1588  0011               L04:
1589  0011 6b01          	ld	(OFST+0,sp),a
1590                     ; 636   if (NewState != DISABLE)
1592  0013 0d07          	tnz	(OFST+6,sp)
1593  0015 270a          	jreq	L367
1594                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1596  0017 1e02          	ldw	x,(OFST+1,sp)
1597  0019 e602          	ld	a,(2,x)
1598  001b 1a01          	or	a,(OFST+0,sp)
1599  001d e702          	ld	(2,x),a
1601  001f 2009          	jra	L567
1602  0021               L367:
1603                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1605  0021 1e02          	ldw	x,(OFST+1,sp)
1606  0023 7b01          	ld	a,(OFST+0,sp)
1607  0025 43            	cpl	a
1608  0026 e402          	and	a,(2,x)
1609  0028 e702          	ld	(2,x),a
1610  002a               L567:
1611                     ; 644 }
1614  002a 5b03          	addw	sp,#3
1615  002c 81            	ret
1748                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1748                     ; 662 {
1749                     .text:	section	.text,new
1750  0000               _SPI_GetFlagStatus:
1752  0000 89            	pushw	x
1753  0001 88            	push	a
1754       00000001      OFST:	set	1
1757                     ; 663   FlagStatus status = RESET;
1759                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1761                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1763  0002 e603          	ld	a,(3,x)
1764  0004 1506          	bcp	a,(OFST+5,sp)
1765  0006 2706          	jreq	L1501
1766                     ; 670     status = SET; /* SPI_FLAG is set */
1768  0008 a601          	ld	a,#1
1769  000a 6b01          	ld	(OFST+0,sp),a
1771  000c 2002          	jra	L3501
1772  000e               L1501:
1773                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1775  000e 0f01          	clr	(OFST+0,sp)
1776  0010               L3501:
1777                     ; 678   return status;
1779  0010 7b01          	ld	a,(OFST+0,sp)
1782  0012 5b03          	addw	sp,#3
1783  0014 81            	ret
1830                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1830                     ; 697 {
1831                     .text:	section	.text,new
1832  0000               _SPI_ClearFlag:
1834  0000 89            	pushw	x
1835       00000000      OFST:	set	0
1838                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1840                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1842  0001 7b05          	ld	a,(OFST+5,sp)
1843  0003 43            	cpl	a
1844  0004 1e01          	ldw	x,(OFST+1,sp)
1845  0006 e703          	ld	(3,x),a
1846                     ; 701 }
1849  0008 85            	popw	x
1850  0009 81            	ret
1944                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1944                     ; 718 {
1945                     .text:	section	.text,new
1946  0000               _SPI_GetITStatus:
1948  0000 89            	pushw	x
1949  0001 5203          	subw	sp,#3
1950       00000003      OFST:	set	3
1953                     ; 719   ITStatus pendingbitstatus = RESET;
1955                     ; 720   uint8_t itpos = 0;
1957                     ; 721   uint8_t itmask1 = 0;
1959                     ; 722   uint8_t itmask2 = 0;
1961                     ; 723   __IO uint8_t enablestatus = 0;
1963  0003 0f02          	clr	(OFST-1,sp)
1964                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1966                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1968  0005 7b08          	ld	a,(OFST+5,sp)
1969  0007 a40f          	and	a,#15
1970  0009 5f            	clrw	x
1971  000a 97            	ld	xl,a
1972  000b a601          	ld	a,#1
1973  000d 5d            	tnzw	x
1974  000e 2704          	jreq	L25
1975  0010               L45:
1976  0010 48            	sll	a
1977  0011 5a            	decw	x
1978  0012 26fc          	jrne	L45
1979  0014               L25:
1980  0014 6b01          	ld	(OFST-2,sp),a
1981                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1983  0016 7b08          	ld	a,(OFST+5,sp)
1984  0018 4e            	swap	a
1985  0019 a40f          	and	a,#15
1986  001b 6b03          	ld	(OFST+0,sp),a
1987                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1989  001d 7b03          	ld	a,(OFST+0,sp)
1990  001f 5f            	clrw	x
1991  0020 97            	ld	xl,a
1992  0021 a601          	ld	a,#1
1993  0023 5d            	tnzw	x
1994  0024 2704          	jreq	L65
1995  0026               L06:
1996  0026 48            	sll	a
1997  0027 5a            	decw	x
1998  0028 26fc          	jrne	L06
1999  002a               L65:
2000  002a 6b03          	ld	(OFST+0,sp),a
2001                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2003  002c 1e04          	ldw	x,(OFST+1,sp)
2004  002e e603          	ld	a,(3,x)
2005  0030 1403          	and	a,(OFST+0,sp)
2006  0032 6b02          	ld	(OFST-1,sp),a
2007                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2009  0034 1e04          	ldw	x,(OFST+1,sp)
2010  0036 e602          	ld	a,(2,x)
2011  0038 1501          	bcp	a,(OFST-2,sp)
2012  003a 270a          	jreq	L1511
2014  003c 0d02          	tnz	(OFST-1,sp)
2015  003e 2706          	jreq	L1511
2016                     ; 738     pendingbitstatus = SET;
2018  0040 a601          	ld	a,#1
2019  0042 6b03          	ld	(OFST+0,sp),a
2021  0044 2002          	jra	L3511
2022  0046               L1511:
2023                     ; 743     pendingbitstatus = RESET;
2025  0046 0f03          	clr	(OFST+0,sp)
2026  0048               L3511:
2027                     ; 746   return  pendingbitstatus;
2029  0048 7b03          	ld	a,(OFST+0,sp)
2032  004a 5b05          	addw	sp,#5
2033  004c 81            	ret
2090                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2090                     ; 765 {
2091                     .text:	section	.text,new
2092  0000               _SPI_ClearITPendingBit:
2094  0000 89            	pushw	x
2095  0001 88            	push	a
2096       00000001      OFST:	set	1
2099                     ; 766   uint8_t itpos = 0;
2101                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2103                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2105  0002 7b06          	ld	a,(OFST+5,sp)
2106  0004 a4f0          	and	a,#240
2107  0006 4e            	swap	a
2108  0007 a40f          	and	a,#15
2109  0009 5f            	clrw	x
2110  000a 97            	ld	xl,a
2111  000b a601          	ld	a,#1
2112  000d 5d            	tnzw	x
2113  000e 2704          	jreq	L46
2114  0010               L66:
2115  0010 48            	sll	a
2116  0011 5a            	decw	x
2117  0012 26fc          	jrne	L66
2118  0014               L46:
2119  0014 6b01          	ld	(OFST+0,sp),a
2120                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2122  0016 7b01          	ld	a,(OFST+0,sp)
2123  0018 43            	cpl	a
2124  0019 1e02          	ldw	x,(OFST+1,sp)
2125  001b e703          	ld	(3,x),a
2126                     ; 776 }
2129  001d 5b03          	addw	sp,#3
2130  001f 81            	ret
2143                     	xdef	_SPI_ClearITPendingBit
2144                     	xdef	_SPI_GetITStatus
2145                     	xdef	_SPI_ClearFlag
2146                     	xdef	_SPI_GetFlagStatus
2147                     	xdef	_SPI_ITConfig
2148                     	xdef	_SPI_DMACmd
2149                     	xdef	_SPI_GetCRCPolynomial
2150                     	xdef	_SPI_ResetCRC
2151                     	xdef	_SPI_GetCRC
2152                     	xdef	_SPI_CalculateCRCCmd
2153                     	xdef	_SPI_TransmitCRC
2154                     	xdef	_SPI_ReceiveData
2155                     	xdef	_SPI_SendData
2156                     	xdef	_SPI_BiDirectionalLineConfig
2157                     	xdef	_SPI_NSSInternalSoftwareCmd
2158                     	xdef	_SPI_Cmd
2159                     	xdef	_SPI_Init
2160                     	xdef	_SPI_DeInit
2179                     	end
