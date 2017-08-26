<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fgsbh=null;
String deflbm=null;
String deflmc=null;
long dedy=0;
long dexy=0;
long depjz=0;
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
deflbm=cf.GB2Uni(request.getParameter("deflbm"));
deflmc=cf.GB2Uni(request.getParameter("deflmc"));
ls=request.getParameter("dedy");
try{
	if (!(ls.equals("")))  dedy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dedy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�������(>=)]����ת����������:"+e);
	return;
}
ls=request.getParameter("dexy");
try{
	if (!(ls.equals("")))  dexy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����dexy������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����յ�(<)]����ת����������:"+e);
	return;
}
ls=request.getParameter("depjz");
try{
	if (!(ls.equals("")))  depjz=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����depjz������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ƽ��ֵ]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into kp_deflbm ( fgsbh,deflbm,deflmc,dedy,dexy,depjz ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fgsbh);
	ps.setString(2,deflbm);
	ps.setString(3,deflmc);
	ps.setLong(4,dedy);
	ps.setLong(5,dexy);
	ps.setLong(6,depjz);
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