<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
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
	ls_sql+=" where ddbh='"+ddbh+"' and zjxxh="+zjxxh;
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

	String  zcbm=null;
	String  jxbz=null;
	for (int i=0;i<xh.length ;i++ )
	{
		ls_sql="select zcbm,jxbz";
		ls_sql+=" from  jc_zcddmx";
		ls_sql+=" where xh="+xh[i]+"";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zcbm=rs.getString("zcbm");
			jxbz=rs.getString("jxbz");
		}
		rs.close();
		ps.close();

		if (jxbz.equals("Y"))
		{
			conn.rollback();
			out.println("错误！主材编码【"+zcbm+"】已被减项");
			return;
		}

		ls_sql =" update  jc_zcddmx set jxbz='Y'";
		ls_sql+=" where xh="+xh[i]+"";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql ="insert into jc_zczjxmx (ddbh,zjxxh,xh) ";
		ls_sql+=" values( ?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setString(2,zjxxh);
		ps.setString(3,xh[i]);
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