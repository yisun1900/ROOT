<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ls=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double bj=0;
double cbenj=0;
double sgdbj=0;

//***********************************************************************************2006-3-31
double zcf=0;//A�����ķ�
double clf=0;
double rgf=0;//A���˹���
double jjf=0;//A����е��
double glfbl=0;//A������Ѱٷֱ�
String zcmc=null;//A����������
String zcgg=null;//A�����Ĺ��

zcmc=cf.GB2Uni(request.getParameter("zcmc"));
zcgg=cf.GB2Uni(request.getParameter("zcgg"));
ls=request.getParameter("zcf");
try{
	if (!(ls.equals("")))  zcf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����azcf������");
	return;
}
catch (Exception e){
	out.println("<BR>[zcf]����ת����������:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����aclf������");
	return;
}
catch (Exception e){
	out.println("<BR>[���Ϸ�]����ת����������:"+e);
	return;
}

ls=request.getParameter("rgf");
try{
	if (!(ls.equals("")))  rgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����argf������");
	return;
}
catch (Exception e){
	out.println("<BR>[rgf]����ת����������:"+e);
	return;
}
ls=request.getParameter("jjf");
try{
	if (!(ls.equals("")))  jjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ajjf������");
	return;
}
catch (Exception e){
	out.println("<BR>[jjf]����ת����������:"+e);
	return;
}

ls=request.getParameter("glfbl");
try{
	if (!(ls.equals("")))  glfbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����aglfbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[glfbl]����ת����������:"+e);
	return;
}



//**************888888888888888888888888888888888
int xh=0;
String gycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cbenj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ɱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("sgdbj");
try{
	if (!(ls.equals("")))  sgdbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sgdbj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʩ���ӱ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����bj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�����]����ת����������:"+e);
	return;
}


ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xh������");
	return;
}
catch (Exception e){
	out.println("<BR>[���]����ת����������:"+e);
	return;
}
gycl=cf.GB2Uni(request.getParameter("gycl"));
String sfxycl=request.getParameter("sfxycl");

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
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

String sfbxx=request.getParameter("sfbxx");


String wheredqbm=request.getParameter("wheredqbm");
String wherexmbh=request.getParameter("wherexmbh");
String wherebjjbbm=request.getParameter("wherebjjbbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	if (!wherexmbh.equals(xmbh) || !wherebjjbbm.equals(bjjbbm))
	{
		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_gzbjb";
		ls_sql+=" where xmbh='"+xmbh+"'  and dqbm='"+dqbm+"'  and bjjbbm='"+bjjbbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("����[��Ŀ���]�ڸñ��ۼ����Ѵ���");
			return;
		}
	}

	ls_sql="update bj_gzbjb set dqbm=?,xmbh=?,bjjbbm=?,xmmc=?,xmdlbm=?,xmxlbm=?,smbm=?,jldwbm=?,bj=?,gycl=?,xh=?,cbenj=?,sgdbj=?,clf=?,zcmc=?,zcgg=?,zcf=?,rgf=?,jjf=?,glfbl=?,sfxycl=?,lrr=?,lrsj=?,sfbxx=?";
	ls_sql+=" where  dqbm='"+wheredqbm+"' and xmbh='"+wherexmbh+"' and bjjbbm='"+wherebjjbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,bjjbbm);
	ps.setString(4,xmmc);
	ps.setString(5,xmdlbm);
	ps.setString(6,xmxlbm);
	ps.setString(7,smbm);
	ps.setString(8,jldwbm);
	ps.setDouble(9,bj);
	ps.setString(10,gycl);
	ps.setInt(11,xh);
	ps.setDouble(12,cbenj);
	ps.setDouble(13,sgdbj);
	ps.setDouble(14,clf);
	ps.setString(15,zcmc);
	ps.setString(16,zcgg);
	ps.setDouble(17,zcf);
	ps.setDouble(18,rgf);
	ps.setDouble(19,jjf);
	ps.setDouble(20,glfbl);
	ps.setString(21,sfxycl);
	ps.setString(22,lrr);
	ps.setDate(23,lrsj);
	ps.setString(24,sfbxx);
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
	out.print("Exception: " + e);
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