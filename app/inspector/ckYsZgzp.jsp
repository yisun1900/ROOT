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
String ysjlh = request.getParameter("ysjlh");
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
	String yszpmc=null;
	String zpsm=null;
	String zpml = "";
	
	ls_sql="SELECT yszpmc,zpsm,zpml";
	ls_sql+=" FROM crm_heyszp";
	ls_sql+=" where  ysjlh='"+ysjlh+"'";
//	ls_sql+=" order by zpxmbm";
	System.out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yszpmc=rs.getString("yszpmc");
		zpsm=rs.getString("zpsm");
		zpml=rs.getString("zpml");

		row++;

		%>
		<tr bgcolor="#FFFFFF" align="center"> 
        
		  <td> 
			<img src="/yblimg/gcys/<%=zpml%>/<%=yszpmc%>" width="100%">
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
