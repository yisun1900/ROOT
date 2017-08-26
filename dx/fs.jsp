<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*,com.roya.mcc.thirdapi.sendsms.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>短信发送页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  

	SMSAgent.initialize((args==null||args.length<1)?"G:\\workspace6.0\\MAS20SMSAPI\\conf\\jdbc.properties":args[0]);

		SMSSubmitMessage message=new
		SMSSubmitMessage(java.util.UUID.randomUUID().toString(),"13900139000","test"+System.currentTimeMillis(),"P000000000008001");
		message.setReqDeliveryReport(1);
		SMSAgent.sendSMS(message);
		System.out.println("commit sms");


%>

</body>
</html>
