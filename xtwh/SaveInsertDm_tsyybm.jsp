<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tsyybm=null;
String tsyymc=null;
String tslxbm=null;
String tsxlbm=null;
int zjkf=0;
long px=0;
tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
tsyymc=cf.GB2Uni(request.getParameter("tsyymc"));
tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
ls=request.getParameter("zjkf");
try{
	if (!(ls.equals("")))  zjkf=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjkf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[质检扣分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("px");
try{
	if (!(ls.equals("")))  px=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量px不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[显示顺序]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into dm_tsyybm ( tsyybm,tsyymc,tslxbm,tsxlbm,px,zjkf ) ";
	ls_sql+=" values ( ?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsyybm);
	ps.setString(2,tsyymc);
	ps.setString(3,tslxbm);
	ps.setString(4,tsxlbm);
	ps.setLong(5,px);
	ps.setInt(6,zjkf);
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
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>