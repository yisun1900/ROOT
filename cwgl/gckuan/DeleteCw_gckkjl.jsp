<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String wherekkjlh=null;
String[] kkjlh=request.getParameterValues("kkjlh");
if (kkjlh.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="delete from  cw_gckkjl";   
	ls_sql+=" where  (kkjlh='"+kkjlh[0]+"' and cw_gckkjl.spbz in('2','4') and jsbz='N')  ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>删除失败！");
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
	out.print("Exception: " + e);
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