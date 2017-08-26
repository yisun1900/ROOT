<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date hfsj=null;
String dwbh=null;
String hfr=null;
String hfjl=null;
String jjyy=null;
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[回复时间]类型转换发生意外:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
hfr=cf.GB2Uni(request.getParameter("hfr"));
hfjl=cf.GB2Uni(request.getParameter("hfjl"));
jjyy=cf.GB2Uni(request.getParameter("jjyy"));
String wherekhbh=null;
String wheresgd=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;

String sfhs=null;
String ldspjl=null;
if (hfjl.equals("3"))//0：未回复；3拒绝派单；4接受派单
{
	sfhs="N";
	ldspjl="0";
}

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	ls_sql="update crm_khxx set pdclzt=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hfjl);
	ps.executeUpdate();
	ps.close();

	ls_sql="update pd_pdjl set hfsj=?,hfr=?,hfjl=?,jjyy=?,dwbh=?,sfhs=?,ldspjl=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,hfsj);
	ps.setString(2,hfr);
	ps.setString(3,hfjl);
	ps.setString(4,jjyy);
	ps.setString(5,dwbh);
	ps.setString(6,sfhs);
	ps.setString(7,ldspjl);
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