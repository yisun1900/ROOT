<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String psdh=null;
String dwbh=null;
String psfs=null;
java.sql.Date jhshsj=null;
double fkje=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
psdh=cf.GB2Uni(request.getParameter("psdh"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
psfs=cf.GB2Uni(request.getParameter("psfs"));
ls=request.getParameter("jhshsj");
System.out.println(ls);
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
	System.out.println(jhshsj);
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
String lx=cf.GB2Uni(request.getParameter("lx"));
double yf=0;
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
double qtsf=0;
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pszt=null;
	ls_sql=" SELECT pszt ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
	}
	rs.close();
	ps.close();

	if (!pszt.equals("1"))//1��δ�ύ��2�����ύ��3��������
	{
		out.print("�������ύ���������޸�");
		return;
	}

	ls_sql="update cl_psd set dwbh=?,lrr=?,lrsj=?,bz=?,psfs=?,jhshsj=?,fkje=?,lx=?,yf=?,qtsf=?";
	ls_sql+=" where psdh='"+psdh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,bz);
	ps.setString(5,psfs);
	ps.setDate(6,jhshsj);
	ps.setDouble(7,fkje);
	ps.setString(8,lx);
	ps.setDouble(9,yf);
	ps.setDouble(10,qtsf);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>