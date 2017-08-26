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

	String clzt=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		String ddlx="";
		ls_sql =" select clzt,ddlx";
		ls_sql+=" from jc_zcdd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
			ddlx=cf.fillNull(rs.getString("ddlx"));
		}
		rs.close();
		ps.close();

		if (ddlx.equals("E") || ddlx.equals("9") || ddlx.equals("C"))//E：散客
		{
			if (!clzt.equals("30") && !clzt.equals("99"))
			{
				conn.rollback();
				out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
				return;
			}
		}
		else{
			if (!clzt.equals("11") && !clzt.equals("99"))
			{
				conn.rollback();
				out.println("<BR>错误，删除失败！订单【"+ddbh[i]+"】状态不正确");
				return;
			}
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from jc_zczjx";
		ls_sql+=" where  ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			conn.rollback();
			out.println("错误，删除失败！订单【"+ddbh[i]+"】已有增减项");
			return;
		}

		if (clzt.equals("11"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,clzt='09'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (clzt.equals("30"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,clzt='09'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (clzt.equals("99"))
		{
			ls_sql="update jc_zcdd set ddqrr=null,ddqrsj=null,tdqrbz='N'";
			ls_sql+=" where ddbh='"+ddbh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
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