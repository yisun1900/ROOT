<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ffctzr=cf.GB2Uni(request.getParameter("ffctzr"));
String jhccxgyy=cf.GB2Uni(request.getParameter("jhccxgyy"));
java.sql.Date ffctzsj=null;
java.sql.Date tzfcsj=null;
ls=request.getParameter("ffctzsj");
try{
	if (!(ls.equals("")))  ffctzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����ffctzsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[������֪ͨʱ��]����ת����������:"+e);
	return;
}
ls=request.getParameter("tzfcsj");
try{
	if (!(ls.equals("")))  tzfcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzfcsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[֪ͨ����ʱ��]����ת����������:"+e);
	return;
}

String yddbh=request.getParameter("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	String bclzt=null;
	ls_sql="select bclzt";
	ls_sql+=" from  jdm_mmclzt";
	ls_sql+=" where cdmc='֪ͨ����' and jgclzt='"+clzt+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bclzt=rs.getString("bclzt");
	}
	rs.close();
	ps.close();
	
	if (bclzt==null)
	{
		out.println("������ʧ�ܣ�����״̬����ȷ��");
		return;
	}

	ls_sql="update jc_mmydd set ffctzsj=?,ffctzr=?,tzfcsj=?";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,ffctzsj);
	ps.setString(2,ffctzr);
	ps.setDate(3,tzfcsj);
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
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>