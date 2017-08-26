<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String yczzsm=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
yczzsm=cf.GB2Uni(request.getParameter("yczzsm"));
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
java.sql.Date yczzsj=null;
ls=request.getParameter("yczzsj");
try{
	if (!(ls.equals("")))  yczzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yczzsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[异常终止时间]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String gcjdbm=null;
	ls_sql="select gcjdbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
	}
	rs.close();
	ps.close();

	if (gcjdbm.equals("4"))//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：客户完结；7：合同异常终止
	{
		out.println("错误！工程已完工");
		return;
	}
	else if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结");
		return;
	}
	else if (gcjdbm.equals("7"))
	{
		out.println("错误！合同已经异常终止");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_htyczz";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！已录入申请");
		return;
	}

	ls_sql="insert into crm_htyczz ( khbh,yczzsj,yczzsm,lrr,lrsj,lrbm,clzt,ygcjdbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,'1',?) ";//1：未审批；2：审批同意；3：审批不同意
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khbh);
	ps.setDate(2,yczzsj);
	ps.setString(3,yczzsm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,lrbm);
	ps.setString(7,gcjdbm);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>