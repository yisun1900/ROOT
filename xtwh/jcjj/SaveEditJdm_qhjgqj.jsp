<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qhjgqjbm=null;
String qhjgqj=null;
long qshd=0;
long zzhd=0;
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
qhjgqj=cf.GB2Uni(request.getParameter("qhjgqj"));
String mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
ls=request.getParameter("qshd");
try{
	if (!(ls.equals("")))  qshd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qshd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zzhd");
try{
	if (!(ls.equals("")))  zzhd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zzhd������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֹ���]����ת����������:"+e);
	return;
}
String whereqhjgqjbm=null;
whereqhjgqjbm=cf.GB2Uni(request.getParameter("whereqhjgqjbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jdm_qhjgqj set qhjgqjbm=?,qhjgqj=?,qshd=?,zzhd=?,mmdglxbm=? ";
	ls_sql+=" where  (qhjgqjbm='"+whereqhjgqjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qhjgqjbm);
	ps.setString(2,qhjgqj);
	ps.setLong(3,qshd);
	ps.setLong(4,zzhd);
	ps.setString(5,mmdglxbm);
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