<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010116")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String ls=null;
double jryjbfb=0;
double sjjryjbfb=0;
double yjjzcs=0;
ls=request.getParameter("jryjbfb");
try{
	if (!(ls.equals("")))  jryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[jryjbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��װǩ������ҵ���տ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("sjjryjbfb");
try{
	if (!(ls.equals("")))  sjjryjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[sjjryjbfb]������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ƷѼ���ҵ���տ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("yjjzcs");
try{
	if (!(ls.equals("")))  yjjzcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����[yjjzcs]������");
	return;
}
catch (Exception e){
	out.println("<BR>[ҵ����ֵ����]����ת����������:"+e);
	return;
}

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="update sq_dwxx set jryjbfb=?,sjjryjbfb=?,yjjzcs=?";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jryjbfb);
	ps.setDouble(2,sjjryjbfb);
	ps.setDouble(3,yjjzcs);
	ps.executeUpdate();
	ps.close();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
	return;
}
finally 
{
	try{
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>






