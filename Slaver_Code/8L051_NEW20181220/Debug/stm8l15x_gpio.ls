   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 110                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 110                     ; 97 {
 112                     .text:	section	.text,new
 113  0000               _GPIO_DeInit:
 117                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 119  0000 6f04          	clr	(4,x)
 120                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 122  0002 7f            	clr	(x)
 123                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 125  0003 6f02          	clr	(2,x)
 126                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 128  0005 6f03          	clr	(3,x)
 129                     ; 102 }
 132  0007 81            	ret
 288                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 288                     ; 134 {
 289                     .text:	section	.text,new
 290  0000               _GPIO_Init:
 292  0000 89            	pushw	x
 293       00000000      OFST:	set	0
 296                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 298                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 300                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 302  0001 7b05          	ld	a,(OFST+5,sp)
 303  0003 43            	cpl	a
 304  0004 e404          	and	a,(4,x)
 305  0006 e704          	ld	(4,x),a
 306                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 308  0008 7b06          	ld	a,(OFST+6,sp)
 309  000a a580          	bcp	a,#128
 310  000c 271d          	jreq	L541
 311                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 313  000e 7b06          	ld	a,(OFST+6,sp)
 314  0010 a510          	bcp	a,#16
 315  0012 2706          	jreq	L741
 316                     ; 153       GPIOx->ODR |= GPIO_Pin;
 318  0014 f6            	ld	a,(x)
 319  0015 1a05          	or	a,(OFST+5,sp)
 320  0017 f7            	ld	(x),a
 322  0018 2007          	jra	L151
 323  001a               L741:
 324                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 326  001a 1e01          	ldw	x,(OFST+1,sp)
 327  001c 7b05          	ld	a,(OFST+5,sp)
 328  001e 43            	cpl	a
 329  001f f4            	and	a,(x)
 330  0020 f7            	ld	(x),a
 331  0021               L151:
 332                     ; 159     GPIOx->DDR |= GPIO_Pin;
 334  0021 1e01          	ldw	x,(OFST+1,sp)
 335  0023 e602          	ld	a,(2,x)
 336  0025 1a05          	or	a,(OFST+5,sp)
 337  0027 e702          	ld	(2,x),a
 339  0029 2009          	jra	L351
 340  002b               L541:
 341                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 343  002b 1e01          	ldw	x,(OFST+1,sp)
 344  002d 7b05          	ld	a,(OFST+5,sp)
 345  002f 43            	cpl	a
 346  0030 e402          	and	a,(2,x)
 347  0032 e702          	ld	(2,x),a
 348  0034               L351:
 349                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 351  0034 7b06          	ld	a,(OFST+6,sp)
 352  0036 a540          	bcp	a,#64
 353  0038 270a          	jreq	L551
 354                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 356  003a 1e01          	ldw	x,(OFST+1,sp)
 357  003c e603          	ld	a,(3,x)
 358  003e 1a05          	or	a,(OFST+5,sp)
 359  0040 e703          	ld	(3,x),a
 361  0042 2009          	jra	L751
 362  0044               L551:
 363                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 365  0044 1e01          	ldw	x,(OFST+1,sp)
 366  0046 7b05          	ld	a,(OFST+5,sp)
 367  0048 43            	cpl	a
 368  0049 e403          	and	a,(3,x)
 369  004b e703          	ld	(3,x),a
 370  004d               L751:
 371                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 373  004d 7b06          	ld	a,(OFST+6,sp)
 374  004f a520          	bcp	a,#32
 375  0051 270a          	jreq	L161
 376                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 378  0053 1e01          	ldw	x,(OFST+1,sp)
 379  0055 e604          	ld	a,(4,x)
 380  0057 1a05          	or	a,(OFST+5,sp)
 381  0059 e704          	ld	(4,x),a
 383  005b 2009          	jra	L361
 384  005d               L161:
 385                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 387  005d 1e01          	ldw	x,(OFST+1,sp)
 388  005f 7b05          	ld	a,(OFST+5,sp)
 389  0061 43            	cpl	a
 390  0062 e404          	and	a,(4,x)
 391  0064 e704          	ld	(4,x),a
 392  0066               L361:
 393                     ; 190 }
 396  0066 85            	popw	x
 397  0067 81            	ret
 474                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 474                     ; 210 {
 475                     .text:	section	.text,new
 476  0000               _GPIO_ExternalPullUpConfig:
 478  0000 89            	pushw	x
 479       00000000      OFST:	set	0
 482                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 484                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 486                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 488  0001 0d06          	tnz	(OFST+6,sp)
 489  0003 2708          	jreq	L522
 490                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 492  0005 e603          	ld	a,(3,x)
 493  0007 1a05          	or	a,(OFST+5,sp)
 494  0009 e703          	ld	(3,x),a
 496  000b 2009          	jra	L722
 497  000d               L522:
 498                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 500  000d 1e01          	ldw	x,(OFST+1,sp)
 501  000f 7b05          	ld	a,(OFST+5,sp)
 502  0011 43            	cpl	a
 503  0012 e403          	and	a,(3,x)
 504  0014 e703          	ld	(3,x),a
 505  0016               L722:
 506                     ; 222 }
 509  0016 85            	popw	x
 510  0017 81            	ret
 556                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 556                     ; 249 {
 557                     .text:	section	.text,new
 558  0000               _GPIO_Write:
 560  0000 89            	pushw	x
 561       00000000      OFST:	set	0
 564                     ; 250   GPIOx->ODR = GPIO_PortVal;
 566  0001 7b05          	ld	a,(OFST+5,sp)
 567  0003 1e01          	ldw	x,(OFST+1,sp)
 568  0005 f7            	ld	(x),a
 569                     ; 251 }
 572  0006 85            	popw	x
 573  0007 81            	ret
 733                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 733                     ; 271 {
 734                     .text:	section	.text,new
 735  0000               _GPIO_WriteBit:
 737  0000 89            	pushw	x
 738       00000000      OFST:	set	0
 741                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 743                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 745                     ; 276   if (GPIO_BitVal != RESET)
 747  0001 0d06          	tnz	(OFST+6,sp)
 748  0003 2706          	jreq	L743
 749                     ; 278     GPIOx->ODR |= GPIO_Pin;
 751  0005 f6            	ld	a,(x)
 752  0006 1a05          	or	a,(OFST+5,sp)
 753  0008 f7            	ld	(x),a
 755  0009 2007          	jra	L153
 756  000b               L743:
 757                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 759  000b 1e01          	ldw	x,(OFST+1,sp)
 760  000d 7b05          	ld	a,(OFST+5,sp)
 761  000f 43            	cpl	a
 762  0010 f4            	and	a,(x)
 763  0011 f7            	ld	(x),a
 764  0012               L153:
 765                     ; 285 }
 768  0012 85            	popw	x
 769  0013 81            	ret
 815                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 815                     ; 304 {
 816                     .text:	section	.text,new
 817  0000               _GPIO_SetBits:
 819  0000 89            	pushw	x
 820       00000000      OFST:	set	0
 823                     ; 305   GPIOx->ODR |= GPIO_Pin;
 825  0001 f6            	ld	a,(x)
 826  0002 1a05          	or	a,(OFST+5,sp)
 827  0004 f7            	ld	(x),a
 828                     ; 306 }
 831  0005 85            	popw	x
 832  0006 81            	ret
 878                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 878                     ; 325 {
 879                     .text:	section	.text,new
 880  0000               _GPIO_ResetBits:
 882  0000 89            	pushw	x
 883       00000000      OFST:	set	0
 886                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 888  0001 7b05          	ld	a,(OFST+5,sp)
 889  0003 43            	cpl	a
 890  0004 f4            	and	a,(x)
 891  0005 f7            	ld	(x),a
 892                     ; 327 }
 895  0006 85            	popw	x
 896  0007 81            	ret
 942                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 942                     ; 337 {
 943                     .text:	section	.text,new
 944  0000               _GPIO_ToggleBits:
 946  0000 89            	pushw	x
 947       00000000      OFST:	set	0
 950                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 952  0001 f6            	ld	a,(x)
 953  0002 1805          	xor	a,	(OFST+5,sp)
 954  0004 f7            	ld	(x),a
 955                     ; 339 }
 958  0005 85            	popw	x
 959  0006 81            	ret
 996                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 996                     ; 348 {
 997                     .text:	section	.text,new
 998  0000               _GPIO_ReadInputData:
1002                     ; 349   return ((uint8_t)GPIOx->IDR);
1004  0000 e601          	ld	a,(1,x)
1007  0002 81            	ret
1045                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1045                     ; 359 {
1046                     .text:	section	.text,new
1047  0000               _GPIO_ReadOutputData:
1051                     ; 360   return ((uint8_t)GPIOx->ODR);
1053  0000 f6            	ld	a,(x)
1056  0001 81            	ret
1105                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1105                     ; 379 {
1106                     .text:	section	.text,new
1107  0000               _GPIO_ReadInputDataBit:
1109  0000 89            	pushw	x
1110       00000000      OFST:	set	0
1113                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1115  0001 e601          	ld	a,(1,x)
1116  0003 1405          	and	a,(OFST+5,sp)
1119  0005 85            	popw	x
1120  0006 81            	ret
1169                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1169                     ; 390 {
1170                     .text:	section	.text,new
1171  0000               _GPIO_ReadOutputDataBit:
1173  0000 89            	pushw	x
1174       00000000      OFST:	set	0
1177                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1179  0001 f6            	ld	a,(x)
1180  0002 1405          	and	a,(OFST+5,sp)
1183  0004 85            	popw	x
1184  0005 81            	ret
1197                     	xdef	_GPIO_ReadOutputDataBit
1198                     	xdef	_GPIO_ReadInputDataBit
1199                     	xdef	_GPIO_ReadOutputData
1200                     	xdef	_GPIO_ReadInputData
1201                     	xdef	_GPIO_ToggleBits
1202                     	xdef	_GPIO_ResetBits
1203                     	xdef	_GPIO_SetBits
1204                     	xdef	_GPIO_WriteBit
1205                     	xdef	_GPIO_Write
1206                     	xdef	_GPIO_ExternalPullUpConfig
1207                     	xdef	_GPIO_Init
1208                     	xdef	_GPIO_DeInit
1227                     	end
