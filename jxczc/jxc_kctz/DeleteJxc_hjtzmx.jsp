<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzph = request.getParameter("tzph");
String[] tzxh = request.getParameterValues("tzxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql = null;


try {
	conn=cf.getConnection();    //得到连接
	

	String clzt = "";
	ls_sql=" select clzt";
	ls_sql+=" from jxc_hjtzjl ";
	ls_sql+=" where tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if (!clzt.equals("0"))//0:未提交；9：提交
	{
		out.println("错误！已提交");
		return;
	}

	for (int i=0;i<tzxh.length ;i++ )
	{
		ls_sql="delete from jxc_hjtzmx  ";
		ls_sql+=" where tzph='"+tzph+"' and tzxh='"+tzxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close(); 
	}



	%>
	<SCRIPT language=javascript >
	<!--
		alert("删除成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql );
 }
 finally{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

