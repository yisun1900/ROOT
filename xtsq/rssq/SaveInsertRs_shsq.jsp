<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String[] ztbm=request.getParameterValues("ztbm");
String ztlx=cf.GB2Uni(request.getParameter("ztlx"));
String yhzbh=null;
yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from rs_shsq";
	ls_sql+=" where yhzbh='"+yhzbh+"' and ztbm in(select ztbm from rs_ztbm where ztlx='"+ztlx+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<ztbm.length ;i++ )
	{
		if (ztbm[i].equals(""))
		{
			continue;
		}
		ls_sql="insert into rs_shsq ( ztbm,yhzbh ) ";
		ls_sql+=" values ( ?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ztbm[i]);
		ps.setString(2,yhzbh);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>