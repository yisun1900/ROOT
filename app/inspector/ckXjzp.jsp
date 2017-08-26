<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<%@ page import='ybl.upload.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<html>
<head>
<title>查看工程巡检照片</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String xjjlh = request.getParameter("xjjlh");
String userName = request.getParameter("ysjlh");
String khbh = request.getParameter("khbh");	


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
//(yszpmc, ysjlh, khbh, yyszpmc, zplx,    zpxmbm, zpxm, zpsm, kkzpbz, khly,  zpscsj,zpscr) 

	int row=0;
	String xjzpmc=null;
	String zpsm=null;
	String zpml = "";
	
	ls_sql="SELECT xjzpmc,zpsm,zpml";
	ls_sql+=" FROM kp_xjgdjlzp";
	ls_sql+=" where  xjjlh='"+xjjlh+"'";
	ls_sql+=" order by lx";
	System.out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xjzpmc=rs.getString("xjzpmc");
		zpsm=rs.getString("zpsm");
		zpml = rs.getString("zpml");

		row++;

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
        
		  <td> 
			<img src="/yblimg/xjgd/<%=zpml%>/<%=xjzpmc%>" width="100%">
		  </td>
		</tr>
        
        <tr bgcolor="#FFFFFF" align="center"> 
		  <td><font size="+3" ><%=zpsm%></font> </td>
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
