<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
double fdbl=0;
ls=request.getParameter("fdbl");
try{
	if (!(ls.equals("")))  fdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����fdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
double cxfdbl=0;
ls=request.getParameter("cxfdbl");
try{
	if (!(ls.equals("")))  cxfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}


double khfdbl=0;
ls=request.getParameter("khfdbl");
try{
	if (!(ls.equals("")))  khfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
double khcxfdbl=0;
ls=request.getParameter("khcxfdbl");
try{
	if (!(ls.equals("")))  khcxfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����khcxfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
double tcjrbl=0;
ls=request.getParameter("tcjrbl");
try{
	if (!(ls.equals("")))  tcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tcjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������������]����ת����������:"+e);
	return;
}
double tccxjrbl=0;
ls=request.getParameter("tccxjrbl");
try{
	if (!(ls.equals("")))  tccxjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tccxjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ɴ����������]����ת����������:"+e);
	return;
}


double xpjsbl=0;
ls=request.getParameter("xpjsbl");
try{
	if (!(ls.equals("")))  xpjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xpjsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ�䳧�������������]����ת����������:"+e);
	return;
}
double xpcxjsbl=0;
ls=request.getParameter("xpcxjsbl");
try{
	if (!(ls.equals("")))  xpcxjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xpcxjsbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ�䳧�̴����������]����ת����������:"+e);
	return;
}

double xpkhfdbl=0;
ls=request.getParameter("xpkhfdbl");
try{
	if (!(ls.equals("")))  xpkhfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xpkhfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ��ͻ������������]����ת����������:"+e);
	return;
}
double xpkhcxfdbl=0;
ls=request.getParameter("xpkhcxfdbl");
try{
	if (!(ls.equals("")))  xpkhcxfdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xpkhcxfdbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ��ͻ������������]����ת����������:"+e);
	return;
}
double xptcjrbl=0;
ls=request.getParameter("xptcjrbl");
try{
	if (!(ls.equals("")))  xptcjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xptcjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ����������������]����ת����������:"+e);
	return;
}
double xptccxjrbl=0;
ls=request.getParameter("xptccxjrbl");
try{
	if (!(ls.equals("")))  xptccxjrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����xptccxjrbl������");
	return;
}
catch (Exception e){
	out.println("<BR>[ѡ����ɴ����������]����ת����������:"+e);
	return;
}

double azfjsbl=0;
ls=request.getParameter("azfjsbl");
try{
	if (!(ls.equals("")))  azfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[azfjsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ�ѽ������]����ת����������:"+e);
	return;
}


double ycfjsbl=0;
ls=request.getParameter("ycfjsbl");
try{
	if (!(ls.equals("")))  ycfjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[ycfjsbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[Զ�̷ѽ������]����ת����������:"+e);
	return;
}


String whereppbm=null;
String wheregysbm=null;
String wheressfgs=null;
whereppbm=cf.GB2Uni(request.getParameter("whereppbm"));
wheregysbm=cf.GB2Uni(request.getParameter("wheregysbm"));
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update jxc_ppgysdzb set fdbl=?,cxfdbl=?,khfdbl=?,khcxfdbl=?,tcjrbl=?,tccxjrbl=?   ,xpjsbl=?,xpcxjsbl=?,xpkhfdbl=?,xpkhcxfdbl=?,xptcjrbl=?,xptccxjrbl=?,azfjsbl=?,ycfjsbl=?,lrr='"+yhmc+"',lrsj=SYSDATE";
	ls_sql+=" where  (ppbm="+whereppbm+") and  (gysbm="+wheregysbm+") and  (ssfgs='"+wheressfgs+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,fdbl);
	ps.setDouble(2,cxfdbl);
	ps.setDouble(3,khfdbl);
	ps.setDouble(4,khcxfdbl);
	ps.setDouble(5,tcjrbl);
	ps.setDouble(6,tccxjrbl);
	ps.setDouble(7,xpjsbl);
	ps.setDouble(8,xpcxjsbl);
	ps.setDouble(9,xpkhfdbl);
	ps.setDouble(10,xpkhcxfdbl);
	ps.setDouble(11,xptcjrbl);
	ps.setDouble(12,xptccxjrbl);
	ps.setDouble(13,azfjsbl);
	ps.setDouble(14,ycfjsbl);
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
	out.print("<BR>����:" + e);
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