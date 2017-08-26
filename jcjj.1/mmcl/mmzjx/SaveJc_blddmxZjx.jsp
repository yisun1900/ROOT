<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] lrxh=request.getParameterValues("lrxh");
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
double blzjxje=0;
double zjxze=0;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where  (yddbh='"+yddbh+"' and zjxxh="+zjxxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString(1);
	}
	rs.close();
	ps.close();
	if (!clzt.equals("00"))//00：录入未完成
	{
		out.println("错误！增减项已完成，不能再录入");
		return;
	}

	conn.setAutoCommit(false);

	for (int i=0;i<lrxh.length ;i++ )
	{
		int ysl=0;
		ls_sql="select zjhsl";
		ls_sql+=" from jc_blddmx ";
		ls_sql+=" where lrxh="+lrxh[i];
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			ysl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		ls_sql="insert into jc_blzjxmx ( lrxh,yddbh,zjxxh,lx,ysl,xsl) ";
		ls_sql+=" values ( ?,?,?,'1',?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lrxh[i]);
		ps.setString(2,yddbh);
		ps.setString(3,zjxxh);
		ps.setInt(4,ysl);
		ps.setInt(5,ysl);
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
	out.print("存盘失败,发生意外: " + ls_sql);
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