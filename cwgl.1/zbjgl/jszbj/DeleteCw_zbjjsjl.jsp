<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xuhao=request.getParameterValues("xuhao");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xuhao.length ;i++ )
	{
		double oldje=0;
		String sgd=null;
		ls_sql="select je,sgd";
		ls_sql+=" from  cw_zbjjsjl";
		ls_sql+=" where xuhao="+xuhao[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldje=rs.getDouble("je");
			sgd=rs.getString("sgd");
		}
		else{
			conn.rollback();
			out.println("错误！不存在的序号："+xuhao[i]);
			return;
		}
		rs.close();
		ps.close();
		

		ls_sql="update sq_sgd set zbj=zbj+?";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,oldje);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_zbjjsjl ";
		ls_sql+=" where xuhao="+xuhao[i];
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