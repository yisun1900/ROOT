<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>���빤�ʳ�ʼ����Ϣ </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String filename=null;
String bdfj=null;
java.io.FileOutputStream f=null;

String[][] outStr=null; 
String bgcolor=null;

String bdbh =null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	bdbh = up.getParameter("bdbh");

	//��ȡ�ļ�����
	byte[] buffer=up.getFileBuffer("loadName");

	//��ȡ�ļ�����
	filename =up.getFileName("loadName");
	filename=filename.substring(filename.lastIndexOf('\\')+1);
	bdfj=filename;

	if (!cf.isFileType(bdfj))
	{
		out.println("���󣡲����������ϴ��ļ�����");
		return;
	}
 
 	conn=cf.getConnection();

	int xh=0;
	ls_sql="select count(*)";
	ls_sql+=" from  xz_bdgl";
	ls_sql+=" where bdbh!='"+bdbh+"' and bdfj='"+bdfj+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (xh>0)
	{
		out.println("����[������������]�Ѵ���");
		return;
	}


	filename =rootPath+"\\xz\\bdgl\\file\\"+filename;
	//д�ļ�
	f=new java.io.FileOutputStream(filename);
	f.write(buffer);
	f.close();


	ls_sql="update xz_bdgl set bdfj=?";
	ls_sql+=" where  (bdbh='"+bdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bdfj);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�ϴ��ɹ���");
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
		if (f!=null) f.close();
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%> 