   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     .const:	section	.text
  17  0000               __vectab:
  18  0000 82            	dc.b	130
  20  0001 00            	dc.b	page(__stext)
  21  0002 0000          	dc.w	__stext
  22  0004 82            	dc.b	130
  24  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  25  0006 0000          	dc.w	f_TRAP_IRQHandler
  26  0008 82            	dc.b	130
  28  0009 00            	dc.b	page(f_NonHandledInterrupt)
  29  000a 0000          	dc.w	f_NonHandledInterrupt
  30  000c 82            	dc.b	130
  32  000d 00            	dc.b	page(f_FLASH_IRQHandler)
  33  000e 0000          	dc.w	f_FLASH_IRQHandler
  34  0010 82            	dc.b	130
  36  0011 00            	dc.b	page(f_DMA1_CHANNEL0_1_IRQHandler)
  37  0012 0000          	dc.w	f_DMA1_CHANNEL0_1_IRQHandler
  38  0014 82            	dc.b	130
  40  0015 00            	dc.b	page(f_DMA1_CHANNEL2_3_IRQHandler)
  41  0016 0000          	dc.w	f_DMA1_CHANNEL2_3_IRQHandler
  42  0018 82            	dc.b	130
  44  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  45  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  46  001c 82            	dc.b	130
  48  001d 00            	dc.b	page(f_EXTIE_F_PVD_IRQHandler)
  49  001e 0000          	dc.w	f_EXTIE_F_PVD_IRQHandler
  50  0020 82            	dc.b	130
  52  0021 00            	dc.b	page(f_EXTIB_G_IRQHandler)
  53  0022 0000          	dc.w	f_EXTIB_G_IRQHandler
  54  0024 82            	dc.b	130
  56  0025 00            	dc.b	page(f_EXTID_H_IRQHandler)
  57  0026 0000          	dc.w	f_EXTID_H_IRQHandler
  58  0028 82            	dc.b	130
  60  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  61  002a 0000          	dc.w	f_EXTI0_IRQHandler
  62  002c 82            	dc.b	130
  64  002d 00            	dc.b	page(f_EXTI1_IRQHandler)
  65  002e 0000          	dc.w	f_EXTI1_IRQHandler
  66  0030 82            	dc.b	130
  68  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  69  0032 0000          	dc.w	f_EXTI2_IRQHandler
  70  0034 82            	dc.b	130
  72  0035 00            	dc.b	page(f_EXTI3_IRQHandler)
  73  0036 0000          	dc.w	f_EXTI3_IRQHandler
  74  0038 82            	dc.b	130
  76  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  77  003a 0000          	dc.w	f_EXTI4_IRQHandler
  78  003c 82            	dc.b	130
  80  003d 00            	dc.b	page(f_EXTI5_IRQHandler)
  81  003e 0000          	dc.w	f_EXTI5_IRQHandler
  82  0040 82            	dc.b	130
  84  0041 00            	dc.b	page(f_EXTI6_IRQHandler)
  85  0042 0000          	dc.w	f_EXTI6_IRQHandler
  86  0044 82            	dc.b	130
  88  0045 00            	dc.b	page(f_EXTI7_IRQHandler)
  89  0046 0000          	dc.w	f_EXTI7_IRQHandler
  90  0048 82            	dc.b	130
  92  0049 00            	dc.b	page(f_LCD_AES_IRQHandler)
  93  004a 0000          	dc.w	f_LCD_AES_IRQHandler
  94  004c 82            	dc.b	130
  96  004d 00            	dc.b	page(f_SWITCH_CSS_BREAK_DAC_IRQHandler)
  97  004e 0000          	dc.w	f_SWITCH_CSS_BREAK_DAC_IRQHandler
  98  0050 82            	dc.b	130
 100  0051 00            	dc.b	page(f_ADC1_COMP_IRQHandler)
 101  0052 0000          	dc.w	f_ADC1_COMP_IRQHandler
 102  0054 82            	dc.b	130
 104  0055 00            	dc.b	page(f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler)
 105  0056 0000          	dc.w	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 106  0058 82            	dc.b	130
 108  0059 00            	dc.b	page(f_TIM2_CC_USART2_RX_IRQHandler)
 109  005a 0000          	dc.w	f_TIM2_CC_USART2_RX_IRQHandler
 110  005c 82            	dc.b	130
 112  005d 00            	dc.b	page(f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler)
 113  005e 0000          	dc.w	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 114  0060 82            	dc.b	130
 116  0061 00            	dc.b	page(f_TIM3_CC_USART3_RX_IRQHandler)
 117  0062 0000          	dc.w	f_TIM3_CC_USART3_RX_IRQHandler
 118  0064 82            	dc.b	130
 120  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 121  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 122  0068 82            	dc.b	130
 124  0069 00            	dc.b	page(f_TIM1_CC_IRQHandler)
 125  006a 0000          	dc.w	f_TIM1_CC_IRQHandler
 126  006c 82            	dc.b	130
 128  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 129  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 130  0070 82            	dc.b	130
 132  0071 00            	dc.b	page(f_SPI1_IRQHandler)
 133  0072 0000          	dc.w	f_SPI1_IRQHandler
 134  0074 82            	dc.b	130
 136  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 137  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 138  0078 82            	dc.b	130
 140  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 141  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 142  007c 82            	dc.b	130
 144  007d 00            	dc.b	page(f_I2C1_SPI2_IRQHandler)
 145  007e 0000          	dc.w	f_I2C1_SPI2_IRQHandler
 205                     	xdef	__vectab
 206                     	xref	f_I2C1_SPI2_IRQHandler
 207                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 208                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 209                     	xref	f_SPI1_IRQHandler
 210                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 211                     	xref	f_TIM1_CC_IRQHandler
 212                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 213                     	xref	f_TIM3_CC_USART3_RX_IRQHandler
 214                     	xref	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
 215                     	xref	f_TIM2_CC_USART2_RX_IRQHandler
 216                     	xref	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
 217                     	xref	f_ADC1_COMP_IRQHandler
 218                     	xref	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 219                     	xref	f_LCD_AES_IRQHandler
 220                     	xref	f_EXTI7_IRQHandler
 221                     	xref	f_EXTI6_IRQHandler
 222                     	xref	f_EXTI5_IRQHandler
 223                     	xref	f_EXTI4_IRQHandler
 224                     	xref	f_EXTI3_IRQHandler
 225                     	xref	f_EXTI2_IRQHandler
 226                     	xref	f_EXTI1_IRQHandler
 227                     	xref	f_EXTI0_IRQHandler
 228                     	xref	f_EXTID_H_IRQHandler
 229                     	xref	f_EXTIB_G_IRQHandler
 230                     	xref	f_EXTIE_F_PVD_IRQHandler
 231                     	xref	f_RTC_CSSLSE_IRQHandler
 232                     	xref	f_DMA1_CHANNEL2_3_IRQHandler
 233                     	xref	f_DMA1_CHANNEL0_1_IRQHandler
 234                     	xref	f_FLASH_IRQHandler
 235                     	xref	f_TRAP_IRQHandler
 236                     	xref	f_NonHandledInterrupt
 237                     	xref	__stext
 256                     	end
