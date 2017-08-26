<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfxsp=null;

	int count=0;
	ls_sql=" SELECT count(*)";
	ls_sql+=" FROM oa_xcplqmx ";
	ls_sql+=" where sqxh="+sqxh+" and sfxsp='Y'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)//N：不需要；Y：需要
	{
		sfxsp="Y";
	}
	else 
	{
		sfxsp="N";
	}

	
	double jhlqsl=0;
	double jhlqje=0;
	ls_sql="select sum(jhlqsl),sum(jhlqsl*dj) ";
	ls_sql+=" from  oa_xcplqmx";
	ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jhlqsl=rs.getDouble(1);
		jhlqje=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update oa_xcplqsq set lqzt='2',sfxsp='"+sfxsp+"',jhlqsl="+jhlqsl+",jhlqje="+jhlqje;
	ls_sql+=" where  sqxh="+sqxh+" ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>错误！存盘失败！");
	}
	else
	{
		out.println("<BR>存盘成功！");
	}
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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