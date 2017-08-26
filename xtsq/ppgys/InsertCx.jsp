<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%  
String dqbm = request.getParameter("dqbm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String c1=null;
	String retStr="";

	ls_sql="select gys";
	ls_sql+=" from  sq_gysbm";
	ls_sql+=" where dqbm='"+dqbm+"'";
	ls_sql+=" order by gys";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		c1=rs.getString(1);

		retStr+="%"+c1;
	}
	rs.close();
	ps.close();

	if (!retStr.equals(""))
	{
		retStr=retStr.substring(1);
	}

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

