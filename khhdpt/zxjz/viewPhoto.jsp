<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看工程验收照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ysjlh=request.getParameter("ysjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();


%>
<body bgcolor="#FFFFFF">
<CENTER><B>验收记录号：<%=ysjlh%></B><BR><HR>
<form method="post" action="viewPhoto.jsp" name="editform">
<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >
    <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#999999" style="FONT-SIZE: 12px;border-collapse:collapse">
      <tr bgcolor="#FFFFFF"> 
        <td width="60%" height="25" bgcolor="#F6F6F6"> 
          <div align="center"><font color="#000099">工程验收照片</font></div>
  </td>
</tr>
<%

	String yszpmc=null;
	ls_sql="SELECT yszpmc";
	ls_sql+=" FROM crm_gcyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString(1);

		%>
		<tr bgcolor="#FFFFFF"> 
		  <td> 
			<div align="center"><img src="http://127.0.0.1:8090/gcgl/gcjdgz/images/<%=yszpmc%>" width="650"></div>
		  </td>
		</tr>
		<tr bgcolor="#FFFFFF"> 
		  <td> &nbsp;
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("上载版库照片失败，Exception:" + e);
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

