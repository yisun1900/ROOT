<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date jjfazdsj=null;
String jjfazdr=null;
String jjfa=null;

ls=request.getParameter("jjfazdsj");
try{
	if (!(ls.equals("")))  jjfazdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jjfazdsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ƶ�ʱ��]����ת����������:"+e);
	return;
}
jjfazdr=cf.GB2Uni(request.getParameter("jjfazdr"));
jjfa=cf.GB2Uni(request.getParameter("jjfa"));

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("1"))//1��¼�룻2���ƶ�������3��������ˣ�4���Ѵ���
	{
		out.println("����״̬����ȷ���������޸�");
		return;
	}

	ls_sql="update crm_xmycgl set zt='2',jjfazdsj=?,jjfazdr=?,jjfa=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jjfazdsj);
	ps.setString(2,jjfazdr);
	ps.setString(3,jjfa);
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