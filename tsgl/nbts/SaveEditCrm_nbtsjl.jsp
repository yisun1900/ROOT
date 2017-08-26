<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long tsjlh=0;
String btsr=null;
String tsnr=null;
String tsr=null;
java.sql.Date tssj=null;
String slr=null;
java.sql.Date slsj=null;
String slbm=null;
ls=request.getParameter("tsjlh");
try{
	if (!(ls.equals("")))  tsjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tsjlh������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ͷ�߼�¼��]����ת����������:"+e);
	return;
}
btsr=cf.GB2Uni(request.getParameter("btsr"));
tsnr=cf.GB2Uni(request.getParameter("tsnr"));
tsr=cf.GB2Uni(request.getParameter("tsr"));
ls=request.getParameter("tssj");
try{
	if (!(ls.equals("")))  tssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ͷ��ʱ��]����ת����������:"+e);
	return;
}
slr=cf.GB2Uni(request.getParameter("slr"));
ls=request.getParameter("slsj");
try{
	if (!(ls.equals("")))  slsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����slsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
slbm=cf.GB2Uni(request.getParameter("slbm"));
String btsfgs=cf.GB2Uni(request.getParameter("btsfgs"));
String btsbm=cf.GB2Uni(request.getParameter("btsbm"));
String slfgs=cf.GB2Uni(request.getParameter("slfgs"));


String wheretsjlh=null;
wheretsjlh=cf.GB2Uni(request.getParameter("wheretsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_nbtsjl set tsjlh=?,btsr=?,tsnr=?,tsr=?,tssj=?,slr=?,slsj=?,slbm=?,btsfgs=?,btsbm=?,slfgs=?";
	ls_sql+=" where  (tsjlh="+wheretsjlh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,tsjlh);
	ps.setString(2,btsr);
	ps.setString(3,tsnr);
	ps.setString(4,tsr);
	ps.setDate(5,tssj);
	ps.setString(6,slr);
	ps.setDate(7,slsj);
	ps.setString(8,slbm);
	ps.setString(9,btsfgs);
	ps.setString(10,btsbm);
	ps.setString(11,slfgs);
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