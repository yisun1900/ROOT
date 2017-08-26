<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xcqk=null;
String cxcr=null;
java.sql.Date cxcsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;

xcqk=cf.GB2Uni(request.getParameter("xcqk"));
cxcr=cf.GB2Uni(request.getParameter("cxcr"));
ls=request.getParameter("cxcsj");
try{
	if (!(ls.equals("")))  cxcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[勘查时间]类型转换发生意外:"+e);
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

java.sql.Date jhcfasj=null;
ls=request.getParameter("jhcfasj");
try{
	if (!(ls.equals("")))  jhcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhcfasj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出方案时]类型转换发生意外:"+e);
	return;
}

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String kcjlh=cf.GB2Uni(request.getParameter("kcjlh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String ykcjlh="";
	String getclzt="";
	ls_sql="select kcjlh,clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
		ykcjlh=cf.fillNull(rs.getString("kcjlh"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("4"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into crm_tsbxxckcjl ( kcjlh,tsjlh,tsyybm,xcqk,cxcr,cxcsj,jhcfasj,lrr,lrsj,lrbm,ykcjlh ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kcjlh);
	ps.setString(2,tsjlh);
	ps.setString(3,tsyybm);
	ps.setString(4,xcqk);
	ps.setString(5,cxcr);
	ps.setDate(6,cxcsj);
	ps.setDate(7,jhcfasj);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrbm);
	ps.setString(11,ykcjlh);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set clzt='5',zrbmclzt='6'";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set cxcsm=?,sjcxcr=?,sjcxcsj=?,jhcfasj=?,kcjlh=?,clzt='6'";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xcqk);
	ps.setString(2,cxcr);
	ps.setDate(3,cxcsj);
	ps.setDate(4,jhcfasj);
	ps.setString(5,kcjlh);
	ps.executeUpdate();
	ps.close();

	conn.commit();

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
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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