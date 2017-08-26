<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String qcph=null;
String xm=null;
double fy=0;
java.sql.Date djrq=null;
String jsr=null;
String pzr=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
//******************************************
//�������
//******************************************
String ls_sql2=null;
int xh=0;
String xhs=null;

qcph=cf.GB2Uni(request.getParameter("qcph"));
xm=cf.GB2Uni(request.getParameter("xm"));
ls=request.getParameter("fy");
try{
	if (!(ls.equals("")))  fy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fy������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("djrq");
try{
	if (!(ls.equals("")))  djrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[���÷�������]����ת����������:"+e);
	return;
}
jsr=cf.GB2Uni(request.getParameter("jsr"));
pzr=cf.GB2Uni(request.getParameter("pzr"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
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
String fyfsbm=cf.GB2Uni(request.getParameter("fyfsbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long djxh=0;
	ls_sql="select NVL(max(djxh)+1,1)";
	ls_sql+=" from  xz_clwhfyb";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		djxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	ls_sql="insert into xz_clwhfyb ( djxh,qcph,xm,fy,djrq,jsr,pzr,bz,ssfgs,lrr,lrsj,fyfsbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,djxh);
	ps.setString(2,qcph);
	ps.setString(3,xm);
	ps.setDouble(4,fy);
	ps.setDate(5,djrq);
	ps.setString(6,jsr);
	ps.setString(7,pzr);
	ps.setString(8,bz);
	ps.setString(9,ssfgs);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);
	ps.setString(12,fyfsbm);
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
	out.print("����ʧ��,��������: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>