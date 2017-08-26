<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");

String ls=null;
String ddbh=request.getParameter("ddbh");
String tzshr=cf.GB2Uni(request.getParameter("tzshr"));

java.sql.Date tzshsj=null;
ls=request.getParameter("tzshsj");
try{
	if (!(ls.equals("")))  tzshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tzshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发送货通知时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String khbh=null;
	String clzt=null;
	String ppbm=null;
	ls_sql =" select khbh,clzt,ppbm";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		ppbm=rs.getString("ppbm");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("15"))
	{
		out.println("<BR>错误，存盘失败！订单状态不正确");
		return;
	}


	
	ls_sql="update jc_zcdd set tzshr=?,tzshsj=SYSDATE,ddshbz='3',clzt='17'";
	ls_sql+=" where ddbh='"+ddbh+"' and  clzt='15' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tzshr);
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
