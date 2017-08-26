<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long zprs=0;
double zpfy=0;
String fgs=null;
String ztbm=null;
java.sql.Date jhkssj=null;
java.sql.Date jhjssj=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("zprs");
try{
	if (!(ls.equals("")))  zprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zprs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ƹ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("zpfy");
try{
	if (!(ls.equals("")))  zpfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zpfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ƹ����]����ת����������:"+e);
	return;
}
String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
String ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));//¼���˷ֹ�˾
fgs=cf.GB2Uni(request.getParameter("fgs"));//ѡ�����Ƹ��λ
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
ls=request.getParameter("jhkssj");
try{
	if (!(ls.equals("")))  jhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhjssj");
try{
	if (!(ls.equals("")))  jhjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
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
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into rs_zpjh ( zprs,zpfy,fgs,ztbm,jhkssj,jhjssj,lrr,lrsj,bz,zpjhbh,jhzt,shjl,ssfgs ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,'0','x',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,zprs);
	ps.setDouble(2,zpfy);
	ps.setString(3,fgs);
	ps.setString(4,ztbm);
	ps.setDate(5,jhkssj);
	ps.setDate(6,jhjssj);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,bz);
	ps.setString(10,zpjhbh);
	ps.setString(11,ssfgs);
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