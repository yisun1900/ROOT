<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] xqbm=request.getParameterValues("xqbm");
String[] kksStr=request.getParameterValues("kks");

double kks=0;
String ls=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	for (int i=0;i<xqbm.length ;i++ )
	{
	
		ls=kksStr[i];
		try{
			if (!(ls.equals("")))  kks=Double.parseDouble(kksStr[i].trim());
		}
		catch (java.lang.NullPointerException nulle){
		    conn.rollback();
			out.println("<BR>变量kks不存在");
			return;
		}
		catch (Exception e){
		    conn.rollback();
			out.println("<BR>[可控数]类型转换发生意外:"+e);
			return;
		}


		ls_sql="update qh_tgglb set kkjs=?";
		ls_sql+=" where  xqbm='"+xqbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,kks);
		ps.executeUpdate();
		ps.close();

	}//for


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("录入可控数成功！");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
