<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>�鿴����Ѳ����Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xjjlh=request.getParameter("xjjlh");

String[] filename=request.getParameterValues("filename");//���ݵ�ɾ���ļ���
String ls=getServletContext().getRealPath("")+"/sgdgl/xjgd/images";


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
<CENTER>
  
  <hr>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<%

	int row=0;
	String xjzpmc=null;
	String getzpgjz=null;
	String getzpsm=null;
	String zpml = null;
	ls_sql="SELECT xjzpmc,zpgjz,zpsm,zpml";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" order by lx,xjzpmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString("xjzpmc");
		getzpgjz=rs.getString("zpgjz");
		getzpsm=rs.getString("zpsm");
		zpml = rs.getString("zpml");

		row++;

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
        
		  <td> 
			<img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="100%">
		  </td>
		</tr>
        
        <tr bgcolor="#FFFFFF" align="center"> 
		  <td><%=getzpsm%></td>
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
</form>
</CENTER>
</body>
</html>
