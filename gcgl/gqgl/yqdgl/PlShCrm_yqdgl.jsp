<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String[] yqdbh = request.getParameterValues("yqdbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yqdbh.length ;i++ )
	{
		String clzt=null;
		String khbh=null;
		ls_sql=" select clzt,khbh";
		ls_sql+=" from  crm_yqdgl";
		ls_sql+=" where  yqdbh='"+yqdbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clzt=cf.fillNull(rs.getString("clzt"));
			khbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		if (clzt.equals("2"))
		{
			conn.rollback();
			out.println("<BR>£¡£¡£¡´íÎó£¬ÒÑÉóºË£º"+yqdbh[i]);
			return;
		}


		ls_sql="update crm_yqdgl set shr=?,shsj=TRUNC(SYSDATE),shjg='Y',shts=zjts,shsm='ÅúÁ¿ÉóºË',clzt='2' ";
		ls_sql+=" where  yqdbh='"+yqdbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,yhmc);
		ps.executeUpdate();
		ps.close();

		int hzts=0;
		ls_sql=" select sum(shts)";
		ls_sql+=" from  crm_yqdgl";
		ls_sql+=" where  khbh='"+khbh+"' and shjg='Y' and clzt='2'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			hzts=rs.getInt(1);
		}
		rs.close();
		ps.close();
			
	
		ls_sql="update crm_khxx set hzts=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,hzts);
		ps.executeUpdate();
		ps.close();
	}

		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("ÉóºË³É¹¦£¡");
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