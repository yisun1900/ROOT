<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ɾ����Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
String xcmbm=request.getParameter("xcmbm");
String zpmc=request.getParameter("zpmc");

String path=getServletContext().getRealPath("")+"/jcjj/jjbj/images";
String fileName=path+"/"+zpmc;

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

try 
{
	java.io.File lsFile=null;
	lsFile=new java.io.File(fileName);

	if (!lsFile.delete())
	{
		out.println("<BR>ɾ��ͼƬ��"+zpmc+"��ʧ�ܣ�");
		return;
	}

	conn=cf.getConnection();
	
	ls_sql="update jc_bgmbj set zpmc=null";
	ls_sql+=" where xcmbm='"+xcmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ɾ���ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("����ʧ�ܣ�Exception:" + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}

%>

</body>
</html>


