<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String mmdglxbm=null;
String ysbm=null;
String qhjgqjbm=null;
double mmdj=0;
double yksmjjl=0;
mmdglxbm=cf.GB2Uni(request.getParameter("mmdglxbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
qhjgqjbm=cf.GB2Uni(request.getParameter("qhjgqjbm"));
ls=request.getParameter("mmdj");
try{
	if (!(ls.equals("")))  mmdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����mmdj������");
	return;
}
catch (Exception e){
	out.println("<BR>[ÿ�׵���]����ת����������:"+e);
	return;
}
ls=request.getParameter("yksmjjl");
try{
	if (!(ls.equals("")))  yksmjjl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yksmjjl������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ľ���ɲļӼ���]����ת����������:"+e);
	return;
}

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
java.sql.Date lrsj=null;
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
String wheremmdglxbm=null;
String whereysbm=null;
String whereqhjgqjbm=null;
wheremmdglxbm=cf.GB2Uni(request.getParameter("wheremmdglxbm"));
whereysbm=cf.GB2Uni(request.getParameter("whereysbm"));
whereqhjgqjbm=cf.GB2Uni(request.getParameter("whereqhjgqjbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("wheredqbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_mtbjb set mmdglxbm=?,ysbm=?,qhjgqjbm=?,mmdj=?,yksmjjl=?  ,dqbm=?,lrr=?,lrsj=SYSDATE,lrbm=? ";
	ls_sql+=" where mmdglxbm='"+wheremmdglxbm+"' and ysbm='"+whereysbm+"' and qhjgqjbm='"+whereqhjgqjbm+"' and dqbm='"+wheredqbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,mmdglxbm);
	ps.setString(2,ysbm);
	ps.setString(3,qhjgqjbm);
	ps.setDouble(4,mmdj);
	ps.setDouble(5,yksmjjl);

	ps.setString(6,dqbm);
	ps.setString(7,lrr);
	ps.setString(8,lrbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>�޸����ݿ�ʧ�ܣ�");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>