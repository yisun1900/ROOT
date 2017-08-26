<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String dqbm = request.getParameter("dqbm");

String[] tcsjflbm =request.getParameterValues("tcsjflbm");
String[] bjjbbm =request.getParameterValues("bjjbbm");
String[] bjjbbm1 =request.getParameterValues("bjjbbm1");
String[] jldw =request.getParameterValues("jldw");
String[] sjcj =request.getParameterValues("sjcj");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);


	for (int i=0;i<bjjbbm.length ;i++ )
	{
		sql="insert into bj_tcsjcjb (bjbbh,dqbm,tcsjflbm,bjjbbm,bjjbbm1,jldw,sjcj) ";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+tcsjflbm[i]+"','"+bjjbbm[i]+"','"+bjjbbm1[i]+"','"+cf.GB2Uni(jldw[i])+"','"+sjcj[i]+"')";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
