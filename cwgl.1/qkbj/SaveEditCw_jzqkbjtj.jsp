<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zqysxmbm=null;
double sfkl=0;
zqysxmbm=cf.GB2Uni(request.getParameter("zqysxmbm"));
ls=request.getParameter("sfkl");
try{
	if (!(ls.equals("")))  sfkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����sfkl������");
	return;
}
catch (Exception e){
	out.println("<BR>[����ʵ�տ���С��]����ת����������:"+e);
	return;
}
String wherezqysxmbm=null;
wherezqysxmbm=cf.GB2Uni(request.getParameter("wherezqysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_jzqkbjtj set zqysxmbm=?,sfkl=? ";
	ls_sql+=" where  (zqysxmbm='"+wherezqysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zqysxmbm);
	ps.setDouble(2,sfkl);
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