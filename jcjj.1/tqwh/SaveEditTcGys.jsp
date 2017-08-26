<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=request.getParameter("ssfgs");
String gysmcold=cf.GB2Uni(request.getParameter("gysmcold"));
String gysmcnew=cf.GB2Uni(request.getParameter("gysmcnew"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String khbh=null;
	int row=0;
	ls_sql="select distinct bj_khzcxm.khbh";
	ls_sql+=" FROM bj_khzcxm,crm_zxkhxx ";
	ls_sql+=" where bj_khzcxm.khbh=crm_zxkhxx.khbh(+) ";
	ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"'";
	ls_sql+=" and bj_khzcxm.gysmc='"+gysmcold+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");

		row++;

		ls_sql="update bj_khzcxm set gysmc=?";
		ls_sql+=" where gysmc='"+gysmcold+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysmcnew);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_mbkhzcxm set gysmc=?";
		ls_sql+=" where gysmc='"+gysmcold+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysmcnew);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_khzcxmq set gysmc=?";
		ls_sql+=" where gysmc='"+gysmcold+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysmcnew);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_khzcxmh set gysmc=?";
		ls_sql+=" where gysmc='"+gysmcold+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysmcnew);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update bj_zjxzcbgqd set gysmc=?";
		ls_sql+=" where gysmc='"+gysmcold+"'";
		ls_sql+=" and khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,gysmcnew);
		ps1.executeUpdate();
		ps1.close();

	}
	rs.close();
	ps.close();

	


 	conn.commit();

	if (row==0)
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("提醒！没有任何符合条件的供应商被修改，请确认原供应商是否正确【<%=gysmcold%>】");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}


}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>