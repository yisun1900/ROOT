<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hflxbm=null;
String hflxmc=null;
String hfdl=null;
long sjjg=0;
hflxbm=cf.GB2Uni(request.getParameter("hflxbm"));
hflxmc=cf.GB2Uni(request.getParameter("hflxmc"));
hfdl=cf.GB2Uni(request.getParameter("hfdl"));
ls=request.getParameter("sjjg");
try{
	if (!(ls.equals("")))  sjjg=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ط�ʱ����]����ת����������:"+e);
	return;
}
String sfzdsz=cf.GB2Uni(request.getParameter("sfzdsz"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_hflxbm ( hflxbm,hflxmc,hfdl,sjjg,sfzdsz ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hflxbm);
	ps.setString(2,hflxmc);
	ps.setString(3,hfdl);
	ps.setLong(4,sjjg);
	ps.setString(5,sfzdsz);
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
	out.print("����ʧ��,��������: " + e);
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