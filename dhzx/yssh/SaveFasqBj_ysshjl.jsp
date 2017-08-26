<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xgfasqr=null;
java.sql.Date xgfasqsj=null;
String xgfasqsm=null;

xgfasqr=cf.GB2Uni(request.getParameter("xgfasqr"));
ls=request.getParameter("xgfasqsj");
try{
	if (!(ls.equals("")))  xgfasqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xgfasqsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改方案授权时间]类型转换发生意外:"+e);
	return;
}
xgfasqsm=cf.GB2Uni(request.getParameter("xgfasqsm"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ysshjl=cf.GB2Uni(request.getParameter("ysshjl"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	String ysshbz="S";//B：申请审核；C：受理申请；Y：审核通过；M：审核未通过；S：修改方案授权 

	ls_sql="update bj_ysshjl set ysshbz=?,xgfasqr=?,xgfasqsj=?,xgfasqsm=? ";
	ls_sql+=" where  ysshjl='"+ysshjl+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
	ps.setString(2,xgfasqr);
	ps.setDate(3,xgfasqsj);
	ps.setString(4,xgfasqsm);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_zxkhxx set ysshbz=?,ysshdf=0 ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysshbz);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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