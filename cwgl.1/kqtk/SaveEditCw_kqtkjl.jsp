<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sgd=null;
double kkje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
sgd=cf.GB2Uni(request.getParameter("sgd"));
ls=request.getParameter("kkje");
try{
	if (!(ls.equals("")))  kkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣款金额]类型转换发生意外:"+e);
	return;
}
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
String qtkkbm=cf.GB2Uni(request.getParameter("qtkkbm"));
String wherekkjlh=null;
wherekkjlh=cf.GB2Uni(request.getParameter("wherekkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_kqtkjl set kkje=?,lrr=?,lrsj=?,lrbm=?,bz=?,qtkkbm=? ";
	ls_sql+=" where  (kkjlh='"+wherekkjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,kkje);
	ps.setString(2,lrr);
	ps.setDate(3,lrsj);
	ps.setString(4,lrbm);
	ps.setString(5,bz);
	ps.setString(6,qtkkbm);
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