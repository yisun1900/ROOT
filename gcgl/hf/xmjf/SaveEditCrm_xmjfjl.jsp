<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jfjlh=null;
String khbh=null;
String xmjfr=null;
java.sql.Date xmjfsj=null;
String xmjfsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
jfjlh=cf.GB2Uni(request.getParameter("jfjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
xmjfr=cf.GB2Uni(request.getParameter("xmjfr"));
ls=request.getParameter("xmjfsj");
try{
	if (!(ls.equals("")))  xmjfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xmjfsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
xmjfsm=cf.GB2Uni(request.getParameter("xmjfsm"));
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
String wherejfjlh=null;
wherejfjlh=cf.GB2Uni(request.getParameter("wherejfjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getxmjfzt=null;
	ls_sql="select xmjfzt";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getxmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();

	//N��δ������S��������Y���طóɹ���X��ʧ��δ����T��ʧ���Ѵ���W����Ŀ����
	if (!getxmjfzt.equals("W"))
	{
		out.println("����״̬����ȷ");
		return;
	}
	
	
	ls_sql="update crm_xmjfjl set xmjfr=?,xmjfsj=?,xmjfsm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (jfjlh='"+wherejfjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xmjfr);
	ps.setDate(2,xmjfsj);
	ps.setString(3,xmjfsm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>