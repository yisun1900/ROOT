<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jjfa=null;
String sjcfar=null;
java.sql.Date sjcfasj=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;

jjfa=cf.GB2Uni(request.getParameter("jjfa"));
sjcfar=cf.GB2Uni(request.getParameter("sjcfar"));
ls=request.getParameter("sjcfasj");
try{
	if (!(ls.equals("")))  sjcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjcfasj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际出方案时间]类型转换发生意外:"+e);
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

java.sql.Date jhjjsj=null;
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解决时间]类型转换发生意外:"+e);
	return;
}

String sffswxf=request.getParameter("sffswxf");
String sfnbcf=request.getParameter("sfnbcf");

double wxfze=0;
ls=request.getParameter("wxfze");
try{
	if (!(ls.equals("")))  wxfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wxfze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[维修费总额]类型转换发生意外:"+e);
	return;
}
double nbcfze=0;
ls=request.getParameter("nbcfze");
try{
	if (!(ls.equals("")))  nbcfze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量nbcfze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[内部处罚总额]类型转换发生意外:"+e);
	return;
}
String clzt=cf.GB2Uni(request.getParameter("clzt"));

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String cfajlh=cf.GB2Uni(request.getParameter("cfajlh"));
String dwbh=request.getParameter("dwbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	String getclzt="";
	ls_sql="select clzt";
	ls_sql+=" from  crm_tsbm";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getclzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	if ( !getclzt.equals("7") && !getclzt.equals("8"))//1：未接收；2：已接收等待出方案；4：已接收等待出现场；6：已出现场等待出方案；7：已出方案等待审核；8：已出方案不需审核；9：方案审核通过；A：方案审核未通过；3：已解决；B:回访未解决；5：结案
	{
		out.println("错误！处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update crm_tsbxfajl set jjfa=?,sjcfar=?,sjcfasj=?,jhjjsj=?,sffswxf=?,wxfze=?,sfnbcf=?,nbcfze=?,lrr=?,lrsj=?,lrbm=? ";
	ls_sql+=" where cfajlh='"+cfajlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjfa);
	ps.setString(2,sjcfar);
	ps.setDate(3,sjcfasj);
	ps.setDate(4,jhjjsj);
	ps.setString(5,sffswxf);
	ps.setDouble(6,wxfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,lrbm);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_tsbm set jjfa=?,sjcfar=?,sjcfasj=?,jhjjsj=?,sffswxf=?,wxfze=?,sfnbcf=?,nbcfze=?,clzt=? ";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jjfa);
	ps.setString(2,sjcfar);
	ps.setDate(3,sjcfasj);
	ps.setDate(4,jhjjsj);
	ps.setString(5,sffswxf);
	ps.setDouble(6,wxfze);
	ps.setString(7,sfnbcf);
	ps.setDouble(8,nbcfze);
	ps.setString(9,clzt);
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