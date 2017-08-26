<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double rkzsl = 0;
double rkzje = 0;
try {
	conn=cf.getConnection();

	ls_sql=" SELECT sum(rksl),sum(rkje) FROM cl_rkmx where (rkph='"+rkph+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		rkzsl = rs.getDouble(1);
		rkzje = rs.getDouble(2);
	}
	rs.close();
	ps.close();

	if (rkzsl==0)
	{
		out.print("入库的总数量不能为零！");
		return;
	}
	if (rkzje==0)
	{
		out.print("入库的总金额不能为零！");
		return;
	}
	ls_sql="update cl_rkd set rkzt='2',rkzsl='"+rkzsl+"',rkzje='"+rkzje+"' ";
	ls_sql+=" where  (rkph='"+rkph+"')  ";
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
		alert("入库单提交成功！");
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
		if (rs!= null) rs.close();
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>