<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
String yszpmc=request.getParameter("yszpmc");
%>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

f_do();

function f_do()//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="LoadYsZpPadCp.jsp?yszpmc="+encodeURI("<%=yszpmc%>");
		window.location=urlStr;
	}
	else
	{
		var urlStr="LoadYsZpCp.jsp?yszpmc="+encodeURI("<%=yszpmc%>");
		window.location=urlStr;
	}
}


//-->
</SCRIPT>
