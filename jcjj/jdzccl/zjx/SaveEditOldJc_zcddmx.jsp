<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double zjsl=0;
double zjje=0;
double zjycf=0;
String bz=null;
ls=request.getParameter("zjsl");
try{
	if (!(ls.equals("")))  zjsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������Ϸ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("zjycf");
try{
	if (!(ls.equals("")))  zjycf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjycf������");
	return;
}
catch (Exception e){
	out.println("<BR>[����Զ�̷�]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

double zjqtfy=0;
ls=request.getParameter("zjqtfy");
try{
	if (!(ls.equals("")))  zjqtfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjqtfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[������������]����ת����������:"+e);
	return;
}


double zjcxhdje=0;
ls=request.getParameter("zjcxhdje");
try{
	if (!(ls.equals("")))  zjcxhdje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjcxhdje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}

double zjcbje=0;
ls=request.getParameter("zjcbje");
try{
	if (!(ls.equals("")))  zjcbje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����zjcbje������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����ɱ����]����ת����������:"+e);
	return;
}


String ddbh=request.getParameter("ddbh");
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=request.getParameter("xh");

double zjxze=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where ddbh='"+ddbh+"' and zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>���󣬲����ٽ����޸ģ�����������");
		return;
	}


	ls_sql="update jc_zczjxmx set zjsl=?,zjje=?,zjycf=?,zjqtfy=?,zjcxhdje=?,zjcbje=?,bz=?";
	ls_sql+=" where zjxbh='"+zjxbh+"' and xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zjsl);
	ps.setDouble(2,zjje);
	ps.setDouble(3,zjycf);
	ps.setDouble(4,zjqtfy);
	ps.setDouble(5,zjcxhdje);
	ps.setDouble(6,zjcbje);
	ps.setString(7,bz);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

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