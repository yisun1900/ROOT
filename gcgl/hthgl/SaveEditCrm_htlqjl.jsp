<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long lqsl=0;
String dwbh=null;
String fgsbh=null;
String lqr=null;
java.sql.Date lqsj=null;
String qshth=null;
String zzhth=null;
String bz=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("lqsl");
try{
	if (!(ls.equals("")))  lqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lqsl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡ����]����ת����������:"+e);
	return;
}
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
lqr=cf.GB2Uni(request.getParameter("lqr"));
ls=request.getParameter("lqsj");
try{
	if (!(ls.equals("")))  lqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lqsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ȡʱ��]����ת����������:"+e);
	return;
}
qshth=cf.GB2Uni(request.getParameter("qshth"));
zzhth=cf.GB2Uni(request.getParameter("zzhth"));
bz=cf.GB2Uni(request.getParameter("bz"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lrsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[¼��ʱ��]����ת����������:"+e);
	return;
}
String wherelqjlh=null;
wherelqjlh=cf.GB2Uni(request.getParameter("wherelqjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_htlqjl set lqsl=?,dwbh=?,fgsbh=?,lqr=?,lqsj=?,qshth=?,zzhth=?,bz=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (lqjlh='"+wherelqjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,lqsl);
	ps.setString(2,dwbh);
	ps.setString(3,fgsbh);
	ps.setString(4,lqr);
	ps.setDate(5,lqsj);
	ps.setString(6,qshth);
	ps.setString(7,zzhth);
	ps.setString(8,bz);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>