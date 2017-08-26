<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
String nian=null;
String yue=null;
double khcz=0;
double mbcz=0;
String lrr=null;
java.sql.Date lrsj=null;
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
nian=cf.GB2Uni(request.getParameter("nian"));
yue=cf.GB2Uni(request.getParameter("yue"));
ls=request.getParameter("khcz");
try{
	if (!(ls.equals("")))  khcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[���˲�ֵ]����ת����������:"+e);
	return;
}
ls=request.getParameter("mbcz");
try{
	if (!(ls.equals("")))  mbcz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mbcz������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ŀ���ֵ]����ת����������:"+e);
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
String wheredwbh=null;
String wherenian=null;
String whereyue=null;
wheredwbh=cf.GB2Uni(request.getParameter("wheredwbh"));
wherenian=cf.GB2Uni(request.getParameter("wherenian"));
whereyue=cf.GB2Uni(request.getParameter("whereyue"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_dmkhcz set dwbh=?,nian=?,yue=?,khcz=?,mbcz=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (dwbh='"+wheredwbh+"') and  (nian='"+wherenian+"') and  (yue='"+whereyue+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,nian);
	ps.setString(3,yue);
	ps.setDouble(4,khcz);
	ps.setDouble(5,mbcz);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
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