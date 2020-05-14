   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 123 void EXTI_DeInit(void)
  44                     ; 124 {
  46                     .text:	section	.text,new
  47  0000               _EXTI_DeInit:
  51                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  53  0000 725f50a0      	clr	20640
  54                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  56  0004 725f50a1      	clr	20641
  57                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  59  0008 725f50a2      	clr	20642
  60                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  62  000c 725f50aa      	clr	20650
  63                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  65  0010 35ff50a3      	mov	20643,#255
  66                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  68  0014 35ff50a4      	mov	20644,#255
  69                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  71  0018 725f50a5      	clr	20645
  72                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  74  001c 725f50ab      	clr	20651
  75                     ; 133 }
  78  0020 81            	ret
 224                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 224                     ; 161 {
 225                     .text:	section	.text,new
 226  0000               _EXTI_SetPinSensitivity:
 228  0000 89            	pushw	x
 229       00000000      OFST:	set	0
 232                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 234                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 236                     ; 168   switch (EXTI_Pin)
 238  0001 9e            	ld	a,xh
 240                     ; 202     default:
 240                     ; 203       break;
 241  0002 4d            	tnz	a
 242  0003 272f          	jreq	L12
 243  0005 a002          	sub	a,#2
 244  0007 274a          	jreq	L32
 245  0009 a002          	sub	a,#2
 246  000b 2765          	jreq	L52
 247  000d a002          	sub	a,#2
 248  000f 2603cc0091    	jreq	L72
 249  0014 a00a          	sub	a,#10
 250  0016 2603          	jrne	L05
 251  0018 cc00ae        	jp	L13
 252  001b               L05:
 253  001b a002          	sub	a,#2
 254  001d 2603          	jrne	L25
 255  001f cc00cd        	jp	L33
 256  0022               L25:
 257  0022 a002          	sub	a,#2
 258  0024 2603          	jrne	L45
 259  0026 cc00ec        	jp	L53
 260  0029               L45:
 261  0029 a002          	sub	a,#2
 262  002b 2603          	jrne	L65
 263  002d cc010b        	jp	L73
 264  0030               L65:
 265  0030 ac280128      	jpf	L721
 266  0034               L12:
 267                     ; 170     case EXTI_Pin_0:
 267                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 269  0034 c650a0        	ld	a,20640
 270  0037 a4fc          	and	a,#252
 271  0039 c750a0        	ld	20640,a
 272                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 274  003c 7b01          	ld	a,(OFST+1,sp)
 275  003e 5f            	clrw	x
 276  003f 97            	ld	xl,a
 277  0040 7b02          	ld	a,(OFST+2,sp)
 278  0042 5d            	tnzw	x
 279  0043 2704          	jreq	L01
 280  0045               L21:
 281  0045 48            	sll	a
 282  0046 5a            	decw	x
 283  0047 26fc          	jrne	L21
 284  0049               L01:
 285  0049 ca50a0        	or	a,20640
 286  004c c750a0        	ld	20640,a
 287                     ; 173       break;
 289  004f ac280128      	jpf	L721
 290  0053               L32:
 291                     ; 174     case EXTI_Pin_1:
 291                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 293  0053 c650a0        	ld	a,20640
 294  0056 a4f3          	and	a,#243
 295  0058 c750a0        	ld	20640,a
 296                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 298  005b 7b01          	ld	a,(OFST+1,sp)
 299  005d 5f            	clrw	x
 300  005e 97            	ld	xl,a
 301  005f 7b02          	ld	a,(OFST+2,sp)
 302  0061 5d            	tnzw	x
 303  0062 2704          	jreq	L41
 304  0064               L61:
 305  0064 48            	sll	a
 306  0065 5a            	decw	x
 307  0066 26fc          	jrne	L61
 308  0068               L41:
 309  0068 ca50a0        	or	a,20640
 310  006b c750a0        	ld	20640,a
 311                     ; 177       break;
 313  006e ac280128      	jpf	L721
 314  0072               L52:
 315                     ; 178     case EXTI_Pin_2:
 315                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 317  0072 c650a0        	ld	a,20640
 318  0075 a4cf          	and	a,#207
 319  0077 c750a0        	ld	20640,a
 320                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 322  007a 7b01          	ld	a,(OFST+1,sp)
 323  007c 5f            	clrw	x
 324  007d 97            	ld	xl,a
 325  007e 7b02          	ld	a,(OFST+2,sp)
 326  0080 5d            	tnzw	x
 327  0081 2704          	jreq	L02
 328  0083               L22:
 329  0083 48            	sll	a
 330  0084 5a            	decw	x
 331  0085 26fc          	jrne	L22
 332  0087               L02:
 333  0087 ca50a0        	or	a,20640
 334  008a c750a0        	ld	20640,a
 335                     ; 181       break;
 337  008d ac280128      	jpf	L721
 338  0091               L72:
 339                     ; 182     case EXTI_Pin_3:
 339                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 341  0091 c650a0        	ld	a,20640
 342  0094 a43f          	and	a,#63
 343  0096 c750a0        	ld	20640,a
 344                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 346  0099 7b01          	ld	a,(OFST+1,sp)
 347  009b 5f            	clrw	x
 348  009c 97            	ld	xl,a
 349  009d 7b02          	ld	a,(OFST+2,sp)
 350  009f 5d            	tnzw	x
 351  00a0 2704          	jreq	L42
 352  00a2               L62:
 353  00a2 48            	sll	a
 354  00a3 5a            	decw	x
 355  00a4 26fc          	jrne	L62
 356  00a6               L42:
 357  00a6 ca50a0        	or	a,20640
 358  00a9 c750a0        	ld	20640,a
 359                     ; 185       break;
 361  00ac 207a          	jra	L721
 362  00ae               L13:
 363                     ; 186     case EXTI_Pin_4:
 363                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 365  00ae c650a1        	ld	a,20641
 366  00b1 a4fc          	and	a,#252
 367  00b3 c750a1        	ld	20641,a
 368                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 370  00b6 7b01          	ld	a,(OFST+1,sp)
 371  00b8 a4ef          	and	a,#239
 372  00ba 5f            	clrw	x
 373  00bb 97            	ld	xl,a
 374  00bc 7b02          	ld	a,(OFST+2,sp)
 375  00be 5d            	tnzw	x
 376  00bf 2704          	jreq	L03
 377  00c1               L23:
 378  00c1 48            	sll	a
 379  00c2 5a            	decw	x
 380  00c3 26fc          	jrne	L23
 381  00c5               L03:
 382  00c5 ca50a1        	or	a,20641
 383  00c8 c750a1        	ld	20641,a
 384                     ; 189       break;
 386  00cb 205b          	jra	L721
 387  00cd               L33:
 388                     ; 190     case EXTI_Pin_5:
 388                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 390  00cd c650a1        	ld	a,20641
 391  00d0 a4f3          	and	a,#243
 392  00d2 c750a1        	ld	20641,a
 393                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 395  00d5 7b01          	ld	a,(OFST+1,sp)
 396  00d7 a4ef          	and	a,#239
 397  00d9 5f            	clrw	x
 398  00da 97            	ld	xl,a
 399  00db 7b02          	ld	a,(OFST+2,sp)
 400  00dd 5d            	tnzw	x
 401  00de 2704          	jreq	L43
 402  00e0               L63:
 403  00e0 48            	sll	a
 404  00e1 5a            	decw	x
 405  00e2 26fc          	jrne	L63
 406  00e4               L43:
 407  00e4 ca50a1        	or	a,20641
 408  00e7 c750a1        	ld	20641,a
 409                     ; 193       break;
 411  00ea 203c          	jra	L721
 412  00ec               L53:
 413                     ; 194     case EXTI_Pin_6:
 413                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 415  00ec c650a1        	ld	a,20641
 416  00ef a4cf          	and	a,#207
 417  00f1 c750a1        	ld	20641,a
 418                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 420  00f4 7b01          	ld	a,(OFST+1,sp)
 421  00f6 a4ef          	and	a,#239
 422  00f8 5f            	clrw	x
 423  00f9 97            	ld	xl,a
 424  00fa 7b02          	ld	a,(OFST+2,sp)
 425  00fc 5d            	tnzw	x
 426  00fd 2704          	jreq	L04
 427  00ff               L24:
 428  00ff 48            	sll	a
 429  0100 5a            	decw	x
 430  0101 26fc          	jrne	L24
 431  0103               L04:
 432  0103 ca50a1        	or	a,20641
 433  0106 c750a1        	ld	20641,a
 434                     ; 197       break;
 436  0109 201d          	jra	L721
 437  010b               L73:
 438                     ; 198     case EXTI_Pin_7:
 438                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 440  010b c650a1        	ld	a,20641
 441  010e a43f          	and	a,#63
 442  0110 c750a1        	ld	20641,a
 443                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 445  0113 7b01          	ld	a,(OFST+1,sp)
 446  0115 a4ef          	and	a,#239
 447  0117 5f            	clrw	x
 448  0118 97            	ld	xl,a
 449  0119 7b02          	ld	a,(OFST+2,sp)
 450  011b 5d            	tnzw	x
 451  011c 2704          	jreq	L44
 452  011e               L64:
 453  011e 48            	sll	a
 454  011f 5a            	decw	x
 455  0120 26fc          	jrne	L64
 456  0122               L44:
 457  0122 ca50a1        	or	a,20641
 458  0125 c750a1        	ld	20641,a
 459                     ; 201       break;
 461  0128               L14:
 462                     ; 202     default:
 462                     ; 203       break;
 464  0128               L721:
 465                     ; 205 }
 468  0128 85            	popw	x
 469  0129 81            	ret
 552                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 552                     ; 220 {
 553                     .text:	section	.text,new
 554  0000               _EXTI_SelectPort:
 556  0000 88            	push	a
 557       00000000      OFST:	set	0
 560                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 562                     ; 224   if (EXTI_Port == EXTI_Port_B)
 564  0001 4d            	tnz	a
 565  0002 2606          	jrne	L761
 566                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 568  0004 721b50ab      	bres	20651,#5
 570  0008 2034          	jra	L171
 571  000a               L761:
 572                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 574  000a 7b01          	ld	a,(OFST+1,sp)
 575  000c a102          	cp	a,#2
 576  000e 2606          	jrne	L371
 577                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 579  0010 721d50ab      	bres	20651,#6
 581  0014 2028          	jra	L171
 582  0016               L371:
 583                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 585  0016 7b01          	ld	a,(OFST+1,sp)
 586  0018 a104          	cp	a,#4
 587  001a 2606          	jrne	L771
 588                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 590  001c 721f50a5      	bres	20645,#7
 592  0020 201c          	jra	L171
 593  0022               L771:
 594                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 596  0022 7b01          	ld	a,(OFST+1,sp)
 597  0024 a106          	cp	a,#6
 598  0026 2606          	jrne	L302
 599                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 601  0028 721e50a5      	bset	20645,#7
 603  002c 2010          	jra	L171
 604  002e               L302:
 605                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 607  002e 7b01          	ld	a,(OFST+1,sp)
 608  0030 a110          	cp	a,#16
 609  0032 2606          	jrne	L702
 610                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 612  0034 721a50ab      	bset	20651,#5
 614  0038 2004          	jra	L171
 615  003a               L702:
 616                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 618  003a 721c50ab      	bset	20651,#6
 619  003e               L171:
 620                     ; 254 }
 623  003e 84            	pop	a
 624  003f 81            	ret
 792                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 792                     ; 281                                FunctionalState NewState)
 792                     ; 282 {
 793                     .text:	section	.text,new
 794  0000               _EXTI_SetHalfPortSelection:
 796  0000 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 802                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 804                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 806  0001 9e            	ld	a,xh
 807  0002 a580          	bcp	a,#128
 808  0004 2619          	jrne	L103
 809                     ; 289     if (NewState != DISABLE)
 811  0006 0d02          	tnz	(OFST+2,sp)
 812  0008 270a          	jreq	L303
 813                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 815  000a c650a5        	ld	a,20645
 816  000d 1a01          	or	a,(OFST+1,sp)
 817  000f c750a5        	ld	20645,a
 819  0012 2026          	jra	L703
 820  0014               L303:
 821                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 823  0014 7b01          	ld	a,(OFST+1,sp)
 824  0016 43            	cpl	a
 825  0017 c450a5        	and	a,20645
 826  001a c750a5        	ld	20645,a
 827  001d 201b          	jra	L703
 828  001f               L103:
 829                     ; 302     if (NewState != DISABLE)
 831  001f 0d02          	tnz	(OFST+2,sp)
 832  0021 270c          	jreq	L113
 833                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 835  0023 7b01          	ld	a,(OFST+1,sp)
 836  0025 a47f          	and	a,#127
 837  0027 ca50ab        	or	a,20651
 838  002a c750ab        	ld	20651,a
 840  002d 200b          	jra	L703
 841  002f               L113:
 842                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 844  002f 7b01          	ld	a,(OFST+1,sp)
 845  0031 a47f          	and	a,#127
 846  0033 43            	cpl	a
 847  0034 c450ab        	and	a,20651
 848  0037 c750ab        	ld	20651,a
 849  003a               L703:
 850                     ; 313 }
 853  003a 85            	popw	x
 854  003b 81            	ret
 900                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 900                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 900                     ; 340 {
 901                     .text:	section	.text,new
 902  0000               _EXTI_SetPortSensitivity:
 904  0000 89            	pushw	x
 905       00000000      OFST:	set	0
 908                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 910                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 912                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 914  0001 9e            	ld	a,xh
 915  0002 a5f0          	bcp	a,#240
 916  0004 2629          	jrne	L733
 917                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 919  0006 7b01          	ld	a,(OFST+1,sp)
 920  0008 5f            	clrw	x
 921  0009 97            	ld	xl,a
 922  000a a603          	ld	a,#3
 923  000c 5d            	tnzw	x
 924  000d 2704          	jreq	L66
 925  000f               L07:
 926  000f 48            	sll	a
 927  0010 5a            	decw	x
 928  0011 26fc          	jrne	L07
 929  0013               L66:
 930  0013 43            	cpl	a
 931  0014 c450a2        	and	a,20642
 932  0017 c750a2        	ld	20642,a
 933                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 935  001a 7b01          	ld	a,(OFST+1,sp)
 936  001c 5f            	clrw	x
 937  001d 97            	ld	xl,a
 938  001e 7b02          	ld	a,(OFST+2,sp)
 939  0020 5d            	tnzw	x
 940  0021 2704          	jreq	L27
 941  0023               L47:
 942  0023 48            	sll	a
 943  0024 5a            	decw	x
 944  0025 26fc          	jrne	L47
 945  0027               L27:
 946  0027 ca50a2        	or	a,20642
 947  002a c750a2        	ld	20642,a
 949  002d 202b          	jra	L143
 950  002f               L733:
 951                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 953  002f 7b01          	ld	a,(OFST+1,sp)
 954  0031 a40f          	and	a,#15
 955  0033 5f            	clrw	x
 956  0034 97            	ld	xl,a
 957  0035 a603          	ld	a,#3
 958  0037 5d            	tnzw	x
 959  0038 2704          	jreq	L67
 960  003a               L001:
 961  003a 48            	sll	a
 962  003b 5a            	decw	x
 963  003c 26fc          	jrne	L001
 964  003e               L67:
 965  003e 43            	cpl	a
 966  003f c450aa        	and	a,20650
 967  0042 c750aa        	ld	20650,a
 968                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 970  0045 7b01          	ld	a,(OFST+1,sp)
 971  0047 a40f          	and	a,#15
 972  0049 5f            	clrw	x
 973  004a 97            	ld	xl,a
 974  004b 7b02          	ld	a,(OFST+2,sp)
 975  004d 5d            	tnzw	x
 976  004e 2704          	jreq	L201
 977  0050               L401:
 978  0050 48            	sll	a
 979  0051 5a            	decw	x
 980  0052 26fc          	jrne	L401
 981  0054               L201:
 982  0054 ca50aa        	or	a,20650
 983  0057 c750aa        	ld	20650,a
 984  005a               L143:
 985                     ; 360 }
 988  005a 85            	popw	x
 989  005b 81            	ret
1035                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1035                     ; 377 {
1036                     .text:	section	.text,new
1037  0000               _EXTI_GetPinSensitivity:
1039  0000 88            	push	a
1040       00000001      OFST:	set	1
1043                     ; 378   uint8_t value = 0;
1045  0001 0f01          	clr	(OFST+0,sp)
1046                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1048                     ; 383   switch (EXTI_Pin)
1051                     ; 409     default:
1051                     ; 410       break;
1052  0003 4d            	tnz	a
1053  0004 271e          	jreq	L343
1054  0006 a002          	sub	a,#2
1055  0008 2723          	jreq	L543
1056  000a a002          	sub	a,#2
1057  000c 272a          	jreq	L743
1058  000e a002          	sub	a,#2
1059  0010 2732          	jreq	L153
1060  0012 a00a          	sub	a,#10
1061  0014 273c          	jreq	L353
1062  0016 a002          	sub	a,#2
1063  0018 2741          	jreq	L553
1064  001a a002          	sub	a,#2
1065  001c 2748          	jreq	L753
1066  001e a002          	sub	a,#2
1067  0020 2750          	jreq	L163
1068  0022 205a          	jra	L114
1069  0024               L343:
1070                     ; 385     case EXTI_Pin_0:
1070                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1072  0024 c650a0        	ld	a,20640
1073  0027 a403          	and	a,#3
1074  0029 6b01          	ld	(OFST+0,sp),a
1075                     ; 387       break;
1077  002b 2051          	jra	L114
1078  002d               L543:
1079                     ; 388     case EXTI_Pin_1:
1079                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1081  002d c650a0        	ld	a,20640
1082  0030 a40c          	and	a,#12
1083  0032 44            	srl	a
1084  0033 44            	srl	a
1085  0034 6b01          	ld	(OFST+0,sp),a
1086                     ; 390       break;
1088  0036 2046          	jra	L114
1089  0038               L743:
1090                     ; 391     case EXTI_Pin_2:
1090                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1092  0038 c650a0        	ld	a,20640
1093  003b a430          	and	a,#48
1094  003d 4e            	swap	a
1095  003e a40f          	and	a,#15
1096  0040 6b01          	ld	(OFST+0,sp),a
1097                     ; 393       break;
1099  0042 203a          	jra	L114
1100  0044               L153:
1101                     ; 394     case EXTI_Pin_3:
1101                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1103  0044 c650a0        	ld	a,20640
1104  0047 a4c0          	and	a,#192
1105  0049 4e            	swap	a
1106  004a 44            	srl	a
1107  004b 44            	srl	a
1108  004c a403          	and	a,#3
1109  004e 6b01          	ld	(OFST+0,sp),a
1110                     ; 396       break;
1112  0050 202c          	jra	L114
1113  0052               L353:
1114                     ; 397     case EXTI_Pin_4:
1114                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1116  0052 c650a1        	ld	a,20641
1117  0055 a403          	and	a,#3
1118  0057 6b01          	ld	(OFST+0,sp),a
1119                     ; 399       break;
1121  0059 2023          	jra	L114
1122  005b               L553:
1123                     ; 400     case EXTI_Pin_5:
1123                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1125  005b c650a1        	ld	a,20641
1126  005e a40c          	and	a,#12
1127  0060 44            	srl	a
1128  0061 44            	srl	a
1129  0062 6b01          	ld	(OFST+0,sp),a
1130                     ; 402       break;
1132  0064 2018          	jra	L114
1133  0066               L753:
1134                     ; 403     case EXTI_Pin_6:
1134                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1136  0066 c650a1        	ld	a,20641
1137  0069 a430          	and	a,#48
1138  006b 4e            	swap	a
1139  006c a40f          	and	a,#15
1140  006e 6b01          	ld	(OFST+0,sp),a
1141                     ; 405       break;
1143  0070 200c          	jra	L114
1144  0072               L163:
1145                     ; 406     case EXTI_Pin_7:
1145                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1147  0072 c650a1        	ld	a,20641
1148  0075 a4c0          	and	a,#192
1149  0077 4e            	swap	a
1150  0078 44            	srl	a
1151  0079 44            	srl	a
1152  007a a403          	and	a,#3
1153  007c 6b01          	ld	(OFST+0,sp),a
1154                     ; 408       break;
1156  007e               L363:
1157                     ; 409     default:
1157                     ; 410       break;
1159  007e               L114:
1160                     ; 412   return((EXTI_Trigger_TypeDef)value);
1162  007e 7b01          	ld	a,(OFST+0,sp)
1165  0080 5b01          	addw	sp,#1
1166  0082 81            	ret
1212                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1212                     ; 428 {
1213                     .text:	section	.text,new
1214  0000               _EXTI_GetPortSensitivity:
1216  0000 88            	push	a
1217  0001 88            	push	a
1218       00000001      OFST:	set	1
1221                     ; 429   uint8_t portsensitivity = 0;
1223                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1225                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1227  0002 a5f0          	bcp	a,#240
1228  0004 2614          	jrne	L534
1229                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1231  0006 7b02          	ld	a,(OFST+1,sp)
1232  0008 5f            	clrw	x
1233  0009 97            	ld	xl,a
1234  000a c650a2        	ld	a,20642
1235  000d 5d            	tnzw	x
1236  000e 2704          	jreq	L211
1237  0010               L411:
1238  0010 44            	srl	a
1239  0011 5a            	decw	x
1240  0012 26fc          	jrne	L411
1241  0014               L211:
1242  0014 a403          	and	a,#3
1243  0016 6b01          	ld	(OFST+0,sp),a
1245  0018 2014          	jra	L734
1246  001a               L534:
1247                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1249  001a 7b02          	ld	a,(OFST+1,sp)
1250  001c a40f          	and	a,#15
1251  001e 5f            	clrw	x
1252  001f 97            	ld	xl,a
1253  0020 c650aa        	ld	a,20650
1254  0023 5d            	tnzw	x
1255  0024 2704          	jreq	L611
1256  0026               L021:
1257  0026 44            	srl	a
1258  0027 5a            	decw	x
1259  0028 26fc          	jrne	L021
1260  002a               L611:
1261  002a a403          	and	a,#3
1262  002c 6b01          	ld	(OFST+0,sp),a
1263  002e               L734:
1264                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1266  002e 7b01          	ld	a,(OFST+0,sp)
1269  0030 85            	popw	x
1270  0031 81            	ret
1440                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1440                     ; 488 {
1441                     .text:	section	.text,new
1442  0000               _EXTI_GetITStatus:
1444  0000 89            	pushw	x
1445  0001 88            	push	a
1446       00000001      OFST:	set	1
1449                     ; 489   ITStatus status = RESET;
1451                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1453                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1455  0002 01            	rrwa	x,a
1456  0003 9f            	ld	a,xl
1457  0004 a4ff          	and	a,#255
1458  0006 97            	ld	xl,a
1459  0007 4f            	clr	a
1460  0008 02            	rlwa	x,a
1461  0009 a30100        	cpw	x,#256
1462  000c 260b          	jrne	L335
1463                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1465  000e 7b03          	ld	a,(OFST+2,sp)
1466  0010 a4ff          	and	a,#255
1467  0012 c450a4        	and	a,20644
1468  0015 6b01          	ld	(OFST+0,sp),a
1470  0017 2009          	jra	L535
1471  0019               L335:
1472                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1474  0019 7b03          	ld	a,(OFST+2,sp)
1475  001b a4ff          	and	a,#255
1476  001d c450a3        	and	a,20643
1477  0020 6b01          	ld	(OFST+0,sp),a
1478  0022               L535:
1479                     ; 501   return((ITStatus)status);
1481  0022 7b01          	ld	a,(OFST+0,sp)
1484  0024 5b03          	addw	sp,#3
1485  0026 81            	ret
1530                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1530                     ; 525 {
1531                     .text:	section	.text,new
1532  0000               _EXTI_ClearITPendingBit:
1534  0000 89            	pushw	x
1535  0001 89            	pushw	x
1536       00000002      OFST:	set	2
1539                     ; 526   uint16_t tempvalue = 0;
1541                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1543                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1545  0002 01            	rrwa	x,a
1546  0003 9f            	ld	a,xl
1547  0004 a4ff          	and	a,#255
1548  0006 97            	ld	xl,a
1549  0007 4f            	clr	a
1550  0008 02            	rlwa	x,a
1551  0009 1f01          	ldw	(OFST-1,sp),x
1552  000b 01            	rrwa	x,a
1553                     ; 533   if ( tempvalue == 0x0100)
1555  000c 1e01          	ldw	x,(OFST-1,sp)
1556  000e a30100        	cpw	x,#256
1557  0011 2609          	jrne	L165
1558                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1560  0013 7b04          	ld	a,(OFST+2,sp)
1561  0015 a4ff          	and	a,#255
1562  0017 c750a4        	ld	20644,a
1564  001a 2005          	jra	L365
1565  001c               L165:
1566                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1568  001c 7b04          	ld	a,(OFST+2,sp)
1569  001e c750a3        	ld	20643,a
1570  0021               L365:
1571                     ; 541 }
1574  0021 5b04          	addw	sp,#4
1575  0023 81            	ret
1588                     	xdef	_EXTI_ClearITPendingBit
1589                     	xdef	_EXTI_GetITStatus
1590                     	xdef	_EXTI_GetPortSensitivity
1591                     	xdef	_EXTI_GetPinSensitivity
1592                     	xdef	_EXTI_SetPortSensitivity
1593                     	xdef	_EXTI_SetHalfPortSelection
1594                     	xdef	_EXTI_SelectPort
1595                     	xdef	_EXTI_SetPinSensitivity
1596                     	xdef	_EXTI_DeInit
1615                     	end
