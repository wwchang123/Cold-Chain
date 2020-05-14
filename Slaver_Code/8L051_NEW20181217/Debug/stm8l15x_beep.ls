   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 92 void BEEP_DeInit(void)
  44                     ; 93 {
  46                     .text:	section	.text,new
  47  0000               _BEEP_DeInit:
  51                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  53  0000 725f50f0      	clr	20720
  54                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  56  0004 351f50f3      	mov	20723,#31
  57                     ; 96 }
  60  0008 81            	ret
 125                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 125                     ; 106 {
 126                     .text:	section	.text,new
 127  0000               _BEEP_Init:
 129  0000 88            	push	a
 130       00000000      OFST:	set	0
 133                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 135                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 137  0001 c650f3        	ld	a,20723
 138  0004 a41f          	and	a,#31
 139  0006 a11f          	cp	a,#31
 140  0008 260c          	jrne	L15
 141                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 143  000a c650f3        	ld	a,20723
 144  000d a4e0          	and	a,#224
 145  000f c750f3        	ld	20723,a
 146                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 148  0012 721050f3      	bset	20723,#0
 149  0016               L15:
 150                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 152  0016 c650f3        	ld	a,20723
 153  0019 a43f          	and	a,#63
 154  001b c750f3        	ld	20723,a
 155                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 157  001e c650f3        	ld	a,20723
 158  0021 1a01          	or	a,(OFST+1,sp)
 159  0023 c750f3        	ld	20723,a
 160                     ; 122 }
 163  0026 84            	pop	a
 164  0027 81            	ret
 219                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 219                     ; 131 {
 220                     .text:	section	.text,new
 221  0000               _BEEP_Cmd:
 225                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 227                     ; 135   if (NewState != DISABLE)
 229  0000 4d            	tnz	a
 230  0001 2706          	jreq	L101
 231                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 233  0003 721a50f3      	bset	20723,#5
 235  0007 2004          	jra	L301
 236  0009               L101:
 237                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 239  0009 721b50f3      	bres	20723,#5
 240  000d               L301:
 241                     ; 145 }
 244  000d 81            	ret
 280                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 280                     ; 179 {
 281                     .text:	section	.text,new
 282  0000               _BEEP_LSClockToTIMConnectCmd:
 286                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 288                     ; 183   if (NewState != DISABLE)
 290  0000 4d            	tnz	a
 291  0001 2706          	jreq	L321
 292                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 294  0003 721050f0      	bset	20720,#0
 296  0007 2004          	jra	L521
 297  0009               L321:
 298                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 300  0009 721150f0      	bres	20720,#0
 301  000d               L521:
 302                     ; 193 }
 305  000d 81            	ret
 358                     .const:	section	.text
 359  0000               L61:
 360  0000 000003e8      	dc.l	1000
 361                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 361                     ; 208 {
 362                     .text:	section	.text,new
 363  0000               _BEEP_LSICalibrationConfig:
 365  0000 5206          	subw	sp,#6
 366       00000006      OFST:	set	6
 369                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 371                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 373  0002 96            	ldw	x,sp
 374  0003 1c0009        	addw	x,#OFST+3
 375  0006 cd0000        	call	c_ltor
 377  0009 ae0000        	ldw	x,#L61
 378  000c cd0000        	call	c_ludv
 380  000f be02          	ldw	x,c_lreg+2
 381  0011 1f03          	ldw	(OFST-3,sp),x
 382                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 384  0013 c650f3        	ld	a,20723
 385  0016 a4e0          	and	a,#224
 386  0018 c750f3        	ld	20723,a
 387                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 389  001b 1e03          	ldw	x,(OFST-3,sp)
 390  001d 54            	srlw	x
 391  001e 54            	srlw	x
 392  001f 54            	srlw	x
 393  0020 1f05          	ldw	(OFST-1,sp),x
 394                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 396  0022 1e05          	ldw	x,(OFST-1,sp)
 397  0024 58            	sllw	x
 398  0025 58            	sllw	x
 399  0026 58            	sllw	x
 400  0027 1f01          	ldw	(OFST-5,sp),x
 401  0029 1e03          	ldw	x,(OFST-3,sp)
 402  002b 72f001        	subw	x,(OFST-5,sp)
 403  002e 1605          	ldw	y,(OFST-1,sp)
 404  0030 9058          	sllw	y
 405  0032 905c          	incw	y
 406  0034 cd0000        	call	c_imul
 408  0037 1605          	ldw	y,(OFST-1,sp)
 409  0039 9058          	sllw	y
 410  003b 9058          	sllw	y
 411  003d 9058          	sllw	y
 412  003f bf00          	ldw	c_x,x
 413  0041 90b300        	cpw	y,c_x
 414  0044 250c          	jrult	L551
 415                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 417  0046 7b06          	ld	a,(OFST+0,sp)
 418  0048 a002          	sub	a,#2
 419  004a ca50f3        	or	a,20723
 420  004d c750f3        	ld	20723,a
 422  0050 2009          	jra	L751
 423  0052               L551:
 424                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 426  0052 7b06          	ld	a,(OFST+0,sp)
 427  0054 4a            	dec	a
 428  0055 ca50f3        	or	a,20723
 429  0058 c750f3        	ld	20723,a
 430  005b               L751:
 431                     ; 231 }
 434  005b 5b06          	addw	sp,#6
 435  005d 81            	ret
 448                     	xdef	_BEEP_LSICalibrationConfig
 449                     	xdef	_BEEP_LSClockToTIMConnectCmd
 450                     	xdef	_BEEP_Cmd
 451                     	xdef	_BEEP_Init
 452                     	xdef	_BEEP_DeInit
 453                     	xref.b	c_lreg
 454                     	xref.b	c_x
 473                     	xref	c_imul
 474                     	xref	c_ludv
 475                     	xref	c_ltor
 476                     	end
