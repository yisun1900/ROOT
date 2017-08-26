<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sqr=null;
java.sql.Date sqsj=null;
double sqzkl=0;
double sqzjxzkl=0;
String sfsqqtyh=null;
String sqqtyhnr=null;
String sqyysm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
sqr=cf.GB2Uni(request.getParameter("sqr"));
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqzkl");
try{
	if (!(ls.equals("")))  sqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqzjxzkl");
try{
	if (!(ls.equals("")))  sqzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项折扣率]类型转换发生意外:"+e);
	return;
}
sfsqqtyh=cf.GB2Uni(request.getParameter("sfsqqtyh"));
sqqtyhnr=cf.GB2Uni(request.getParameter("sqqtyhnr"));
sqyysm=cf.GB2Uni(request.getParameter("sqyysm"));
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

String zklx=cf.GB2Uni(request.getParameter("zklx"));
 
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="insert into crm_dzyhsq ( khbh,sqr,sqsj,sqzkl,sqzjxzkl,sfsqqtyh,sqqtyhnr,sqyysm,lrr,lrsj,lrbm,spbz,zklx  ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,'1',?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setString(2,sqr);
	ps.setDate(3,sqsj);
	ps.setDouble(4,sqzkl);
	ps.setDouble(5,sqzjxzkl);
	ps.setString(6,sfsqqtyh);
	ps.setString(7,sqqtyhnr);
	ps.setString(8,sqyysm);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.setString(12,zklx);
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
	out.print("<BR>存盘失败,发生意外: " + e);
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