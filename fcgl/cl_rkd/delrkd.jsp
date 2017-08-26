<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;
String ls_sql=null;
double sgzsl = 0;
try {
	conn=cf.getConnection();
	ls_sql="delete from cl_rkmx ";
	ls_sql+=" where (rkph='"+rkph+"')  ";
	ps2= conn.prepareStatement(ls_sql); 
	if (ps2.executeUpdate()!=1)
	{
		out.println("<BR>删除入库明细失败,可能没有录入数据！");
//		return;
	}
	conn=cf.getConnection();
	ls_sql="delete from cl_rkd ";
	ls_sql+=" where (rkph='"+rkph+"') ";
	ps= conn.prepareStatement(ls_sql);   
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>删除入库单失败！");
		return;
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("入库单删除成功！");
		window.opener.location.reload();
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>