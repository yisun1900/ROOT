<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;

String lx=request.getParameter("lx").trim();
String sfzh=request.getParameter("sfzh").trim();

try {
	conn=cf.getConnection();   //得到连接


	long ygbh=0;
	sql="select ygbh";
	sql+=" from sq_yhxx";
	sql+=" WHERE sfzh='"+sfzh+"'";
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		ygbh=rs.getLong("ygbh");
	}
	rs.close();
	ps.close();

	if (lx.equals("jyjl"))
	{
		response.sendRedirect("InsertRs_jyjl.jsp?ygbh="+ygbh);
	}
	else if (lx.equals("gzjl"))
	{
		response.sendRedirect("InsertRs_gzjl.jsp?ygbh="+ygbh);
	}
	else if (lx.equals("jtzl"))
	{
		response.sendRedirect("InsertRs_jtzl.jsp?ygbh="+ygbh);
	}
	else if (lx.equals("sczp"))
	{
		response.sendRedirect("loadPhoto.jsp?ygbh="+ygbh);
	}
	else if (lx.equals("ckzp"))
	{
		response.sendRedirect("viewPhoto.jsp?ygbh="+ygbh);
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}

%>


