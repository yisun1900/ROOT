<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] djjlh=request.getParameterValues("djjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<djjlh.length ;i++ )
	{
		String khbh=null;
		ls_sql=" select khbh";
		ls_sql+=" from  crm_gqtzjl";
		ls_sql+=" where  (djjlh='"+djjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=rs.getString(1);
		}
		rs.close();
		ps.close();

		ls_sql="delete from crm_gqtzjl ";
		ls_sql+=" where  (djjlh='"+djjlh[i]+"')  ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		int yqts=0;
		ls_sql=" select sum(tzts)";
		ls_sql+=" from  crm_gqtzjl";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yqts=rs.getInt(1);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set yqts=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,yqts);
		ps.executeUpdate();
		ps.close();
	}



	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ý³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>