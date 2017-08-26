<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date clqklrsj=null;
String clqklrr=null;
String sjclqk=null;

ls=request.getParameter("clqklrsj");
try{
	if (!(ls.equals("")))  clqklrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clqklrsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������¼��ʱ��]����ת����������:"+e);
	return;
}
clqklrr=cf.GB2Uni(request.getParameter("clqklrr"));
sjclqk=cf.GB2Uni(request.getParameter("sjclqk"));
String wtsfjj=cf.GB2Uni(request.getParameter("wtsfjj"));

java.sql.Date clsj=null;
ls=request.getParameter("clsj");
try{
	if (!(ls.equals("")))  clsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[clsj]������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʱ��]����ת����������:"+e);
	return;
}

int khyyts=0;
ls=request.getParameter("khyyts");
try{
	if (!(ls.equals("")))  khyyts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khyyts]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�ԭ��Ӱ������]����ת����������:"+e);
	return;
}
double khzrbl=0;
ls=request.getParameter("khzrbl");
try{
	if (!(ls.equals("")))  khzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[khzrbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ����α���]����ת����������:"+e);
	return;
}
int fkhyyts=0;
ls=request.getParameter("fkhyyts");
try{
	if (!(ls.equals("")))  fkhyyts=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fkhyyts]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ǿͻ�ԭ��Ӱ������]����ת����������:"+e);
	return;
}
double fkhzrbl=0;
ls=request.getParameter("fkhzrbl");
try{
	if (!(ls.equals("")))  fkhzrbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[fkhzrbl]������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ǿͻ����α���]����ת����������:"+e);
	return;
}

String djbh=cf.GB2Uni(request.getParameter("djbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_xmycgl";
	ls_sql+=" where djbh='"+djbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("3"))//1��¼�룻2���ƶ�������3��������ˣ�4���Ѵ���
	{
		out.println("����״̬����ȷ���������޸�");
		return;
	}

	ls_sql="update crm_xmycgl set zt='4',clqklrsj=?,clqklrr=?,wtsfjj=?,sjclqk=?,clsj=?,khyyts=?,khzrbl=?,fkhyyts=?,fkhzrbl=? ";
	ls_sql+=" where  djbh='"+djbh+"' and zt='3'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,clqklrsj);
	ps.setString(2,clqklrr);
	ps.setString(3,wtsfjj);
	ps.setString(4,sjclqk);
	ps.setDate(5,clsj);
	ps.setInt(6,khyyts);
	ps.setDouble(7,khzrbl);
	ps.setInt(8,fkhyyts);
	ps.setDouble(9,fkhzrbl);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>