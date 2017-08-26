<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xqbh=0;
String xqmc=null;
String ffdw=null;
String dwdz=null;
String dwdh=null;
String lxr=null;
String tglh=null;
long tgts=0;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("xqbh");
try{
	if (!(ls.equals("")))  xqbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xqbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[С�����]����ת����������:"+e);
	return;
}
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
ffdw=cf.GB2Uni(request.getParameter("ffdw"));
dwdz=cf.GB2Uni(request.getParameter("dwdz"));
dwdh=cf.GB2Uni(request.getParameter("dwdh"));
lxr=cf.GB2Uni(request.getParameter("lxr"));
tglh=cf.GB2Uni(request.getParameter("tglh"));
ls=request.getParameter("tgts");
try{
	if (!(ls.equals("")))  tgts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tgts������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ź�����]����ת����������:"+e);
	return;
}
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[lrsj]������");
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
	ls_sql="insert into yx_lptgqk ( xqbh,xqmc,ffdw,dwdz,dwdh,lxr,tglh,tgts,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xqbh);
	ps.setString(2,xqmc);
	ps.setString(3,ffdw);
	ps.setString(4,dwdz);
	ps.setString(5,dwdh);
	ps.setString(6,lxr);
	ps.setString(7,tglh);
	ps.setLong(8,tgts);
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