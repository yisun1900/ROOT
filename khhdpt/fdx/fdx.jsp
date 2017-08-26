CMPPAPI, CMPPDeliverResp, CMPPQueryResp etc. 
和一般的程序没有区别
CMPPAPI pCMPPAPI = new CMPPAPI();
	if( pCMPPAPI.InitCMPPAPI( "../config/javacmppc.ini" ) != 0 ) 
	{
		if( nOutput == 1 ) {
		System.out.println( "Fail to call InitCMPPAPI!" );
	}
	System.exit( 1 ); 
}
// CMPPSendSingle包括参数服务代码，接受手机，发送端口，计费手机，消息格式，消息级别，是否回复等参数
if( pCMPPAPI.CMPPSendSingle( nNeedReply, nMsgLevel,sServiceID, nMsgFormat,sFeeType, sFeeCode,sValidTime, sAtTime
,sSrcTermID, sDestTermID,nMsgLen, sMsgCon,sMsgID, (byte)0, null, (byte)0, (byte)0 ) != 0 ) 
{
	if( nOutput == 1 ) {
	System.out.println( "Fail to call CMPPSendSingle, error=" + pCMPPAPI.GetErrCode() );
}
System.exit( 1 );
}
接收的程序就做一个线程通过
private CMPPDeliverResp deliver = new CMPPDeliverResp();
int error = CMPPDeliver( nTimeout, deliver );
来处理返回的数据。其他公司的API各有各的写法。
其他需要高级功能的，可自行在CMPP协议基础上进行开发。



