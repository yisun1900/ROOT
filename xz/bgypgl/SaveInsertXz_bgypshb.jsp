<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqxh=null;
String dwbh=null;
java.sql.Date sqrq=null;
String sqr=null;
String bgypbh=null;
long sqsl=0;
long syjcsl=0;
String bz=null;
//******************************************
//�������
//******************************************
String ls_sql2=null;
int xh=0;
String xhs=null;
ls_sql2="select NVL(max(TO_NUMBER(sqxh))+1,1)";
ls_sql2+=" from  xz_bgypshb";
xhs=cf.executeQuery(ls_sql2);
xh=Integer.parseInt(xhs);
sqxh=cf.addZero(xh,7);
//�Զ��������
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
sqr=cf.GB2Uni(request.getParameter("sqr"));
bgypbh=cf.GB2Uni(request.getParameter("bgypbh"));
ls=request.getParameter("sqsl");
try{
	if (!(ls.equals("")))  sqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������]����ת����������:"+e);
	return;
}
ls=request.getParameter("syjcsl");
try{
	if (!(ls.equals("")))  syjcsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����syjcsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[���½������]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into xz_bgypshb ( sqxh,dwbh,sqrq,sqr,bgypbh,sqsl,syjcsl,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqxh);
	ps.setString(2,dwbh);
	ps.setDate(3,sqrq);
	ps.setString(4,sqr);
	ps.setString(5,bgypbh);
	ps.setLong(6,sqsl);
	ps.setLong(7,syjcsl);
	ps.setString(8,bz);
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
	out.print("����ʧ��,��������: " + e);
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