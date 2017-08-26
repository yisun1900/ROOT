<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sqxh=request.getParameterValues("sqxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<sqxh.length ;i++ )
	{
		String clzt=null;
		ls_sql="select clzt";
		ls_sql+=" from  rs_thrysq";
		ls_sql+=" where sqxh='"+sqxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clzt=cf.fillNull(rs.getString("clzt"));
		}
		else{
			conn.rollback();
			out.println("错误！退回人员申请序号『"+sqxh[i]+"』不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!clzt.equals("01"))//01：等待审批
		{
			conn.rollback();
			out.println("退回人员申请序号『"+sqxh[i]+"』错误！处理状态不正确");
			return;
		}

		ls_sql="delete from rs_thrysq";
		ls_sql+=" where sqxh='"+sqxh[i]+"'";
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