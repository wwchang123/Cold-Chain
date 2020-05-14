   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 82 void PWR_DeInit(void)
  44                     ; 83 {
  46                     .text:	section	.text,new
  47  0000               _PWR_DeInit:
  51                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  53  0000 352050b2      	mov	20658,#32
  54                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  56  0004 725f50b3      	clr	20659
  57                     ; 86 }
  60  0008 81            	ret
 157                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 157                     ; 103 {
 158                     .text:	section	.text,new
 159  0000               _PWR_PVDLevelConfig:
 161  0000 88            	push	a
 162       00000000      OFST:	set	0
 165                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 167                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 169  0001 c650b2        	ld	a,20658
 170  0004 a4f1          	and	a,#241
 171  0006 c750b2        	ld	20658,a
 172                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 174  0009 c650b2        	ld	a,20658
 175  000c 1a01          	or	a,(OFST+1,sp)
 176  000e c750b2        	ld	20658,a
 177                     ; 113 }
 180  0011 84            	pop	a
 181  0012 81            	ret
 236                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 236                     ; 122 {
 237                     .text:	section	.text,new
 238  0000               _PWR_PVDCmd:
 242                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 244                     ; 126   if (NewState != DISABLE)
 246  0000 4d            	tnz	a
 247  0001 2706          	jreq	L111
 248                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 250  0003 721050b2      	bset	20658,#0
 252  0007 2004          	jra	L311
 253  0009               L111:
 254                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 256  0009 721150b2      	bres	20658,#0
 257  000d               L311:
 258                     ; 136 }
 261  000d 81            	ret
 296                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 296                     ; 172 {
 297                     .text:	section	.text,new
 298  0000               _PWR_FastWakeUpCmd:
 302                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 304                     ; 176   if (NewState != DISABLE)
 306  0000 4d            	tnz	a
 307  0001 2706          	jreq	L331
 308                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 310  0003 721450b3      	bset	20659,#2
 312  0007 2004          	jra	L531
 313  0009               L331:
 314                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 316  0009 721550b3      	bres	20659,#2
 317  000d               L531:
 318                     ; 186 }
 321  000d 81            	ret
 357                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 357                     ; 195 {
 358                     .text:	section	.text,new
 359  0000               _PWR_UltraLowPowerCmd:
 363                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 365                     ; 199   if (NewState != DISABLE)
 367  0000 4d            	tnz	a
 368  0001 2706          	jreq	L551
 369                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 371  0003 721250b3      	bset	20659,#1
 373  0007 2004          	jra	L751
 374  0009               L551:
 375                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 377  0009 721350b3      	bres	20659,#1
 378  000d               L751:
 379                     ; 209 }
 382  000d 81            	ret
 417                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 417                     ; 233 {
 418                     .text:	section	.text,new
 419  0000               _PWR_PVDITConfig:
 423                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 425                     ; 237   if (NewState != DISABLE)
 427  0000 4d            	tnz	a
 428  0001 2706          	jreq	L771
 429                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 431  0003 721850b2      	bset	20658,#4
 433  0007 2004          	jra	L102
 434  0009               L771:
 435                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 437  0009 721950b2      	bres	20658,#4
 438  000d               L102:
 439                     ; 247 }
 442  000d 81            	ret
 535                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 535                     ; 262 {
 536                     .text:	section	.text,new
 537  0000               _PWR_GetFlagStatus:
 539  0000 88            	push	a
 540  0001 88            	push	a
 541       00000001      OFST:	set	1
 544                     ; 263   FlagStatus bitstatus = RESET;
 546                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 548                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 550  0002 a501          	bcp	a,#1
 551  0004 2711          	jreq	L742
 552                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 554  0006 c650b3        	ld	a,20659
 555  0009 a501          	bcp	a,#1
 556  000b 2706          	jreq	L152
 557                     ; 272       bitstatus = SET;
 559  000d a601          	ld	a,#1
 560  000f 6b01          	ld	(OFST+0,sp),a
 562  0011 2013          	jra	L552
 563  0013               L152:
 564                     ; 276       bitstatus = RESET;
 566  0013 0f01          	clr	(OFST+0,sp)
 567  0015 200f          	jra	L552
 568  0017               L742:
 569                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 571  0017 c650b2        	ld	a,20658
 572  001a 1502          	bcp	a,(OFST+1,sp)
 573  001c 2706          	jreq	L752
 574                     ; 283       bitstatus = SET;
 576  001e a601          	ld	a,#1
 577  0020 6b01          	ld	(OFST+0,sp),a
 579  0022 2002          	jra	L552
 580  0024               L752:
 581                     ; 287       bitstatus = RESET;
 583  0024 0f01          	clr	(OFST+0,sp)
 584  0026               L552:
 585                     ; 292   return((FlagStatus)bitstatus);
 587  0026 7b01          	ld	a,(OFST+0,sp)
 590  0028 85            	popw	x
 591  0029 81            	ret
 614                     ; 300 void PWR_PVDClearFlag(void)
 614                     ; 301 {
 615                     .text:	section	.text,new
 616  0000               _PWR_PVDClearFlag:
 620                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 622  0000 721a50b2      	bset	20658,#5
 623                     ; 304 }
 626  0004 81            	ret
 680                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 680                     ; 312 {
 681                     .text:	section	.text,new
 682  0000               _PWR_PVDGetITStatus:
 684  0000 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 313   ITStatus bitstatus = RESET;
 690                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 694                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 696  0001 c650b2        	ld	a,20658
 697  0004 a420          	and	a,#32
 698  0006 6b01          	ld	(OFST-1,sp),a
 699                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 701  0008 c650b2        	ld	a,20658
 702  000b a410          	and	a,#16
 703  000d 6b02          	ld	(OFST+0,sp),a
 704                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 706  000f 0d01          	tnz	(OFST-1,sp)
 707  0011 270a          	jreq	L123
 709  0013 0d02          	tnz	(OFST+0,sp)
 710  0015 2706          	jreq	L123
 711                     ; 322     bitstatus = (ITStatus)SET;
 713  0017 a601          	ld	a,#1
 714  0019 6b02          	ld	(OFST+0,sp),a
 716  001b 2002          	jra	L323
 717  001d               L123:
 718                     ; 326     bitstatus = (ITStatus)RESET;
 720  001d 0f02          	clr	(OFST+0,sp)
 721  001f               L323:
 722                     ; 328   return ((ITStatus)bitstatus);
 724  001f 7b02          	ld	a,(OFST+0,sp)
 727  0021 85            	popw	x
 728  0022 81            	ret
 752                     ; 336 void PWR_PVDClearITPendingBit(void)
 752                     ; 337 {
 753                     .text:	section	.text,new
 754  0000               _PWR_PVDClearITPendingBit:
 758                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 760  0000 721a50b2      	bset	20658,#5
 761                     ; 340 }
 764  0004 81            	ret
 777                     	xdef	_PWR_PVDClearITPendingBit
 778                     	xdef	_PWR_PVDClearFlag
 779                     	xdef	_PWR_GetFlagStatus
 780                     	xdef	_PWR_PVDGetITStatus
 781                     	xdef	_PWR_PVDITConfig
 782                     	xdef	_PWR_UltraLowPowerCmd
 783                     	xdef	_PWR_FastWakeUpCmd
 784                     	xdef	_PWR_PVDCmd
 785                     	xdef	_PWR_PVDLevelConfig
 786                     	xdef	_PWR_DeInit
 805                     	end
