<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>OROP��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%  
String lrph = request.getParameter("lrph");
String bz = cf.GB2Uni(request.getParameter("bz"));
String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //�õ�����
	
	ls_sql=" update crm_lrph set bz=?";
	ls_sql+=" where lrph='"+lrph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bz);
	ps.executeUpdate();
	ps.close();
}
catch(Exception e){
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + ls_sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
}

response.sendRedirect("yrk_lrxxmain.jsp?lrph="+lrph);

%>


<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
