<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String htbz=cf.GB2Uni(request.getParameter("htbz"));
String qhtr=cf.GB2Uni(request.getParameter("qhtr"));
java.sql.Date qhtsj=null;
java.sql.Date kjxsj=null;
java.sql.Date jhazrq=null;
ls=request.getParameter("jhazrq");
try{
	if (!(ls.equals("")))  jhazrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhazrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("qhtsj");
try{
	if (!(ls.equals("")))  qhtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qhtsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ǩ��ͬʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("kjxsj");
try{
	if (!(ls.equals("")))  kjxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kjxsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɼ����ֹʱ��]����ת����������:"+e);
	return;
}

double jjje=0;
double xcmje=0;
double cpjjje=0;
ls=request.getParameter("jjje");
try{
	if (!(ls.equals("")))  jjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ҿߺ�ͬ���ۺ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("xcmje");
try{
	if (!(ls.equals("")))  xcmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xcmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ͳ��ź�ͬ���ۺ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("cpjjje");
try{
	if (!(ls.equals("")))  cpjjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cpjjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�Ҿߺ�ͬ���-�ۺ�]����ת����������:"+e);
	return;
}

double htze=0;
ls=request.getParameter("htze");
try{
	if (!(ls.equals("")))  htze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ܶ�]����ת����������:"+e);
	return;
}

double zqjjje=0;
double zqxcmje=0;
double zqcpjjje=0;
ls=request.getParameter("zqjjje");
try{
	if (!(ls.equals("")))  zqjjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqjjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ҿߺ�ͬ����ǰ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqxcmje");
try{
	if (!(ls.equals("")))  zqxcmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqxcmje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Ͳ��ź�ͬ����ǰ]����ת����������:"+e);
	return;
}
ls=request.getParameter("zqcpjjje");
try{
	if (!(ls.equals("")))  zqcpjjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zqcpjjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[��Ʒ�Ҿߺ�ͬ���-��ǰ]����ת����������:"+e);
	return;
}
double wdzje=0;
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����wdzje������");
	return;
}
catch (Exception e){
	out.println("<BR>[δ���۽��]����ת����������:"+e);
	return;
}

double jjzkl=0;
ls=request.getParameter("jjzkl");
try{
	if (!(ls.equals("")))  jjzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jjzkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String ddbh=request.getParameter("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;
String sfpsjs=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt,sfpsjs";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		sfpsjs=rs.getString("sfpsjs");
	}
	rs.close();
	ps.close();

	if (sfpsjs.equals("1"))//1���ǣ�2����
	{
		if (!clzt.equals("07"))
		{
			out.println("�����󣬴���״̬����ȷ");
			return;
		}
	}
	else{
		if (!clzt.equals("01"))
		{
			out.println("�����󣬴���״̬����ȷ");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set qhtsj=?,jhazrq=?,kjxsj=?,qhtr=?,htbz=?,jjzkl=?,dzyy=?,lsclzt1=?,clzt='13'";
	ls_sql+=" ,wdzje=?,zqjjje=?,zqxcmje=?,zqcpjjje=?           ,htze=?,jjje=?,xcmje=?,cpjjje=? ";
	ls_sql+=" ,zqzjhze=?,zqjjzjje=?,zqxcmzjje=?,zqcpjjzjje=?   ,zjhze=?,jjzjje=?,xcmzjje=?,cpjjzjje=?";
	ls_sql+=" where  ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qhtsj);
	ps.setDate(2,jhazrq);
	ps.setDate(3,kjxsj);
	ps.setString(4,qhtr);
	ps.setString(5,htbz);
	ps.setDouble(6,jjzkl);
	ps.setString(7,dzyy);
	ps.setString(8,clzt);

	ps.setDouble(9,wdzje);
	ps.setDouble(10,zqjjje);
	ps.setDouble(11,zqxcmje);
	ps.setDouble(12,zqcpjjje);
	ps.setDouble(13,htze);
	ps.setDouble(14,jjje);
	ps.setDouble(15,xcmje);
	ps.setDouble(16,cpjjje);

	ps.setDouble(17,wdzje);
	ps.setDouble(18,zqjjje);
	ps.setDouble(19,zqxcmje);
	ps.setDouble(20,zqcpjjje);
	ps.setDouble(21,htze);
	ps.setDouble(22,jjje);
	ps.setDouble(23,xcmje);
	ps.setDouble(24,cpjjje);
	ps.executeUpdate();
	ps.close();

	//���ɶ���
	ls_sql="insert into jc_jcdd (gjz,lx,czlx,ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs ,zcdlbm,zcxlbm,pdgc,pdgcmc,gys,ppmc     ,pdgc1,pdgcmc1,gys1,ppmc1      ,zqje ,zhje,cbje,fssj)";
	ls_sql+=" select ddbh,'3','1',ddbh,khbh,fgsbh,qddm,khjl,jzsjs,clgw,ztjjgw,xmzy,jjsjs            ,'',''        ,pdgc,pdgcmc,jjgys,jjppmc ,xcmgc,xcmgcmc,xcmgys,xcmppmc  ,wdzje,htze,cbze,qhtsj";
	ls_sql+=" from jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
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