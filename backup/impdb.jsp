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
		out.println("<BR>������������,�ļ���"+imppath+"������");
		return;
	}


	java.lang.Runtime rt=java.lang.Runtime.getRuntime();
	java.lang.Process p=null;

	p=rt.exec("imp yzerp/yzerp BUFFER=4096 FILE="+imppath);
//	out.println("ִ�����imp yzerp/yzerp BUFFER=4096 FILE="+imppath+" FULL=Y");
	out.println("<BR>��ʼ�����ļ���"+imppath+"<P>���빤����ϵͳ�ں�̨��ɣ�������������������");

}
catch (Exception e) {
	out.print("Exception: " + e.getMessage());
	return;
}
finally 
{
}

%>

