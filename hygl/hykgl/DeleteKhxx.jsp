<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<%
String[] hykh = request.getParameterValues("hykh");

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sqlString=null;

try{
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for(int i=0;i<hykh.length;i++)
	{
		sqlString = "delete from hy_khxxb ";
		sqlString+= " where hykh='"+hykh[i]+"' and sfyfk='N' and sfysy='N'";
		ps=conn.prepareStatement(sqlString);  
		if(ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.print("¿¨ºÅÉ¾³ýÊ§°Ü£¬¿¨ºÅ£º"+hykh[i]);
			return;
		}
		ps.close();
	}

	conn.commit();
	out.print("<BR>É¾³ý³É¹¦");
}
catch(Exception e){
	conn.rollback();
	out.print("Exception: "+e);
}
finally{
	conn.setAutoCommit(true);
	try{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) cf.close(conn);
	}
	catch(Exception e){
		out.print("Finally Exception: "+e);
		return;
	}
}

%>