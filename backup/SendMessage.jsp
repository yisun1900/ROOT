<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String mess=cf.GB2Uni(request.getParameter("mess"));
try {
	java.lang.Runtime rt=java.lang.Runtime.getRuntime();
	java.lang.Process p=null;
	String name=null;

	for (int i=1;i<6 ;i++ )
	{
		name="10.10.10."+i;
		p=rt.exec("net send "+name+" "+mess);
		out.println("<BR>开始发送数据TO:"+name);
	}

}
catch (Exception e) {
	out.print("Exception: " + e.getMessage());
	return;
}
finally 
{
}

%>

