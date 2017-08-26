<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='YZCS' scope='page' class='cs.YZCS'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>短信发送页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  
//String yhdlm=(String)session.getAttribute("yhdlm");
String yhdlm="ybl";
String jssj = request.getParameter("jssj");//接收传递过来的手机号码,多个号码用","分割
String dxnr=cf.GB2Uni(request.getParameter("dxnr"));//接收传递过来的短信内容

//String dxcs=FSDX.DXSX(jssj,dxnr,yhdlm,"1");//调用发送短信函数
//函数说明:jssj:接收号码,如果有多个用","隔开
//dxnr:短信的内容
//yhdlm:用户登录名
//"1":固定数字,1:及时短信;0:定时短信
try 
{
YZCS.qdxc();
out.println("线程已经启动");//将发送结果显示到页面上
}
catch (Exception e) 
{
	out.println("线程正在运行!!!!!!!");//将发送结果显示到页面上
}

%>

</body>
</html>
