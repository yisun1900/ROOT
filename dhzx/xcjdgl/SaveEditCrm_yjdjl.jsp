<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date sqrq=null;
String sqr=null;
String sqrlxdh=null;
java.sql.Date jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sqrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}
sqr=cf.GB2Uni(request.getParameter("sqr"));
sqrlxdh=cf.GB2Uni(request.getParameter("sqrlxdh"));
ls=request.getParameter("jhjdrq");
try{
	if (!(ls.equals("")))  jhjdrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjdrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划预交底日期]类型转换发生意外:"+e);
	return;
}
//ls=request.getParameter("jhjdsj");
//try{
//	if (!(ls.equals("")))  jhjdsj=Long.parseLong(ls.trim());
//}
//catch (java.lang.NullPointerException nulle){
//	out.println("<BR>变量[jhjdsj]不存在");
//	return;
//}
//catch (Exception e){
//	out.println("<BR>[计划预交底时间]类型转换发生意外:"+e);
//	return;
//}
sqsm=cf.GB2Uni(request.getParameter("sqsm"));
jhjdsj=cf.GB2Uni(request.getParameter("jhjdsj"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
String jdjlh=null;
jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="update crm_yjdjl set sqrq=?,sqr=?,sqrlxdh=?,jhjdrq=?,jhjdsj=?,sqsm=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqrq);
	ps.setString(2,sqr);
	ps.setString(3,sqrlxdh);
	ps.setDate(4,jhjdrq);
	ps.setString(5,jhjdsj);
	ps.setString(6,sqsm);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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