<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sqxh=0;
String xcpbm=null;
String xcpmc=null;
String xcpflbm=null;
String jldw=null;
double dj=0;
double jhlqsl=0;
ls=request.getParameter("sqxh");
try{
	if (!(ls.equals("")))  sqxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqxh������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������]����ת����������:"+e);
	return;
}
xcpbm=cf.GB2Uni(request.getParameter("xcpbm"));
xcpmc=cf.GB2Uni(request.getParameter("xcpmc"));
xcpflbm=cf.GB2Uni(request.getParameter("xcpflbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhlqsl");
try{
	if (!(ls.equals("")))  jhlqsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhlqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ���ȡ����]����ת����������:"+e);
	return;
}
String sfxsp=cf.GB2Uni(request.getParameter("sfxsp"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	ls_sql=" SELECT lqzt";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=rs.getString("lqzt");
	}
	rs.close();
	ps.close();

	if (lqzt.equals("2"))//1��δ��ɣ�2��������룻3��һ��������4������������5������������6������ȡ
	{
		out.println("��������ɣ��������޸ģ������޸ģ���ά����ɾ�����״̬");
		return;
	}
	
	ls_sql="insert into oa_xcplqmx ( sqxh,xcpbm,xcpmc,xcpflbm,jldw,dj,jhlqsl,sfxsp,slqsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sqxh);
	ps.setString(2,xcpbm);
	ps.setString(3,xcpmc);
	ps.setString(4,xcpflbm);
	ps.setString(5,jldw);
	ps.setDouble(6,dj);
	ps.setDouble(7,jhlqsl);
	ps.setString(8,sfxsp);
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