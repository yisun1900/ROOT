<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String jjrksg=request.getParameter("jjrksg");
String[] rwbm=request.getParameterValues("rwbm");
String[] jhkssj=request.getParameterValues("jhkssj");
String[] jhjssj=request.getParameterValues("jhjssj");
String[] jhgzr=request.getParameterValues("jhgzr");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql=" update crm_khxx set jjrksg='"+jjrksg+"'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<rwbm.length ;i++ )
	{
		ls_sql=" update crm_xmrwgl set jhkssj=TO_DATE('"+jhkssj[i]+"','YYYY-MM-DD'),jhjssj=TO_DATE('"+jhjssj[i]+"','YYYY-MM-DD'),jhgzr='"+jhgzr[i]+"'";
		ls_sql+="                   ,csjhkssj=TO_DATE('"+jhkssj[i]+"','YYYY-MM-DD'),csjhjssj=TO_DATE('"+jhjssj[i]+"','YYYY-MM-DD'),csjhgzr='"+jhgzr[i]+"'";
		ls_sql+=" where rwbm='"+rwbm[i]+"' and khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>