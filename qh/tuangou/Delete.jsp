<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>
<%

//从咨询客户中选取符合条件的记录
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	//清空团购管理表
	ls_sql="delete   from qh_tgglb";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
%>
	<SCRIPT language=javascript >
	<!--
	alert("清空团购历史数据成功！");
	window.close();
	//-->
	</SCRIPT>
<%

 }
catch (Exception e) {
	out.print("发生意外: " + e);
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

