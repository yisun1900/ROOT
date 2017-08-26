<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] fbillno=request.getParameterValues("fbillno");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
try {
	Class.forName (driver);
	conn = DriverManager.getConnection(url, "sa", "");



	conn.setAutoCommit(false);
	
	String clzt=null;
	for (int i=0;i<fbillno.length ;i++ )
	{
		ls_sql =" select clzt";
		ls_sql+=" from SEOrder";
		ls_sql+=" where fbillno='"+fbillno[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("13"))
		{
			conn.rollback();
			out.println("<BR>´íÎó£¬´æÅÌÊ§°Ü£¡¶©µ¥×´Ì¬²»ÕýÈ·¡£"+fbillno[i]);
			return;
		}

		ls_sql="update SEOrder set gysjslrr=null,gysjslrsj=null,clzt='11'";
		ls_sql+=" where fbillno='"+fbillno[i]+"' and  clzt='13' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("É¾³ý³É¹¦£¡");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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