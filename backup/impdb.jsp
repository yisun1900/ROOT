<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String imppath=cf.GB2Uni(request.getParameter("imppath"));
try {
	java.io.File dir=new java.io.File(imppath);
	if (!dir.isFile())
	{
		out.println("<BR>！！！！错误,文件："+imppath+"不存在");
		return;
	}


	java.lang.Runtime rt=java.lang.Runtime.getRuntime();
	java.lang.Process p=null;

	p=rt.exec("imp yzerp/yzerp BUFFER=4096 FILE="+imppath);
//	out.println("执行命令：imp yzerp/yzerp BUFFER=4096 FILE="+imppath+" FULL=Y");
	out.println("<BR>开始导入文件："+imppath+"<P>导入工作由系统在后台完成，您可以做其他工作了");

}
catch (Exception e) {
	out.print("Exception: " + e.getMessage());
	return;
}
finally 
{
}

%>

