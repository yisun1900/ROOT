<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String stbhr=cf.GB2Uni(request.getParameter("stbhr"));
String tbhqk=cf.GB2Uni(request.getParameter("tbhqk"));

java.sql.Date stbhsj=null;
ls=request.getParameter("stbhsj");
try{
	if (!(ls.equals("")))  stbhsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量stbhsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发退补货通知时间]类型转换发生意外:"+e);
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
	java.sql.Date jhtbhsj=null;
	ls_sql =" select clzt,khbh,jhtbhsj";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		jhtbhsj=rs.getDate("jhtbhsj");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("23"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}


	conn.setAutoCommit(false);

	ls_sql="update jc_zctbhjl set stbhsj=?,stbhr=?,tbhqk=?";
	ls_sql+=" where ddbh='"+ddbh+"' and jhtbhsj=?";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,stbhsj);
	ps.setString(2,stbhr);
	ps.setString(3,tbhqk);
	ps.setDate(4,jhtbhsj);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update jc_zcdd set stbhsj=?,stbhr=?,tbhqk=?";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt='23'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,stbhsj);
	ps.setString(2,stbhr);
	ps.setString(3,tbhqk);
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
