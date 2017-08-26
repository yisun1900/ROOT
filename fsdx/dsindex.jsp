<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='YZCS' scope='page' class='cs.YZCS'/><!-- 短信发送包 -->

<html>
<head>
<title>短信发送页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%  

String jssj = "200803071732";//发送日期
String dxnr = "2008-03-07 17:32发送!";//发送内容

YZCS.Addtime(jssj,dxnr);//调用发送短信函数
out.print(jssj+"<br>"+dxnr);

%>

</body>
</html>
