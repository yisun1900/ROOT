<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String ssbm=null;
String ckph=null;
String bz=null;
String lsph=null;
int csph=0;
double yf=0;
double qtsf=0;

String khbh=null;
String psfs=null;
java.sql.Date jhshsj=null;
double fkje=0;
ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˷�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qtsf");
try{
	if (!(ls.equals("")))  qtsf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtsf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ��ͻ�ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fkje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
	return;
}
khbh=cf.GB2Uni(request.getParameter("khbh"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ssbm=cf.GB2Uni(request.getParameter("ssbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

java.sql.Date lrrq=null;
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}


String psph=request.getParameter("psph");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt="0";

	ls_sql="insert into jxc_clpsd ( psph,psdzt,khbh,yf,qtsf,fkje,psfs,jhshsj,lrr,lrrq,ssbm,bz,pszsl,pszje,cbze ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,0,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,psph);
	ps.setString(2,psdzt);
	ps.setString(3,khbh);
	ps.setDouble(4,yf);
	ps.setDouble(5,qtsf);
	ps.setDouble(6,fkje);
	ps.setString(7,psfs);
	ps.setDate(8,jhshsj);
	ps.setString(9,lrr);
	ps.setDate(10,lrrq);
	ps.setString(11,ssbm);
	ps.setString(12,bz);
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