<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bcpp=null;
String bclx=null;
long bchd=0;
double dj=0;
bcpp=cf.GB2Uni(request.getParameter("bcpp"));
bclx=cf.GB2Uni(request.getParameter("bclx"));
ls=request.getParameter("bchd");
try{
	if (!(ls.equals("")))  bchd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bchd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ĺ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
String wherebclx=null;
String wherebchd=null;
wherebclx=cf.GB2Uni(request.getParameter("wherebclx"));
wherebchd=cf.GB2Uni(request.getParameter("wherebchd"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_jjbjbj set bcpp=?,bclx=?,bchd=?,dj=? ";
	ls_sql+=" where  (bclx='"+wherebclx+"') and  (bchd="+wherebchd+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bcpp);
	ps.setString(2,bclx);
	ps.setLong(3,bchd);
	ps.setDouble(4,dj);
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