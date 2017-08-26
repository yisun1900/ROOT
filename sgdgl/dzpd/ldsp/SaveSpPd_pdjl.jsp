<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ldspjl=cf.GB2Uni(request.getParameter("ldspjl"));
String ldspyj=cf.GB2Uni(request.getParameter("ldspyj"));
String wherekhbh=null;
String wheresgd=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

String pdclzt=null;
if (ldspjl.equals("Y"))
{
	pdclzt="6";
}
else if (ldspjl.equals("N")){
	pdclzt="5";
}
else{
	out.println("错误！领导审批结论不正确");
	return;
}

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set pdclzt=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,pdclzt);
	ps.executeUpdate();
	ps.close();

	ls_sql="update pd_pdjl set ldspjl=?,ldspyj=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"') and sfhs='Y' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ldspjl);
	ps.setString(2,ldspyj);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>