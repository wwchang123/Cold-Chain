   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 97 void IRTIM_DeInit(void)
  44                     ; 98 {
  46                     .text:	section	.text,new
  47  0000               _IRTIM_DeInit:
  51                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  53  0000 725f52ff      	clr	21247
  54                     ; 100 }
  57  0004 81            	ret
 112                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 112                     ; 109 {
 113                     .text:	section	.text,new
 114  0000               _IRTIM_Cmd:
 118                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 120                     ; 114   if (NewState ==   DISABLE)
 122  0000 4d            	tnz	a
 123  0001 2606          	jrne	L74
 124                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 126  0003 721152ff      	bres	21247,#0
 128  0007 2004          	jra	L15
 129  0009               L74:
 130                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 132  0009 721052ff      	bset	21247,#0
 133  000d               L15:
 134                     ; 122 }
 137  000d 81            	ret
 173                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 173                     ; 131 {
 174                     .text:	section	.text,new
 175  0000               _IRTIM_HighSinkODCmd:
 179                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 181                     ; 136   if (NewState == DISABLE)
 183  0000 4d            	tnz	a
 184  0001 2606          	jrne	L17
 185                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 187  0003 721352ff      	bres	21247,#1
 189  0007 2004          	jra	L37
 190  0009               L17:
 191                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 193  0009 721252ff      	bset	21247,#1
 194  000d               L37:
 195                     ; 144 }
 198  000d 81            	ret
 222                     ; 168 FunctionalState IRTIM_GetStatus(void)
 222                     ; 169 {
 223                     .text:	section	.text,new
 224  0000               _IRTIM_GetStatus:
 228                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 230  0000 c652ff        	ld	a,21247
 231  0003 a401          	and	a,#1
 234  0005 81            	ret
 259                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 259                     ; 179 {
 260                     .text:	section	.text,new
 261  0000               _IRTIM_GetHighSinkODStatus:
 265                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 267  0000 c652ff        	ld	a,21247
 268  0003 a402          	and	a,#2
 271  0005 81            	ret
 284                     	xdef	_IRTIM_GetHighSinkODStatus
 285                     	xdef	_IRTIM_GetStatus
 286                     	xdef	_IRTIM_HighSinkODCmd
 287                     	xdef	_IRTIM_Cmd
 288                     	xdef	_IRTIM_DeInit
 307                     	end
