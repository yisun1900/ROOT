<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jcjlh=request.getParameter("jcjlh");
String khbh=request.getParameter("khbh");
String[] xmbm=request.getParameterValues("xmbm");
String[] jcjg=request.getParameterValues("jcjg");
String[] bz=request.getParameterValues("bz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" delete from  kp_gdrcjcmx";
	ls_sql+=" where  jcjlh='"+jcjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<xmbm.length ;i++ )
	{

		ls_sql="insert into kp_gdrcjcmx (jcjlh,xmbm,xmmc,rcjcdlbm,jcnr,jcjg,bz) ";
		ls_sql+=" select ?,xmbm,xmmc,rcjcdlbm,jcnr,?,?";
		ls_sql+=" from dm_rcjcxm ";
		ls_sql+=" where xmbm='"+xmbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jcjlh);
		ps.setString(2,cf.GB2Uni(jcjg[i]));
		ps.setString(3,cf.GB2Uni(bz[i]));
		ps.executeUpdate();
		ps.close();
	}
	

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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