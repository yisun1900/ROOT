<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ϴ�ͼƬ�����ݿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
	String ls=getServletContext().getRealPath("");
	String loadname=null;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;

	int maxSize=100;//���ߴ�

	try 
	{
		ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
		up.initialize();

		String lfjlh=cf.GB2Uni(up.getParameter("lfjlh"));

		loadname=up.getFileName("loadname");
		byte[] buffer=up.getFileBuffer("loadname");

		int size=buffer.length/1024;
		if (size>maxSize)
		{
			out.println("�����ϴ��ļ���С���ܳ���["+maxSize+"K]�����ļ���СΪ["+size+"K]");
			return;
		}

		loadname=loadname.substring(loadname.lastIndexOf('\\')+1);


		//Ϊ��Ƭ���Ƽ�ǰ׺
		loadname=lfjlh.toUpperCase()+"-"+loadname;


		if (!cf.isFileType(loadname))
		{
			out.println("���󣡲���������ϴ��ļ�����");
			return;
		}

		conn=cf.getConnection();


		String oldlfjlh="";
		ls_sql="SELECT lfjlh";
		ls_sql+=" FROM crm_lfjlzp";
		ls_sql+=" where lfzpmc='"+loadname+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldlfjlh=rs.getString(1);

			if (!oldlfjlh.equals(lfjlh))
			{
				out.println("����[��Ƭ����]�Ѵ���");
				return;
			}
		}
		rs.close();
		ps.close();


		String filename=ls+"/dhzx/lfjl/images/"+loadname;

		java.io.FileOutputStream f=new java.io.FileOutputStream(filename);
		f.write(buffer);
		f.close();


		if (!oldlfjlh.equals(lfjlh))
		{
			ls_sql="insert into crm_lfjlzp(lfjlh,lfzpmc) values(?,?)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,lfjlh);
			ps.setString(2,loadname);
			ps.executeUpdate();
			ps.close();
		}


		%>
		<SCRIPT language=javascript >
		<!--
		alert("���ذ����Ƭ�ɹ���");
		history.go(-1);
		//-->
		</SCRIPT>
		<%
	}
	catch (Exception e) {
	  out.print("���ذ����Ƭʧ�ܣ�Exception:" + e);
	}
	finally 
	{
		try{
			if (rs!= null) rs.close(); 
			if (ps!= null) ps.close(); 
			if (conn != null) cf.close(conn); 
		}
		catch (Exception e){
			if (conn != null) cf.close(conn); 
		}
	}
%> 
</body>
</html>
