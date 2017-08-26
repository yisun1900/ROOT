<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String yjdz=null;
String yb=null;
String sjr=null;
String dh=null;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
yjdz=cf.GB2Uni(request.getParameter("yjdz"));
yb=cf.GB2Uni(request.getParameter("yb"));
sjr=cf.GB2Uni(request.getParameter("sjr"));
dh=cf.GB2Uni(request.getParameter("dh"));
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update crm_bdxx set yjdz=?,yb=?,sjr=?,dh=?,bz=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,yjdz);
	ps.setString(2,yb);
	ps.setString(3,sjr);
	ps.setString(4,dh);
	ps.setString(5,bz);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set fwdz='"+fwdz+"'";
	ls_sql+=" where  khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
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