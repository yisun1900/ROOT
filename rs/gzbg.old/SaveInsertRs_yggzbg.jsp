<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
java.sql.Date sjqd=null;
java.sql.Date sjzd=null;
String xm=null;
String xzzwbm=null;
String ssfgs=null;
String dwbh=null;
String gzsm=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ygbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[Ա�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjqd");
try{
	if (!(ls.equals("")))  sjqd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjqd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzd");
try{
	if (!(ls.equals("")))  sjzd=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjzd������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ���յ�]����ת����������:"+e);
	return;
}
xm=cf.GB2Uni(request.getParameter("xm"));
xzzwbm=cf.GB2Uni(request.getParameter("xzzwbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
gzsm=cf.GB2Uni(request.getParameter("gzsm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_yggzbg ( ygbh,sjqd,sjzd,xm,xzzwbm,ssfgs,dwbh,gzsm,lrr,lrsj,zt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'1' ) ";//1��δ�ģ�2��������
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,ygbh);
	ps.setDate(2,sjqd);
	ps.setDate(3,sjzd);
	ps.setString(4,xm);
	ps.setString(5,xzzwbm);
	ps.setString(6,ssfgs);
	ps.setString(7,dwbh);
	ps.setString(8,gzsm);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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