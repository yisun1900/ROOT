<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date zzqrjdrq=null;
long zzqrjdsj=0;
String fbr=null;
java.sql.Date fbsj=null;
ls=request.getParameter("zzqrjdrq");
try{
	if (!(ls.equals("")))  zzqrjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zzqrjdrq]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ�Ͻ�������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzqrjdsj");
try{
	if (!(ls.equals("")))  zzqrjdsj=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zzqrjdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȷ�Ͻ���ʱ��]����ת����������:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fbsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[���׷���ʱ��]����ת����������:"+e);
	return;
}

String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql=" SELECT clzt";
	ls_sql+=" FROM crm_xcjdjl ";
    ls_sql+=" where jdjlh='"+jdjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("5"))//1�����룻2��ȷ�ϣ�3������ȷ�ϣ�4��������ɣ�5��������6���ѽ���
	{
		out.print("����δ����");
		return;
	}

	ls_sql="update crm_xcjdjl set zzqrjdrq=?,zzqrjdsj=?,fbr=?,fbsj=? ";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,zzqrjdrq);
	ps.setLong(2,zzqrjdsj);
	ps.setString(3,fbr);
	ps.setDate(4,fbsj);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>