<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long slqsl=0;
String blr=null;
java.sql.Date lqsj=null;
String bz=null;

ls=request.getParameter("slqsl");
try{
	if (!(ls.equals("")))  slqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����slqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ��ȡ����]����ת����������:"+e);
	return;
}
blr=cf.GB2Uni(request.getParameter("blr"));
ls=request.getParameter("lqsj");
try{
	if (!(ls.equals("")))  lqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lqsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

String wherexh=cf.GB2Uni(request.getParameter("wherexh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update oa_lqsq set lqzt=?,slqsl=?,blr=?,bz=?,lqsj=? ";
	ls_sql+=" where  xh="+wherexh;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"Y");
	ps.setLong(2,slqsl);
	ps.setString(3,blr);
	ps.setString(4,bz);
	ps.setDate(5,lqsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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
	out.print("Exception: " + e);
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