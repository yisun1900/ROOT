<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dxpjzbbm=null;
String pfbm=null;
String pfmc=null;
double df=0;
long xh=0;
dxpjzbbm=cf.GB2Uni(request.getParameter("dxpjzbbm"));
pfbm=cf.GB2Uni(request.getParameter("pfbm"));
pfmc=cf.GB2Uni(request.getParameter("pfmc"));
ls=request.getParameter("df");
try{
	if (!(ls.equals("")))  df=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[df]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�÷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xh������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into hdm_pjzbpf ( dxpjzbbm,pfbm,pfmc,df,xh ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dxpjzbbm);
	ps.setString(2,pfbm);
	ps.setString(3,pfmc);
	ps.setDouble(4,df);
	ps.setLong(5,xh);
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
	out.print("<BR>����ʧ��,��������: " + e);
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