CMPPAPI, CMPPDeliverResp, CMPPQueryResp etc. 
��һ��ĳ���û������
CMPPAPI pCMPPAPI = new CMPPAPI();
	if( pCMPPAPI.InitCMPPAPI( "../config/javacmppc.ini" ) != 0 ) 
	{
		if( nOutput == 1 ) {
		System.out.println( "Fail to call InitCMPPAPI!" );
	}
	System.exit( 1 ); 
}
// CMPPSendSingle��������������룬�����ֻ������Ͷ˿ڣ��Ʒ��ֻ�����Ϣ��ʽ����Ϣ�����Ƿ�ظ��Ȳ���
if( pCMPPAPI.CMPPSendSingle( nNeedReply, nMsgLevel,sServiceID, nMsgFormat,sFeeType, sFeeCode,sValidTime, sAtTime
,sSrcTermID, sDestTermID,nMsgLen, sMsgCon,sMsgID, (byte)0, null, (byte)0, (byte)0 ) != 0 ) 
{
	if( nOutput == 1 ) {
	System.out.println( "Fail to call CMPPSendSingle, error=" + pCMPPAPI.GetErrCode() );
}
System.exit( 1 );
}
���յĳ������һ���߳�ͨ��
private CMPPDeliverResp deliver = new CMPPDeliverResp();
int error = CMPPDeliver( nTimeout, deliver );
�������ص����ݡ�������˾��API���и���д����
������Ҫ�߼����ܵģ���������CMPPЭ������Ͻ��п�����



