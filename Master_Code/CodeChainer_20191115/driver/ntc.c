#include "ntc.h"

unsigned const int tempresist[]={28709,27421,26200,25042,23943,22899,21908, 20967, 20072, 19221, 18412, 17642, 16910,16213, 15549,14916,14314,13740,13192,12670,12172, 11696,11243, 10809, 10395,10000,9622,9261, 8916, 8585, 8269, 7967,7677,7400,7135,  
6880, 6637, 6403, 6179, 5964, 5758, 5561, 5371, 5189, 5014, 4846, 4685, 4530, 4381, 4238, 4101, 3968, 3841, 3719,  
3601, 3487, 3378, 3273, 3172, 3074, 2980, 2890, 2803, 2718, 2637, 2559, 2483, 2411, 2340, 2272, 2207, 2144, 2082, 2023, 1966, 1911, 1858, 1807, 1757, 1709, 1662, 1617, 1573, 1531, 1491, 1451, 1413,  
1376, 1340, 1305, 1271, 1239, 1207, 1177, 1147, 1118, 1090, 1063,1037, 1011,987,963,939,917,895,874,853,833,813,794,776,758 
};//b值3435 25度 10k NTC電阻=((1024count/NTCcount)-1)/10k 

unsigned char Compare_tempres(unsigned int TR)//電阻查表成為溫度 
{ 
	 unsigned char cmp_cnt; 
	 cmp_cnt =0; 
	 while (TR<tempresist[cmp_cnt]) 
	 { 
	  cmp_cnt++; 
	  if (cmp_cnt>140) 
	  break; 
	 } 
	 return cmp_cnt; 
} 

float ADC_Temperature(u16 value) 
{
	u16 NTCvalue;
	u8 Degree_C;
	float Degree_0C;
	NTCvalue=value/100*10000/14;//溫度AD值轉換成溫度電阻 
	Degree_C = Compare_tempres(NTCvalue);//溫度電阻查表成溫度值 
	Degree_0C= (float)((tempresist[Degree_C-1]-NTCvalue)*10)/(tempresist[Degree_C-1]-tempresist[Degree_C]);//差分成小數 
	return (Degree_C+Degree_0C);
}
//通过ad值去计算温度		
//u16 ntc_proc(u16 ad_data)
//{
//		
//}
