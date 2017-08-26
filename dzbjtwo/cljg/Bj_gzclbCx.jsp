<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%  
String dqbm = request.getParameter("dqbm");
String jswlbm = request.getParameter("jswlbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String jldwbm=null;
String cljldwmc=null;

try {

	conn=cf.getConnection();

	if (jswlbm!=null)
	{
		ls_sql="select jldwbm,cljldwmc ";
		ls_sql+=" from  bj_jscljgb,bdm_cljldwbm";
		ls_sql+=" where bj_jscljgb.jldwbm=bdm_cljldwbm.cljldwbm and bj_jscljgb.dqbm='"+dqbm+"' and bj_jscljgb.wlbm='"+jswlbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			jldwbm=cf.fillNull(rs.getString("jldwbm"));
			cljldwmc=cf.fillNull(rs.getString("cljldwmc"));
		}
		rs.close();
		ps.close();


		%>
			parent.main.insertItem(parent.main.editform.jsjldwbm,"<%=jldwbm%>","<%=cljldwmc%>");
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

//-->
</SCRIPT>
