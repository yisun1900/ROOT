<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zsqxflbm=null;
String zsqxflmc=null;
long qsz=0;
long zzz=0;
zsqxflbm=cf.GB2Uni(request.getParameter("zsqxflbm"));
zsqxflmc=cf.GB2Uni(request.getParameter("zsqxflmc"));
ls=request.getParameter("qsz");
try{
	if (!(ls.equals("")))  qsz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qsz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼֵ���£�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzz");
try{
	if (!(ls.equals("")))  zzz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֵֹ���£�]����ת����������:"+e);
	return;
}
String wherezsqxflbm=null;
wherezsqxflbm=cf.GB2Uni(request.getParameter("wherezsqxflbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_zsqxflbm set zsqxflbm=?,zsqxflmc=?,qsz=?,zzz=? ";
	ls_sql+=" where  (zsqxflbm='"+wherezsqxflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zsqxflbm);
	ps.setString(2,zsqxflmc);
	ps.setLong(3,qsz);
	ps.setLong(4,zzz);
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