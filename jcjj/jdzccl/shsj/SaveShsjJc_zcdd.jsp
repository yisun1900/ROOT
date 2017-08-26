<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");
String ls=null;
String fbillno=request.getParameter("fbillno");
String khbh=request.getParameter("khbh");
String shtzsm=cf.GB2Uni(request.getParameter("shtzsm"));
String tzry=cf.GB2Uni(request.getParameter("tzry"));


java.sql.Date jhshsj=null;
ls=request.getParameter("jhshsj");
try{
	if (!(ls.equals("")))  jhshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划送货时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String driver = "sun.jdbc.odbc.JdbcOdbcDriver";
String url = "jdbc:odbc:sqlserver";
try {
	Class.forName (driver);
	conn = DriverManager.getConnection(url, "sa", "");

	String clzt=null;
	ls_sql =" select clzt";
	ls_sql+=" from SEOrder";
	ls_sql+=" where fbillno='"+fbillno+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("13"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	int count=0;
	ls_sql =" select COUNT(*)";
	ls_sql+=" from jc_zcshsjjl";
	ls_sql+=" where ddbh='"+fbillno+"' and jhshsj='"+ls+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	if (count>0)
	{
		ls_sql="update jc_zcshsjjl set shtzsm=?,lrsj=getdate(),lrr=?";
		ls_sql+=" where ddbh='"+fbillno+"' and jhshsj='"+ls+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shtzsm);
		ps.setString(2,yhmc);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into jc_zcshsjjl (ddbh,jhshsj,khbh,shtzsm,lrsj,lrr)";
		ls_sql+=" values ( ?,'"+ls+"',?,?,getdate(),?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,fbillno);
		ps.setString(2,khbh);
		ps.setString(3,shtzsm);
		ps.setString(4,yhmc);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update SEOrder set jhshsj='"+ls+"',clzt='15',shtzsm=?,tzry=?";
	ls_sql+=" where fbillno='"+fbillno+"' and  clzt='13' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,shtzsm);
	ps.setString(2,tzry);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) conn.close();
	}
	catch (Exception e){
		if (conn != null) conn.close();
	}
}
%>