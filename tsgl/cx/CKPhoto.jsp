<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ֳ���Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String tsjlh=request.getParameter("tsjlh");

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/tsgl/images";


java.io.File dir=new java.io.File(ls);
java.io.File lsFile=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();


%>
<body bgcolor="#FFFFFF">
<CENTER><B>Ͷ�߱��޼�¼�ţ�<%=tsjlh%></B><BR><HR>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
  <td width="25%"> 
	<div align="center"><font color="#000099">�ļ�����</font></div>
  </td>
  <td width="60%"> 
	<div align="center"><font color="#000099">��Ƭ</font></div>
  </td>
</tr>
<%
	String kcjlh=null;
	ls_sql="SELECT kcjlh";
	ls_sql+=" FROM crm_tsbxxckcjl";
	ls_sql+=" where  tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kcjlh=rs.getString(1);
	}
	rs.close();
	ps.close();


	String xczpmc=null;
	ls_sql="SELECT xczpmc";
	ls_sql+=" FROM crm_xckczp";
	ls_sql+=" where  kcjlh='"+kcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xczpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td width="25%"> 
			<div align="center">/tsgl/images/<%=xczpmc%></div>
		  </td>
		  <td width="60%"> 
			<div align="center"><A HREF="ViewImage.jsp?zhaopian=/tsgl/images/<%=java.net.URLEncoder.encode(xczpmc,"UTF-8")%>" target="_blank"><img src="/tsgl/images/<%=xczpmc%>" width="300"></A></div>
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

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

</table>

</CENTER>
</body>
</html>


