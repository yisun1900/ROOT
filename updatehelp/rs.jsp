<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="alter table rs_yhlzjl add (lzyyflbm char(2) null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_yhlzjl set lzyyflbm='00'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="alter table rs_yhlzjl modify (lzyyflbm char(2) not null)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
//	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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