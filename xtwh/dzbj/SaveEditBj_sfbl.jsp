<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfxmbm=null;
double sfbfb=0;
double qsz=0;
double jzz=0;
String dqbm=null;
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
ls=request.getParameter("sfbfb");
try{
	if (!(ls.equals("")))  sfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfbfb������");
	return;
}
catch (Exception e){
	out.println("<BR>[�շѰٷֱ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("qsz");
try{
	if (!(ls.equals("")))  qsz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����qsz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ʼֵ>]����ת����������:"+e);
	return;
}
ls=request.getParameter("jzz");
try{
	if (!(ls.equals("")))  jzz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jzz������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ֵֹ<=]����ת����������:"+e);
	return;
}
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wherexh=null;
wherexh=cf.GB2Uni(request.getParameter("wherexh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update bj_sfbl set sfxmbm=?,sfbfb=?,qsz=?,jzz=?,dqbm=? ";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sfxmbm);
	ps.setDouble(2,sfbfb);
	ps.setDouble(3,qsz);
	ps.setDouble(4,jzz);
	ps.setString(5,dqbm);
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