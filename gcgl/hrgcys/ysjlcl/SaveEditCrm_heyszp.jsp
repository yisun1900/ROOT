<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ysjlh=request.getParameter("ysjlh");
String[] yszpmc=request.getParameterValues("yszpmc");
String[] zpsm=request.getParameterValues("zpsm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<yszpmc.length ;i++ )
	{
		ls_sql=" update crm_heyszp set zpsm='"+cf.GB2Uni(zpsm[i])+"'";
		ls_sql+=" where  ysjlh='"+ysjlh+"' and yszpmc='"+cf.GB2Uni(yszpmc[i])+"'";
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
	out.print("存盘失败,发生意外: " + e);
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