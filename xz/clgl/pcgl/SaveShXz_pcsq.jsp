<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String clzt=null;
String qcph=null;
String pzr=null;
java.sql.Date pzsj=null;
String sjxm=null;
clzt=cf.GB2Uni(request.getParameter("clzt"));
qcph=cf.GB2Uni(request.getParameter("qcph"));
pzr=cf.GB2Uni(request.getParameter("pzr"));
ls=request.getParameter("pzsj");
try{
	if (!(ls.equals("")))  pzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɳ�ʱ��]����ת����������:"+e);
	return;
}
sjxm=cf.GB2Uni(request.getParameter("sjxm"));
String bz=cf.GB2Uni(request.getParameter("bz"));
int gls=0;
ls=request.getParameter("gls");
try{
	if (!(ls.equals("")))  gls=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����������������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}

String wheresqxh=null;
wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update xz_pcsq set clzt=?,qcph=?,pzr=?,pzsj=?,sjxm=?,bz=?,gls=? ";
	ls_sql+=" where  (sqxh="+wheresqxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,qcph);
	ps.setString(3,pzr);
	ps.setDate(4,pzsj);
	ps.setString(5,sjxm);
	ps.setString(6,bz);
	ps.setDouble(7,gls);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%
	
}
catch (Exception e) {
	out.print("����ʧ��,��������: " + ls_sql);
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