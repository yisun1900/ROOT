<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String nian=cf.GB2Uni(request.getParameter("nian"));
String yue=cf.GB2Uni(request.getParameter("yue"));

%>

<html>
<head>
<title>��ʼɾ���ͻ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center">
  <input type="button" value="��ʼɾ���ͻ�" onClick="f_do()">
  <font color="#FF0000"><b>��������ע�⣺ɾ���󲻿ɻָ� </b></font> 
  <P> <BR>
</div>
<BR>
</body>
</html>


<script  LANGUAGE="javascript">
<!--
function f_do()
{
	if ( confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		window.open('DeleteCw_dmkhjl.jsp?dwbh=<%=dwbh%>&nian=<%=nian%>&yue=<%=yue%>')
	}
} 
//-->
</script>
</html>