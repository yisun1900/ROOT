<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String psdh=cf.GB2Uni(request.getParameter("psdh"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String clmc=cf.GB2Uni(request.getParameter("clmc"));
String clgg=cf.GB2Uni(request.getParameter("clgg"));
String lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
String lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
String cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
double pssl = 0;
double gdj = 0;
double psje = 0;
ls=request.getParameter("pssl");
try{
	if (!(ls.equals("")))  pssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pssl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����gdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���͵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("psje");
try{
	if (!(ls.equals("")))  psje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����psje������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ͽ��]����ת����������:"+e);
	return;
}


String ckmc=cf.GB2Uni(request.getParameter("ckmc"));
String sfrk=cf.GB2Uni(request.getParameter("sfrk"));
double cj = 0;
ls=request.getParameter("cj");
try{
	if (!(ls.equals("")))  cj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
double cjjsj = 0;
ls=request.getParameter("cjjsj");
try{
	if (!(ls.equals("")))  cjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cjjsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�볧�ҽ����]����ת����������:"+e);
	return;
}
double fgsdj = 0;
ls=request.getParameter("fgsdj");
try{
	if (!(ls.equals("")))  fgsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fgsdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ֹ�˾���ϵ���]����ת����������:"+e);
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



/********************************************************************************
|					��ѯ�����Ƿ񱻳���											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		out.print("�����������Ѿ����ڴ˲���!!!");
		return;
	}
	rs.close();
	ps.close();
/********************************************************************************
|					¼����Ϣ														|
********************************************************************************/
	
	conn.setAutoCommit(false);
	
	ls_sql="insert into cl_psdmx ( psdh,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,pssl,psje ) ";
	ls_sql+=" values ( '"+psdh+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"','"+lrjsfs+"',"+lrbfb+",'"+ckmc+"','"+sfrk+"',"+cj+","+cjjsj+","+fgsdj+","+gdj+","+pssl+","+psje+") ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_psd set pszsl=pszsl+'"+pssl+"',pszje=pszje+'"+psje+"' ";
	ls_sql+=" where  (psdh='"+psdh+"')  ";
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