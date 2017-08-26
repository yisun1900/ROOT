<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String ycsm=cf.GB2Uni(request.getParameter("ycsm"));
String mmycyybm=cf.GB2Uni(request.getParameter("mmycyybm"));
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String ls=null;
java.sql.Date sshsj=null;
ls=request.getParameter("sshsj");
try{
	if (!(ls.equals("")))  sshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ʵ�ͻ�ʱ��]����ת����������:"+e);
	return;
}
java.sql.Date azkssj=null;
ls=request.getParameter("azkssj");
try{
	if (!(ls.equals("")))  azkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����azkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ��ʼʱ��]����ת����������:"+e);
	return;
}
java.sql.Date azjssj=null;
ls=request.getParameter("azjssj");
try{
	if (!(ls.equals("")))  azjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����azjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װ����ʱ��]����ת����������:"+e);
	return;
}
String ycclzt=null;
if (!mmycyybm.equals(""))
{
	ycclzt="1";
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("07") && !oldclzt.equals("09") && !oldclzt.equals("11"))
	{
		out.println("������ʧ�ܣ�����״̬����ȷ��");
		return;
	}
	
	ls_sql="update jc_mmydd set sshsj=?,azkssj=?,azjssj=?,ycsm=?,mmycyybm=?,ycclzt=?,clzt=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt in('07','09','11') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sshsj);
	ps.setDate(2,azkssj);
	ps.setDate(3,azjssj);
	ps.setString(4,ycsm);
	ps.setString(5,mmycyybm);
	ps.setString(6,ycclzt);
	ps.setString(7,clzt);
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