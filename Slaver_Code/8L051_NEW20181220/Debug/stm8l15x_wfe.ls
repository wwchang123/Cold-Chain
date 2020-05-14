   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 95 void WFE_DeInit(void)
  44                     ; 96 {
  46                     .text:	section	.text,new
  47  0000               _WFE_DeInit:
  51                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  53  0000 725f50a6      	clr	20646
  54                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  56  0004 725f50a7      	clr	20647
  57                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  59  0008 725f50a8      	clr	20648
  60                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  62  000c 725f50a9      	clr	20649
  63                     ; 101 }
  66  0010 81            	ret
 390                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 390                     ; 142 {
 391                     .text:	section	.text,new
 392  0000               _WFE_WakeUpSourceEventCmd:
 394  0000 89            	pushw	x
 395  0001 88            	push	a
 396       00000001      OFST:	set	1
 399                     ; 143   uint8_t register_index = 0;
 401                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 403                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 405                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 407  0002 9e            	ld	a,xh
 408  0003 6b01          	ld	(OFST+0,sp),a
 409                     ; 151   if (NewState != DISABLE)
 411  0005 0d06          	tnz	(OFST+5,sp)
 412  0007 273c          	jreq	L502
 413                     ; 153     switch (register_index)
 415  0009 7b01          	ld	a,(OFST+0,sp)
 417                     ; 171       default:
 417                     ; 172         break;
 418  000b 4a            	dec	a
 419  000c 270b          	jreq	L12
 420  000e 4a            	dec	a
 421  000f 2712          	jreq	L32
 422  0011 4a            	dec	a
 423  0012 2719          	jreq	L52
 424  0014 4a            	dec	a
 425  0015 2720          	jreq	L72
 426  0017 2045          	jra	L312
 427  0019               L12:
 428                     ; 155       case 1:
 428                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 430  0019 c650a6        	ld	a,20646
 431  001c 1a03          	or	a,(OFST+2,sp)
 432  001e c750a6        	ld	20646,a
 433                     ; 157         break;
 435  0021 203b          	jra	L312
 436  0023               L32:
 437                     ; 159       case 2:
 437                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 439  0023 c650a7        	ld	a,20647
 440  0026 1a03          	or	a,(OFST+2,sp)
 441  0028 c750a7        	ld	20647,a
 442                     ; 161         break;
 444  002b 2031          	jra	L312
 445  002d               L52:
 446                     ; 163       case 3:
 446                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 448  002d c650a8        	ld	a,20648
 449  0030 1a03          	or	a,(OFST+2,sp)
 450  0032 c750a8        	ld	20648,a
 451                     ; 165         break;
 453  0035 2027          	jra	L312
 454  0037               L72:
 455                     ; 167       case 4:
 455                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 457  0037 c650a9        	ld	a,20649
 458  003a 1a03          	or	a,(OFST+2,sp)
 459  003c c750a9        	ld	20649,a
 460                     ; 169         break;
 462  003f 201d          	jra	L312
 463  0041               L13:
 464                     ; 171       default:
 464                     ; 172         break;
 466  0041 201b          	jra	L312
 467  0043               L112:
 469  0043 2019          	jra	L312
 470  0045               L502:
 471                     ; 177     switch (register_index)
 473  0045 7b01          	ld	a,(OFST+0,sp)
 475                     ; 195       default:
 475                     ; 196         break;
 476  0047 4a            	dec	a
 477  0048 270b          	jreq	L33
 478  004a 4a            	dec	a
 479  004b 2714          	jreq	L53
 480  004d 4a            	dec	a
 481  004e 271c          	jreq	L73
 482  0050 4a            	dec	a
 483  0051 2724          	jreq	L14
 484  0053 2009          	jra	L312
 485  0055               L33:
 486                     ; 179       case 1:
 486                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 488  0055 7b03          	ld	a,(OFST+2,sp)
 489  0057 43            	cpl	a
 490  0058 c450a6        	and	a,20646
 491  005b c750a6        	ld	20646,a
 492                     ; 181         break;
 493  005e               L312:
 494                     ; 199 }
 497  005e 5b03          	addw	sp,#3
 498  0060 81            	ret
 499  0061               L53:
 500                     ; 183       case 2:
 500                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 502  0061 7b03          	ld	a,(OFST+2,sp)
 503  0063 43            	cpl	a
 504  0064 c450a7        	and	a,20647
 505  0067 c750a7        	ld	20647,a
 506                     ; 185         break;
 508  006a 20f2          	jra	L312
 509  006c               L73:
 510                     ; 187       case 3:
 510                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 512  006c 7b03          	ld	a,(OFST+2,sp)
 513  006e 43            	cpl	a
 514  006f c450a8        	and	a,20648
 515  0072 c750a8        	ld	20648,a
 516                     ; 189         break;
 518  0075 20e7          	jra	L312
 519  0077               L14:
 520                     ; 191       case 4:
 520                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 522  0077 7b03          	ld	a,(OFST+2,sp)
 523  0079 43            	cpl	a
 524  007a c450a9        	and	a,20649
 525  007d c750a9        	ld	20649,a
 526                     ; 193         break;
 528  0080 20dc          	jra	L312
 529  0082               L34:
 530                     ; 195       default:
 530                     ; 196         break;
 532  0082 20da          	jra	L312
 533  0084               L712:
 534  0084 20d8          	jra	L312
 581                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 581                     ; 238 {
 582                     .text:	section	.text,new
 583  0000               _WFE_GetWakeUpSourceEventStatus:
 585  0000 89            	pushw	x
 586  0001 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 239   FunctionalState status = DISABLE;
 592  0002 0f01          	clr	(OFST+0,sp)
 593                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 595                     ; 243   switch (WFE_Source)
 598                     ; 326     default:
 598                     ; 327       break;
 599  0004 1d0101        	subw	x,#257
 600  0007 2603          	jrne	L21
 601  0009 cc00a7        	jp	L122
 602  000c               L21:
 603  000c 5a            	decw	x
 604  000d 2603          	jrne	L41
 605  000f cc00a7        	jp	L122
 606  0012               L41:
 607  0012 1d0002        	subw	x,#2
 608  0015 2603          	jrne	L61
 609  0017 cc00a7        	jp	L122
 610  001a               L61:
 611  001a 1d0004        	subw	x,#4
 612  001d 2603          	jrne	L02
 613  001f cc00a7        	jp	L122
 614  0022               L02:
 615  0022 1d0008        	subw	x,#8
 616  0025 2602          	jrne	L22
 617  0027 207e          	jp	L122
 618  0029               L22:
 619  0029 1d0010        	subw	x,#16
 620  002c 2779          	jreq	L122
 621  002e 1d0020        	subw	x,#32
 622  0031 2774          	jreq	L122
 623  0033 1d0040        	subw	x,#64
 624  0036 276f          	jreq	L122
 625  0038 1d0081        	subw	x,#129
 626  003b 277b          	jreq	L322
 627  003d 5a            	decw	x
 628  003e 2778          	jreq	L322
 629  0040 1d0002        	subw	x,#2
 630  0043 2773          	jreq	L322
 631  0045 1d0004        	subw	x,#4
 632  0048 276e          	jreq	L322
 633  004a 1d0008        	subw	x,#8
 634  004d 2769          	jreq	L322
 635  004f 1d0010        	subw	x,#16
 636  0052 2764          	jreq	L322
 637  0054 1d0020        	subw	x,#32
 638  0057 275f          	jreq	L322
 639  0059 1d0040        	subw	x,#64
 640  005c 275a          	jreq	L322
 641  005e 1d0081        	subw	x,#129
 642  0061 2766          	jreq	L522
 643  0063 5a            	decw	x
 644  0064 2763          	jreq	L522
 645  0066 1d0002        	subw	x,#2
 646  0069 275e          	jreq	L522
 647  006b 1d0004        	subw	x,#4
 648  006e 2759          	jreq	L522
 649  0070 1d0008        	subw	x,#8
 650  0073 2754          	jreq	L522
 651  0075 1d0010        	subw	x,#16
 652  0078 274f          	jreq	L522
 653  007a 1d0020        	subw	x,#32
 654  007d 274a          	jreq	L522
 655  007f 1d0040        	subw	x,#64
 656  0082 2745          	jreq	L522
 657  0084 1d0081        	subw	x,#129
 658  0087 2751          	jreq	L722
 659  0089 5a            	decw	x
 660  008a 274e          	jreq	L722
 661  008c 1d0002        	subw	x,#2
 662  008f 2749          	jreq	L722
 663  0091 1d0004        	subw	x,#4
 664  0094 2744          	jreq	L722
 665  0096 1d0008        	subw	x,#8
 666  0099 273f          	jreq	L722
 667  009b 1d0010        	subw	x,#16
 668  009e 273a          	jreq	L722
 669  00a0 1d0020        	subw	x,#32
 670  00a3 2735          	jreq	L722
 671  00a5 2042          	jra	L752
 672  00a7               L122:
 673                     ; 245     case WFE_Source_TIM2_EV0:
 673                     ; 246     case WFE_Source_TIM2_EV1:
 673                     ; 247     case WFE_Source_TIM1_EV0:
 673                     ; 248     case WFE_Source_TIM1_EV1:
 673                     ; 249     case WFE_Source_EXTI_EV0:
 673                     ; 250     case WFE_Source_EXTI_EV1:
 673                     ; 251     case WFE_Source_EXTI_EV2:
 673                     ; 252     case WFE_Source_EXTI_EV3:
 673                     ; 253 
 673                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 675  00a7 c650a6        	ld	a,20646
 676  00aa 1503          	bcp	a,(OFST+2,sp)
 677  00ac 2706          	jreq	L162
 678                     ; 257         status = ENABLE;
 680  00ae a601          	ld	a,#1
 681  00b0 6b01          	ld	(OFST+0,sp),a
 683  00b2 2035          	jra	L752
 684  00b4               L162:
 685                     ; 262         status = DISABLE;
 687  00b4 0f01          	clr	(OFST+0,sp)
 688  00b6 2031          	jra	L752
 689  00b8               L322:
 690                     ; 266     case WFE_Source_EXTI_EV4:
 690                     ; 267     case WFE_Source_EXTI_EV5:
 690                     ; 268     case WFE_Source_EXTI_EV6:
 690                     ; 269     case WFE_Source_EXTI_EV7:
 690                     ; 270     case WFE_Source_EXTI_EVB_G:
 690                     ; 271     case WFE_Source_EXTI_EVD_H:
 690                     ; 272     case WFE_Source_EXTI_EVE_F:
 690                     ; 273     case WFE_Source_ADC1_COMP_EV:
 690                     ; 274 
 690                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 692  00b8 c650a7        	ld	a,20647
 693  00bb 1503          	bcp	a,(OFST+2,sp)
 694  00bd 2706          	jreq	L562
 695                     ; 278         status = ENABLE;
 697  00bf a601          	ld	a,#1
 698  00c1 6b01          	ld	(OFST+0,sp),a
 700  00c3 2024          	jra	L752
 701  00c5               L562:
 702                     ; 283         status = DISABLE;
 704  00c5 0f01          	clr	(OFST+0,sp)
 705  00c7 2020          	jra	L752
 706  00c9               L522:
 707                     ; 286     case WFE_Source_TIM3_EV0:
 707                     ; 287     case WFE_Source_TIM3_EV1:
 707                     ; 288     case WFE_Source_TIM4_EV:
 707                     ; 289     case WFE_Source_SPI1_EV:
 707                     ; 290     case WFE_Source_I2C1_EV:
 707                     ; 291     case WFE_Source_USART1_EV:
 707                     ; 292     case WFE_Source_DMA1CH01_EV:
 707                     ; 293     case WFE_Source_DMA1CH23_EV:
 707                     ; 294 
 707                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 709  00c9 c650a8        	ld	a,20648
 710  00cc 1503          	bcp	a,(OFST+2,sp)
 711  00ce 2706          	jreq	L172
 712                     ; 298         status = ENABLE;
 714  00d0 a601          	ld	a,#1
 715  00d2 6b01          	ld	(OFST+0,sp),a
 717  00d4 2013          	jra	L752
 718  00d6               L172:
 719                     ; 303         status = DISABLE;
 721  00d6 0f01          	clr	(OFST+0,sp)
 722  00d8 200f          	jra	L752
 723  00da               L722:
 724                     ; 307     case WFE_Source_TIM5_EV0:
 724                     ; 308     case WFE_Source_TIM5_EV1:
 724                     ; 309     case WFE_Source_AES_EV:
 724                     ; 310     case WFE_Source_SPI2_EV:
 724                     ; 311     case WFE_Source_USART2_EV:
 724                     ; 312     case WFE_Source_USART3_EV:
 724                     ; 313     case WFE_Source_RTC_CSS_EV:
 724                     ; 314 
 724                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 726  00da c650a9        	ld	a,20649
 727  00dd 1503          	bcp	a,(OFST+2,sp)
 728  00df 2706          	jreq	L572
 729                     ; 318         status = ENABLE;
 731  00e1 a601          	ld	a,#1
 732  00e3 6b01          	ld	(OFST+0,sp),a
 734  00e5 2002          	jra	L752
 735  00e7               L572:
 736                     ; 323         status = DISABLE;
 738  00e7 0f01          	clr	(OFST+0,sp)
 739  00e9               L132:
 740                     ; 326     default:
 740                     ; 327       break;
 742  00e9               L752:
 743                     ; 329   return status;
 745  00e9 7b01          	ld	a,(OFST+0,sp)
 748  00eb 5b03          	addw	sp,#3
 749  00ed 81            	ret
 762                     	xdef	_WFE_GetWakeUpSourceEventStatus
 763                     	xdef	_WFE_WakeUpSourceEventCmd
 764                     	xdef	_WFE_DeInit
 783                     	end
