#include "CC1101.h"
#include "delay.h"

u8 PaTabel[] = { 0xc0, 0xC8, 0x84, 0x60, 0x68, 0x34, 0x1D, 0x0E};



// RF_SETTINGS is a data structure which contains all relevant CCxxx0 registers
static const u8 CC1101InitData[22][2]= 
{
  {CC1101_IOCFG0,      0x06},
  {CC1101_FIFOTHR,     0x47},
  {CC1101_PKTCTRL0,    0x05},
  {CC1101_CHANNR,      0x01},
  {CC1101_FSCTRL1,     0x06},
  {CC1101_FREQ2,       0x0F},
  {CC1101_FREQ1,       0x62},
  {CC1101_FREQ0,       0x76},
  {CC1101_MDMCFG4,     0xF6},
  {CC1101_MDMCFG3,     0x43},
  {CC1101_MDMCFG2,     0x13},
  {CC1101_DEVIATN,     0x15},
  {CC1101_MCSM0,       0x18},
  {CC1101_FOCCFG,      0x16},
  {CC1101_WORCTRL,     0xFB},
  {CC1101_FSCAL3,      0xE9},
  {CC1101_FSCAL2,      0x2A},
  {CC1101_FSCAL1,      0x00},
  {CC1101_FSCAL0,      0x1F},
  {CC1101_TEST2,       0x81},
  {CC1101_TEST1,       0x35},
  {CC1101_MCSM1,       0x3B},
};

void CC1101WriteReg(u8 Addr,u8 Value);

//SPI初始化
void SpiC1101Init(void)
{
 	GPIO_InitTypeDef GPIO_InitStructure; 
	SPI_InitTypeDef SPI_InitStructure;
	//配置SPI1接口 PA5、6、7
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);
	 //PC2-GDO2 PC1-GDO0
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_2;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
  
  	GPIO_Init(GPIOC, &GPIO_InitStructure);
	//CS-PD2
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
  
  	GPIO_Init(GPIOD, &GPIO_InitStructure);
	
	SPI_InitStructure.SPI_Direction=SPI_Direction_2Lines_FullDuplex;
	SPI_InitStructure.SPI_Mode=SPI_Mode_Master;
	SPI_InitStructure.SPI_DataSize=SPI_DataSize_8b;
	SPI_InitStructure.SPI_CPOL=SPI_CPOL_High;
	SPI_InitStructure.SPI_CPHA=SPI_CPHA_2Edge;
	SPI_InitStructure.SPI_NSS=SPI_NSS_Soft;
	SPI_InitStructure.SPI_BaudRatePrescaler=SPI_BaudRatePrescaler_16;
	SPI_InitStructure.SPI_FirstBit=SPI_FirstBit_MSB;
	SPI_InitStructure.SPI_CRCPolynomial=7;

	SPI_Init(SPI1,&SPI_InitStructure);
	SPI_Cmd(SPI1,ENABLE);
}
/*===========================================================================
通过SPI进行数据交换
输入：需要写入SPI的值
输出：通过SPI读出的值
============================================================================*/
u8 SPI_ExchangeByte(u16 input)
{
	u8 retry=0;
	SPI_I2S_SendData(SPI1,input);
	while (RESET == SPI_I2S_GetFlagStatus(SPI1,SPI_I2S_FLAG_TXE))
	{
		retry++;
		if(retry>200)
			return 0;
		
	}
	
	retry=0;
	while (RESET == SPI_I2S_GetFlagStatus(SPI1,SPI_I2S_FLAG_RXNE))
	{
		retry++;
		if(retry>200)
			return 0;
	}
		
	return (SPI_I2S_ReceiveData(SPI1));
}
/*
================================================================================
Function : CC1101WORInit( )
    Initialize the WOR function of CC1101
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101WORInit(void)
{
	CC1101WriteReg(CC1101_MCSM0,0x18);
	CC1101WriteReg(CC1101_WORCTRL,0x78); //Wake On Radio Control
	CC1101WriteReg(CC1101_MCSM2,0x00);
	CC1101WriteReg(CC1101_WOREVT1,0x8C);
	CC1101WriteReg(CC1101_WOREVT0,0xA0);	
}
/*
================================================================================
Function : CC1101ReadReg( )
    read a byte from the specified register
INPUT    : addr, The address of the register
OUTPUT   : the byte read from the rigister
================================================================================
*/
u8 CC1101ReadReg(u8 addr)
{
	u8 i;
	GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
	SPI_ExchangeByte(addr|READ_SINGLE); //send addr
	i= SPI_ExchangeByte(0xff); 
	GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable 
	return i;
}

/*
================================================================================
Function : CC1101ReadMultiReg( )
    Read some bytes from the rigisters continously
INPUT    : addr, The address of the register
           buff, The buffer stores the data
           size, How many bytes should be read
OUTPUT   : None
================================================================================
*/
void CC1101ReadMultiReg( u8 addr, u8 *buff, u8 size )
{
    u8 i, j;
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    SPI_ExchangeByte( addr | READ_BURST);
    for( i = 0; i < size; i ++ )
    {
        for( j = 0; j < 20; j ++ );
        *( buff + i ) = SPI_ExchangeByte( 0xFF );
    }
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable 
}

/*
================================================================================
Function : CC1101ReadStatus( )
    Read a status register
INPUT    : addr, The address of the register
OUTPUT   : the value read from the status register
================================================================================
*/
u8 CC1101ReadStatus( u8 addr )
{
    u8 i;
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    SPI_ExchangeByte( addr | READ_BURST);
    i = SPI_ExchangeByte( 0xFF );
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable 
    return i;
}


/*
================================================================================
Function : CC1101SetTRMode( )
    Set the device as TX mode or RX mode
INPUT    : mode selection
OUTPUT   : None
================================================================================
*/
void CC1101SetTRMode( TRMODE mode )
{
    if( mode == TX_MODE )
    {
        CC1101WriteReg(CC1101_IOCFG0,0x46);
        CC1101WriteCmd( CC1101_STX );
    }
    else if( mode == RX_MODE )
    {
        CC1101WriteReg(CC1101_IOCFG0,0x46);
        CC1101WriteCmd( CC1101_SRX );
    }
}



/*
================================================================================
Function : CC1101WriteReg( )
    Write a byte to the specified register
INPUT    : addr, The address of the register
           value, the byte you want to write
OUTPUT   : None
================================================================================
*/
void CC1101WriteReg( u8 addr, u8 value )
{
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    SPI_ExchangeByte( addr );
    SPI_ExchangeByte( value );
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable 
}


/*
================================================================================
Function : CC1101WriteMultiReg( )
    Write some bytes to the specified register
INPUT    : addr, The address of the register
           buff, a buffer stores the values
           size, How many byte should be written
OUTPUT   : None
================================================================================
*/
void CC1101WriteMultiReg( u8 addr, u8 *buff, u8 size )
{
    u8 i;
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    SPI_ExchangeByte( addr | WRITE_BURST );
    for( i = 0; i < size; i ++ )
    {
        SPI_ExchangeByte( *( buff + i ) );
    }
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable
}

/*
================================================================================
Function : CC1101WriteCmd( )
    Write a command byte to the device
INPUT    : command, the byte you want to write
OUTPUT   : None
================================================================================
*/
void CC1101WriteCmd( u8 command )
{
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    SPI_ExchangeByte( command );
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable
}

/*
================================================================================
Function : CC1101Reset( )
    Reset the CC1101 device
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101Reset( void )
{
    u8 x;

    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_RESET);	//CS enable 
    GPIO_WriteBit(GPIOD,GPIO_Pin_2,Bit_SET);	//CS enable
    for( x = 0; x < 100; x ++ );
    CC1101WriteCmd( CC1101_SRES );
}

/*
================================================================================
Function : CC1101SetIdle( )
    Set the CC1101 into IDLE mode
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101SetIdle( void )
{
    CC1101WriteCmd(CC1101_SIDLE);
}

/*
================================================================================
Function : CC1101ClrTXBuff( )
    Flush the TX buffer of CC1101
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101ClrTXBuff( void )
{
    CC1101SetIdle();//MUST BE IDLE MODE
    CC1101WriteCmd( CC1101_SFTX );
}
/*
================================================================================
Function : CC1101ClrRXBuff( )
    Flush the RX buffer of CC1101
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101ClrRXBuff( void )
{
    CC1101SetIdle();//MUST BE IDLE MODE
    CC1101WriteCmd( CC1101_SFRX );
}

/*
================================================================================
Function : CC1101SendPacket( )
    Send a packet
INPUT    : txbuffer, The buffer stores data to be sent
           size, How many bytes should be sent
           mode, Broadcast or address check packet
OUTPUT   : None
================================================================================
*/
void CC1101SendPacket( u8 *txbuffer, u8 size, TX_DATA_MODE mode )
{
    u8 address;
    if( mode == BROADCAST )             { address = 0; }
    else if( mode == ADDRESS_CHECK )    { address = CC1101ReadReg( CC1101_ADDR ); }

    CC1101ClrTXBuff( );
    
    if( ( CC1101ReadReg( CC1101_PKTCTRL1 ) & ~0x03 ) != 0 )
    {
        CC1101WriteReg( CC1101_TXFIFO, size + 1 );
        CC1101WriteReg( CC1101_TXFIFO, address );
    }
    else
    {
        CC1101WriteReg( CC1101_TXFIFO, size );
    }

    CC1101WriteMultiReg( CC1101_TXFIFO, txbuffer, size );
    CC1101SetTRMode( TX_MODE );
    while( GPIO_ReadInputDataBit( GPIOC, GPIO_Pin_1 ) != 0 );
    while( GPIO_ReadInputDataBit( GPIOC, GPIO_Pin_1 ) == 0 );

    CC1101ClrTXBuff( );
}

/*
================================================================================
Function : CC1101GetRXCnt( )
    Get received count of CC1101
INPUT    : None
OUTPUT   : How many bytes hae been received
================================================================================
*/
u8 CC1101GetRXCnt( void )
{
    return ( CC1101ReadStatus( CC1101_RXBYTES )  & BYTES_IN_RXFIFO );
}

/*
================================================================================
Function : CC1101SetAddress( )
    Set the address and address mode of the CC1101
INPUT    : address, The address byte
           AddressMode, the address check mode
OUTPUT   : None
================================================================================
*/
void CC1101SetAddress( u8 address, ADDR_MODE AddressMode)
{
    u8 btmp = CC1101ReadReg( CC1101_PKTCTRL1 ) & ~0x03;
    CC1101WriteReg(CC1101_ADDR, address);
    if     ( AddressMode == BROAD_ALL )     {}
    else if( AddressMode == BROAD_NO  )     { btmp |= 0x01; }
    else if( AddressMode == BROAD_0   )     { btmp |= 0x02; }
    else if( AddressMode == BROAD_0AND255 ) { btmp |= 0x03; }   
}
/*
================================================================================
Function : CC1101SetSYNC( )
    Set the SYNC bytes of the CC1101
INPUT    : sync, 16bit sync 
OUTPUT   : None
================================================================================
*/
void CC1101SetSYNC( u16 sync )
{
    CC1101WriteReg(CC1101_SYNC1, 0xFF & ( sync>>8 ) );
    CC1101WriteReg(CC1101_SYNC0, 0xFF & sync ); 
}

/*
================================================================================
Function : CC1101RecPacket( )
    Receive a packet
INPUT    : rxBuffer, A buffer store the received data
OUTPUT   : 1:received count, 0:no data
================================================================================
*/
u8 CC1101RecPacket( u8 *rxBuffer )
{
    u8 status[2];
    u8 pktLen;
    u8 x , j = 0;

    if ( CC1101GetRXCnt( ) != 0 )
    {
        pktLen = CC1101ReadReg(CC1101_RXFIFO);           // Read length byte
        if( ( CC1101ReadReg( CC1101_PKTCTRL1 ) & ~0x03 ) != 0 )
        {
            x = CC1101ReadReg(CC1101_RXFIFO);
        }
        if( pktLen == 0 )           { return 0; }
        else                        { pktLen --; }
        CC1101ReadMultiReg(CC1101_RXFIFO, rxBuffer, pktLen); // Pull data
        CC1101ReadMultiReg(CC1101_RXFIFO, status, 2);   // Read  status bytes

        CC1101ClrRXBuff( );

        if( status[1] & CRC_OK ) {   return pktLen; }
        else                     {   return 0; }
    }
    else   {  return 0; }                               // Error
}
/*
================================================================================
Function : CC1101Init( )
    Initialize the CC1101, User can modify it
INPUT    : None
OUTPUT   : None
================================================================================
*/
void CC1101Init( void )
{
    volatile u8 i, j;

    CC1101Reset( );    
    
    for( i = 0; i < 22; i++ )
    {
        CC1101WriteReg( CC1101InitData[i][0], CC1101InitData[i][1] );
    }
    CC1101SetAddress( 0x05, BROAD_0AND255 );
    CC1101SetSYNC( 0x8799 );
    CC1101WriteReg(CC1101_MDMCFG1,   0x72); //Modem Configuration

    CC1101WriteMultiReg(CC1101_PATABLE, PaTabel, 8 );

    i = CC1101ReadStatus( CC1101_PARTNUM );//for test, must be 0x80
    i = CC1101ReadStatus( CC1101_VERSION );//for test, refer to the datasheet
}

