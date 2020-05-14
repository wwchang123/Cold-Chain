   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  61                     ; 21 void delay_ms(u16 n_ms)
  61                     ; 22 {
  63                     .text:	section	.text,new
  64  0000               _delay_ms:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70                     ; 24   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  72  0001 ae0001        	ldw	x,#1
  73  0004 a602          	ld	a,#2
  74  0006 95            	ld	xh,a
  75  0007 cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 26   TIM4_TimeBaseInit(TIM4_Prescaler_64,250);
  79  000a ae00fa        	ldw	x,#250
  80  000d a606          	ld	a,#6
  81  000f 95            	ld	xh,a
  82  0010 cd0000        	call	_TIM4_TimeBaseInit
  84                     ; 27   TIM4_SetCounter(0);
  86  0013 4f            	clr	a
  87  0014 cd0000        	call	_TIM4_SetCounter
  89                     ; 28   TIM4_ClearFlag(TIM4_FLAG_Update);
  91  0017 a601          	ld	a,#1
  92  0019 cd0000        	call	_TIM4_ClearFlag
  94                     ; 29   TIM4_Cmd(ENABLE);
  96  001c a601          	ld	a,#1
  97  001e cd0000        	call	_TIM4_Cmd
 100  0021 200d          	jra	L13
 101  0023               L73:
 102                     ; 32     while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
 104  0023 a601          	ld	a,#1
 105  0025 cd0000        	call	_TIM4_GetFlagStatus
 107  0028 4d            	tnz	a
 108  0029 27f8          	jreq	L73
 109                     ; 33     TIM4_ClearFlag(TIM4_FLAG_Update);
 111  002b a601          	ld	a,#1
 112  002d cd0000        	call	_TIM4_ClearFlag
 114  0030               L13:
 115                     ; 30   while(n_ms--)
 117  0030 1e01          	ldw	x,(OFST+1,sp)
 118  0032 1d0001        	subw	x,#1
 119  0035 1f01          	ldw	(OFST+1,sp),x
 120  0037 1c0001        	addw	x,#1
 121  003a a30000        	cpw	x,#0
 122  003d 26e4          	jrne	L73
 123                     ; 35   TIM4_Cmd(DISABLE);
 125  003f 4f            	clr	a
 126  0040 cd0000        	call	_TIM4_Cmd
 128                     ; 36 }
 131  0043 85            	popw	x
 132  0044 81            	ret
 172                     ; 44 void delay_10us(u16 n_10us)
 172                     ; 45 {
 173                     .text:	section	.text,new
 174  0000               _delay_10us:
 176  0000 89            	pushw	x
 177       00000000      OFST:	set	0
 180                     ; 47   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 182  0001 ae0001        	ldw	x,#1
 183  0004 a602          	ld	a,#2
 184  0006 95            	ld	xh,a
 185  0007 cd0000        	call	_CLK_PeripheralClockConfig
 187                     ; 49   TIM4_TimeBaseInit(TIM4_Prescaler_1,160);
 189  000a ae00a0        	ldw	x,#160
 190  000d 4f            	clr	a
 191  000e 95            	ld	xh,a
 192  000f cd0000        	call	_TIM4_TimeBaseInit
 194                     ; 50   TIM4_SetCounter(0);
 196  0012 4f            	clr	a
 197  0013 cd0000        	call	_TIM4_SetCounter
 199                     ; 51   TIM4_ClearFlag(TIM4_FLAG_Update);
 201  0016 a601          	ld	a,#1
 202  0018 cd0000        	call	_TIM4_ClearFlag
 204                     ; 52   TIM4_Cmd(ENABLE);
 206  001b a601          	ld	a,#1
 207  001d cd0000        	call	_TIM4_Cmd
 210  0020 200d          	jra	L36
 211  0022               L17:
 212                     ; 55     while(TIM4_GetFlagStatus(TIM4_FLAG_Update) == 0) ;
 214  0022 a601          	ld	a,#1
 215  0024 cd0000        	call	_TIM4_GetFlagStatus
 217  0027 4d            	tnz	a
 218  0028 27f8          	jreq	L17
 219                     ; 56     TIM4_ClearFlag(TIM4_FLAG_Update);
 221  002a a601          	ld	a,#1
 222  002c cd0000        	call	_TIM4_ClearFlag
 224  002f               L36:
 225                     ; 53   while(n_10us--)
 227  002f 1e01          	ldw	x,(OFST+1,sp)
 228  0031 1d0001        	subw	x,#1
 229  0034 1f01          	ldw	(OFST+1,sp),x
 230  0036 1c0001        	addw	x,#1
 231  0039 a30000        	cpw	x,#0
 232  003c 26e4          	jrne	L17
 233                     ; 58   TIM4_Cmd(DISABLE);
 235  003e 4f            	clr	a
 236  003f cd0000        	call	_TIM4_Cmd
 238                     ; 59  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 240  0042 5f            	clrw	x
 241  0043 a602          	ld	a,#2
 242  0045 95            	ld	xh,a
 243  0046 cd0000        	call	_CLK_PeripheralClockConfig
 245                     ; 61 }
 248  0049 85            	popw	x
 249  004a 81            	ret
 262                     	xdef	_delay_10us
 263                     	xdef	_delay_ms
 264                     	xref	_TIM4_ClearFlag
 265                     	xref	_TIM4_GetFlagStatus
 266                     	xref	_TIM4_Cmd
 267                     	xref	_TIM4_SetCounter
 268                     	xref	_TIM4_TimeBaseInit
 269                     	xref	_CLK_PeripheralClockConfig
 288                     	end
