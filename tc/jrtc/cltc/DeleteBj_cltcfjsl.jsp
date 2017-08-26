<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.getParameter(request,"tcmc");
String jgwzbm=cf.getParameter(request,"jgwzbm");
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="delete from bj_cltcfjsl ";
	ls_sql+=" where  (dqbm='"+dqbm+"') and  (tcmc='"+tcmc+"') and  (hxbm='"+hxbm+"') and  (jgwzbm='"+jgwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！"+ls_sql);
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("删除成功！");
		window.close();
		//-->
		</SCRIPT>
		<%

	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>