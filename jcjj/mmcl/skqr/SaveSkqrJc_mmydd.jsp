<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String skqrr=cf.GB2Uni(request.getParameter("skqrr"));

String ls=null;
java.sql.Date skqrsj=null;
ls=request.getParameter("skqrsj");
try{
	if (!(ls.equals("")))  skqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量skqrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款确认时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;
double zjxbz=0;

try {
	conn=cf.getConnection();

	ls_sql="select clzt";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldclzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!oldclzt.equals("04"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}
	
	ls_sql="update jc_mmydd set clzt='23',skqrsj=?,skqrr=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='04' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,skqrsj);
	ps.setString(2,skqrr);
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>