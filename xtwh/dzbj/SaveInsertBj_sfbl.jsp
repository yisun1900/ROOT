<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sfxmbm=null;
double sfbfb=0;
double qsz=0;
double jzz=0;
String dqbm=null;
sfxmbm=cf.GB2Uni(request.getParameter("sfxmbm"));
ls=request.getParameter("sfbfb");
try{
	if (!(ls.equals("")))  sfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sfbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收费百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("qsz");
try{
	if (!(ls.equals("")))  qsz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量qsz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[起始值>]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzz");
try{
	if (!(ls.equals("")))  jzz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzz不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[截止值<=]类型转换发生意外:"+e);
	return;
}
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_sfbl";
	ls_sql+=" where sfxmbm='"+sfxmbm+"' and dqbm='"+dqbm+"' and sfbfb="+sfbfb;
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
		out.println("错误！百分比["+sfbfb+"%]录入重复:");
		return;
	}
	
	
	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  bj_sfbl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xh++;
	
	
	ls_sql="insert into bj_sfbl ( xh,sfxmbm,sfbfb,qsz,jzz,dqbm ) ";
	ls_sql+=" values ( ?,'"+sfxmbm+"',?,?,?,'"+dqbm+"' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setDouble(2,sfbfb);
	ps.setDouble(3,qsz);
	ps.setDouble(4,jzz);
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