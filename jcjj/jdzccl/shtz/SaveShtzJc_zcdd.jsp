<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fbillno=request.getParameter("fbillno");
String tzshr=cf.GB2Uni(request.getParameter("tzshr"));

java.sql.Date tzshsj=null;
ls=request.getParameter("tzshsj");
try{
	if (!(ls.equals("")))  tzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>����tzshsj������");
	return;
}
catch (Exception e){
	out.println("<BR>[���ͻ�֪ͨʱ��]����ת����������:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
try {
	Class.forName (driver);
	conn = DriverManager.getConnection(url, "sa", "");

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from SEOrder";
	ls_sql+=" where fbillno='"+fbillno+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("15"))
	{
		out.println("<BR>���󣬴���ʧ�ܣ�����״̬����ȷ");
		return;
	}

	ls_sql="update SEOrder set tzshr=?,tzshsj=getdate(),clzt='17'";
	ls_sql+=" where fbillno='"+fbillno+"' and  clzt='15' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzshr);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
	}
	catch (Exception e){
		if (conn != null) conn.close();
	}
}
%>
