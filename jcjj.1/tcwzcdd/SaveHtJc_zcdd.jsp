<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=null;
String khbh=null;
String clgw=null;
String ddshbz=null;
double hkze=0;
double wdzje=0;
double htcxhdje=0;
java.sql.Date jhtzshsj=null;
java.sql.Date kjxsj=null;
java.sql.Date htshsj=null;
String xmzy=null;
java.sql.Date qhtsj=null;
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
clgw=cf.GB2Uni(request.getParameter("clgw"));
ddshbz=cf.GB2Uni(request.getParameter("ddshbz"));
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
ls=request.getParameter("hkze");
try{
	if (!(ls.equals("")))  hkze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����hkze������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ܶ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("htcxhdje");
try{
	if (!(ls.equals("")))  htcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htcxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}

ls=request.getParameter("jhtzshsj");
try{
	if (!(ls.equals("")))  jhtzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhtzshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�֪ͨ�ͻ�ʱ��]����ת����������:"+e);
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
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����htshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ͬ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
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
String bz=cf.GB2Uni(request.getParameter("bz"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));

String lrr=null;
String dwbh=null;
lrr=cf.GB2Uni(request.getParameter("lrr"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String sfyyh=null;
java.sql.Date yhkssj=null;
java.sql.Date yhjzsj=null;
sfyyh=request.getParameter("sfyyh");
ls=request.getParameter("yhkssj");
try{
	if (!(ls.equals("")))  yhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݿ�ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("yhjzsj");
try{
	if (!(ls.equals("")))  yhjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhjzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݽ���ʱ��]����ת����������:"+e);
	return;
}
String yhnr=cf.GB2Uni(request.getParameter("yhnr"));
double zczkl=0;
ls=request.getParameter("zczkl");
try{
	if (!(ls.equals("")))  zczkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zczkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ۿ�]����ת����������:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

/*
String jkxz=cf.GB2Uni(request.getParameter("jkxz"));
String jkdd=cf.GB2Uni(request.getParameter("jkdd"));
*/

String whereddbh=cf.GB2Uni(request.getParameter("whereddbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String xclbz=null;
	ls_sql =" select clzt,xclbz";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+whereddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		xclbz=rs.getString("xclbz");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00") && !clzt.equals("02") && !clzt.equals("03") && !clzt.equals("05") && !clzt.equals("25") && !clzt.equals("26"))
	{
		out.println("<BR>���󣡴���״̬����ȷ");
		return;
	}
	if (!xclbz.equals("2") )
	{
		out.println("<BR>���󣡷Ƕ���ʽ��Ʒ");
		return;
	}

	ls_sql="update jc_zcdd set clgw=?,ztjjgw=?,ddshbz=?,kjxsj=?,htshsj=?,xmzy=?,qhtsj=?,bz=?,hkze=?,jhtzshsj=?,wdzje=?,htcxhdje=?,clzt='07',jjsjs=?,lrr=?,lrsj=SYSDATE,dwbh=?,zczkl=?,dzyy=?,sfyyh=?,yhkssj=?,yhjzsj=?,yhnr=?,ddlx='1' ";
	ls_sql+=" where ddbh='"+whereddbh+"' and clzt in('00','02','03','05','25','26')";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clgw);
	ps.setString(2,ztjjgw);
	ps.setString(3,ddshbz);
	ps.setDate(4,kjxsj);
	ps.setDate(5,htshsj);
	ps.setString(6,xmzy);
	ps.setDate(7,qhtsj);
	ps.setString(8,bz);
	ps.setDouble(9,hkze);
	ps.setDate(10,jhtzshsj);
	ps.setDouble(11,wdzje);
	ps.setDouble(12,htcxhdje);
	ps.setString(13,jjsjs);
	ps.setString(14,lrr);
	ps.setString(15,dwbh);

	ps.setDouble(16,zczkl);
	ps.setString(17,dzyy);
	ps.setString(18,sfyyh);
	ps.setDate(19,yhkssj);
	ps.setDate(20,yhjzsj);
	ps.setString(21,yhnr);
	
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>