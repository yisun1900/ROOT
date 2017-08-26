<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xh=request.getParameterValues("xh");
if (xh==null)
{
	out.println("请选择");
	return;
}
Connection conn  = null;
PreparedStatement ps=null;

String ls_sql=null;
String ls=cf.arrayToStr(xh,",","");
try {
	conn=cf.getConnection();
	
	//插入订单汇总表
	ls_sql="delete from sq_xxzx  ";
	ls_sql+=" where xh in("+ls.substring(1)+")";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>