<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xh=0;
String ssfgs=null;
double jxfzxx=0;
double jxfzsx=0;
double jxgzbl=0;
ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[xh]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
ls=request.getParameter("jxfzxx");
try{
	if (!(ls.equals("")))  jxfzxx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxfzxx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч��ֵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jxfzsx");
try{
	if (!(ls.equals("")))  jxfzsx=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxfzsx]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч��ֵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jxgzbl");
try{
	if (!(ls.equals("")))  jxgzbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jxgzbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ч���ʱ���]����ת����������:"+e);
	return;
}
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update rs_jxgzjsfs set xh=?,ssfgs=?,jxfzxx=?,jxfzsx=?,jxgzbl=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xh);
	ps.setString(2,ssfgs);
	ps.setDouble(3,jxfzxx);
	ps.setDouble(4,jxfzsx);
	ps.setDouble(5,jxgzbl);
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