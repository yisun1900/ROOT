<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dqbm=null;
String bjjbbm=null;
String tcmc=null;
double mjdj=0;
double zxmj=0;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
tcmc=cf.GB2Uni(request.getParameter("tcmc"));
ls=request.getParameter("mjdj");
try{
	if (!(ls.equals("")))  mjdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[mjdj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ƽ�׵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("zxmj");
try{
	if (!(ls.equals("")))  zxmj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[zxmj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��С���]����ת����������:"+e);
	return;
}

double yssl=0;
ls=request.getParameter("yssl");
try{
	if (!(ls.equals("")))  yssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yssl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����޶���ɫ����]����ת����������:"+e);
	return;
}

double tsf=0;
ls=request.getParameter("tsf");
try{
	if (!(ls.equals("")))  tsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[tsf]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ɫ��]����ת����������:"+e);
	return;
}

double wyjg=0;
ls=request.getParameter("wyjg");
try{
	if (!(ls.equals("")))  wyjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[wyjg]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ����ԡ�۸�]����ת����������:"+e);
	return;
}

double czjg=0;
ls=request.getParameter("czjg");
try{
	if (!(ls.equals("")))  czjg=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[czjg]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ�״�ש�۸�]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into tc_jgb ( dqbm,bjjbbm,tcmc,mjdj,zxmj,yssl,tsf,wyjg,czjg ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,bjjbbm);
	ps.setString(3,tcmc);
	ps.setDouble(4,mjdj);
	ps.setDouble(5,zxmj);
	ps.setDouble(6,yssl);
	ps.setDouble(7,tsf);
	ps.setDouble(8,wyjg);
	ps.setDouble(9,czjg);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>