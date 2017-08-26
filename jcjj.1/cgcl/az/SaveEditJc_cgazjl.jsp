<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date smrq=null;
String zcsmyybm=null;
String azqk=null;
String lrr=null;
java.sql.Date lrsj=null;
ls=request.getParameter("smrq");
try{
	if (!(ls.equals("")))  smrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量smrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上门日期]类型转换发生意外:"+e);
	return;
}
zcsmyybm=cf.GB2Uni(request.getParameter("zcsmyybm"));
azqk=cf.GB2Uni(request.getParameter("azqk"));
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
String whereddbh=null;
String wheresmrq=null;
whereddbh=cf.GB2Uni(request.getParameter("whereddbh"));
wheresmrq=cf.GB2Uni(request.getParameter("wheresmrq"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jc_cgazjl set smrq=?,zcsmyybm=?,azqk=?,lrr=?,lrsj=? ";
	ls_sql+=" where  (ddbh='"+whereddbh+"') and  (smrq=TO_DATE('"+wheresmrq+"','yyyy-mm-dd'))  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,smrq);
	ps.setString(2,zcsmyybm);
	ps.setString(3,azqk);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
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