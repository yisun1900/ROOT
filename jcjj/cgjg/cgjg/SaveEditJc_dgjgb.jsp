<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cgbm=null;
String dggdbm=null;
String dgjsbm=null;
double lsj=0;
double yhj=0;
cgbm=cf.GB2Uni(request.getParameter("cgbm"));
dggdbm=cf.GB2Uni(request.getParameter("dggdbm"));
dgjsbm=cf.GB2Uni(request.getParameter("dgjsbm"));
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����lsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ۼ�]����ת����������:"+e);
	return;
}
ls=request.getParameter("yhj");
try{
	if (!(ls.equals("")))  yhj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����yhj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�Żݼ�]����ת����������:"+e);
	return;
}
String wherecgbm=null;
String wheredggdbm=null;
String wheredgjsbm=null;
wherecgbm=cf.GB2Uni(request.getParameter("wherecgbm"));
wheredggdbm=cf.GB2Uni(request.getParameter("wheredggdbm"));
wheredgjsbm=cf.GB2Uni(request.getParameter("wheredgjsbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_dgjgb set cgbm=?,dggdbm=?,dgjsbm=?,lsj=?,yhj=? ";
	ls_sql+=" where  (cgbm='"+wherecgbm+"') and  (dggdbm='"+wheredggdbm+"') and  (dgjsbm='"+wheredgjsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgbm);
	ps.setString(2,dggdbm);
	ps.setString(3,dgjsbm);
	ps.setDouble(4,lsj);
	ps.setDouble(5,yhj);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>