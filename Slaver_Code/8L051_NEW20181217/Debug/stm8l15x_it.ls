   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  45                     ; 53 {
  46                     .text:	section	.text,new
  47  0000               f_NonHandledInterrupt:
  51                     ; 57 }
  54  0000 80            	iret
  76                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 68 {
  77                     .text:	section	.text,new
  78  0000               f_TRAP_IRQHandler:
  82                     ; 72 }
  85  0000 80            	iret
 107                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 107                     ; 79 {
 108                     .text:	section	.text,new
 109  0000               f_FLASH_IRQHandler:
 113                     ; 83 }
 116  0000 80            	iret
 139                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 139                     ; 90 {
 140                     .text:	section	.text,new
 141  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 145                     ; 94 }
 148  0000 80            	iret
 171                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 171                     ; 101 {
 172                     .text:	section	.text,new
 173  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 177                     ; 105 }
 180  0000 80            	iret
 205                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 205                     ; 112 {
 206                     .text:	section	.text,new
 207  0000               f_RTC_CSSLSE_IRQHandler:
 209  0000 3b0002        	push	c_x+2
 210  0003 be00          	ldw	x,c_x
 211  0005 89            	pushw	x
 212  0006 3b0002        	push	c_y+2
 213  0009 be00          	ldw	x,c_y
 214  000b 89            	pushw	x
 217                     ; 113    RTC_WakeUpCmd(DISABLE);
 219  000c 4f            	clr	a
 220  000d cd0000        	call	_RTC_WakeUpCmd
 222                     ; 114    RTC_ClearITPendingBit(RTC_IT_WUT);  
 224  0010 ae0040        	ldw	x,#64
 225  0013 cd0000        	call	_RTC_ClearITPendingBit
 227                     ; 115    RTC_WakeUpCmd(ENABLE);
 229  0016 a601          	ld	a,#1
 230  0018 cd0000        	call	_RTC_WakeUpCmd
 232                     ; 116 }
 235  001b 85            	popw	x
 236  001c bf00          	ldw	c_y,x
 237  001e 320002        	pop	c_y+2
 238  0021 85            	popw	x
 239  0022 bf00          	ldw	c_x,x
 240  0024 320002        	pop	c_x+2
 241  0027 80            	iret
 264                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 264                     ; 123 {
 265                     .text:	section	.text,new
 266  0000               f_EXTIE_F_PVD_IRQHandler:
 270                     ; 127 }
 273  0000 80            	iret
 295                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 295                     ; 135 {
 296                     .text:	section	.text,new
 297  0000               f_EXTIB_G_IRQHandler:
 301                     ; 139 }
 304  0000 80            	iret
 326                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 326                     ; 147 {
 327                     .text:	section	.text,new
 328  0000               f_EXTID_H_IRQHandler:
 332                     ; 151 }
 335  0000 80            	iret
 357                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 357                     ; 159 {
 358                     .text:	section	.text,new
 359  0000               f_EXTI0_IRQHandler:
 363                     ; 163 }
 366  0000 80            	iret
 388                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 388                     ; 171 {
 389                     .text:	section	.text,new
 390  0000               f_EXTI1_IRQHandler:
 394                     ; 175 }
 397  0000 80            	iret
 419                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 419                     ; 183 {
 420                     .text:	section	.text,new
 421  0000               f_EXTI2_IRQHandler:
 425                     ; 187 }
 428  0000 80            	iret
 450                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 450                     ; 195 {
 451                     .text:	section	.text,new
 452  0000               f_EXTI3_IRQHandler:
 456                     ; 199 }
 459  0000 80            	iret
 481                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 481                     ; 207 {
 482                     .text:	section	.text,new
 483  0000               f_EXTI4_IRQHandler:
 487                     ; 211 }
 490  0000 80            	iret
 512                     ; 218 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 512                     ; 219 {
 513                     .text:	section	.text,new
 514  0000               f_EXTI5_IRQHandler:
 518                     ; 223 }
 521  0000 80            	iret
 543                     ; 230 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 543                     ; 231 {
 544                     .text:	section	.text,new
 545  0000               f_EXTI6_IRQHandler:
 549                     ; 235 }
 552  0000 80            	iret
 574                     ; 242 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 574                     ; 243 {
 575                     .text:	section	.text,new
 576  0000               f_EXTI7_IRQHandler:
 580                     ; 247 }
 583  0000 80            	iret
 605                     ; 253 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 605                     ; 254 {
 606                     .text:	section	.text,new
 607  0000               f_LCD_AES_IRQHandler:
 611                     ; 258 }
 614  0000 80            	iret
 637                     ; 264 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 637                     ; 265 {
 638                     .text:	section	.text,new
 639  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 643                     ; 269 }
 646  0000 80            	iret
 669                     ; 276 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 669                     ; 277 {
 670                     .text:	section	.text,new
 671  0000               f_ADC1_COMP_IRQHandler:
 675                     ; 281 }
 678  0000 80            	iret
 702                     ; 288 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 702                     ; 289 {
 703                     .text:	section	.text,new
 704  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 708                     ; 293 }
 711  0000 80            	iret
 734                     ; 300 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 734                     ; 301 {
 735                     .text:	section	.text,new
 736  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 740                     ; 305 }
 743  0000 80            	iret
 767                     ; 313 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 767                     ; 314 {
 768                     .text:	section	.text,new
 769  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 773                     ; 318 }
 776  0000 80            	iret
 799                     ; 324 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 799                     ; 325 {
 800                     .text:	section	.text,new
 801  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 805                     ; 329 }
 808  0000 80            	iret
 831                     ; 335 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 831                     ; 336 {
 832                     .text:	section	.text,new
 833  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 837                     ; 340 }
 840  0000 80            	iret
 862                     ; 346 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 862                     ; 347 {
 863                     .text:	section	.text,new
 864  0000               f_TIM1_CC_IRQHandler:
 868                     ; 351 }
 871  0000 80            	iret
 894                     ; 358 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 894                     ; 359 {
 895                     .text:	section	.text,new
 896  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 900                     ; 363 }
 903  0000 80            	iret
 925                     ; 369 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 925                     ; 370 {
 926                     .text:	section	.text,new
 927  0000               f_SPI1_IRQHandler:
 931                     ; 374 }
 934  0000 80            	iret
 958                     ; 381 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 958                     ; 382 {
 959                     .text:	section	.text,new
 960  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 964                     ; 386 }
 967  0000 80            	iret
 990                     ; 393 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 990                     ; 394 {
 991                     .text:	section	.text,new
 992  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 996                     ; 398 }
 999  0000 80            	iret
1022                     ; 405 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1022                     ; 406 {
1023                     .text:	section	.text,new
1024  0000               f_I2C1_SPI2_IRQHandler:
1028                     ; 410 }
1031  0000 80            	iret
1043                     	xdef	f_I2C1_SPI2_IRQHandler
1044                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1045                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1046                     	xdef	f_SPI1_IRQHandler
1047                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1048                     	xdef	f_TIM1_CC_IRQHandler
1049                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1050                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1051                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1052                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1053                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1054                     	xdef	f_ADC1_COMP_IRQHandler
1055                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1056                     	xdef	f_LCD_AES_IRQHandler
1057                     	xdef	f_EXTI7_IRQHandler
1058                     	xdef	f_EXTI6_IRQHandler
1059                     	xdef	f_EXTI5_IRQHandler
1060                     	xdef	f_EXTI4_IRQHandler
1061                     	xdef	f_EXTI3_IRQHandler
1062                     	xdef	f_EXTI2_IRQHandler
1063                     	xdef	f_EXTI1_IRQHandler
1064                     	xdef	f_EXTI0_IRQHandler
1065                     	xdef	f_EXTID_H_IRQHandler
1066                     	xdef	f_EXTIB_G_IRQHandler
1067                     	xdef	f_EXTIE_F_PVD_IRQHandler
1068                     	xdef	f_RTC_CSSLSE_IRQHandler
1069                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1070                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1071                     	xdef	f_FLASH_IRQHandler
1072                     	xdef	f_TRAP_IRQHandler
1073                     	xdef	f_NonHandledInterrupt
1074                     	xref	_RTC_ClearITPendingBit
1075                     	xref	_RTC_WakeUpCmd
1076                     	xref.b	c_x
1077                     	xref.b	c_y
1096                     	end
