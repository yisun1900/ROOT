<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tsjlh=null;
String kcjlh=null;
String xcqk=null;
String xcclqk=null;
String kcr=null;
java.sql.Date kcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
kcjlh=cf.GB2Uni(request.getParameter("kcjlh"));
xcqk=cf.GB2Uni(request.getParameter("xcqk"));
xcclqk=cf.GB2Uni(request.getParameter("xcclqk"));
kcr=cf.GB2Uni(request.getParameter("kcr"));
ls=request.getParameter("kcsj");
try{
	if (!(ls.equals("")))  kcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherekcjlh=null;
wherekcjlh=cf.GB2Uni(request.getParameter("wherekcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_tsbxxckcjl set tsjlh=?,kcjlh=?,xcqk=?,xcclqk=?,kcr=?,kcsj=?,lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (kcjlh='"+wherekcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsjlh);
	ps.setString(2,kcjlh);
	ps.setString(3,xcqk);
	ps.setString(4,xcclqk);
	ps.setString(5,kcr);
	ps.setDate(6,kcsj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,bz);
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