<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] ddbh=request.getParameterValues("ddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	
	conn.setAutoCommit(false);

	for (int i=0;i<ddbh.length ;i++ )
	{
		clzt="";
		ls_sql =" select clzt";
		ls_sql+=" from jc_zcysd";
		ls_sql+=" where ddbh='"+ddbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			clzt=rs.getString("clzt");
		}
		rs.close();
		ps.close();

		if (!clzt.equals("01"))
		{
			conn.rollback();
			out.println("<BR>´íÎó£¬É¾³ýÊ§°Ü£¡¶©µ¥¡¾"+ddbh[i]+"¡¿×´Ì¬²»ÕýÈ·");
			return;
		}


		ls_sql="update jc_zcysd set clzt='00',hkze=0,wdzje=0,htcxhdje=0 ";
		ls_sql+=" ,zqclf=0,zhclf=0,ycf=0,qtf=0 ";
		ls_sql+=" where  ddbh='"+ddbh[i]+"' and clzt='01'";
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>