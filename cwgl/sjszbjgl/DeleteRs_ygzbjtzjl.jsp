<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xuhao = request.getParameterValues("xuhao");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xuhao.length ;i++ )
	{
		String ygbh=null;
		ls_sql="select ygbh";
		ls_sql+=" from  rs_ygzbjtzjl";
		ls_sql+=" where xuhao="+xuhao[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
		}
		rs.close();
		ps.close();


		ls_sql="delete from rs_ygzbjtzjl ";
		ls_sql+=" where xuhao="+xuhao[i];
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		double allje=0;
		ls_sql="select sum(je)";
		ls_sql+=" from  rs_ygzbjtzjl";
		ls_sql+=" where ygbh="+ygbh;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			allje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//员工社保信息
		ls_sql="update sq_yhxx set zbj="+allje;
		ls_sql+=" where ygbh="+ygbh;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>出错:" + e);
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