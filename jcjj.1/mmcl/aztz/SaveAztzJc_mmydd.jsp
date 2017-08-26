<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String aztzr=cf.GB2Uni(request.getParameter("aztzr"));
String azsjbz=cf.GB2Uni(request.getParameter("azsjbz"));

String ls=null;
java.sql.Date aztzsj=null;
ls=request.getParameter("aztzsj");
try{
	if (!(ls.equals("")))  aztzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量aztzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发安装通知时间]类型转换发生意外:"+e);
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String oldclzt=null;

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
	if (!oldclzt.equals("07"))
	{
		out.println("！存盘失败，处理状态不正确。");
		return;
	}
	
	ls_sql="update jc_mmydd set aztz='Y',aztzsj=?,aztzr=?,clzt='09',azsjbz=?";
	ls_sql+=" where  yddbh='"+yddbh+"' and clzt='07'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,aztzsj);
	ps.setString(2,aztzr);
	ps.setString(3,azsjbz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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