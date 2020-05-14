   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 164                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 164                     ; 149 {
 166                     .text:	section	.text,new
 167  0000               _USART_DeInit:
 171                     ; 153   (void) USARTx->SR;
 173  0000 f6            	ld	a,(x)
 174                     ; 154   (void) USARTx->DR;
 176  0001 e601          	ld	a,(1,x)
 177                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 179  0003 6f03          	clr	(3,x)
 180                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 182  0005 6f02          	clr	(2,x)
 183                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 185  0007 6f04          	clr	(4,x)
 186                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 188  0009 6f05          	clr	(5,x)
 189                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 191  000b 6f06          	clr	(6,x)
 192                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 194  000d 6f07          	clr	(7,x)
 195                     ; 163 }
 198  000f 81            	ret
 390                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 390                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 390                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 390                     ; 195 {
 391                     .text:	section	.text,new
 392  0000               _USART_Init:
 394  0000 89            	pushw	x
 395  0001 5204          	subw	sp,#4
 396       00000004      OFST:	set	4
 399                     ; 196   uint32_t BaudRate_Mantissa = 0;
 401                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 403                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 405                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 407                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 409                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 411                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 413  0003 e604          	ld	a,(4,x)
 414  0005 a4e9          	and	a,#233
 415  0007 e704          	ld	(4,x),a
 416                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 418  0009 7b0d          	ld	a,(OFST+9,sp)
 419  000b 1a0f          	or	a,(OFST+11,sp)
 420  000d ea04          	or	a,(4,x)
 421  000f e704          	ld	(4,x),a
 422                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 424  0011 e606          	ld	a,(6,x)
 425  0013 a4cf          	and	a,#207
 426  0015 e706          	ld	(6,x),a
 427                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 429  0017 e606          	ld	a,(6,x)
 430  0019 1a0e          	or	a,(OFST+10,sp)
 431  001b e706          	ld	(6,x),a
 432                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 434  001d 6f02          	clr	(2,x)
 435                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 437  001f e603          	ld	a,(3,x)
 438  0021 a40f          	and	a,#15
 439  0023 e703          	ld	(3,x),a
 440                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 442  0025 e603          	ld	a,(3,x)
 443  0027 a4f0          	and	a,#240
 444  0029 e703          	ld	(3,x),a
 445                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 447  002b cd0000        	call	_CLK_GetClockFreq
 449  002e 96            	ldw	x,sp
 450  002f 1c0009        	addw	x,#OFST+5
 451  0032 cd0000        	call	c_ludv
 453  0035 96            	ldw	x,sp
 454  0036 1c0001        	addw	x,#OFST-3
 455  0039 cd0000        	call	c_rtol
 457                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 459  003c 7b03          	ld	a,(OFST-1,sp)
 460  003e a4f0          	and	a,#240
 461  0040 1e05          	ldw	x,(OFST+1,sp)
 462  0042 e703          	ld	(3,x),a
 463                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 465  0044 1e05          	ldw	x,(OFST+1,sp)
 466  0046 7b04          	ld	a,(OFST+0,sp)
 467  0048 a40f          	and	a,#15
 468  004a ea03          	or	a,(3,x)
 469  004c e703          	ld	(3,x),a
 470                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  004e 96            	ldw	x,sp
 473  004f 1c0001        	addw	x,#OFST-3
 474  0052 cd0000        	call	c_ltor
 476  0055 a604          	ld	a,#4
 477  0057 cd0000        	call	c_lursh
 479  005a b603          	ld	a,c_lreg+3
 480  005c 1e05          	ldw	x,(OFST+1,sp)
 481  005e e702          	ld	(2,x),a
 482                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  0060 1e05          	ldw	x,(OFST+1,sp)
 485  0062 e605          	ld	a,(5,x)
 486  0064 a4f3          	and	a,#243
 487  0066 e705          	ld	(5,x),a
 488                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 490  0068 1e05          	ldw	x,(OFST+1,sp)
 491  006a e605          	ld	a,(5,x)
 492  006c 1a10          	or	a,(OFST+12,sp)
 493  006e e705          	ld	(5,x),a
 494                     ; 239 }
 497  0070 5b06          	addw	sp,#6
 498  0072 81            	ret
 658                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 658                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 658                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 658                     ; 267 {
 659                     .text:	section	.text,new
 660  0000               _USART_ClockInit:
 662  0000 89            	pushw	x
 663       00000000      OFST:	set	0
 666                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 668                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 670                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 672                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 674                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 676  0001 e606          	ld	a,(6,x)
 677  0003 a4f8          	and	a,#248
 678  0005 e706          	ld	(6,x),a
 679                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 681  0007 7b06          	ld	a,(OFST+6,sp)
 682  0009 1a07          	or	a,(OFST+7,sp)
 683  000b 1a08          	or	a,(OFST+8,sp)
 684  000d ea06          	or	a,(6,x)
 685  000f e706          	ld	(6,x),a
 686                     ; 279   if (USART_Clock != USART_Clock_Disable)
 688  0011 0d05          	tnz	(OFST+5,sp)
 689  0013 2708          	jreq	L523
 690                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 692  0015 e606          	ld	a,(6,x)
 693  0017 aa08          	or	a,#8
 694  0019 e706          	ld	(6,x),a
 696  001b 2008          	jra	L723
 697  001d               L523:
 698                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 700  001d 1e01          	ldw	x,(OFST+1,sp)
 701  001f e606          	ld	a,(6,x)
 702  0021 a4f7          	and	a,#247
 703  0023 e706          	ld	(6,x),a
 704  0025               L723:
 705                     ; 287 }
 708  0025 85            	popw	x
 709  0026 81            	ret
 776                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 776                     ; 297 {
 777                     .text:	section	.text,new
 778  0000               _USART_Cmd:
 780  0000 89            	pushw	x
 781       00000000      OFST:	set	0
 784                     ; 298   if (NewState != DISABLE)
 786  0001 0d05          	tnz	(OFST+5,sp)
 787  0003 2708          	jreq	L563
 788                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 790  0005 e604          	ld	a,(4,x)
 791  0007 a4df          	and	a,#223
 792  0009 e704          	ld	(4,x),a
 794  000b 2008          	jra	L763
 795  000d               L563:
 796                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 798  000d 1e01          	ldw	x,(OFST+1,sp)
 799  000f e604          	ld	a,(4,x)
 800  0011 aa20          	or	a,#32
 801  0013 e704          	ld	(4,x),a
 802  0015               L763:
 803                     ; 306 }
 806  0015 85            	popw	x
 807  0016 81            	ret
 853                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 853                     ; 330 {
 854                     .text:	section	.text,new
 855  0000               _USART_SetPrescaler:
 857  0000 89            	pushw	x
 858       00000000      OFST:	set	0
 861                     ; 332   USARTx->PSCR = USART_Prescaler;
 863  0001 7b05          	ld	a,(OFST+5,sp)
 864  0003 1e01          	ldw	x,(OFST+1,sp)
 865  0005 e70a          	ld	(10,x),a
 866                     ; 333 }
 869  0007 85            	popw	x
 870  0008 81            	ret
 907                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 907                     ; 341 {
 908                     .text:	section	.text,new
 909  0000               _USART_SendBreak:
 913                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 915  0000 e605          	ld	a,(5,x)
 916  0002 aa01          	or	a,#1
 917  0004 e705          	ld	(5,x),a
 918                     ; 343 }
 921  0006 81            	ret
 958                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 958                     ; 383 {
 959                     .text:	section	.text,new
 960  0000               _USART_ReceiveData8:
 964                     ; 384   return USARTx->DR;
 966  0000 e601          	ld	a,(1,x)
 969  0002 81            	ret
1015                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1015                     ; 393 {
1016                     .text:	section	.text,new
1017  0000               _USART_ReceiveData9:
1019  0000 89            	pushw	x
1020  0001 89            	pushw	x
1021       00000002      OFST:	set	2
1024                     ; 394   uint16_t temp = 0;
1026                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1028  0002 e604          	ld	a,(4,x)
1029  0004 5f            	clrw	x
1030  0005 a480          	and	a,#128
1031  0007 5f            	clrw	x
1032  0008 02            	rlwa	x,a
1033  0009 58            	sllw	x
1034  000a 1f01          	ldw	(OFST-1,sp),x
1035                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1037  000c 1e03          	ldw	x,(OFST+1,sp)
1038  000e e601          	ld	a,(1,x)
1039  0010 5f            	clrw	x
1040  0011 97            	ld	xl,a
1041  0012 01            	rrwa	x,a
1042  0013 1a02          	or	a,(OFST+0,sp)
1043  0015 01            	rrwa	x,a
1044  0016 1a01          	or	a,(OFST-1,sp)
1045  0018 01            	rrwa	x,a
1046  0019 01            	rrwa	x,a
1047  001a a4ff          	and	a,#255
1048  001c 01            	rrwa	x,a
1049  001d a401          	and	a,#1
1050  001f 01            	rrwa	x,a
1053  0020 5b04          	addw	sp,#4
1054  0022 81            	ret
1100                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1100                     ; 406 {
1101                     .text:	section	.text,new
1102  0000               _USART_SendData8:
1104  0000 89            	pushw	x
1105       00000000      OFST:	set	0
1108                     ; 408   USARTx->DR = Data;
1110  0001 7b05          	ld	a,(OFST+5,sp)
1111  0003 1e01          	ldw	x,(OFST+1,sp)
1112  0005 e701          	ld	(1,x),a
1113                     ; 409 }
1116  0007 85            	popw	x
1117  0008 81            	ret
1163                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1163                     ; 419 {
1164                     .text:	section	.text,new
1165  0000               _USART_SendData9:
1167  0000 89            	pushw	x
1168       00000000      OFST:	set	0
1171                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1173                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1175  0001 e604          	ld	a,(4,x)
1176  0003 a4bf          	and	a,#191
1177  0005 e704          	ld	(4,x),a
1178                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1180  0007 1605          	ldw	y,(OFST+5,sp)
1181  0009 9054          	srlw	y
1182  000b 9054          	srlw	y
1183  000d 909f          	ld	a,yl
1184  000f a440          	and	a,#64
1185  0011 ea04          	or	a,(4,x)
1186  0013 e704          	ld	(4,x),a
1187                     ; 429   USARTx->DR   = (uint8_t)(Data);
1189  0015 7b06          	ld	a,(OFST+6,sp)
1190  0017 1e01          	ldw	x,(OFST+1,sp)
1191  0019 e701          	ld	(1,x),a
1192                     ; 430 }
1195  001b 85            	popw	x
1196  001c 81            	ret
1244                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1244                     ; 474 {
1245                     .text:	section	.text,new
1246  0000               _USART_ReceiverWakeUpCmd:
1248  0000 89            	pushw	x
1249       00000000      OFST:	set	0
1252                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1254                     ; 477   if (NewState != DISABLE)
1256  0001 0d05          	tnz	(OFST+5,sp)
1257  0003 2708          	jreq	L575
1258                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1260  0005 e605          	ld	a,(5,x)
1261  0007 aa02          	or	a,#2
1262  0009 e705          	ld	(5,x),a
1264  000b 2008          	jra	L775
1265  000d               L575:
1266                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1268  000d 1e01          	ldw	x,(OFST+1,sp)
1269  000f e605          	ld	a,(5,x)
1270  0011 a4fd          	and	a,#253
1271  0013 e705          	ld	(5,x),a
1272  0015               L775:
1273                     ; 487 }
1276  0015 85            	popw	x
1277  0016 81            	ret
1323                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1323                     ; 497 {
1324                     .text:	section	.text,new
1325  0000               _USART_SetAddress:
1327  0000 89            	pushw	x
1328       00000000      OFST:	set	0
1331                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1333                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1335  0001 e607          	ld	a,(7,x)
1336  0003 a4f0          	and	a,#240
1337  0005 e707          	ld	(7,x),a
1338                     ; 504   USARTx->CR4 |= USART_Address;
1340  0007 e607          	ld	a,(7,x)
1341  0009 1a05          	or	a,(OFST+5,sp)
1342  000b e707          	ld	(7,x),a
1343                     ; 505 }
1346  000d 85            	popw	x
1347  000e 81            	ret
1416                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1416                     ; 516 {
1417                     .text:	section	.text,new
1418  0000               _USART_WakeUpConfig:
1420  0000 89            	pushw	x
1421       00000000      OFST:	set	0
1424                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1426                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1428  0001 e604          	ld	a,(4,x)
1429  0003 a4f7          	and	a,#247
1430  0005 e704          	ld	(4,x),a
1431                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1433  0007 e604          	ld	a,(4,x)
1434  0009 1a05          	or	a,(OFST+5,sp)
1435  000b e704          	ld	(4,x),a
1436                     ; 521 }
1439  000d 85            	popw	x
1440  000e 81            	ret
1488                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1488                     ; 567 {
1489                     .text:	section	.text,new
1490  0000               _USART_HalfDuplexCmd:
1492  0000 89            	pushw	x
1493       00000000      OFST:	set	0
1496                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1498                     ; 570   if (NewState != DISABLE)
1500  0001 0d05          	tnz	(OFST+5,sp)
1501  0003 2708          	jreq	L507
1502                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1504  0005 e608          	ld	a,(8,x)
1505  0007 aa08          	or	a,#8
1506  0009 e708          	ld	(8,x),a
1508  000b 2008          	jra	L707
1509  000d               L507:
1510                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1512  000d 1e01          	ldw	x,(OFST+1,sp)
1513  000f e608          	ld	a,(8,x)
1514  0011 a4f7          	and	a,#247
1515  0013 e708          	ld	(8,x),a
1516  0015               L707:
1517                     ; 578 }
1520  0015 85            	popw	x
1521  0016 81            	ret
1568                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1568                     ; 645 {
1569                     .text:	section	.text,new
1570  0000               _USART_SmartCardCmd:
1572  0000 89            	pushw	x
1573       00000000      OFST:	set	0
1576                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1578                     ; 648   if (NewState != DISABLE)
1580  0001 0d05          	tnz	(OFST+5,sp)
1581  0003 2708          	jreq	L537
1582                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1584  0005 e608          	ld	a,(8,x)
1585  0007 aa20          	or	a,#32
1586  0009 e708          	ld	(8,x),a
1588  000b 2008          	jra	L737
1589  000d               L537:
1590                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1592  000d 1e01          	ldw	x,(OFST+1,sp)
1593  000f e608          	ld	a,(8,x)
1594  0011 a4df          	and	a,#223
1595  0013 e708          	ld	(8,x),a
1596  0015               L737:
1597                     ; 658 }
1600  0015 85            	popw	x
1601  0016 81            	ret
1649                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1649                     ; 668 {
1650                     .text:	section	.text,new
1651  0000               _USART_SmartCardNACKCmd:
1653  0000 89            	pushw	x
1654       00000000      OFST:	set	0
1657                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1659                     ; 671   if (NewState != DISABLE)
1661  0001 0d05          	tnz	(OFST+5,sp)
1662  0003 2708          	jreq	L567
1663                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1665  0005 e608          	ld	a,(8,x)
1666  0007 aa10          	or	a,#16
1667  0009 e708          	ld	(8,x),a
1669  000b 2008          	jra	L767
1670  000d               L567:
1671                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1673  000d 1e01          	ldw	x,(OFST+1,sp)
1674  000f e608          	ld	a,(8,x)
1675  0011 a4ef          	and	a,#239
1676  0013 e708          	ld	(8,x),a
1677  0015               L767:
1678                     ; 681 }
1681  0015 85            	popw	x
1682  0016 81            	ret
1728                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1728                     ; 691 {
1729                     .text:	section	.text,new
1730  0000               _USART_SetGuardTime:
1732  0000 89            	pushw	x
1733       00000000      OFST:	set	0
1736                     ; 693   USARTx->GTR = USART_GuardTime;
1738  0001 7b05          	ld	a,(OFST+5,sp)
1739  0003 1e01          	ldw	x,(OFST+1,sp)
1740  0005 e709          	ld	(9,x),a
1741                     ; 694 }
1744  0007 85            	popw	x
1745  0008 81            	ret
1814                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1814                     ; 752 {
1815                     .text:	section	.text,new
1816  0000               _USART_IrDAConfig:
1818  0000 89            	pushw	x
1819       00000000      OFST:	set	0
1822                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1824                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1826  0001 0d05          	tnz	(OFST+5,sp)
1827  0003 2708          	jreq	L1501
1828                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1830  0005 e608          	ld	a,(8,x)
1831  0007 aa04          	or	a,#4
1832  0009 e708          	ld	(8,x),a
1834  000b 2008          	jra	L3501
1835  000d               L1501:
1836                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1838  000d 1e01          	ldw	x,(OFST+1,sp)
1839  000f e608          	ld	a,(8,x)
1840  0011 a4fb          	and	a,#251
1841  0013 e708          	ld	(8,x),a
1842  0015               L3501:
1843                     ; 763 }
1846  0015 85            	popw	x
1847  0016 81            	ret
1894                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1894                     ; 773 {
1895                     .text:	section	.text,new
1896  0000               _USART_IrDACmd:
1898  0000 89            	pushw	x
1899       00000000      OFST:	set	0
1902                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1904                     ; 778   if (NewState != DISABLE)
1906  0001 0d05          	tnz	(OFST+5,sp)
1907  0003 2708          	jreq	L1011
1908                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1910  0005 e608          	ld	a,(8,x)
1911  0007 aa02          	or	a,#2
1912  0009 e708          	ld	(8,x),a
1914  000b 2008          	jra	L3011
1915  000d               L1011:
1916                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1918  000d 1e01          	ldw	x,(OFST+1,sp)
1919  000f e608          	ld	a,(8,x)
1920  0011 a4fd          	and	a,#253
1921  0013 e708          	ld	(8,x),a
1922  0015               L3011:
1923                     ; 788 }
1926  0015 85            	popw	x
1927  0016 81            	ret
2004                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2004                     ; 819                   FunctionalState NewState)
2004                     ; 820 {
2005                     .text:	section	.text,new
2006  0000               _USART_DMACmd:
2008  0000 89            	pushw	x
2009       00000000      OFST:	set	0
2012                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2014                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2016                     ; 825   if (NewState != DISABLE)
2018  0001 0d06          	tnz	(OFST+6,sp)
2019  0003 2708          	jreq	L5411
2020                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2022  0005 e608          	ld	a,(8,x)
2023  0007 1a05          	or	a,(OFST+5,sp)
2024  0009 e708          	ld	(8,x),a
2026  000b 2009          	jra	L7411
2027  000d               L5411:
2028                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2030  000d 1e01          	ldw	x,(OFST+1,sp)
2031  000f 7b05          	ld	a,(OFST+5,sp)
2032  0011 43            	cpl	a
2033  0012 e408          	and	a,(8,x)
2034  0014 e708          	ld	(8,x),a
2035  0016               L7411:
2036                     ; 837 }
2039  0016 85            	popw	x
2040  0017 81            	ret
2184                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2184                     ; 940 {
2185                     .text:	section	.text,new
2186  0000               _USART_ITConfig:
2188  0000 89            	pushw	x
2189  0001 89            	pushw	x
2190       00000002      OFST:	set	2
2193                     ; 941   uint8_t usartreg, itpos = 0x00;
2195                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2197                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2199                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2201  0002 7b07          	ld	a,(OFST+5,sp)
2202  0004 6b01          	ld	(OFST-1,sp),a
2203                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2205  0006 7b08          	ld	a,(OFST+6,sp)
2206  0008 a40f          	and	a,#15
2207  000a 5f            	clrw	x
2208  000b 97            	ld	xl,a
2209  000c a601          	ld	a,#1
2210  000e 5d            	tnzw	x
2211  000f 2704          	jreq	L65
2212  0011               L06:
2213  0011 48            	sll	a
2214  0012 5a            	decw	x
2215  0013 26fc          	jrne	L06
2216  0015               L65:
2217  0015 6b02          	ld	(OFST+0,sp),a
2218                     ; 950   if (NewState != DISABLE)
2220  0017 0d09          	tnz	(OFST+7,sp)
2221  0019 272a          	jreq	L7321
2222                     ; 953     if (usartreg == 0x01)
2224  001b 7b01          	ld	a,(OFST-1,sp)
2225  001d a101          	cp	a,#1
2226  001f 260a          	jrne	L1421
2227                     ; 955       USARTx->CR1 |= itpos;
2229  0021 1e03          	ldw	x,(OFST+1,sp)
2230  0023 e604          	ld	a,(4,x)
2231  0025 1a02          	or	a,(OFST+0,sp)
2232  0027 e704          	ld	(4,x),a
2234  0029 2045          	jra	L1521
2235  002b               L1421:
2236                     ; 957     else if (usartreg == 0x05)
2238  002b 7b01          	ld	a,(OFST-1,sp)
2239  002d a105          	cp	a,#5
2240  002f 260a          	jrne	L5421
2241                     ; 959       USARTx->CR5 |= itpos;
2243  0031 1e03          	ldw	x,(OFST+1,sp)
2244  0033 e608          	ld	a,(8,x)
2245  0035 1a02          	or	a,(OFST+0,sp)
2246  0037 e708          	ld	(8,x),a
2248  0039 2035          	jra	L1521
2249  003b               L5421:
2250                     ; 964       USARTx->CR2 |= itpos;
2252  003b 1e03          	ldw	x,(OFST+1,sp)
2253  003d e605          	ld	a,(5,x)
2254  003f 1a02          	or	a,(OFST+0,sp)
2255  0041 e705          	ld	(5,x),a
2256  0043 202b          	jra	L1521
2257  0045               L7321:
2258                     ; 970     if (usartreg == 0x01)
2260  0045 7b01          	ld	a,(OFST-1,sp)
2261  0047 a101          	cp	a,#1
2262  0049 260b          	jrne	L3521
2263                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2265  004b 1e03          	ldw	x,(OFST+1,sp)
2266  004d 7b02          	ld	a,(OFST+0,sp)
2267  004f 43            	cpl	a
2268  0050 e404          	and	a,(4,x)
2269  0052 e704          	ld	(4,x),a
2271  0054 201a          	jra	L1521
2272  0056               L3521:
2273                     ; 974     else if (usartreg == 0x05)
2275  0056 7b01          	ld	a,(OFST-1,sp)
2276  0058 a105          	cp	a,#5
2277  005a 260b          	jrne	L7521
2278                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2280  005c 1e03          	ldw	x,(OFST+1,sp)
2281  005e 7b02          	ld	a,(OFST+0,sp)
2282  0060 43            	cpl	a
2283  0061 e408          	and	a,(8,x)
2284  0063 e708          	ld	(8,x),a
2286  0065 2009          	jra	L1521
2287  0067               L7521:
2288                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2290  0067 1e03          	ldw	x,(OFST+1,sp)
2291  0069 7b02          	ld	a,(OFST+0,sp)
2292  006b 43            	cpl	a
2293  006c e405          	and	a,(5,x)
2294  006e e705          	ld	(5,x),a
2295  0070               L1521:
2296                     ; 984 }
2299  0070 5b04          	addw	sp,#4
2300  0072 81            	ret
2448                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2448                     ; 1003 {
2449                     .text:	section	.text,new
2450  0000               _USART_GetFlagStatus:
2452  0000 89            	pushw	x
2453  0001 88            	push	a
2454       00000001      OFST:	set	1
2457                     ; 1004   FlagStatus status = RESET;
2459                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2461                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2463  0002 1e06          	ldw	x,(OFST+5,sp)
2464  0004 a30101        	cpw	x,#257
2465  0007 2612          	jrne	L1531
2466                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2468  0009 1e02          	ldw	x,(OFST+1,sp)
2469  000b e605          	ld	a,(5,x)
2470  000d 1507          	bcp	a,(OFST+6,sp)
2471  000f 2706          	jreq	L3531
2472                     ; 1014       status = SET;
2474  0011 a601          	ld	a,#1
2475  0013 6b01          	ld	(OFST+0,sp),a
2477  0015 2013          	jra	L7531
2478  0017               L3531:
2479                     ; 1019       status = RESET;
2481  0017 0f01          	clr	(OFST+0,sp)
2482  0019 200f          	jra	L7531
2483  001b               L1531:
2484                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2486  001b 1e02          	ldw	x,(OFST+1,sp)
2487  001d f6            	ld	a,(x)
2488  001e 1507          	bcp	a,(OFST+6,sp)
2489  0020 2706          	jreq	L1631
2490                     ; 1027       status = SET;
2492  0022 a601          	ld	a,#1
2493  0024 6b01          	ld	(OFST+0,sp),a
2495  0026 2002          	jra	L7531
2496  0028               L1631:
2497                     ; 1032       status = RESET;
2499  0028 0f01          	clr	(OFST+0,sp)
2500  002a               L7531:
2501                     ; 1036   return status;
2503  002a 7b01          	ld	a,(OFST+0,sp)
2506  002c 5b03          	addw	sp,#3
2507  002e 81            	ret
2554                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2554                     ; 1061 {
2555                     .text:	section	.text,new
2556  0000               _USART_ClearFlag:
2558  0000 89            	pushw	x
2559       00000000      OFST:	set	0
2562                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2564                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2566  0001 7b06          	ld	a,(OFST+6,sp)
2567  0003 43            	cpl	a
2568  0004 1e01          	ldw	x,(OFST+1,sp)
2569  0006 f7            	ld	(x),a
2570                     ; 1066 }
2573  0007 85            	popw	x
2574  0008 81            	ret
2677                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2677                     ; 1084 {
2678                     .text:	section	.text,new
2679  0000               _USART_GetITStatus:
2681  0000 89            	pushw	x
2682  0001 5203          	subw	sp,#3
2683       00000003      OFST:	set	3
2686                     ; 1085   ITStatus pendingbitstatus = RESET;
2688                     ; 1086   uint8_t temp = 0;
2690                     ; 1087   uint8_t itpos = 0;
2692                     ; 1088   uint8_t itmask1 = 0;
2694                     ; 1089   uint8_t itmask2 = 0;
2696                     ; 1090   uint8_t enablestatus = 0;
2698                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2700                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2702  0003 7b09          	ld	a,(OFST+6,sp)
2703  0005 a40f          	and	a,#15
2704  0007 5f            	clrw	x
2705  0008 97            	ld	xl,a
2706  0009 a601          	ld	a,#1
2707  000b 5d            	tnzw	x
2708  000c 2704          	jreq	L07
2709  000e               L27:
2710  000e 48            	sll	a
2711  000f 5a            	decw	x
2712  0010 26fc          	jrne	L27
2713  0012               L07:
2714  0012 6b02          	ld	(OFST-1,sp),a
2715                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2717  0014 7b09          	ld	a,(OFST+6,sp)
2718  0016 4e            	swap	a
2719  0017 a40f          	and	a,#15
2720  0019 6b03          	ld	(OFST+0,sp),a
2721                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2723  001b 7b03          	ld	a,(OFST+0,sp)
2724  001d 5f            	clrw	x
2725  001e 97            	ld	xl,a
2726  001f a601          	ld	a,#1
2727  0021 5d            	tnzw	x
2728  0022 2704          	jreq	L47
2729  0024               L67:
2730  0024 48            	sll	a
2731  0025 5a            	decw	x
2732  0026 26fc          	jrne	L67
2733  0028               L47:
2734  0028 6b03          	ld	(OFST+0,sp),a
2735                     ; 1103   if (USART_IT == USART_IT_PE)
2737  002a 1e08          	ldw	x,(OFST+5,sp)
2738  002c a30100        	cpw	x,#256
2739  002f 261d          	jrne	L5641
2740                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2742  0031 1e04          	ldw	x,(OFST+1,sp)
2743  0033 e604          	ld	a,(4,x)
2744  0035 1403          	and	a,(OFST+0,sp)
2745  0037 6b03          	ld	(OFST+0,sp),a
2746                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2748  0039 1e04          	ldw	x,(OFST+1,sp)
2749  003b f6            	ld	a,(x)
2750  003c 1502          	bcp	a,(OFST-1,sp)
2751  003e 270a          	jreq	L7641
2753  0040 0d03          	tnz	(OFST+0,sp)
2754  0042 2706          	jreq	L7641
2755                     ; 1112       pendingbitstatus = SET;
2757  0044 a601          	ld	a,#1
2758  0046 6b03          	ld	(OFST+0,sp),a
2760  0048 204f          	jra	L3741
2761  004a               L7641:
2762                     ; 1117       pendingbitstatus = RESET;
2764  004a 0f03          	clr	(OFST+0,sp)
2765  004c 204b          	jra	L3741
2766  004e               L5641:
2767                     ; 1121   else if (USART_IT == USART_IT_OR)
2769  004e 1e08          	ldw	x,(OFST+5,sp)
2770  0050 a30235        	cpw	x,#565
2771  0053 2629          	jrne	L5741
2772                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2774  0055 1e04          	ldw	x,(OFST+1,sp)
2775  0057 e605          	ld	a,(5,x)
2776  0059 1403          	and	a,(OFST+0,sp)
2777  005b 6b03          	ld	(OFST+0,sp),a
2778                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2780  005d 1e04          	ldw	x,(OFST+1,sp)
2781  005f e608          	ld	a,(8,x)
2782  0061 a401          	and	a,#1
2783  0063 6b01          	ld	(OFST-2,sp),a
2784                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2786  0065 1e04          	ldw	x,(OFST+1,sp)
2787  0067 f6            	ld	a,(x)
2788  0068 1502          	bcp	a,(OFST-1,sp)
2789  006a 270e          	jreq	L7741
2791  006c 0d03          	tnz	(OFST+0,sp)
2792  006e 2604          	jrne	L1051
2794  0070 0d01          	tnz	(OFST-2,sp)
2795  0072 2706          	jreq	L7741
2796  0074               L1051:
2797                     ; 1132       pendingbitstatus = SET;
2799  0074 a601          	ld	a,#1
2800  0076 6b03          	ld	(OFST+0,sp),a
2802  0078 201f          	jra	L3741
2803  007a               L7741:
2804                     ; 1137       pendingbitstatus = RESET;
2806  007a 0f03          	clr	(OFST+0,sp)
2807  007c 201b          	jra	L3741
2808  007e               L5741:
2809                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2811  007e 1e04          	ldw	x,(OFST+1,sp)
2812  0080 e605          	ld	a,(5,x)
2813  0082 1403          	and	a,(OFST+0,sp)
2814  0084 6b03          	ld	(OFST+0,sp),a
2815                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2817  0086 1e04          	ldw	x,(OFST+1,sp)
2818  0088 f6            	ld	a,(x)
2819  0089 1502          	bcp	a,(OFST-1,sp)
2820  008b 270a          	jreq	L7051
2822  008d 0d03          	tnz	(OFST+0,sp)
2823  008f 2706          	jreq	L7051
2824                     ; 1149       pendingbitstatus = SET;
2826  0091 a601          	ld	a,#1
2827  0093 6b03          	ld	(OFST+0,sp),a
2829  0095 2002          	jra	L3741
2830  0097               L7051:
2831                     ; 1154       pendingbitstatus = RESET;
2833  0097 0f03          	clr	(OFST+0,sp)
2834  0099               L3741:
2835                     ; 1159   return  pendingbitstatus;
2837  0099 7b03          	ld	a,(OFST+0,sp)
2840  009b 5b05          	addw	sp,#5
2841  009d 81            	ret
2879                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2879                     ; 1184 {
2880                     .text:	section	.text,new
2881  0000               _USART_ClearITPendingBit:
2885                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2887                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2889  0000 f6            	ld	a,(x)
2890  0001 a4bf          	and	a,#191
2891  0003 f7            	ld	(x),a
2892                     ; 1189 }
2895  0004 81            	ret
2908                     	xdef	_USART_ClearITPendingBit
2909                     	xdef	_USART_GetITStatus
2910                     	xdef	_USART_ClearFlag
2911                     	xdef	_USART_GetFlagStatus
2912                     	xdef	_USART_ITConfig
2913                     	xdef	_USART_DMACmd
2914                     	xdef	_USART_IrDACmd
2915                     	xdef	_USART_IrDAConfig
2916                     	xdef	_USART_SetGuardTime
2917                     	xdef	_USART_SmartCardNACKCmd
2918                     	xdef	_USART_SmartCardCmd
2919                     	xdef	_USART_HalfDuplexCmd
2920                     	xdef	_USART_SetAddress
2921                     	xdef	_USART_ReceiverWakeUpCmd
2922                     	xdef	_USART_WakeUpConfig
2923                     	xdef	_USART_ReceiveData9
2924                     	xdef	_USART_ReceiveData8
2925                     	xdef	_USART_SendData9
2926                     	xdef	_USART_SendData8
2927                     	xdef	_USART_SendBreak
2928                     	xdef	_USART_SetPrescaler
2929                     	xdef	_USART_Cmd
2930                     	xdef	_USART_ClockInit
2931                     	xdef	_USART_Init
2932                     	xdef	_USART_DeInit
2933                     	xref	_CLK_GetClockFreq
2934                     	xref.b	c_lreg
2935                     	xref.b	c_x
2954                     	xref	c_lursh
2955                     	xref	c_ltor
2956                     	xref	c_rtol
2957                     	xref	c_ludv
2958                     	end
