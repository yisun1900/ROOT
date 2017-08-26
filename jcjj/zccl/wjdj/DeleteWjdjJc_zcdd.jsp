<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String clzt=null;
		String sfjs=null;
		ls_sql =" select clzt,sfjs";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			sfjs=rs.getString("sfjs");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("30"))
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
			return;
		}

		if (!sfjs.equals("N") && !sfjs.equals("C"))//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
		{
			conn.rollback();
			out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】已结算");
			return;
		}

		ls_sql="update jc_zcdd set wjsj=null,wjlrr=null,clzt='19'";
		ls_sql+=" where ddbh='"+ddbh[i]+"' and clzt='30'";
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
	out.print("Exception: " + e);
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