   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  79                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  79                     ; 129 {
  81                     .text:	section	.text,new
  82  0000               _IWDG_WriteAccessCmd:
  86                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  88                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  90  0000 c750e0        	ld	20704,a
  91                     ; 133 }
  94  0003 81            	ret
 184                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 184                     ; 149 {
 185                     .text:	section	.text,new
 186  0000               _IWDG_SetPrescaler:
 190                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 192                     ; 152   IWDG->PR = IWDG_Prescaler;
 194  0000 c750e1        	ld	20705,a
 195                     ; 153 }
 198  0003 81            	ret
 232                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 232                     ; 163 {
 233                     .text:	section	.text,new
 234  0000               _IWDG_SetReload:
 238                     ; 164   IWDG->RLR = IWDG_Reload;
 240  0000 c750e2        	ld	20706,a
 241                     ; 165 }
 244  0003 81            	ret
 267                     ; 173 void IWDG_ReloadCounter(void)
 267                     ; 174 {
 268                     .text:	section	.text,new
 269  0000               _IWDG_ReloadCounter:
 273                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 275  0000 35aa50e0      	mov	20704,#170
 276                     ; 176 }
 279  0004 81            	ret
 302                     ; 199 void IWDG_Enable(void)
 302                     ; 200 {
 303                     .text:	section	.text,new
 304  0000               _IWDG_Enable:
 308                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 310  0000 35cc50e0      	mov	20704,#204
 311                     ; 202 }
 314  0004 81            	ret
 327                     	xdef	_IWDG_Enable
 328                     	xdef	_IWDG_ReloadCounter
 329                     	xdef	_IWDG_SetReload
 330                     	xdef	_IWDG_SetPrescaler
 331                     	xdef	_IWDG_WriteAccessCmd
 350                     	end
