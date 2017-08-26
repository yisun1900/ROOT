<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String txbt=null;
String txnr=null;
String txfl=null;
String sfyxkhly=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
txbt=cf.GB2Uni(request.getParameter("txbt"));
txnr=cf.GB2Uni(request.getParameter("txnr"));
txfl=cf.GB2Uni(request.getParameter("txfl"));
sfyxkhly=cf.GB2Uni(request.getParameter("sfyxkhly"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String txdj=cf.GB2Uni(request.getParameter("txdj"));


String wheretxxh=null;
wheretxxh=cf.GB2Uni(request.getParameter("wheretxxh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update hd_zyxxtx set txbt=?,txnr=?,txfl=?,sfyxkhly=?,lrr=?,lrsj=?,lrbm=?,bz=?,txdj=? ";
	ls_sql+=" where  (txxh='"+wheretxxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,txbt);
	ps.setString(2,txnr);
	ps.setString(3,txfl);
	ps.setString(4,sfyxkhly);
	ps.setString(5,lrr);
	ps.setDate(6,lrsj);
	ps.setString(7,lrbm);
	ps.setString(8,bz);
	ps.setString(9,txdj);
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