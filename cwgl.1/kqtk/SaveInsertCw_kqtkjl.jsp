<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String sgd=null;
double kkje=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
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
String kkjlh=cf.GB2Uni(request.getParameter("kkjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="insert into cw_kqtkjl ( kkjlh,sgd,kkje,lrr,lrsj,lrbm,spbz,jsbz,bz,qtkkbm,khbh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,'2','N',?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kkjlh);
	ps.setString(2,sgd);
	ps.setDouble(3,kkje);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
	ps.setString(7,bz);
	ps.setString(8,qtkkbm);
	ps.setString(9,khbh);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>