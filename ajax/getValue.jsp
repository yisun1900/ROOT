<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>


<%  
String sql=request.getParameter("sql");
sql=cf.SQLJM(sql);
//	out.print("SQL="+sql);


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

try {
	conn=cf.getConnection();

	String retStr="";
	String c1=null;

	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		c1=cf.fillNull(rs.getString(1));

		retStr=c1;
	}
	rs.close();
	ps.close();

	out.print(retStr);  

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
		if (conn != null) cf.close(conn); 
	}
}

%>

