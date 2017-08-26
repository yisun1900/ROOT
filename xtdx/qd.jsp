<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='DSDX' scope='page' class='dxxt.DSDX'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>启动定时短信线程</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%  
try 
{
DSDX.qdxc();
out.println("短信程序启动!!!");//将发送结果显示到页面上
}
catch (Exception e) 
{
	out.println("线程正在运行!!!!!!!");//将发送结果显示到页面上
}
//boolean a=true;
//if (a)
//{
//	out.print("aaaaaaa");
//}
%>
</body>
</html>

