<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String dwbh=request.getParameter("dwbh");
String[] clbm =request.getParameterValues("clbm");
String[] cj =request.getParameterValues("cj");
String[] cjjsj =request.getParameterValues("cjjsj");
String[] fgsdj =request.getParameterValues("fgsdj");
String[] gdj =request.getParameterValues("gdj");

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
int count=0;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ;i++ )
	{
		sql=" update cl_jgmx set cj="+cj[i]+",cjjsj="+cjjsj[i]+",fgsdj="+fgsdj[i]+",gdj="+gdj[i]+"";
		sql+=" where clbm='"+clbm[i]+"' and dwbh='"+dwbh+"' ";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("价格调整成功!!!");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

