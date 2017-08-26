<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double yf=0;
java.sql.Date shsj=null;
String pslrr=null;
java.sql.Date pslrsj=null;
String bz=null;

ls=request.getParameter("yf");
try{
	if (!(ls.equals("")))  yf=Double.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�˷�]����ת����������:"+e);
	return;
}

ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�ͻ�ʱ��]����ת����������:"+e);
	return;
}

pslrr=cf.GB2Uni(request.getParameter("pslrr"));
ls=request.getParameter("pslrsj");
try{
	if (!(ls.equals("")))  pslrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pslrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[����¼��ʱ��]����ת����������:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));


String ckph=cf.GB2Uni(request.getParameter("ckph"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="update cl_ckd set shsj=?,yf=?,pslrr=?,pslrsj=?,bz=?";
	ls_sql+=" where ckph='"+ckph+"' and ckzt='3' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,shsj);
	ps.setDouble(2,yf);
	ps.setString(3,pslrr);
	ps.setDate(4,pslrsj);
	ps.setString(5,bz);
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