   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  79                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  79                     ; 175 {
  81                     .text:	section	.text,new
  82  0000               _FLASH_SetProgrammingTime:
  86                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  88                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  90  0000 72115050      	bres	20560,#0
  91                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  93  0004 ca5050        	or	a,20560
  94  0007 c75050        	ld	20560,a
  95                     ; 181 }
  98  000a 81            	ret
 123                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 123                     ; 189 {
 124                     .text:	section	.text,new
 125  0000               _FLASH_GetProgrammingTime:
 129                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 131  0000 c65050        	ld	a,20560
 132  0003 a401          	and	a,#1
 135  0005 81            	ret
 191                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 191                     ; 204 {
 192                     .text:	section	.text,new
 193  0000               _FLASH_PowerWaitModeConfig:
 197                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 199                     ; 209   if(FLASH_Power != FLASH_Power_On)
 201  0000 a101          	cp	a,#1
 202  0002 2706          	jreq	L57
 203                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 205  0004 72145050      	bset	20560,#2
 207  0008 2004          	jra	L77
 208  000a               L57:
 209                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 211  000a 72155050      	bres	20560,#2
 212  000e               L77:
 213                     ; 218 }
 216  000e 81            	ret
 239                     ; 259 void FLASH_DeInit(void)
 239                     ; 260 {
 240                     .text:	section	.text,new
 241  0000               _FLASH_DeInit:
 245                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 247  0000 725f5050      	clr	20560
 248                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 250  0004 725f5051      	clr	20561
 251                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 253  0008 35405054      	mov	20564,#64
 254                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 256  000c c65054        	ld	a,20564
 257                     ; 265 }
 260  000f 81            	ret
 316                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 316                     ; 276 {
 317                     .text:	section	.text,new
 318  0000               _FLASH_Unlock:
 320  0000 88            	push	a
 321       00000000      OFST:	set	0
 324                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 326                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 328  0001 a1fd          	cp	a,#253
 329  0003 2608          	jrne	L731
 330                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 332  0005 35565052      	mov	20562,#86
 333                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 335  0009 35ae5052      	mov	20562,#174
 336  000d               L731:
 337                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 339  000d 7b01          	ld	a,(OFST+1,sp)
 340  000f a1f7          	cp	a,#247
 341  0011 2608          	jrne	L141
 342                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 344  0013 35ae5053      	mov	20563,#174
 345                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 347  0017 35565053      	mov	20563,#86
 348  001b               L141:
 349                     ; 293 }
 352  001b 84            	pop	a
 353  001c 81            	ret
 388                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 388                     ; 304 {
 389                     .text:	section	.text,new
 390  0000               _FLASH_Lock:
 394                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 396                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 398  0000 c45054        	and	a,20564
 399  0003 c75054        	ld	20564,a
 400                     ; 310 }
 403  0006 81            	ret
 446                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 446                     ; 319 {
 447                     .text:	section	.text,new
 448  0000               _FLASH_ProgramByte:
 450       00000000      OFST:	set	0
 453                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 455                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 457  0000 7b07          	ld	a,(OFST+7,sp)
 458  0002 1e05          	ldw	x,(OFST+5,sp)
 459  0004 f7            	ld	(x),a
 460                     ; 324 }
 463  0005 81            	ret
 497                     ; 331 void FLASH_EraseByte(uint32_t Address)
 497                     ; 332 {
 498                     .text:	section	.text,new
 499  0000               _FLASH_EraseByte:
 501       00000000      OFST:	set	0
 504                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 506                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 508  0000 1e05          	ldw	x,(OFST+5,sp)
 509  0002 7f            	clr	(x)
 510                     ; 337 }
 513  0003 81            	ret
 556                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 556                     ; 346 {
 557                     .text:	section	.text,new
 558  0000               _FLASH_ProgramWord:
 560       00000000      OFST:	set	0
 563                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 565                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 567  0000 721c5051      	bset	20561,#6
 568                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 570  0004 7b07          	ld	a,(OFST+7,sp)
 571  0006 1e05          	ldw	x,(OFST+5,sp)
 572  0008 f7            	ld	(x),a
 573                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 575  0009 7b08          	ld	a,(OFST+8,sp)
 576  000b 1e05          	ldw	x,(OFST+5,sp)
 577  000d e701          	ld	(1,x),a
 578                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 580  000f 7b09          	ld	a,(OFST+9,sp)
 581  0011 1e05          	ldw	x,(OFST+5,sp)
 582  0013 e702          	ld	(2,x),a
 583                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 585  0015 7b0a          	ld	a,(OFST+10,sp)
 586  0017 1e05          	ldw	x,(OFST+5,sp)
 587  0019 e703          	ld	(3,x),a
 588                     ; 360 }
 591  001b 81            	ret
 625                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 625                     ; 368 {
 626                     .text:	section	.text,new
 627  0000               _FLASH_ReadByte:
 629       00000000      OFST:	set	0
 632                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 634  0000 1e05          	ldw	x,(OFST+5,sp)
 635  0002 f6            	ld	a,(x)
 638  0003 81            	ret
 683                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 683                     ; 418 {
 684                     .text:	section	.text,new
 685  0000               _FLASH_ProgramOptionByte:
 687  0000 89            	pushw	x
 688       00000000      OFST:	set	0
 691                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 693                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 695  0001 721e5051      	bset	20561,#7
 696                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 698  0005 7b05          	ld	a,(OFST+5,sp)
 699  0007 1e01          	ldw	x,(OFST+1,sp)
 700  0009 f7            	ld	(x),a
 701                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 703  000a a6fd          	ld	a,#253
 704  000c cd0000        	call	_FLASH_WaitForLastOperation
 706                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 708  000f 721f5051      	bres	20561,#7
 709                     ; 432 }
 712  0013 85            	popw	x
 713  0014 81            	ret
 749                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 749                     ; 440 {
 750                     .text:	section	.text,new
 751  0000               _FLASH_EraseOptionByte:
 755                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 757                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 759  0000 721e5051      	bset	20561,#7
 760                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 762  0004 7f            	clr	(x)
 763                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 765  0005 a6fd          	ld	a,#253
 766  0007 cd0000        	call	_FLASH_WaitForLastOperation
 768                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 770  000a 721f5051      	bres	20561,#7
 771                     ; 454 }
 774  000e 81            	ret
 831                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 831                     ; 463 {
 832                     .text:	section	.text,new
 833  0000               _FLASH_GetReadOutProtectionStatus:
 835  0000 88            	push	a
 836       00000001      OFST:	set	1
 839                     ; 464   FunctionalState state = DISABLE;
 841                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 843  0001 c64800        	ld	a,18432
 844  0004 a1aa          	cp	a,#170
 845  0006 2606          	jrne	L743
 846                     ; 469     state =  ENABLE;
 848  0008 a601          	ld	a,#1
 849  000a 6b01          	ld	(OFST+0,sp),a
 851  000c 2002          	jra	L153
 852  000e               L743:
 853                     ; 474     state =  DISABLE;
 855  000e 0f01          	clr	(OFST+0,sp)
 856  0010               L153:
 857                     ; 477   return state;
 859  0010 7b01          	ld	a,(OFST+0,sp)
 862  0012 5b01          	addw	sp,#1
 863  0014 81            	ret
 897                     ; 485 uint16_t FLASH_GetBootSize(void)
 897                     ; 486 {
 898                     .text:	section	.text,new
 899  0000               _FLASH_GetBootSize:
 901  0000 89            	pushw	x
 902       00000002      OFST:	set	2
 905                     ; 487   uint16_t temp = 0;
 907                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 909  0001 c64802        	ld	a,18434
 910  0004 5f            	clrw	x
 911  0005 97            	ld	xl,a
 912  0006 4f            	clr	a
 913  0007 02            	rlwa	x,a
 914  0008 44            	srl	a
 915  0009 56            	rrcw	x
 916  000a 1f01          	ldw	(OFST-1,sp),x
 917                     ; 493   if(OPT->UBC > 0x7F)
 919  000c c64802        	ld	a,18434
 920  000f a180          	cp	a,#128
 921  0011 2505          	jrult	L173
 922                     ; 495     temp = 8192;
 924  0013 ae2000        	ldw	x,#8192
 925  0016 1f01          	ldw	(OFST-1,sp),x
 926  0018               L173:
 927                     ; 499   return(temp);
 929  0018 1e01          	ldw	x,(OFST-1,sp)
 932  001a 5b02          	addw	sp,#2
 933  001c 81            	ret
 967                     ; 508 uint16_t FLASH_GetCodeSize(void)
 967                     ; 509 {
 968                     .text:	section	.text,new
 969  0000               _FLASH_GetCodeSize:
 971  0000 89            	pushw	x
 972       00000002      OFST:	set	2
 975                     ; 510   uint16_t temp = 0;
 977                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 979  0001 c64807        	ld	a,18439
 980  0004 5f            	clrw	x
 981  0005 97            	ld	xl,a
 982  0006 4f            	clr	a
 983  0007 02            	rlwa	x,a
 984  0008 44            	srl	a
 985  0009 56            	rrcw	x
 986  000a 1f01          	ldw	(OFST-1,sp),x
 987                     ; 516   if(OPT->PCODESIZE > 0x7F)
 989  000c c64807        	ld	a,18439
 990  000f a180          	cp	a,#128
 991  0011 2505          	jrult	L114
 992                     ; 518     temp = 8192;
 994  0013 ae2000        	ldw	x,#8192
 995  0016 1f01          	ldw	(OFST-1,sp),x
 996  0018               L114:
 997                     ; 522   return(temp);
 999  0018 1e01          	ldw	x,(OFST-1,sp)
1002  001a 5b02          	addw	sp,#2
1003  001c 81            	ret
1038                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1038                     ; 548 {
1039                     .text:	section	.text,new
1040  0000               _FLASH_ITConfig:
1044                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1046                     ; 552   if(NewState != DISABLE)
1048  0000 4d            	tnz	a
1049  0001 2706          	jreq	L134
1050                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1052  0003 72125050      	bset	20560,#1
1054  0007 2004          	jra	L334
1055  0009               L134:
1056                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1058  0009 72135050      	bres	20560,#1
1059  000d               L334:
1060                     ; 562 }
1063  000d 81            	ret
1172                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1172                     ; 577 {
1173                     .text:	section	.text,new
1174  0000               _FLASH_GetFlagStatus:
1176  0000 88            	push	a
1177       00000001      OFST:	set	1
1180                     ; 578   FlagStatus status = RESET;
1182                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1184                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1186  0001 c45054        	and	a,20564
1187  0004 2706          	jreq	L505
1188                     ; 584     status = SET; /* Flash_FLAG is set*/
1190  0006 a601          	ld	a,#1
1191  0008 6b01          	ld	(OFST+0,sp),a
1193  000a 2002          	jra	L705
1194  000c               L505:
1195                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1197  000c 0f01          	clr	(OFST+0,sp)
1198  000e               L705:
1199                     ; 592   return status;
1201  000e 7b01          	ld	a,(OFST+0,sp)
1204  0010 5b01          	addw	sp,#1
1205  0012 81            	ret
1241                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1241                     ; 720 {
1242                     .text:	section	.text,new
1243  0000               _FLASH_PowerRunModeConfig:
1247                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1249                     ; 724   if(FLASH_Power != FLASH_Power_On)
1251  0000 a101          	cp	a,#1
1252  0002 2706          	jreq	L725
1253                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1255  0004 72165050      	bset	20560,#3
1257  0008 2004          	jra	L135
1258  000a               L725:
1259                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1261  000a 72175050      	bres	20560,#3
1262  000e               L135:
1263                     ; 732 }
1266  000e 81            	ret
1330                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1330                     ; 746 {
1331                     .text:	section	.text,new
1332  0000               _FLASH_GetPowerStatus:
1336                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1338  0000 c65050        	ld	a,20560
1339  0003 a40c          	and	a,#12
1342  0005 81            	ret
1446                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1446                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1446                     ; 767 {
1447                     .text:	section	.text,new
1448  0000               _FLASH_ProgramBlock:
1450  0000 89            	pushw	x
1451  0001 5206          	subw	sp,#6
1452       00000006      OFST:	set	6
1455                     ; 768   uint16_t Count = 0;
1457                     ; 769   uint32_t startaddress = 0;
1459                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1461                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1463                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1465  0003 7b0b          	ld	a,(OFST+5,sp)
1466  0005 a1fd          	cp	a,#253
1467  0007 260c          	jrne	L136
1468                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1470                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1472  0009 ae8000        	ldw	x,#32768
1473  000c 1f03          	ldw	(OFST-3,sp),x
1474  000e ae0000        	ldw	x,#0
1475  0011 1f01          	ldw	(OFST-5,sp),x
1477  0013 200a          	jra	L336
1478  0015               L136:
1479                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1481                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1483  0015 ae1000        	ldw	x,#4096
1484  0018 1f03          	ldw	(OFST-3,sp),x
1485  001a ae0000        	ldw	x,#0
1486  001d 1f01          	ldw	(OFST-5,sp),x
1487  001f               L336:
1488                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1490  001f 1e07          	ldw	x,(OFST+1,sp)
1491  0021 a640          	ld	a,#64
1492  0023 cd0000        	call	c_cmulx
1494  0026 96            	ldw	x,sp
1495  0027 1c0001        	addw	x,#OFST-5
1496  002a cd0000        	call	c_lgadd
1498                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1500  002d 0d0c          	tnz	(OFST+6,sp)
1501  002f 2606          	jrne	L536
1502                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1504  0031 72105051      	bset	20561,#0
1506  0035 2004          	jra	L736
1507  0037               L536:
1508                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1510  0037 72185051      	bset	20561,#4
1511  003b               L736:
1512                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1514  003b 5f            	clrw	x
1515  003c 1f05          	ldw	(OFST-1,sp),x
1516  003e               L146:
1517                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1519  003e 1e0d          	ldw	x,(OFST+7,sp)
1520  0040 72fb05        	addw	x,(OFST-1,sp)
1521  0043 f6            	ld	a,(x)
1522  0044 1e03          	ldw	x,(OFST-3,sp)
1523  0046 72fb05        	addw	x,(OFST-1,sp)
1524  0049 f7            	ld	(x),a
1525                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1527  004a 1e05          	ldw	x,(OFST-1,sp)
1528  004c 1c0001        	addw	x,#1
1529  004f 1f05          	ldw	(OFST-1,sp),x
1532  0051 1e05          	ldw	x,(OFST-1,sp)
1533  0053 a30040        	cpw	x,#64
1534  0056 25e6          	jrult	L146
1535                     ; 805 }
1538  0058 5b08          	addw	sp,#8
1539  005a 81            	ret
1602                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1602                     ; 818 {
1603                     .text:	section	.text,new
1604  0000               _FLASH_EraseBlock:
1606  0000 89            	pushw	x
1607  0001 5206          	subw	sp,#6
1608       00000006      OFST:	set	6
1611                     ; 819   uint32_t startaddress = 0;
1613                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1615                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1617  0003 7b0b          	ld	a,(OFST+5,sp)
1618  0005 a1fd          	cp	a,#253
1619  0007 260c          	jrne	L107
1620                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1622                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1624  0009 ae8000        	ldw	x,#32768
1625  000c 1f05          	ldw	(OFST-1,sp),x
1626  000e ae0000        	ldw	x,#0
1627  0011 1f03          	ldw	(OFST-3,sp),x
1629  0013 200a          	jra	L307
1630  0015               L107:
1631                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1633                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1635  0015 ae1000        	ldw	x,#4096
1636  0018 1f05          	ldw	(OFST-1,sp),x
1637  001a ae0000        	ldw	x,#0
1638  001d 1f03          	ldw	(OFST-3,sp),x
1639  001f               L307:
1640                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1642  001f 1e07          	ldw	x,(OFST+1,sp)
1643  0021 a640          	ld	a,#64
1644  0023 cd0000        	call	c_cmulx
1646  0026 96            	ldw	x,sp
1647  0027 1c0003        	addw	x,#OFST-3
1648  002a cd0000        	call	c_ladd
1650  002d be02          	ldw	x,c_lreg+2
1651  002f 1f01          	ldw	(OFST-5,sp),x
1652                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1654  0031 721a5051      	bset	20561,#5
1655                     ; 855     *pwFlash = (uint32_t)0;  
1657  0035 1e01          	ldw	x,(OFST-5,sp)
1658  0037 a600          	ld	a,#0
1659  0039 e703          	ld	(3,x),a
1660  003b a600          	ld	a,#0
1661  003d e702          	ld	(2,x),a
1662  003f a600          	ld	a,#0
1663  0041 e701          	ld	(1,x),a
1664  0043 a600          	ld	a,#0
1665  0045 f7            	ld	(x),a
1666                     ; 863 }
1669  0046 5b08          	addw	sp,#8
1670  0048 81            	ret
1755                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1755                     ; 876 {
1756                     .text:	section	.text,new
1757  0000               _FLASH_WaitForLastOperation:
1759  0000 5203          	subw	sp,#3
1760       00000003      OFST:	set	3
1763                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1765  0002 aeffff        	ldw	x,#65535
1766  0005 1f01          	ldw	(OFST-2,sp),x
1767                     ; 878   uint8_t flagstatus = 0x00;
1769  0007 0f03          	clr	(OFST+0,sp)
1770                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1772  0009 a1fd          	cp	a,#253
1773  000b 2628          	jrne	L367
1775  000d 200e          	jra	L157
1776  000f               L747:
1777                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1777                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1779  000f c65054        	ld	a,20564
1780  0012 a405          	and	a,#5
1781  0014 6b03          	ld	(OFST+0,sp),a
1782                     ; 887       timeout--;
1784  0016 1e01          	ldw	x,(OFST-2,sp)
1785  0018 1d0001        	subw	x,#1
1786  001b 1f01          	ldw	(OFST-2,sp),x
1787  001d               L157:
1788                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1790  001d 0d03          	tnz	(OFST+0,sp)
1791  001f 261c          	jrne	L757
1793  0021 1e01          	ldw	x,(OFST-2,sp)
1794  0023 26ea          	jrne	L747
1795  0025 2016          	jra	L757
1796  0027               L167:
1797                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1797                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1799  0027 c65054        	ld	a,20564
1800  002a a441          	and	a,#65
1801  002c 6b03          	ld	(OFST+0,sp),a
1802                     ; 896       timeout--;
1804  002e 1e01          	ldw	x,(OFST-2,sp)
1805  0030 1d0001        	subw	x,#1
1806  0033 1f01          	ldw	(OFST-2,sp),x
1807  0035               L367:
1808                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1810  0035 0d03          	tnz	(OFST+0,sp)
1811  0037 2604          	jrne	L757
1813  0039 1e01          	ldw	x,(OFST-2,sp)
1814  003b 26ea          	jrne	L167
1815  003d               L757:
1816                     ; 900   if(timeout == 0x00)
1818  003d 1e01          	ldw	x,(OFST-2,sp)
1819  003f 2604          	jrne	L177
1820                     ; 902     flagstatus = FLASH_Status_TimeOut;
1822  0041 a602          	ld	a,#2
1823  0043 6b03          	ld	(OFST+0,sp),a
1824  0045               L177:
1825                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1827  0045 7b03          	ld	a,(OFST+0,sp)
1830  0047 5b03          	addw	sp,#3
1831  0049 81            	ret
1844                     	xdef	_FLASH_WaitForLastOperation
1845                     	xdef	_FLASH_EraseBlock
1846                     	xdef	_FLASH_ProgramBlock
1847                     	xdef	_FLASH_GetPowerStatus
1848                     	xdef	_FLASH_PowerRunModeConfig
1849                     	xdef	_FLASH_GetFlagStatus
1850                     	xdef	_FLASH_ITConfig
1851                     	xdef	_FLASH_EraseOptionByte
1852                     	xdef	_FLASH_ProgramOptionByte
1853                     	xdef	_FLASH_GetReadOutProtectionStatus
1854                     	xdef	_FLASH_GetCodeSize
1855                     	xdef	_FLASH_GetBootSize
1856                     	xdef	_FLASH_ReadByte
1857                     	xdef	_FLASH_ProgramWord
1858                     	xdef	_FLASH_EraseByte
1859                     	xdef	_FLASH_ProgramByte
1860                     	xdef	_FLASH_Lock
1861                     	xdef	_FLASH_Unlock
1862                     	xdef	_FLASH_DeInit
1863                     	xdef	_FLASH_PowerWaitModeConfig
1864                     	xdef	_FLASH_SetProgrammingTime
1865                     	xdef	_FLASH_GetProgrammingTime
1866                     	xref.b	c_lreg
1885                     	xref	c_ladd
1886                     	xref	c_lgadd
1887                     	xref	c_cmulx
1888                     	end
