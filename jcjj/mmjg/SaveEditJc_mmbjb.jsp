<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmxh=null;
String ysbm=null;
String qhjgqjbm=null;

double ztmdj=0;
double dmsjg=0;
double dmtjg=0;
double mtjg=0;
double dkmtjg=0;
double zmmjg=0;
double zdmjjl=0;
double yksmjjl=0;
double ysbljjl=0;
mmxh=cf.GB2Uni(request.getParameter("mmxh"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
String bz=cf.GB2Uni(request.getParameter("bz"));
ls=request.getParameter("ztmdj");
try{
	if (!(ls.equals("")))  ztmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ztmdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ŵ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dmsjg");
try{
	if (!(ls.equals("")))  dmsjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dmsjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ȼ۸�]����ת����������:"+e);
	return;
}
ls=request.getParameter("dmtjg");
try{
	if (!(ls.equals("")))  dmtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dmtjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����׼۸�]����ת����������:"+e);
	return;
}

ls=request.getParameter("mtjg");
try{
	if (!(ls.equals("")))  mtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mtjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[˫������ÿ�׵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("dkmtjg");
try{
	if (!(ls.equals("")))  dkmtjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dkmtjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ÿ�׵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zmmjg");
try{
	if (!(ls.equals("")))  zmmjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zmmjg������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ĸ�żӼ���]����ת����������:"+e);
	return;
}

ls=request.getParameter("zdmjjl");
try{
	if (!(ls.equals("")))  zdmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zdmjjl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۵��żӼ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yksmjjl");
try{
	if (!(ls.equals("")))  yksmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yksmjjl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƿ���ľ���ɲļӼ���]����ת����������:"+e);
	return;
}
ls=request.getParameter("ysbljjl");
try{
	if (!(ls.equals("")))  ysbljjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ysbljjl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���������Ӽ���]����ת����������:"+e);
	return;
}

double tlmpmdj=0;
ls=request.getParameter("tlmpmdj");
try{
	if (!(ls.equals("")))  tlmpmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tlmpmdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ÿƽ�׵���]����ת����������:"+e);
	return;
}

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
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

String wheremmxh=null;
String whereysbm=null;
String whereqhjgqjbm=null;
wheremmxh=cf.GB2Uni(request.getParameter("wheremmxh"));
whereysbm=cf.GB2Uni(request.getParameter("whereysbm"));
whereqhjgqjbm=cf.GB2Uni(request.getParameter("whereqhjgqjbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update jc_mmbjb set mmxh=?,ysbm=?,qhjgqjbm=?,ztmdj=?,zmmjg=?,bz=?,mtjg=?,zdmjjl=?,yksmjjl=?,dmsjg=?,dmtjg=?,ysbljjl=?,dkmtjg=?  ,tlmpmdj=?,dqbm=?,lrr=?,lrsj=SYSDATE,lrbm=?";
	ls_sql+=" where mmxh='"+wheremmxh+"' and ysbm='"+whereysbm+"' and qhjgqjbm='"+whereqhjgqjbm+"' and dqbm='"+wheredqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmxh);
	ps.setString(2,ysbm);
	ps.setString(3,qhjgqjbm);
	ps.setDouble(4,ztmdj);
	ps.setDouble(5,zmmjg);
	ps.setString(6,bz);
	ps.setDouble(7,mtjg);
	ps.setDouble(8,zdmjjl);
	ps.setDouble(9,yksmjjl);
	ps.setDouble(10,dmsjg);
	ps.setDouble(11,dmtjg);
	ps.setDouble(12,ysbljjl);
	ps.setDouble(13,dkmtjg);

	ps.setDouble(14,tlmpmdj);
	ps.setString(15,dqbm);
	ps.setString(16,lrr);
	ps.setString(17,lrbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
