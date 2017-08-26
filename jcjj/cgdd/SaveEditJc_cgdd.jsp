<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double dj=0;
String clgw=null;
String xmzy=null;
String bz=null;
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
clgw=cf.GB2Uni(request.getParameter("clgw"));
xmzy=cf.GB2Uni(request.getParameter("xmzy"));
bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date jhccsj=null;
java.sql.Date jhfcsj=null;
ls=request.getParameter("jhccsj");
try{
	if (!(ls.equals("")))  jhccsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhccsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("jhfcsj");
try{
	if (!(ls.equals("")))  jhfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����jhfcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ƻ�����ʱ��]����ת����������:"+e);
	return;
}
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String pdgc=cf.GB2Uni(request.getParameter("pdgc"));
String sfpsjs=cf.GB2Uni(request.getParameter("sfpsjs"));

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String clzt=null;
try {
	conn=cf.getConnection();

	String pdgcmc=null;
	String ppmc=null;
	String gys=null;

	ls_sql="select gysmc,ppmc,gys";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where  gysbh='"+pdgc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdgcmc=rs.getString("gysmc");
		ppmc=rs.getString("ppmc");
		gys=rs.getString("gys");
	}
	rs.close();
	ps.close();

	if (pdgcmc==null)
	{
		out.println("������ʧ�ܣ�[��������]Ϊ�ա�");
		return;
	}
	if (ppmc==null)
	{
		out.println("������ʧ�ܣ�[Ʒ��]Ϊ�ա�");
		return;
	}
	if (gys==null)
	{
		out.println("������ʧ�ܣ�[��Ӧ��]Ϊ�ա�");
		return;
	}

	ls_sql="update jc_cgdd set dj=?,clgw=?,xmzy=?,bz=?,jhccsj=?,jhfcsj=?,ztjjgw=?,pdgc=?,pdgcmc=?,gys=?,ppmc=?,sfpsjs=?";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dj);
	ps.setString(2,clgw);
	ps.setString(3,xmzy);
	ps.setString(4,bz);
	ps.setDate(5,jhccsj);
	ps.setDate(6,jhfcsj);
	ps.setString(7,ztjjgw);
	ps.setString(8,pdgc);
	ps.setString(9,pdgcmc);
	ps.setString(10,gys);
	ps.setString(11,ppmc);
	ps.setString(12,sfpsjs);
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