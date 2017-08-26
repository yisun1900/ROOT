<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qcdm=null;
String qcph=null;
String sjxm=null;
String ssfgs=null;
String qcxh=null;
String bz=null;
double yxsgls=0;
java.sql.Date gcsj=null;
ls=request.getParameter("gcsj");
try{
	if (!(ls.equals("")))  gcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yxsgls");
try{
	if (!(ls.equals("")))  yxsgls=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yxsgls������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʹ������]����ת����������:"+e);
	return;
}
qcxh=cf.GB2Uni(request.getParameter("qcxh"));
bz=cf.GB2Uni(request.getParameter("bz"));

qcdm=cf.GB2Uni(request.getParameter("qcdm"));
qcph=cf.GB2Uni(request.getParameter("qcph"));
sjxm=cf.GB2Uni(request.getParameter("sjxm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String whereqcdm=null;
whereqcdm=cf.GB2Uni(request.getParameter("whereqcdm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_qcdm set qcdm=?,qcph=?,sjxm=?,ssfgs=?,qcxh=?,gcsj=?,yxsgls=?,bz=? ";
	ls_sql+=" where  (qcdm='"+whereqcdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,qcdm);
	ps.setString(2,qcph);
	ps.setString(3,sjxm);
	ps.setString(4,ssfgs);
	ps.setString(5,qcxh);
	ps.setDate(6,gcsj);
	ps.setDouble(7,yxsgls);
	ps.setString(8,bz);
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