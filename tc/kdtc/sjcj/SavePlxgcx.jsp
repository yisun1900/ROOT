<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));

String ls=null;

String sjsfycx=null;
double cxsjcj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjssj=null;

sjsfycx=request.getParameter("sjsfycx");
ls=request.getParameter("cxsjcj");
try{
	if (!(ls.equals("")))  cxsjcj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxsjcj������");
	return;
}
catch (Exception e){
	out.println("<BR>[�����������]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxkssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������ʼʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("cxjssj");
try{
	if (!(ls.equals("")))  cxjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����cxjssj������");
	return;
}
catch (Exception e){
	out.println("<BR>[��������ʱ��]����ת����������:"+e);
	return;
}



//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
try {
	conn=cf.getConnection();    //�õ�����

	ls_sql="update tckd_tcsjcjb set sjsfycx=?,cxkssj=?,cxjssj=?,cxsjcj=? ";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjsfycx);
	ps.setDate(2,cxkssj);
	ps.setDate(3,cxjssj);
	ps.setDouble(4,cxsjcj);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("����ɹ�");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	out.print("����ʧ��,��������: " + e);
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	try{
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //�ͷ�����
	}
	catch (Exception e){}
 }
%>              
