<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jfjlh = request.getParameterValues("jfjlh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	for (int i=0;i<jfjlh.length ;i++ )
	{
		String khbh=null;
		ls_sql="select khbh";
		ls_sql+=" from  crm_xmjfjl";
		ls_sql+=" where jfjlh='"+jfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();


		String getxmjfzt=null;
		ls_sql="select xmjfzt";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
		}
		rs.close();
		ps.close();

		//N：未交付；S：预交付；Y：回访成功；X：失败未处理；T：失败已处理；W：项目交付
		if (!getxmjfzt.equals("W"))
		{
			conn.rollback();
			out.println("错误！状态不正确:"+jfjlh[i]);
			return;
		}

		String clzt="W";//N：未交付；S：预交付；Y：回访成功；X：回访失败；C：失败已处理；W：项目交付

		
		ls_sql="delete from crm_xmjfjl ";
		ls_sql+=" where jfjlh='"+jfjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="update crm_khxx set xmjfzt='Y',sjwjrq=null,gcjdbm='4' ";
		ls_sql+=" where khbh='"+khbh+"'";
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
	out.print("<BR>存盘失败,发生意外: " + e);
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