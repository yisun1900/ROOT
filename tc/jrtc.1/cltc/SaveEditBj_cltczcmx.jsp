<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpmc=null;
String dqbm=null;
String jgwzbm=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
double ydj=0;
double tcdj=0;
double sjzj=0;
double jsj=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("ydj");
try{
	if (!(ls.equals("")))  ydj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ydj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcdj");
try{
	if (!(ls.equals("")))  tcdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ͵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jsj");
try{
	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));

String wherecpbm=null;
wherecpbm=cf.GB2Uni(request.getParameter("wherecpbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update bj_cltczcmx set cpmc=?,jgwzbm=?,xh=?,gg=?,ppmc=?,gysmc=?,jldw=?,ydj=?,tcdj=?,sjzj=?,jsj=?,lrr=?,lrsj=?,bz=?,tcmc=? ";
	ls_sql+=" where  (cpbm='"+wherecpbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpmc);
	ps.setString(2,jgwzbm);
	ps.setString(3,xh);
	ps.setString(4,gg);
	ps.setString(5,ppmc);
	ps.setString(6,gysmc);
	ps.setString(7,jldw);
	ps.setDouble(8,ydj);
	ps.setDouble(9,tcdj);
	ps.setDouble(10,sjzj);
	ps.setDouble(11,jsj);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,bz);
	ps.setString(15,tcmc);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>����ʧ�ܣ�");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("���̳ɹ���");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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