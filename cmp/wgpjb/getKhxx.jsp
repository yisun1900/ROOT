<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
String cmpbh=cf.GB2Uni(request.getParameter("cmpbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String khbh="";
	ls_sql="select khbh";
	ls_sql+=" from  cmp_cmpjl";
	ls_sql+=" where cmpzt='1'";//1£ºÎ´ÌîÐ´£»2£ºÒÑÌîÐ´
	ls_sql+=" and cmpbh='FBJ01'";
	ls_sql+=" order by lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
	}
	rs.close();
	ps.close();

	out.print(khbh);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



