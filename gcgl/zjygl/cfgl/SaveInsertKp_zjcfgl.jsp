<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long cfjlh=0;
String zjxm=null;
String fgsbh=null;
String cfr=null;
java.sql.Date cfsj=null;
String cflxbm=null;
String cfyybm=null;
double fkze=0;
long kf=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrdw=null;
String bz=null;
ls=request.getParameter("cfjlh");
try{
	if (!(ls.equals("")))  cfjlh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cfjlh������");
	return;
}
catch (Exception e){
	out.println("<BR>[������¼��]����ת����������:"+e);
	return;
}
zjxm=cf.GB2Uni(request.getParameter("zjxm"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
cfr=cf.GB2Uni(request.getParameter("cfr"));
ls=request.getParameter("cfsj");
try{
	if (!(ls.equals("")))  cfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cfsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}
cflxbm=cf.GB2Uni(request.getParameter("cflxbm"));
cfyybm=cf.GB2Uni(request.getParameter("cfyybm"));
ls=request.getParameter("fkze");
try{
	if (!(ls.equals("")))  fkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkze������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷�]����ת����������:"+e);
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
lrdw=cf.GB2Uni(request.getParameter("lrdw"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_zjcfgl ( cfjlh,zjxm,fgsbh,cfr,cfsj,cflxbm,cfyybm,fkze,kf,lrr,lrsj,lrdw,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,cfjlh);
	ps.setString(2,zjxm);
	ps.setString(3,fgsbh);
	ps.setString(4,cfr);
	ps.setDate(5,cfsj);
	ps.setString(6,cflxbm);
	ps.setString(7,cfyybm);
	ps.setDouble(8,fkze);
	ps.setLong(9,kf);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,lrdw);
	ps.setString(13,bz);
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