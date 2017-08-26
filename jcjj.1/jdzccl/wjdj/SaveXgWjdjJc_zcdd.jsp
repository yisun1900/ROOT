<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ddbh=request.getParameter("ddbh");
String wjlrr=cf.GB2Uni(request.getParameter("wjlrr"));

java.sql.Date wjsj=null;
ls=request.getParameter("wjsj");
try{
	if (!(ls.equals("")))  wjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完结时间]类型转换发生意外:"+e);
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

	if (!clzt.equals("30"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}



	ls_sql="update jc_zcdd set wjsj=?,wjlrr=?";
	ls_sql+=" where ddbh='"+ddbh+"' and clzt in('30')";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,wjsj);
	ps.setString(2,wjlrr);
	ps.executeUpdate();
	ps.close();


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
	out.print("Exception: " + e);
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
