   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 125                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 125                     ; 100 {
 127                     .text:	section	.text,new
 128  0000               _RST_GetFlagStatus:
 132                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 134                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 136  0000 c450b1        	and	a,20657
 137  0003 2603          	jrne	L6
 138  0005 4f            	clr	a
 139  0006 2002          	jra	L01
 140  0008               L6:
 141  0008 a601          	ld	a,#1
 142  000a               L01:
 145  000a 81            	ret
 180                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 180                     ; 121 {
 181                     .text:	section	.text,new
 182  0000               _RST_ClearFlag:
 186                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 188                     ; 125   RST->SR = (uint8_t)RST_Flag;
 190  0000 c750b1        	ld	20657,a
 191                     ; 126 }
 194  0003 81            	ret
 217                     ; 149 void RST_GPOutputEnable(void)
 217                     ; 150 {
 218                     .text:	section	.text,new
 219  0000               _RST_GPOutputEnable:
 223                     ; 152   RST->CR = RST_CR_MASK;
 225  0000 35d050b0      	mov	20656,#208
 226                     ; 153 }
 229  0004 81            	ret
 242                     	xdef	_RST_GPOutputEnable
 243                     	xdef	_RST_ClearFlag
 244                     	xdef	_RST_GetFlagStatus
 263                     	end
