<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=cf.GB2Uni(cf.getParameter(request,"dqbm"));
String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
String zcxlbm=cf.GB2Uni(cf.getParameter(request,"zcxlbm"));
String dwbh=cf.GB2Uni(cf.getParameter(request,"dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="delete from  jc_zcjgb ";
	ls_sql+=" where dqbm='"+dqbm+"' and zcdlbm='"+zcdlbm+"' and zcxlbm='"+zcxlbm+"' and dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

//	out.println(ls_sql);


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