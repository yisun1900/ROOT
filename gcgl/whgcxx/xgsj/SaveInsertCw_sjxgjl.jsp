<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xgjlh=null;
String khbh=null;
String khxm=null;
String fgsbh=null;
double wdzgce=0;
double qye=0;
double guanlif=0;
double xgqsuijinbfb=0;
double xghsuijinbfb=0;
double xgqsuijin=0;
double xghsuijin=0;
double sjjmje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
xgjlh=cf.GB2Uni(request.getParameter("xgjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
khxm=cf.GB2Uni(request.getParameter("khxm"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
ls=request.getParameter("wdzgce");
try{
	if (!(ls.equals("")))  wdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzgce������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("qye");
try{
	if (!(ls.equals("")))  qye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qye������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩԼ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("guanlif");
try{
	if (!(ls.equals("")))  guanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����guanlif������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ۺ�����]����ת����������:"+e);
	return;
}
ls=request.getParameter("xgqsuijinbfb");
try{
	if (!(ls.equals("")))  xgqsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xgqsuijinbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸�ǰ˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xghsuijinbfb");
try{
	if (!(ls.equals("")))  xghsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xghsuijinbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸ĺ�˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xgqsuijin");
try{
	if (!(ls.equals("")))  xgqsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xgqsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸�ǰ˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("xghsuijin");
try{
	if (!(ls.equals("")))  xghsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xghsuijin������");
	return;
}
catch (Exception e){
	out.println("<BR>[�޸ĺ�˰��]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjjmje");
try{
	if (!(ls.equals("")))  sjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sjjmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[˰������]����ת����������:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	ls_sql="insert into cw_sjxgjl ( xgjlh,khbh,khxm,fgsbh,wdzgce,qye,guanlif,xgqsuijinbfb,xghsuijinbfb,xgqsuijin,xghsuijin,lrr,lrsj,lrbm,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,khxm);
	ps.setString(4,fgsbh);
	ps.setDouble(5,wdzgce);
	ps.setDouble(6,qye);
	ps.setDouble(7,guanlif);
	ps.setDouble(8,xgqsuijinbfb);
	ps.setDouble(9,xghsuijinbfb);
	ps.setDouble(10,xgqsuijin);
	ps.setDouble(11,xghsuijin);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,lrbm);
	ps.setString(15,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update bj_sfxmmx set sfbfb=?,dj=?,zqsfje=?,sfje=? ";
	ls_sql+=" where khbh='"+khbh+"' and sflx='3'";//3:˰��
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghsuijinbfb);
	ps.setDouble(2,xghsuijin);
	ps.setDouble(3,xghsuijin);
	ps.setDouble(4,xghsuijin);
	ps.executeUpdate();
	ps.close();


	//�޸�������
	ls_sql=" update crm_zjxdj set zjxsuijin=(jzjje+zhguanlif)/100*"+xghsuijinbfb;
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	double allzjxsuijin=0;

	ls_sql="select sum(zjxsuijin)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxsuijin=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql=" update crm_khxx set suijinbfb=?,suijin=?,zjxsuijin=?,sjjmje=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghsuijinbfb);
	ps.setDouble(2,xghsuijin);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,sjjmje);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set suijinbfb=?,suijin=?,zjxsuijin=?,sjjmje=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghsuijinbfb);
	ps.setDouble(2,xghsuijin);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,sjjmje);
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
	out.print("<BR>����ʧ��,��������: " + e);
	out.print("<BR>SQL=" + ls_sql);
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