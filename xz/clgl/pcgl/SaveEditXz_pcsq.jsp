<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
java.sql.Date sqrq=null;
String ycsj=null;
String ycsj1=null;
String ycsj2=null;
String fhsj=null;
String fhsj1=null;
String fhsj2=null;
String mdd=null;
String ycsy=null;
String sqr=null;
int gls=0;
String lxfs=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;


dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqrq������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("gls");
try{
	if (!(ls.equals("")))  gls=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����������������");
	return;
}
catch (Exception e){
	out.println("<BR>[������]����ת����������:"+e);
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
bz=cf.GB2Uni(request.getParameter("bz"));

ycsj=cf.GB2Uni(request.getParameter("ycsj"));
ycsj1=cf.GB2Uni(request.getParameter("ycsj1"));
ycsj2=cf.GB2Uni(request.getParameter("ycsj2"));
fhsj=cf.GB2Uni(request.getParameter("fhsj"));
fhsj1=cf.GB2Uni(request.getParameter("fhsj1"));
fhsj2=cf.GB2Uni(request.getParameter("fhsj2"));

lxfs=cf.GB2Uni(request.getParameter("lxfs"));

mdd=cf.GB2Uni(request.getParameter("mdd"));
ycsy=cf.GB2Uni(request.getParameter("ycsy"));
sqr=cf.GB2Uni(request.getParameter("sqr"));


String wheresqxh=cf.GB2Uni(request.getParameter("wheresqxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update xz_pcsq set dwbh=?,sqrq=?,ycsj=TO_DATE('"+ycsj+" "+ycsj1+":"+ycsj2+":00','YYYY-MM-DD HH24:MI:SS'),mdd=?,ycsy=?,sqr=?,lxfs=?,gls=?,fhsj=TO_DATE('"+fhsj+" "+fhsj1+":"+fhsj2+":00','YYYY-MM-DD HH24:MI:SS'),lrr=?,lrsj=?,bz=? ";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dwbh);
	ps.setDate(2,sqrq);
	ps.setString(3,mdd);
	ps.setString(4,ycsy);
	ps.setString(5,sqr);
	ps.setString(6,lxfs);
	ps.setDouble(7,gls);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,bz);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>