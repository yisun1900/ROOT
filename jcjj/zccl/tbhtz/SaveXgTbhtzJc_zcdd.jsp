<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String tztbhr=cf.GB2Uni(request.getParameter("tztbhr"));
String tbhtzry=cf.GB2Uni(request.getParameter("tbhtzry"));
String tbhqk=cf.GB2Uni(request.getParameter("tbhqk"));

java.sql.Date tztbhsj=null;
java.sql.Date jhtbhsj=null;
ls=request.getParameter("tztbhsj");
try{
	if (!(ls.equals("")))  tztbhsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tztbhsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发退补货通知时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhtbhsj");
try{
	if (!(ls.equals("")))  jhtbhsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhtbhsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[约定退补货时间]类型转换发生意外:"+e);
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

	if (!clzt.equals("19") && !clzt.equals("21") && !clzt.equals("23"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}

	int count=0;
	ls_sql =" select count(*)";
	ls_sql+=" from jc_zctbhjl";
	ls_sql+=" where ddbh='"+ddbh+"' and jhtbhsj=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,jhtbhsj);
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
		ls_sql="update jc_zctbhjl set jhtbhsj=?,tztbhsj=?,tztbhr=?,tbhtzry=?,tbhqk=?";
		ls_sql+=" where ddbh='"+ddbh+"' and jhtbhsj=?";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,jhtbhsj);
		ps.setDate(2,tztbhsj);
		ps.setString(3,tztbhr);
		ps.setString(4,tbhtzry);
		ps.setString(5,tbhqk);
		ps.setDate(6,jhtbhsj);
		ps.executeUpdate();
		ps.close();
	}
	else{
		ls_sql="insert into jc_zctbhjl (ddbh,jhtbhsj,khbh,tztbhsj,tztbhr,tbhtzry,tbhqk)";
		ls_sql+=" values ( ?,?,?,?,?,?,?)";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ddbh);
		ps.setDate(2,jhtbhsj);
		ps.setString(3,khbh);
		ps.setDate(4,tztbhsj);
		ps.setString(5,tztbhr);
		ps.setString(6,tbhtzry);
		ps.setString(7,tbhqk);
		ps.executeUpdate();
		ps.close();
	}

	
	ls_sql="update jc_zcdd set tztbhr=?,tztbhsj=?,tbhtzry=?,jhtbhsj=?,clzt='21',tbhqk=?";
	ls_sql+=" where ddbh='"+ddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tztbhr);
	ps.setDate(2,tztbhsj);
	ps.setString(3,tbhtzry);
	ps.setDate(4,jhtbhsj);
	ps.setString(5,tbhqk);
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
