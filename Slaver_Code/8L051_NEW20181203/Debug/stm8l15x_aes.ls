   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 93 void AES_DeInit(void)
  44                     ; 94 {
  46                     .text:	section	.text,new
  47  0000               _AES_DeInit:
  51                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  53  0000 351853d0      	mov	21456,#24
  54                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  56  0004 725f53d2      	clr	21458
  57                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  59  0008 725f53d3      	clr	21459
  60                     ; 99 }
  63  000c 81            	ret
 137                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 137                     ; 113 {
 138                     .text:	section	.text,new
 139  0000               _AES_OperationModeConfig:
 141  0000 88            	push	a
 142       00000000      OFST:	set	0
 145                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 147                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 149  0001 c653d0        	ld	a,21456
 150  0004 a4f9          	and	a,#249
 151  0006 c753d0        	ld	21456,a
 152                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 154  0009 c653d0        	ld	a,21456
 155  000c 1a01          	or	a,(OFST+1,sp)
 156  000e c753d0        	ld	21456,a
 157                     ; 122 }
 160  0011 84            	pop	a
 161  0012 81            	ret
 216                     ; 132 void AES_Cmd(FunctionalState NewState)
 216                     ; 133 {
 217                     .text:	section	.text,new
 218  0000               _AES_Cmd:
 222                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 224                     ; 137   if (NewState != DISABLE)
 226  0000 4d            	tnz	a
 227  0001 2706          	jreq	L101
 228                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 230  0003 721053d0      	bset	21456,#0
 232  0007 2004          	jra	L301
 233  0009               L101:
 234                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 236  0009 721153d0      	bres	21456,#0
 237  000d               L301:
 238                     ; 145 }
 241  000d 81            	ret
 275                     ; 170 void AES_WriteSubData(uint8_t Data)
 275                     ; 171 {
 276                     .text:	section	.text,new
 277  0000               _AES_WriteSubData:
 281                     ; 173   AES->DINR = Data;
 283  0000 c753d2        	ld	21458,a
 284                     ; 174 }
 287  0003 81            	ret
 321                     ; 183 void AES_WriteSubKey(uint8_t Key)
 321                     ; 184 {
 322                     .text:	section	.text,new
 323  0000               _AES_WriteSubKey:
 327                     ; 186   AES->DINR = Key;
 329  0000 c753d2        	ld	21458,a
 330                     ; 187 }
 333  0003 81            	ret
 356                     ; 195 uint8_t AES_ReadSubData(void)
 356                     ; 196 {
 357                     .text:	section	.text,new
 358  0000               _AES_ReadSubData:
 362                     ; 197   return AES->DOUTR;
 364  0000 c653d3        	ld	a,21459
 367  0003 81            	ret
 390                     ; 206 uint8_t AES_ReadSubKey(void)
 390                     ; 207 {
 391                     .text:	section	.text,new
 392  0000               _AES_ReadSubKey:
 396                     ; 208   return AES->DOUTR;
 398  0000 c653d3        	ld	a,21459
 401  0003 81            	ret
 460                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 460                     ; 238 {
 461                     .text:	section	.text,new
 462  0000               _AES_DMAConfig:
 464  0000 89            	pushw	x
 465       00000000      OFST:	set	0
 468                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 470                     ; 242   if (NewState != DISABLE)
 472  0001 9f            	ld	a,xl
 473  0002 4d            	tnz	a
 474  0003 2709          	jreq	L112
 475                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 477  0005 9e            	ld	a,xh
 478  0006 ca53d0        	or	a,21456
 479  0009 c753d0        	ld	21456,a
 481  000c 2009          	jra	L312
 482  000e               L112:
 483                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 485  000e 7b01          	ld	a,(OFST+1,sp)
 486  0010 43            	cpl	a
 487  0011 c453d0        	and	a,21456
 488  0014 c753d0        	ld	21456,a
 489  0017               L312:
 490                     ; 252 }
 493  0017 85            	popw	x
 494  0018 81            	ret
 559                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 559                     ; 282 {
 560                     .text:	section	.text,new
 561  0000               _AES_ITConfig:
 563  0000 89            	pushw	x
 564       00000000      OFST:	set	0
 567                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 285   assert_param(IS_AES_IT(AES_IT));
 571                     ; 287   if (NewState != DISABLE)
 573  0001 9f            	ld	a,xl
 574  0002 4d            	tnz	a
 575  0003 2709          	jreq	L742
 576                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 578  0005 9e            	ld	a,xh
 579  0006 ca53d0        	or	a,21456
 580  0009 c753d0        	ld	21456,a
 582  000c 2009          	jra	L152
 583  000e               L742:
 584                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 586  000e 7b01          	ld	a,(OFST+1,sp)
 587  0010 43            	cpl	a
 588  0011 c453d0        	and	a,21456
 589  0014 c753d0        	ld	21456,a
 590  0017               L152:
 591                     ; 295 }
 594  0017 85            	popw	x
 595  0018 81            	ret
 688                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 688                     ; 308 {
 689                     .text:	section	.text,new
 690  0000               _AES_GetFlagStatus:
 692  0000 88            	push	a
 693  0001 88            	push	a
 694       00000001      OFST:	set	1
 697                     ; 309   FlagStatus status = RESET;
 699                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 701                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 703  0002 a101          	cp	a,#1
 704  0004 2611          	jrne	L713
 705                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 707  0006 c653d1        	ld	a,21457
 708  0009 a501          	bcp	a,#1
 709  000b 2706          	jreq	L123
 710                     ; 319       status = (FlagStatus) SET;
 712  000d a601          	ld	a,#1
 713  000f 6b01          	ld	(OFST+0,sp),a
 715  0011 202a          	jra	L523
 716  0013               L123:
 717                     ; 324       status = (FlagStatus) RESET;
 719  0013 0f01          	clr	(OFST+0,sp)
 720  0015 2026          	jra	L523
 721  0017               L713:
 722                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 724  0017 7b02          	ld	a,(OFST+1,sp)
 725  0019 a102          	cp	a,#2
 726  001b 2611          	jrne	L723
 727                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 729  001d c653d1        	ld	a,21457
 730  0020 a502          	bcp	a,#2
 731  0022 2706          	jreq	L133
 732                     ; 332       status = (FlagStatus) SET;
 734  0024 a601          	ld	a,#1
 735  0026 6b01          	ld	(OFST+0,sp),a
 737  0028 2013          	jra	L523
 738  002a               L133:
 739                     ; 337       status = (FlagStatus) RESET;
 741  002a 0f01          	clr	(OFST+0,sp)
 742  002c 200f          	jra	L523
 743  002e               L723:
 744                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 746  002e c653d1        	ld	a,21457
 747  0031 a504          	bcp	a,#4
 748  0033 2706          	jreq	L733
 749                     ; 345       status = (FlagStatus) SET;
 751  0035 a601          	ld	a,#1
 752  0037 6b01          	ld	(OFST+0,sp),a
 754  0039 2002          	jra	L523
 755  003b               L733:
 756                     ; 350       status = (FlagStatus) RESET;
 758  003b 0f01          	clr	(OFST+0,sp)
 759  003d               L523:
 760                     ; 354   return ((FlagStatus) status);
 762  003d 7b01          	ld	a,(OFST+0,sp)
 765  003f 85            	popw	x
 766  0040 81            	ret
 801                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 801                     ; 367 {
 802                     .text:	section	.text,new
 803  0000               _AES_ClearFlag:
 807                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 809                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 811  0000 a101          	cp	a,#1
 812  0002 2606          	jrne	L163
 813                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 815  0004 721653d0      	bset	21456,#3
 817  0008 2004          	jra	L363
 818  000a               L163:
 819                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 821  000a 721853d0      	bset	21456,#4
 822  000e               L363:
 823                     ; 382 }
 826  000e 81            	ret
 892                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 892                     ; 393 {
 893                     .text:	section	.text,new
 894  0000               _AES_GetITStatus:
 896  0000 88            	push	a
 897  0001 89            	pushw	x
 898       00000002      OFST:	set	2
 901                     ; 394   ITStatus itstatus = RESET;
 903                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 905                     ; 398   assert_param(IS_AES_IT(AES_IT));
 907                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 909  0002 c653d0        	ld	a,21456
 910  0005 a420          	and	a,#32
 911  0007 6b01          	ld	(OFST-1,sp),a
 912                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 914  0009 c653d1        	ld	a,21457
 915  000c a401          	and	a,#1
 916  000e 6b02          	ld	(OFST+0,sp),a
 917                     ; 404   if (AES_IT == AES_IT_CCIE)
 919  0010 7b03          	ld	a,(OFST+1,sp)
 920  0012 a120          	cp	a,#32
 921  0014 2612          	jrne	L714
 922                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 924  0016 0d01          	tnz	(OFST-1,sp)
 925  0018 270a          	jreq	L124
 927  001a 0d02          	tnz	(OFST+0,sp)
 928  001c 2706          	jreq	L124
 929                     ; 410       itstatus = (ITStatus) SET;
 931  001e a601          	ld	a,#1
 932  0020 6b02          	ld	(OFST+0,sp),a
 934  0022 201e          	jra	L524
 935  0024               L124:
 936                     ; 415       itstatus = (ITStatus) RESET;
 938  0024 0f02          	clr	(OFST+0,sp)
 939  0026 201a          	jra	L524
 940  0028               L714:
 941                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 943  0028 c653d0        	ld	a,21456
 944  002b a540          	bcp	a,#64
 945  002d 2711          	jreq	L724
 946                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 948  002f c653d1        	ld	a,21457
 949  0032 a506          	bcp	a,#6
 950  0034 2706          	jreq	L134
 951                     ; 427         itstatus = (ITStatus) SET;
 953  0036 a601          	ld	a,#1
 954  0038 6b02          	ld	(OFST+0,sp),a
 956  003a 2006          	jra	L524
 957  003c               L134:
 958                     ; 432         itstatus = (ITStatus) RESET;
 960  003c 0f02          	clr	(OFST+0,sp)
 961  003e 2002          	jra	L524
 962  0040               L724:
 963                     ; 438       itstatus = (ITStatus) RESET;
 965  0040 0f02          	clr	(OFST+0,sp)
 966  0042               L524:
 967                     ; 443   return ((ITStatus)itstatus);
 969  0042 7b02          	ld	a,(OFST+0,sp)
 972  0044 5b03          	addw	sp,#3
 973  0046 81            	ret
1009                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1009                     ; 455 {
1010                     .text:	section	.text,new
1011  0000               _AES_ClearITPendingBit:
1015                     ; 457   assert_param(IS_AES_IT(AES_IT));
1017                     ; 460   if (AES_IT == AES_IT_CCIE)
1019  0000 a120          	cp	a,#32
1020  0002 2606          	jrne	L554
1021                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1023  0004 721653d0      	bset	21456,#3
1025  0008 2004          	jra	L754
1026  000a               L554:
1027                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1029  000a 721853d0      	bset	21456,#4
1030  000e               L754:
1031                     ; 470 }
1034  000e 81            	ret
1047                     	xdef	_AES_ClearITPendingBit
1048                     	xdef	_AES_GetITStatus
1049                     	xdef	_AES_ClearFlag
1050                     	xdef	_AES_GetFlagStatus
1051                     	xdef	_AES_ITConfig
1052                     	xdef	_AES_DMAConfig
1053                     	xdef	_AES_ReadSubKey
1054                     	xdef	_AES_ReadSubData
1055                     	xdef	_AES_WriteSubKey
1056                     	xdef	_AES_WriteSubData
1057                     	xdef	_AES_Cmd
1058                     	xdef	_AES_OperationModeConfig
1059                     	xdef	_AES_DeInit
1078                     	end
