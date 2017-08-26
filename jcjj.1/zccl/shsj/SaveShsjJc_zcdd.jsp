<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhmc=(String)session.getAttribute("yhmc");
String ls=null;
String ddbh=request.getParameter("ddbh");
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
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	ls_sql =" select clzt,khbh";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("13") && !clzt.equals("25") && !clzt.equals("26") && !clzt.equals("27"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zcshsjjl";
	ls_sql+=" where ddbh='"+ddbh+"' and jhshsj=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhshsj);
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
		ls_sql="update jc_zcshsjjl set shtzsm=?,lrsj=TRUNC(SYSDATE),lrr=?";
		ls_sql+=" where ddbh='"+ddbh+"' and jhshsj=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,shtzsm);
		ps.setString(2,yhmc);
		ps.setDate(3,jhshsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into jc_zcshsjjl (ddbh,jhshsj,khbh,shtzsm,lrsj,lrr)";
		ls_sql+=" values ( ?,?,?,?,TRUNC(SYSDATE),?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setDate(2,jhshsj);
		ps.setString(3,khbh);
		ps.setString(4,shtzsm);
		ps.setString(5,yhmc);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update jc_zcdd set jhshsj=?,clzt='15',shtzsm=?,tzry=?";
	ls_sql+=" where ddbh='"+ddbh+"' and  clzt in('13','25','26','27') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhshsj);
	ps.setString(2,shtzsm);
	ps.setString(3,tzry);
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
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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