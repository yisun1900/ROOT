<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String shxmbm=null;
String shxmmc=null;
String shxmdlbm=null;
String shxmxlbm=null;
long kf=0;
shxmbm=cf.GB2Uni(request.getParameter("shxmbm"));
shxmmc=cf.GB2Uni(request.getParameter("shxmmc"));
shxmdlbm=cf.GB2Uni(request.getParameter("shxmdlbm"));
shxmxlbm=cf.GB2Uni(request.getParameter("shxmxlbm"));
ls=request.getParameter("kf");
try{
	if (!(ls.equals("")))  kf=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����kf������");
	return;
}
catch (Exception e){
	out.println("<BR>[�۷�]����ת����������:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_shxmbm ( shxmbm,shxmmc,shxmdlbm,shxmxlbm,kf ) ";
	ls_sql+=" values ( ?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shxmbm);
	ps.setString(2,shxmmc);
	ps.setString(3,shxmdlbm);
	ps.setString(4,shxmxlbm);
	ps.setLong(5,kf);
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