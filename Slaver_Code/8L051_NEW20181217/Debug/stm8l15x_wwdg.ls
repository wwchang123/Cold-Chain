   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  64                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  64                     ; 120 {
  66                     .text:	section	.text,new
  67  0000               _WWDG_Init:
  69  0000 89            	pushw	x
  70       00000000      OFST:	set	0
  73                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  75                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  77  0001 357f50d4      	mov	20692,#127
  78                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  80  0005 9e            	ld	a,xh
  81  0006 aa80          	or	a,#128
  82  0008 c750d3        	ld	20691,a
  83                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  85  000b 7b02          	ld	a,(OFST+2,sp)
  86  000d a47f          	and	a,#127
  87  000f c750d4        	ld	20692,a
  88                     ; 127 }
  91  0012 85            	popw	x
  92  0013 81            	ret
 136                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 136                     ; 136 {
 137                     .text:	section	.text,new
 138  0000               _WWDG_SetWindowValue:
 140  0000 88            	push	a
 141       00000001      OFST:	set	1
 144                     ; 137   __IO uint8_t tmpreg = 0;
 146  0001 0f01          	clr	(OFST+0,sp)
 147                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 149                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 151  0003 a47f          	and	a,#127
 152  0005 1a01          	or	a,(OFST+0,sp)
 153  0007 6b01          	ld	(OFST+0,sp),a
 154                     ; 146   WWDG->WR = tmpreg;
 156  0009 7b01          	ld	a,(OFST+0,sp)
 157  000b c750d4        	ld	20692,a
 158                     ; 147 }
 161  000e 84            	pop	a
 162  000f 81            	ret
 196                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 196                     ; 157 {
 197                     .text:	section	.text,new
 198  0000               _WWDG_SetCounter:
 202                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 204                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 206  0000 a47f          	and	a,#127
 207  0002 c750d3        	ld	20691,a
 208                     ; 164 }
 211  0005 81            	ret
 245                     ; 187 void WWDG_Enable(uint8_t Counter)
 245                     ; 188 {
 246                     .text:	section	.text,new
 247  0000               _WWDG_Enable:
 251                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 253                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 255  0000 aa80          	or	a,#128
 256  0002 c750d3        	ld	20691,a
 257                     ; 192 }
 260  0005 81            	ret
 283                     ; 216 uint8_t WWDG_GetCounter(void)
 283                     ; 217 {
 284                     .text:	section	.text,new
 285  0000               _WWDG_GetCounter:
 289                     ; 218   return(WWDG->CR);
 291  0000 c650d3        	ld	a,20691
 294  0003 81            	ret
 317                     ; 226 void WWDG_SWReset(void)
 317                     ; 227 {
 318                     .text:	section	.text,new
 319  0000               _WWDG_SWReset:
 323                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 325  0000 358050d3      	mov	20691,#128
 326                     ; 229 }
 329  0004 81            	ret
 342                     	xdef	_WWDG_SWReset
 343                     	xdef	_WWDG_GetCounter
 344                     	xdef	_WWDG_Enable
 345                     	xdef	_WWDG_SetCounter
 346                     	xdef	_WWDG_SetWindowValue
 347                     	xdef	_WWDG_Init
 366                     	end
