<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tzph = request.getParameter("tzph");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
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

	if (!clzt.equals("9"))//0:未提交；9：提交
	{
		out.println("错误！未提交");
		return;
	}



	conn.setAutoCommit(false);

	ls_sql="update jxc_hjtzjl set clzt='0'";
	ls_sql+=" where tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close(); 

	String ylsh = null;
	String yhjbh = null;
	String xhjbh = null;
	ls_sql=" select ylsh,yhjbh,xhjbh";
	ls_sql+=" from jxc_hjtzmx ";
	ls_sql+=" where tzph='"+tzph+"'";
	ls_sql+=" order by tzxh";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	while (rs.next())
	{
		ylsh=cf.fillNull(rs.getString("ylsh"));
		yhjbh=cf.fillNull(rs.getString("yhjbh"));
		xhjbh=cf.fillNull(rs.getString("xhjbh"));

		ls_sql="update jxc_kcb set hjbh=?,hwbh=''";
		ls_sql+=" where lsh='"+ylsh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,yhjbh);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	


	conn.commit();
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
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>ls_sql=" + ls_sql );
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              

