<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
String bzmc=null;
String xm=null;
String xb=null;
String jg=null;
java.sql.Date csrq=null;
String gz=null;
java.sql.Date rzsj=null;
String dj=null;
String lx=null;
String sfzh=null;
String zz=null;
String dh=null;
String pxsm=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
bzmc=cf.GB2Uni(request.getParameter("bzmc"));
xm=cf.GB2Uni(request.getParameter("xm"));
xb=cf.GB2Uni(request.getParameter("xb"));
jg=cf.GB2Uni(request.getParameter("jg"));
ls=request.getParameter("csrq");
try{
	if (!(ls.equals("")))  csrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出生日期]类型转换发生意外:"+e);
	return;
}
gz=cf.GB2Uni(request.getParameter("gz"));
ls=request.getParameter("rzsj");
try{
	if (!(ls.equals("")))  rzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入职时间]类型转换发生意外:"+e);
	return;
}
dj=cf.GB2Uni(request.getParameter("dj"));
lx=cf.GB2Uni(request.getParameter("lx"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
zz=cf.GB2Uni(request.getParameter("zz"));
dh=cf.GB2Uni(request.getParameter("dh"));
pxsm=cf.GB2Uni(request.getParameter("pxsm"));
String jjlxr=cf.GB2Uni(request.getParameter("jjlxr"));
String jjlxrdh=cf.GB2Uni(request.getParameter("jjlxrdh"));
String jjlxrdz=cf.GB2Uni(request.getParameter("jjlxrdz"));
String sgzbh=cf.GB2Uni(request.getParameter("sgzbh"));
String wheresgd=null;
String wherebzmc=null;
String wherexm=null;
wheresgd=cf.GB2Uni(request.getParameter("wheresgd"));
wherebzmc=cf.GB2Uni(request.getParameter("wherebzmc"));
wherexm=cf.GB2Uni(request.getParameter("wherexm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update sq_grdjb set sgd=?,bzmc=?,xm=?,xb=?,jg=?,csrq=?,gz=?,rzsj=?,dj=?,lx=?,sfzh=?,zz=?,dh=?,pxsm=?,jjlxr=?,jjlxrdh=?,jjlxrdz=?,sgzbh=? ";
	ls_sql+=" where  (sgd='"+wheresgd+"') and  (bzmc='"+wherebzmc+"') and  (xm='"+wherexm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sgd);
	ps.setString(2,bzmc);
	ps.setString(3,xm);
	ps.setString(4,xb);
	ps.setString(5,jg);
	ps.setDate(6,csrq);
	ps.setString(7,gz);
	ps.setDate(8,rzsj);
	ps.setString(9,dj);
	ps.setString(10,lx);
	ps.setString(11,sfzh);
	ps.setString(12,zz);
	ps.setString(13,dh);
	ps.setString(14,pxsm);
	ps.setString(15,jjlxr);
	ps.setString(16,jjlxrdh);
	ps.setString(17,jjlxrdz);
	ps.setString(18,sgzbh);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_bzxx set grsl=(select count(*) from sq_grdjb where sq_grdjb.sgd=sq_bzxx.sgd and sq_grdjb.bzmc=sq_bzxx.bzmc) ";
	ls_sql+=" where  (sgd='"+wheresgd+"') and  (bzmc='"+wherebzmc+"')   ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update sq_bzxx set kygrsl=grsl-yygrsl ";
	ls_sql+=" where  (sgd='"+wheresgd+"') and  (bzmc='"+wherebzmc+"')   ";
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