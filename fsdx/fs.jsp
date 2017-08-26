<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->

<html>
<head>
<title>短信发送页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  

String jssj = request.getParameter("jssj");//接收传递过来的手机号码
String dxnr=cf.GB2Uni(request.getParameter("dxnr"));//接收传递过来的短信内容

String dxcs=FSDX.DXSX(jssj,dxnr);//调用发送短信函数
out.println(dxcs);//将发送结果显示到页面上

%>

</body>
</html>
