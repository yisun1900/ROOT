<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cpmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String gysmc=null;
String jldw=null;
double ydj=0;
double tcdj=0;
double sjzj=0;
double jsj=0;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
cpmc=cf.GB2Uni(request.getParameter("cpmc"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
gysmc=cf.GB2Uni(request.getParameter("gysmc"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("ydj");
try{
	if (!(ls.equals("")))  ydj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ydj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ԭ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("tcdj");
try{
	if (!(ls.equals("")))  tcdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tcdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ײ͵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjzj");
try{
	if (!(ls.equals("")))  sjzj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjzj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۼ�]����ת����������:"+e);
	return;
}
//ls=request.getParameter("jsj");
//try{
//	if (!(ls.equals("")))  jsj=Double.parseDouble(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>����[jsj]������");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[�����]����ת����������:"+e);
//	return;
//}
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
bz=cf.GB2Uni(request.getParameter("bz"));
String jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
String tcmc=cf.GB2Uni(request.getParameter("tcmc"));

String dqbm=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));

String lx=cf.GB2Uni(request.getParameter("lx"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");

double sl=0;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N��δ��ɣ�Y�����
	{
		out.println("��������������ɣ��������޸�");
		return;
	}
	
	//���ɲ��ϱ���
	String cpbm=null;
	int count=0;
	ls_sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	ls_sql+=" from  bj_khcltcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	count++;

	cpbm="SD"+cf.addZero(count,11);
	

	ls_sql="insert into bj_khcltcmxh (zjxxh,khbh,cpbm,cpmc,dqbm,tcmc,jgwzbm,xh,gg,ppmc  ,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,fjddbh,lrr,lrsj   ,lx,bz,sfbpx)  ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?  ,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setString(3,cpbm);
	ps.setString(4,cpmc);
	ps.setString(5,dqbm);
	ps.setString(6,tcmc);
	ps.setString(7,jgwzbm);
	ps.setString(8,xh);
	ps.setString(9,gg);
	ps.setString(10,ppmc);

	ps.setString(11,gysmc);
	ps.setString(12,jldw);

	ps.setDouble(13,ydj);
	ps.setDouble(14,tcdj);
	ps.setDouble(15,sjzj);
	ps.setDouble(16,jsj);
	ps.setDouble(17,sl);
	ps.setString(18,"");
	ps.setString(19,lrr);
	ps.setDate(20,lrsj);

	ps.setString(21,lx);
	ps.setString(22,bz);
	ps.setString(23,"N");
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