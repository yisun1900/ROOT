<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpjhbh=cf.GB2Uni(request.getParameter("wherezpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int all=0;
String ls=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM rs_zpjhmx ";
	ls_sql+=" where zpjhbh='"+zpjhbh+"'" ;
	ls=cf.executeQuery(ls_sql);
	all=Integer.parseInt(ls);
	if (all==0)
	{
		out.println("操作失误！没有录入明细！请录入明细后再单击完成按钮。");
		return;
	}

	ls_sql="update rs_zpjh set jhzt='1' ";
	ls_sql+=" where  (zpjhbh='"+zpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
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