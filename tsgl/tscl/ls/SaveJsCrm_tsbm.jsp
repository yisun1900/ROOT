<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));
String zrbm=cf.GB2Uni(request.getParameter("zrbm"));


String jsr=cf.GB2Uni(request.getParameter("jsr"));
java.sql.Date jssj=null;
ls=request.getParameter("jssj");
try{
	if (!(ls.equals("")))  jssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[接收时间]类型转换发生意外:"+e);
	return;
}

String clzt=cf.GB2Uni(request.getParameter("clzt"));

java.sql.Date jhcfasj=null;
ls=request.getParameter("jhcfasj");
try{
	if (!(ls.equals("")))  jhcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhcfasj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划出方案时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date sjcfasj=null;
ls=request.getParameter("sjcfasj");
try{
	if (!(ls.equals("")))  sjcfasj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjcfasj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际出方案时间]类型转换发生意外:"+e);
	return;
}

java.sql.Date jhjjsj=null;
ls=request.getParameter("jhjjsj");
try{
	if (!(ls.equals("")))  jhjjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjjsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划解决时间]类型转换发生意外:"+e);
	return;
}

String jssm=cf.GB2Uni(request.getParameter("jssm"));


String fashbm=cf.GB2Uni(request.getParameter("fashbm"));
String fashr=cf.GB2Uni(request.getParameter("fashr"));
String jjfa=cf.GB2Uni(request.getParameter("jjfa"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getclzt=null;
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

	if (!getclzt.equals("1"))//1：未接收；2：接收后直接出方案不需审核；4：接收后直接出方案需审核；6：已接收等待出方案；7：等待出现场后出方案；8：已出现场方案不需审核；9：已出现场方案需审核；3：已解决；5：结案
	{
		out.println("错误！已接收");
		return;
	}

	conn.setAutoCommit(false);


	ls_sql="update crm_tsjl set clzt='2'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=" where tsjlh='"+tsjlh+"' and clzt='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_tsbm set clzt=?,jsr=?,jssj=?,jhcfasj=?,sjcfasj=?,jhjjsj=?,fashbm=?,fashr=?,jjfa=?,jssm=?";
	ls_sql+=" where tsjlh='"+tsjlh+"' and tsyybm='"+tsyybm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
	ps.setString(2,jsr);
	ps.setDate(3,jssj);
	ps.setDate(4,jhcfasj);
	ps.setDate(5,sjcfasj);
	ps.setDate(6,jhjjsj);
	ps.setString(7,fashbm);
	ps.setString(8,fashr);
	ps.setString(9,jjfa);
	ps.setString(10,jssm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_tsjl set zrbmclzt=?";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,clzt);
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
	out.print("Exception: " + e);
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

