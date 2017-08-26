<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tsxlbm=null;
String tsxlmc=null;
String tslxbm=null;
long px=0;
tsxlbm=cf.GB2Uni(request.getParameter("tsxlbm"));
tsxlmc=cf.GB2Uni(request.getParameter("tsxlmc"));
tslxbm=cf.GB2Uni(request.getParameter("tslxbm"));
ls=request.getParameter("px");
try{
	if (!(ls.equals("")))  px=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量px不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[排序]类型转换发生意外:"+e);
	return;
}
String wheretsxlbm=null;
wheretsxlbm=cf.GB2Uni(request.getParameter("wheretsxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update dm_tsxlbm set tsxlbm=?,tsxlmc=?,tslxbm=?,px=? ";
	ls_sql+=" where  (tsxlbm='"+wheretsxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,tsxlbm);
	ps.setString(2,tsxlmc);
	ps.setString(3,tslxbm);
	ps.setLong(4,px);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>