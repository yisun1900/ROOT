<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String tzyy=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;


String tzjlh=cf.GB2Uni(request.getParameter("tzjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
tzyy=cf.GB2Uni(request.getParameter("tzyy"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));

String zklx=cf.GB2Uni(request.getParameter("zklx"));




double bzjgzk=0;
ls=request.getParameter("bzjgzk");
try{
	if (!(ls.equals("")))  bzjgzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bzjgzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײͱ�׼�۸��ۿ�]����ת����������:"+e);
	return;
}

double mjzjzk=0;
ls=request.getParameter("mjzjzk");
try{
	if (!(ls.equals("")))  mjzjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mjzjzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ӽ���ۿ�]����ת����������:"+e);
	return;
}

double zcsjzk=0;
ls=request.getParameter("zcsjzk");
try{
	if (!(ls.equals("")))  zcsjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcsjzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������ۿ�]����ת����������:"+e);
	return;
}

double zcclzk=0;
ls=request.getParameter("zcclzk");
try{
	if (!(ls.equals("")))  zcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcclzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ĳ����Ӽ��ۿ�]����ת����������:"+e);
	return;
}

double zcsfzk=0;
ls=request.getParameter("zcsfzk");
try{
	if (!(ls.equals("")))  zcsfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcsfzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���շ������ۿ�]����ת����������:"+e);
	return;
}

double zcjmzk=0;
ls=request.getParameter("zcjmzk");
try{
	if (!(ls.equals("")))  zcjmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zcjmzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ļ����ۿ�]����ת����������:"+e);
	return;
}

double ddzccjzk=0;
ls=request.getParameter("ddzccjzk");
try{
	if (!(ls.equals("")))  ddzccjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ddzccjzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������ۿ�]����ת����������:"+e);
	return;
}

double ddzcclzk=0;
ls=request.getParameter("ddzcclzk");
try{
	if (!(ls.equals("")))  ddzcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ddzcclzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ�������ۿ�]����ת����������:"+e);
	return;
}

double tcwgczk=0;
ls=request.getParameter("tcwgczk");
try{
	if (!(ls.equals("")))  tcwgczk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tcwgczk������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ���ʩ�����ۿ�]����ת����������:"+e);
	return;
}

double tcgcclzk=0;
ls=request.getParameter("tcgcclzk");
try{
	if (!(ls.equals("")))  tcgcclzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tcgcclzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[���̳����Ӽ��ۿ�]����ת����������:"+e);
	return;
}



double glfzk=0;
ls=request.getParameter("glfzk");
try{
	if (!(ls.equals("")))  glfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����glfzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ۿ�]����ת����������:"+e);
	return;
}

double sjzk=0;
ls=request.getParameter("sjzk");
try{
	if (!(ls.equals("")))  sjzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰���ۿ�]����ת����������:"+e);
	return;
}
double sjfzk=0;
ls=request.getParameter("sjfzk");
try{
	if (!(ls.equals("")))  sjfzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjfzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ��ۿ�]����ת����������:"+e);
	return;
}
double qtsfxmzk=0;
ls=request.getParameter("qtsfxmzk");
try{
	if (!(ls.equals("")))  qtsfxmzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qtsfxmzk������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����շ���Ŀ�ۿ�]����ת����������:"+e);
	return;
}




double djjbfb=0;
ls=request.getParameter("djjbfb");
try{
	if (!(ls.equals("")))  djjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[djjbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȯ�ٷֱ�]����ת����������:"+e);
	return;
}
double djjje=0;
ls=request.getParameter("djjje");
try{
	if (!(ls.equals("")))  djjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����djjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ȯ���]����ת����������:"+e);
	return;
}

double hdzsjz=0;
ls=request.getParameter("hdzsjz");
try{
	if (!(ls.equals("")))  hdzsjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hdzsjz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����;�ֵ]����ת����������:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  crm_tzzkjl";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (clzt.equals("2") || clzt.equals("4") || clzt.equals("5"))//1��δ���ۿۣ�2��ֱ���޸��ۿ۳ɹ���3����������4������ͨ���Ѹ��ۿۣ�5������δͨ��
	{
		out.println("���󣡵����ۿ�����ɣ��������޸�");
		return;
	}

	conn.setAutoCommit(false);
	
	
	ls_sql="update crm_tzzkjl set zklx=?,glfzk=?,sjzk=?,sjfzk=?,qtsfxmzk=?,tzyy=?   ,lrr=?,lrsj=SYSDATE,lrbm=? ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zklx);
	ps.setDouble(2,glfzk);
	ps.setDouble(3,sjzk);
	ps.setDouble(4,sjfzk);
	ps.setDouble(5,qtsfxmzk);
	ps.setString(6,tzyy);

	ps.setString(7,lrr);
	ps.setString(8,lrbm);
	ps.executeUpdate();
	ps.close();

	//�ײ͵��ۿۼ�¼
	ls_sql="delete from crm_tctzk  ";
	ls_sql+=" where tzjlh='"+tzjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into crm_tctzk ( tzjlh,khbh,bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzjlh);
	ps.setString(2,khbh);
	ps.setDouble(3,bzjgzk);
	ps.setDouble(4,mjzjzk);
	ps.setDouble(5,zcsjzk);
	ps.setDouble(6,zcclzk);
	ps.setDouble(7,zcsfzk);
	ps.setDouble(8,zcjmzk);
	ps.setDouble(9,ddzccjzk);
	ps.setDouble(10,ddzcclzk);
	ps.setDouble(11,tcwgczk);
	ps.setDouble(12,tcgcclzk);

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
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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