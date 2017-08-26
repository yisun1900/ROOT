<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = cf.getParameter(request,"chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	String ssfgs=null;
	String sgd=null;
	String bzmc=null;
	String xm=null;
	ls_sql="select ssfgs,sgd,bzmc,xm ";
	ls_sql+=" from  sq_grxxb";
	ls_sql+=" where "+chooseitem;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		bzmc=cf.fillNull(rs.getString("bzmc"));
		xm=cf.fillNull(rs.getString("xm"));

		ls_sql="delete sq_grxxb  ";
		ls_sql+=" where  (ssfgs='"+ssfgs+"') and  (xm='"+xm+"')   ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update sq_bzxx set grsl=(select count(*) from sq_grxxb where sq_grxxb.sgd=sq_bzxx.sgd and sq_grxxb.bzmc=sq_bzxx.bzmc) ";
		ls_sql+=" where  (sgd='"+sgd+"') and  (bzmc='"+bzmc+"')   ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();

		ls_sql="update sq_bzxx set kygrsl=grsl-yygrsl ";
		ls_sql+=" where  (sgd='"+sgd+"') and  (bzmc='"+bzmc+"')   ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


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
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>