<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String xjjlh=request.getParameter("xjjlh");
String zpgjz=request.getParameter("zpgjz");
String lx=request.getParameter("lx");
String[] xjzpmc=request.getParameterValues("xjzpmc");
String[] zpsm=request.getParameterValues("zpsm");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try 
{
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xjzpmc.length ;i++ )
	{
		ls_sql=" update kp_xjgdjlzp set zpsm='"+cf.GB2Uni(zpsm[i])+"'";
		ls_sql+=" where  xjjlh='"+xjjlh+"' and xjzpmc='"+cf.GB2Uni(xjzpmc[i])+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e);
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