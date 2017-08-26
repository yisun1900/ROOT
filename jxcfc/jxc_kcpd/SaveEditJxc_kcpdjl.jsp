<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long pdph=0;
String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssbm=null;
String pdrssfgs=null;
java.sql.Date pdsj=null;
String bz=null;
ls=request.getParameter("pdph");
try{
	if (!(ls.equals("")))  pdph=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdph������");
	return;
}
catch (Exception e){
	out.println("<BR>[�̵�����]����ת����������:"+e);
	return;
}
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
ckbh=cf.GB2Uni(request.getParameter("ckbh"));
pdzt=cf.GB2Uni(request.getParameter("pdzt"));
pdr=cf.GB2Uni(request.getParameter("pdr"));
pdrssbm=cf.GB2Uni(request.getParameter("pdrssbm"));
pdrssfgs=cf.GB2Uni(request.getParameter("pdrssfgs"));
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pdsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�̵�ʱ��]����ת����������:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepdph=null;
wherepdph=cf.GB2Uni(request.getParameter("wherepdph"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_kcpdjl set pdph=?,dqbm=?,ckbh=?,pdzt=?,pdr=?,pdrssbm=?,pdrssfgs=?,pdsj=?,bz=? ";
	ls_sql+=" where  (pdph="+wherepdph+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pdph);
	ps.setString(2,dqbm);
	ps.setString(3,ckbh);
	ps.setString(4,pdzt);
	ps.setString(5,pdr);
	ps.setString(6,pdrssbm);
	ps.setString(7,pdrssfgs);
	ps.setDate(8,pdsj);
	ps.setString(9,bz);
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