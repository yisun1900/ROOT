<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%

String khbh=request.getParameter("khbh");
String bjjb="";
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="SELECT lx";
	ls_sql+=" FROM bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));

	}
	rs.close();
	ps.close();

		response.sendRedirect("/cxxydy/cxxydy11.jsp?khbh="+khbh);

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("sql: " + ls_sql);
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




 




