<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kpkfbm=null;
String kpkfmc=null;
long kfs=0;
String pfxmbm=null;
String kflx=null;
kpkfbm=cf.GB2Uni(request.getParameter("kpkfbm"));
kpkfmc=cf.GB2Uni(request.getParameter("kpkfmc"));
ls=request.getParameter("kfs");
try{
	if (!(ls.equals("")))  kfs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kfs������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷���]����ת����������:"+e);
	return;
}
pfxmbm=cf.GB2Uni(request.getParameter("pfxmbm"));
kflx=cf.GB2Uni(request.getParameter("kflx"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_kpkfbm ( kpkfbm,kpkfmc,kfs,pfxmbm,kflx ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpkfbm);
	ps.setString(2,kpkfmc);
	ps.setLong(3,kfs);
	ps.setString(4,pfxmbm);
	ps.setString(5,kflx);
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