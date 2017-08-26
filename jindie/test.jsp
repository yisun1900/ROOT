<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,client.*,javax.xml.rpc.*,com.kingdee.ormrpc.services.EASLogin.*,com.kingdee.ormrpc.services.WSWSVoucher.*,wsvoucher.client.*,org.apache.axis.client.Call,org.apache.axis.client.Service,webservice.bean.*,javax.xml.namespace.QName,org.apache.axis.encoding.ser.*,javax.xml.rpc.*'%>

<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>咨询客户--登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>

<%
	try
	{
		EASLoginProxyService loginws = new EASLoginProxyServiceLocator();


		EASLoginProxy loginServer = loginws.getEASLogin();

		client.WSContext ctx=loginServer.login("user", "", "eas", "001", "L2", 1);


		System.out.println(ctx.getSessionId());

//////////////////		
		WSWSVoucher[] voucherCols = null;

		int isVerify = 2;

		int isImpCashflow = 0;

		String[][] result = null;
		WSWSVoucherSrvProxyServiceLocator locator = new WSWSVoucherSrvProxyServiceLocator();
		
		java.net.URL endPoint = new java.net.URL(
						"http://172.16.250.102:6888/ormrpc/services/WSWSVoucher");
		WSWSVoucherSrvProxy voucherProxy = locator.getWSWSVoucher(endPoint);
//		voucherCols = createVoucher();

		//////////////////////////////

		WSWSVoucher[] vs = new WSWSVoucher[2];

		WSWSVoucher vo = new WSWSVoucher();

		//摘要－头
		vo.setCompanyNumber("01.001");

		vo.setBookedDate("2010-09-30");

		vo.setBizDate("2010-09-30");

		vo.setPeriodYear(2010);

		vo.setPeriodNumber(9);

		vo.setVoucherType("记");

		vo.setVoucherNumber("005");

		vo.setEntrySeq(1);

		vo.setVoucherAbstract("Webserveice Test");//摘要


		//分录－核销、挂账
		vo.setCurrencyNumber("BB01");//币种
		vo.setEntryDC(1);//借方
		vo.setAccountNumber("1001.01");//科目编码
		vo.setOriginalAmount(123.00);//原币金额
		vo.setDebitAmount(123.00);//借方金额
		vo.setCreator("王有财");//制单人

		//辅助帐－核算项目1
		vs[0] = vo;


		WSWSVoucher vo1 = new WSWSVoucher();

		vo1.setCompanyNumber("01.001");
		vo1.setBookedDate("2010-09-30");
		vo1.setBizDate("2010-09-30");
		vo1.setPeriodYear(2010);
		vo1.setPeriodNumber(9);
		vo1.setVoucherType("记");
		vo1.setVoucherNumber("005");
		vo1.setEntrySeq(2);
		vo1.setVoucherAbstract("Webserveice Test");



		vo1.setCurrencyNumber("BB01");//币种
		vo1.setEntryDC(-1);//贷方
		vo1.setAccountNumber("6901");//科目编码
		vo1.setOriginalAmount(123.00);//原币金额
		vo1.setCreditAmount(123.00);//贷方金额
		vo1.setCreator("王有财");//制单人
		vs[1] = vo1;



		voucherCols=vs;



		/////////////////////////////
		result = voucherProxy.importVoucher(voucherCols, isVerify,
						isImpCashflow);
		System.out.println("dafdfadsfa3");
		
		
		String[][] aa = result;
////////////////////////////


		System.out.println(aa[0].length);
		System.out.println(aa[0][0]);
		System.out.println(aa[0][1]);
		System.out.println(aa[0][2]);
		System.out.println(aa[0][3]);
		System.out.println(aa[0][4]);
		System.out.println(aa[0][5]);
		System.out.println(aa[0][6]);
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}

%>

</body>
</html>
