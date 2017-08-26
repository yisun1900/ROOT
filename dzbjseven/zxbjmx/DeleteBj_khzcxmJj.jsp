<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sxh=request.getParameter("sxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String tccpdlbm="";
	String tccplbbm="";
	String jgwzbm="";
	ls_sql="select tccpdlbm,tccplbbm,jgwzbm";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql=" delete from  tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM tc_csrjkhzcqd";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update tc_csrjkhjjjmj set sjsl="+sjsl;
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>