<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String czxh=cf.GB2Uni(request.getParameter("czxh"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String clmc=cf.GB2Uni(request.getParameter("clmc"));
String clgg=cf.GB2Uni(request.getParameter("clgg"));
String cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
String ckmc=cf.GB2Uni(request.getParameter("ckmc"));
String sfrk=cf.GB2Uni(request.getParameter("sfrk"));

double sqlqsl = 0;
double cj = 0;
double cjjsj = 0;
double fgsdj = 0;
double gdj = 0;
double sqlqje = 0;

String sl=request.getParameter("sqlqsl");
try{
	if (!(sl.equals("")))  sqlqsl=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqlqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ȡ����]����ת����������:"+e);
	return;
}
sl=request.getParameter("cj");
try{
	if (!(sl.equals("")))  cj=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
sl=request.getParameter("cjjsj");
try{
	if (!(sl.equals("")))  cjjsj=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�볧�ҽ����]����ת����������:"+e);
	return;
}
sl=request.getParameter("fgsdj");
try{
	if (!(sl.equals("")))  fgsdj=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fgsdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ֹ�˾���ϵ���]����ת����������:"+e);
	return;
}
sl=request.getParameter("gdj");
try{
	if (!(sl.equals("")))  gdj=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ӽ�]����ת����������:"+e);
	return;
}
sl=request.getParameter("sqlqje");
try{
	if (!(sl.equals("")))  sqlqje=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqlqje������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ȡ���]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


/********************************************************************************
|					��ѯ�����Ƿ񱻳���											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_djjmx ";
    ls_sql+=" where czxh='"+czxh+"' and clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		out.print("�����������Ѿ����ڴ˲���!!!");
		return;
	}
	rs.close();
	ps.close();

	String khbh=null;
	ls_sql=" SELECT khbh ";
	ls_sql+=" FROM cl_djj ";
    ls_sql+=" where czxh='"+czxh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString(1);
	}
	rs.close();
	ps.close();


/********************************************************************************
|					¼����Ϣ														|
********************************************************************************/
	conn.setAutoCommit(false);

	ls_sql="insert into cl_djjmx ( czxh,clbm,clmc,clgg,cldlmc,jldwmc,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,sqlqsl,sqlqje,sjsl,sjje) ";
	ls_sql+=" values ( '"+czxh+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"','"+ckmc+"','"+sfrk+"',"+cj+","+cjjsj+","+fgsdj+","+gdj+","+sqlqsl+","+sqlqje+" ,"+sqlqsl+","+sqlqje+") ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_djj set sqlqsl=sqlqsl+'"+sqlqsl+"',sqlqje=sqlqje+'"+sqlqje+"',sjsl=sjsl+'"+sqlqsl+"',sjje=sjje+'"+sqlqje+"' ";
	ls_sql+=" where  czxh='"+czxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	double xjsqlqje=0;
	double xjsjje=0;

	ls_sql=" SELECT sum(cl_djjmx.sqlqje),sum(cl_djjmx.sjje) ";
	ls_sql+=" FROM cl_djjmx,cl_djj ";
    ls_sql+=" where cl_djjmx.czxh=cl_djj.czxh and cl_djj.khbh='"+khbh+"' and cl_djjmx.cldlmc='"+cldlmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjsqlqje=rs.getDouble(1);
		xjsjje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update cl_djjflmx set sqlqje="+xjsqlqje+",sjje="+xjsjje;
	ls_sql+=" where khbh='"+khbh+"' and cldlmc='"+cldlmc+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);

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