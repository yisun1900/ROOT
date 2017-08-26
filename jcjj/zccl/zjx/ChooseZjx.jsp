<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String[] xh=request.getParameterValues("xh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from jc_zczjx";
	ls_sql+=" where zjxbh='"+zjxbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("00"))
	{
		out.println("<BR>错误，不能再进行修改！增减项单已完成");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql ="insert into jc_zczjxmx (zjxbh,xh,ddbh   ,zjsl,zqzjje,zjje,zjcxhdje,zjycf,zjqtfy,zjcbje  ,lx,sxbz,zqsxdj,dpzkl,zhsxdj,cksl,ckje,shsl,zjyjjrje) ";
		ls_sql+=" select ?,"+xh[i]+",?   ,0,0,0,0,0,0,0  ,'1',sxbz,zqdj,dpzk,dj,0,0,0,0";
		ls_sql+=" from jc_zcddmx ";
		ls_sql+=" where xh="+xh[i];
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxbh);
		ps.setString(2,ddbh);
		ps.executeUpdate();
		ps.close();

	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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