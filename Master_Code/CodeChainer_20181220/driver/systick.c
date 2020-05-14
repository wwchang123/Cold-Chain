#include"systick.h"
 

__IO u32 TimingDelay; 
/* SystemFrequency / 1000    1ms 中断一次   
* SystemFrequency / 100000  10us 中断一次  
* SystemFrequency / 1000000 1us 中断一次   
*/   
void SysTick_Init(void)
{
	if(SysTick_Config(SystemCoreClock/1000000))
	{
		while(1);
	}
	SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
}

void Delay_tick(__IO u32 nTime)
{
	TimingDelay = nTime;
	SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk ;
	while(TimingDelay != 0);
}
