<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
long pxrs=0;
double pxfy=0;

ls=request.getParameter("pxrs");
try{
	if (!(ls.equals("")))  pxrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxrs������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ����]����ת����������:"+e);
	return;
}
ls=request.getParameter("pxfy");
try{
	if (!(ls.equals("")))  pxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����pxfy������");
	return;
}
catch (Exception e){
	out.println("<BR>[��ѵ����]����ת����������:"+e);
	return;
}
long shbh=0;
ls=request.getParameter("shbh");
try{
	if (!(ls.equals("")))  shbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����shbh������");
	return;
}
catch (Exception e){
	out.println("<BR>[��˱��]����ת����������:"+e);
	return;
}

String wherepxmxbh=null;
wherepxmxbh=cf.GB2Uni(request.getParameter("wherepxmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);
//����Rs_pxjh����������
	ls_sql="update rs_pxjhmx set shhrs=?,shhfy=? ";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pxrs);
	ps.setDouble(2,pxfy);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into rs_shmxxg ( pxmxbh,shbh,shsl,shfy ) ";
	ls_sql+=" values ( ?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherepxmxbh);
	ps.setLong(2,shbh);
	ps.setLong(3,pxrs);
	ps.setDouble(4,pxfy);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("�޸ĳɹ�!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("����ʧ��,��������: " + e+ls_sql	 );
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("�ر����ӷ�������,Exception:"+e.getMessage());
	}
}
%>