<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtr=null;
java.sql.Date gtsj=null;
String qksm=null;
String sfxcl=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
gtr=cf.GB2Uni(request.getParameter("gtr"));
ls=request.getParameter("gtsj");
try{
	if (!(ls.equals("")))  gtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[gtsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͨʱ��]����ת����������:"+e);
	return;
}
qksm=cf.GB2Uni(request.getParameter("qksm"));
sfxcl=cf.GB2Uni(request.getParameter("sfxcl"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String wheredjbh=null;
wheredjbh=cf.GB2Uni(request.getParameter("wheredjbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khgtjl set gtr=?,gtsj=?,qksm=?,sfxcl=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (djbh='"+wheredjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtr);
	ps.setDate(2,gtsj);
	ps.setString(3,qksm);
	ps.setString(4,sfxcl);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
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