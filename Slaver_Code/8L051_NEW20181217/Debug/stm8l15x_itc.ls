   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 56 uint8_t ITC_GetCPUCC(void)
  44                     ; 57 {
  46                     .text:	section	.text,new
  47  0000               _ITC_GetCPUCC:
  51                     ; 59   _asm("push cc");
  54  0000 8a            push cc
  56                     ; 60   _asm("pop a");
  59  0001 84            pop a
  61                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  64  0002 81            	ret
  87                     ; 87 void ITC_DeInit(void)
  87                     ; 88 {
  88                     .text:	section	.text,new
  89  0000               _ITC_DeInit:
  93                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  95  0000 35ff7f70      	mov	32624,#255
  96                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  98  0004 35ff7f71      	mov	32625,#255
  99                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 101  0008 35ff7f72      	mov	32626,#255
 102                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 104  000c 35ff7f73      	mov	32627,#255
 105                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 107  0010 35ff7f74      	mov	32628,#255
 108                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 110  0014 35ff7f75      	mov	32629,#255
 111                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 113  0018 35ff7f76      	mov	32630,#255
 114                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 116  001c 35ff7f77      	mov	32631,#255
 117                     ; 97 }
 120  0020 81            	ret
 145                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 145                     ; 105 {
 146                     .text:	section	.text,new
 147  0000               _ITC_GetSoftIntStatus:
 151                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 153  0000 cd0000        	call	_ITC_GetCPUCC
 155  0003 a428          	and	a,#40
 158  0005 81            	ret
 444                     .const:	section	.text
 445  0000               L22:
 446  0000 0024          	dc.w	L14
 447  0002 0024          	dc.w	L14
 448  0004 0024          	dc.w	L14
 449  0006 002d          	dc.w	L34
 450  0008 002d          	dc.w	L34
 451  000a 002d          	dc.w	L34
 452  000c 002d          	dc.w	L34
 453  000e 0036          	dc.w	L54
 454  0010 0036          	dc.w	L54
 455  0012 0036          	dc.w	L54
 456  0014 0036          	dc.w	L54
 457  0016 003f          	dc.w	L74
 458  0018 003f          	dc.w	L74
 459  001a 003f          	dc.w	L74
 460  001c 003f          	dc.w	L74
 461  001e 006a          	dc.w	L712
 462  0020 0048          	dc.w	L15
 463  0022 0048          	dc.w	L15
 464  0024 0048          	dc.w	L15
 465  0026 0051          	dc.w	L35
 466  0028 0051          	dc.w	L35
 467  002a 0051          	dc.w	L35
 468  002c 006a          	dc.w	L712
 469  002e 006a          	dc.w	L712
 470  0030 005a          	dc.w	L55
 471  0032 005a          	dc.w	L55
 472  0034 005a          	dc.w	L55
 473  0036 0063          	dc.w	L75
 474  0038 0063          	dc.w	L75
 475                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 475                     ; 115 {
 476                     .text:	section	.text,new
 477  0000               _ITC_GetSoftwarePriority:
 479  0000 88            	push	a
 480  0001 89            	pushw	x
 481       00000002      OFST:	set	2
 484                     ; 116   uint8_t Value = 0;
 486  0002 0f02          	clr	(OFST+0,sp)
 487                     ; 117   uint8_t Mask = 0;
 489                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 491                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 493  0004 a403          	and	a,#3
 494  0006 48            	sll	a
 495  0007 5f            	clrw	x
 496  0008 97            	ld	xl,a
 497  0009 a603          	ld	a,#3
 498  000b 5d            	tnzw	x
 499  000c 2704          	jreq	L41
 500  000e               L61:
 501  000e 48            	sll	a
 502  000f 5a            	decw	x
 503  0010 26fc          	jrne	L61
 504  0012               L41:
 505  0012 6b01          	ld	(OFST-1,sp),a
 506                     ; 125   switch (IRQn)
 508  0014 7b03          	ld	a,(OFST+1,sp)
 510                     ; 223     default:
 510                     ; 224       break;
 511  0016 4a            	dec	a
 512  0017 a11d          	cp	a,#29
 513  0019 2407          	jruge	L02
 514  001b 5f            	clrw	x
 515  001c 97            	ld	xl,a
 516  001d 58            	sllw	x
 517  001e de0000        	ldw	x,(L22,x)
 518  0021 fc            	jp	(x)
 519  0022               L02:
 520  0022 2046          	jra	L712
 521  0024               L14:
 522                     ; 127     case FLASH_IRQn:
 522                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 522                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 522                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 524  0024 c67f70        	ld	a,32624
 525  0027 1401          	and	a,(OFST-1,sp)
 526  0029 6b02          	ld	(OFST+0,sp),a
 527                     ; 131       break;
 529  002b 203d          	jra	L712
 530  002d               L34:
 531                     ; 133     case EXTIE_F_PVD_IRQn:
 531                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 531                     ; 135     case RTC_IRQn:
 531                     ; 136     case EXTIB_IRQn:
 531                     ; 137     case EXTID_IRQn:
 531                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 531                     ; 139     case RTC_CSSLSE_IRQn:
 531                     ; 140     case EXTIB_IRQn:
 531                     ; 141     case EXTID_IRQn:
 531                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 531                     ; 143     case RTC_CSSLSE_IRQn:
 531                     ; 144     case EXTIB_G_IRQn:
 531                     ; 145     case EXTID_H_IRQn:
 531                     ; 146 #endif  /* STM8L15X_MD */
 531                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 533  002d c67f71        	ld	a,32625
 534  0030 1401          	and	a,(OFST-1,sp)
 535  0032 6b02          	ld	(OFST+0,sp),a
 536                     ; 148       break;
 538  0034 2034          	jra	L712
 539  0036               L54:
 540                     ; 150     case EXTI0_IRQn:
 540                     ; 151     case EXTI1_IRQn:
 540                     ; 152     case EXTI2_IRQn:
 540                     ; 153     case EXTI3_IRQn:
 540                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 542  0036 c67f72        	ld	a,32626
 543  0039 1401          	and	a,(OFST-1,sp)
 544  003b 6b02          	ld	(OFST+0,sp),a
 545                     ; 155       break;
 547  003d 202b          	jra	L712
 548  003f               L74:
 549                     ; 157     case EXTI4_IRQn:
 549                     ; 158     case EXTI5_IRQn:
 549                     ; 159     case EXTI6_IRQn:
 549                     ; 160     case EXTI7_IRQn:
 549                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 551  003f c67f73        	ld	a,32627
 552  0042 1401          	and	a,(OFST-1,sp)
 553  0044 6b02          	ld	(OFST+0,sp),a
 554                     ; 162       break;
 556  0046 2022          	jra	L712
 557  0048               L15:
 558                     ; 165     case SWITCH_CSS_IRQn:
 558                     ; 166 #else
 558                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 558                     ; 168 #endif /* STM8L15X_LD */		
 558                     ; 169     case ADC1_COMP_IRQn:
 558                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 558                     ; 171     case LCD_IRQn:
 558                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 558                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 558                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 558                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 558                     ; 176     case LCD_AES_IRQn:
 558                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 558                     ; 178 #endif  /* STM8L15X_MD */
 558                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 560  0048 c67f74        	ld	a,32628
 561  004b 1401          	and	a,(OFST-1,sp)
 562  004d 6b02          	ld	(OFST+0,sp),a
 563                     ; 180       break;
 565  004f 2019          	jra	L712
 566  0051               L35:
 567                     ; 187     case TIM2_CC_IRQn:
 567                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 567                     ; 189     case TIM3_CC_IRQn:
 567                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 567                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 567                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 567                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 567                     ; 194 #endif  /* STM8L15X_MD */
 567                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 569  0051 c67f75        	ld	a,32629
 570  0054 1401          	and	a,(OFST-1,sp)
 571  0056 6b02          	ld	(OFST+0,sp),a
 572                     ; 196       break;
 574  0058 2010          	jra	L712
 575  005a               L55:
 576                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 576                     ; 202     case SPI1_IRQn:
 576                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 576                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 576                     ; 205     case USART1_TX_IRQn:
 576                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 576                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 576                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 576                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 578  005a c67f76        	ld	a,32630
 579  005d 1401          	and	a,(OFST-1,sp)
 580  005f 6b02          	ld	(OFST+0,sp),a
 581                     ; 210       break;
 583  0061 2007          	jra	L712
 584  0063               L75:
 585                     ; 214     case USART1_RX_IRQn:
 585                     ; 215     case I2C1_IRQn:
 585                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 585                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 585                     ; 218     case I2C1_SPI2_IRQn:
 585                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 585                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 587  0063 c67f77        	ld	a,32631
 588  0066 1401          	and	a,(OFST-1,sp)
 589  0068 6b02          	ld	(OFST+0,sp),a
 590                     ; 221       break;
 592  006a               L16:
 593                     ; 223     default:
 593                     ; 224       break;
 595  006a               L712:
 596                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 598  006a 7b03          	ld	a,(OFST+1,sp)
 599  006c a403          	and	a,#3
 600  006e 48            	sll	a
 601  006f 5f            	clrw	x
 602  0070 97            	ld	xl,a
 603  0071 7b02          	ld	a,(OFST+0,sp)
 604  0073 5d            	tnzw	x
 605  0074 2704          	jreq	L42
 606  0076               L62:
 607  0076 44            	srl	a
 608  0077 5a            	decw	x
 609  0078 26fc          	jrne	L62
 610  007a               L42:
 611  007a 6b02          	ld	(OFST+0,sp),a
 612                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 614  007c 7b02          	ld	a,(OFST+0,sp)
 617  007e 5b03          	addw	sp,#3
 618  0080 81            	ret
 682                     	switch	.const
 683  003a               L44:
 684  003a 0038          	dc.w	L122
 685  003c 0038          	dc.w	L122
 686  003e 0038          	dc.w	L122
 687  0040 004a          	dc.w	L322
 688  0042 004a          	dc.w	L322
 689  0044 004a          	dc.w	L322
 690  0046 004a          	dc.w	L322
 691  0048 005c          	dc.w	L522
 692  004a 005c          	dc.w	L522
 693  004c 005c          	dc.w	L522
 694  004e 005c          	dc.w	L522
 695  0050 006e          	dc.w	L722
 696  0052 006e          	dc.w	L722
 697  0054 006e          	dc.w	L722
 698  0056 006e          	dc.w	L722
 699  0058 00c6          	dc.w	L772
 700  005a 0080          	dc.w	L132
 701  005c 0080          	dc.w	L132
 702  005e 0080          	dc.w	L132
 703  0060 0092          	dc.w	L332
 704  0062 0092          	dc.w	L332
 705  0064 0092          	dc.w	L332
 706  0066 00c6          	dc.w	L772
 707  0068 00c6          	dc.w	L772
 708  006a 00a4          	dc.w	L532
 709  006c 00a4          	dc.w	L532
 710  006e 00a4          	dc.w	L532
 711  0070 00b6          	dc.w	L732
 712  0072 00b6          	dc.w	L732
 713                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 713                     ; 251 {
 714                     .text:	section	.text,new
 715  0000               _ITC_SetSoftwarePriority:
 717  0000 89            	pushw	x
 718  0001 89            	pushw	x
 719       00000002      OFST:	set	2
 722                     ; 252   uint8_t Mask = 0;
 724                     ; 253   uint8_t NewPriority = 0;
 726                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 728                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 730                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 732                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 734  0002 9e            	ld	a,xh
 735  0003 a403          	and	a,#3
 736  0005 48            	sll	a
 737  0006 5f            	clrw	x
 738  0007 97            	ld	xl,a
 739  0008 a603          	ld	a,#3
 740  000a 5d            	tnzw	x
 741  000b 2704          	jreq	L23
 742  000d               L43:
 743  000d 48            	sll	a
 744  000e 5a            	decw	x
 745  000f 26fc          	jrne	L43
 746  0011               L23:
 747  0011 43            	cpl	a
 748  0012 6b01          	ld	(OFST-1,sp),a
 749                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 751  0014 7b03          	ld	a,(OFST+1,sp)
 752  0016 a403          	and	a,#3
 753  0018 48            	sll	a
 754  0019 5f            	clrw	x
 755  001a 97            	ld	xl,a
 756  001b 7b04          	ld	a,(OFST+2,sp)
 757  001d 5d            	tnzw	x
 758  001e 2704          	jreq	L63
 759  0020               L04:
 760  0020 48            	sll	a
 761  0021 5a            	decw	x
 762  0022 26fc          	jrne	L04
 763  0024               L63:
 764  0024 6b02          	ld	(OFST+0,sp),a
 765                     ; 268   switch (IRQn)
 767  0026 7b03          	ld	a,(OFST+1,sp)
 769                     ; 372     default:
 769                     ; 373       break;
 770  0028 4a            	dec	a
 771  0029 a11d          	cp	a,#29
 772  002b 2407          	jruge	L24
 773  002d 5f            	clrw	x
 774  002e 97            	ld	xl,a
 775  002f 58            	sllw	x
 776  0030 de003a        	ldw	x,(L44,x)
 777  0033 fc            	jp	(x)
 778  0034               L24:
 779  0034 acc600c6      	jpf	L772
 780  0038               L122:
 781                     ; 270     case FLASH_IRQn:
 781                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 781                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 781                     ; 273       ITC->ISPR1 &= Mask;
 783  0038 c67f70        	ld	a,32624
 784  003b 1401          	and	a,(OFST-1,sp)
 785  003d c77f70        	ld	32624,a
 786                     ; 274       ITC->ISPR1 |= NewPriority;
 788  0040 c67f70        	ld	a,32624
 789  0043 1a02          	or	a,(OFST+0,sp)
 790  0045 c77f70        	ld	32624,a
 791                     ; 275       break;
 793  0048 207c          	jra	L772
 794  004a               L322:
 795                     ; 277     case EXTIE_F_PVD_IRQn:
 795                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 795                     ; 279     case RTC_IRQn:
 795                     ; 280     case EXTIB_IRQn:
 795                     ; 281     case EXTID_IRQn:
 795                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 795                     ; 283     case RTC_CSSLSE_IRQn:
 795                     ; 284     case EXTIB_IRQn:
 795                     ; 285     case EXTID_IRQn:
 795                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 795                     ; 287     case RTC_CSSLSE_IRQn:
 795                     ; 288     case EXTIB_G_IRQn:
 795                     ; 289     case EXTID_H_IRQn:
 795                     ; 290 #endif  /* STM8L15X_MD */
 795                     ; 291       ITC->ISPR2 &= Mask;
 797  004a c67f71        	ld	a,32625
 798  004d 1401          	and	a,(OFST-1,sp)
 799  004f c77f71        	ld	32625,a
 800                     ; 292       ITC->ISPR2 |= NewPriority;
 802  0052 c67f71        	ld	a,32625
 803  0055 1a02          	or	a,(OFST+0,sp)
 804  0057 c77f71        	ld	32625,a
 805                     ; 293       break;
 807  005a 206a          	jra	L772
 808  005c               L522:
 809                     ; 295     case EXTI0_IRQn:
 809                     ; 296     case EXTI1_IRQn:
 809                     ; 297     case EXTI2_IRQn:
 809                     ; 298     case EXTI3_IRQn:
 809                     ; 299       ITC->ISPR3 &= Mask;
 811  005c c67f72        	ld	a,32626
 812  005f 1401          	and	a,(OFST-1,sp)
 813  0061 c77f72        	ld	32626,a
 814                     ; 300       ITC->ISPR3 |= NewPriority;
 816  0064 c67f72        	ld	a,32626
 817  0067 1a02          	or	a,(OFST+0,sp)
 818  0069 c77f72        	ld	32626,a
 819                     ; 301       break;
 821  006c 2058          	jra	L772
 822  006e               L722:
 823                     ; 303     case EXTI4_IRQn:
 823                     ; 304     case EXTI5_IRQn:
 823                     ; 305     case EXTI6_IRQn:
 823                     ; 306     case EXTI7_IRQn:
 823                     ; 307       ITC->ISPR4 &= Mask;
 825  006e c67f73        	ld	a,32627
 826  0071 1401          	and	a,(OFST-1,sp)
 827  0073 c77f73        	ld	32627,a
 828                     ; 308       ITC->ISPR4 |= NewPriority;
 830  0076 c67f73        	ld	a,32627
 831  0079 1a02          	or	a,(OFST+0,sp)
 832  007b c77f73        	ld	32627,a
 833                     ; 309       break;
 835  007e 2046          	jra	L772
 836  0080               L132:
 837                     ; 313     case SWITCH_CSS_IRQn:
 837                     ; 314 #endif /*	STM8L15X_LD	*/
 837                     ; 315     case ADC1_COMP_IRQn:
 837                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 837                     ; 317     case LCD_IRQn:
 837                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 837                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 837                     ; 322     case LCD_AES_IRQn:
 837                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 837                     ; 324 #endif  /* STM8L15X_MD */
 837                     ; 325       ITC->ISPR5 &= Mask;
 839  0080 c67f74        	ld	a,32628
 840  0083 1401          	and	a,(OFST-1,sp)
 841  0085 c77f74        	ld	32628,a
 842                     ; 326       ITC->ISPR5 |= NewPriority;
 844  0088 c67f74        	ld	a,32628
 845  008b 1a02          	or	a,(OFST+0,sp)
 846  008d c77f74        	ld	32628,a
 847                     ; 327       break;
 849  0090 2034          	jra	L772
 850  0092               L332:
 851                     ; 333     case TIM2_CC_IRQn:
 851                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 851                     ; 335     case TIM3_CC_IRQn:
 851                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 851                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 851                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 851                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 851                     ; 340 #endif  /* STM8L15X_MD */
 851                     ; 341       ITC->ISPR6 &= Mask;
 853  0092 c67f75        	ld	a,32629
 854  0095 1401          	and	a,(OFST-1,sp)
 855  0097 c77f75        	ld	32629,a
 856                     ; 342       ITC->ISPR6 |= NewPriority;
 858  009a c67f75        	ld	a,32629
 859  009d 1a02          	or	a,(OFST+0,sp)
 860  009f c77f75        	ld	32629,a
 861                     ; 343       break;
 863  00a2 2022          	jra	L772
 864  00a4               L532:
 865                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 865                     ; 349     case SPI1_IRQn:
 865                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 865                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 865                     ; 352     case USART1_TX_IRQn:
 865                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 865                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 865                     ; 355 #endif  /* STM8L15X_MD */
 865                     ; 356       ITC->ISPR7 &= Mask;
 867  00a4 c67f76        	ld	a,32630
 868  00a7 1401          	and	a,(OFST-1,sp)
 869  00a9 c77f76        	ld	32630,a
 870                     ; 357       ITC->ISPR7 |= NewPriority;
 872  00ac c67f76        	ld	a,32630
 873  00af 1a02          	or	a,(OFST+0,sp)
 874  00b1 c77f76        	ld	32630,a
 875                     ; 358       break;
 877  00b4 2010          	jra	L772
 878  00b6               L732:
 879                     ; 362     case USART1_RX_IRQn:
 879                     ; 363     case I2C1_IRQn:
 879                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 879                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 879                     ; 366     case I2C1_SPI2_IRQn:
 879                     ; 367 #endif  /* STM8L15X_MD */
 879                     ; 368       ITC->ISPR8 &= Mask;
 881  00b6 c67f77        	ld	a,32631
 882  00b9 1401          	and	a,(OFST-1,sp)
 883  00bb c77f77        	ld	32631,a
 884                     ; 369       ITC->ISPR8 |= NewPriority;
 886  00be c67f77        	ld	a,32631
 887  00c1 1a02          	or	a,(OFST+0,sp)
 888  00c3 c77f77        	ld	32631,a
 889                     ; 370       break;
 891  00c6               L142:
 892                     ; 372     default:
 892                     ; 373       break;
 894  00c6               L772:
 895                     ; 375 }
 898  00c6 5b04          	addw	sp,#4
 899  00c8 81            	ret
 912                     	xdef	_ITC_GetSoftwarePriority
 913                     	xdef	_ITC_SetSoftwarePriority
 914                     	xdef	_ITC_GetSoftIntStatus
 915                     	xdef	_ITC_GetCPUCC
 916                     	xdef	_ITC_DeInit
 935                     	end
