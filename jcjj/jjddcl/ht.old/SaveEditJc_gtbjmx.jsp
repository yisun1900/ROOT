<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String gtxh=null;
String ddbh=null;
String bjmc=null;
String bcpp=null;
long bchd=0;
double bzdj=0;
long cd=0;
long kd=0;
long sl=0;
double je=0;
String bz=null;
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
bjmc=cf.GB2Uni(request.getParameter("bjmc"));
bcpp=cf.GB2Uni(request.getParameter("bcpp"));
ls=request.getParameter("bchd");
try{
	if (!(ls.equals("")))  bchd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bchd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[板材厚度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("bzdj");
try{
	if (!(ls.equals("")))  bzdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bzdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[标准单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cd");
try{
	if (!(ls.equals("")))  cd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[长度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kd");
try{
	if (!(ls.equals("")))  kd=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kd不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[宽度]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("je");
try{
	if (!(ls.equals("")))  je=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量je不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[金额]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wherebjxh=null;
wherebjxh=cf.GB2Uni(request.getParameter("wherebjxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	ls_sql="select clzt";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_gtbjmx set gtxh=?,ddbh=?,bjmc=?,bcpp=?,bchd=?,bzdj=?,khdj=?,cd=?,kd=?,sl=?,je=?,bz=? ";
	ls_sql+=" where  (bjxh="+wherebjxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gtxh);
	ps.setString(2,ddbh);
	ps.setString(3,bjmc);
	ps.setString(4,bcpp);
	ps.setLong(5,bchd);
	ps.setDouble(6,bzdj);
	ps.setDouble(7,bzdj);
	ps.setLong(8,cd);
	ps.setLong(9,kd);
	ps.setLong(10,sl);
	ps.setDouble(11,je);
	ps.setString(12,bz);
	ps.executeUpdate();
	ps.close();

	//板材部分金额
	double bcbfje=0;
	ls_sql="select sum(je)";
	ls_sql+=" from  jc_gtbjmx";
	ls_sql+=" where  (gtxh='"+gtxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bcbfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update jc_jjgtmx set bcbfje=?,zj=pjbfje+? ";
	ls_sql+=" where  (gtxh='"+gtxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,bcbfje);
	ps.setDouble(2,bcbfje);
	ps.executeUpdate();
	ps.close();
	
	double jjje=0;
	double cpjjje=0;
	double xcmje=0;
	double htze=0;

	//家具合同金额
	ls_sql="select sum(zj)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//成品家具合同金额
	ls_sql="select sum(zj)";
	ls_sql+=" from  jc_cpjjddmx";
	ls_sql+=" where ddbh='"+whereddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	jjje=jjje+cpjjje;

	//型材门合同金额
	ls_sql="select sum(zj)";
	ls_sql+=" from  jc_jjxcmmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//合同总额
	htze=jjje+xcmje;

	ls_sql="update jc_jjdd set jjje=?,xcmje=?,htze=?,wdzje=?,jjzjje=?,xcmzjje=?,zjhze=?";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,jjje);
	ps.setDouble(2,xcmje);
	ps.setDouble(3,htze);
	ps.setDouble(4,htze);
	ps.setDouble(5,jjje);
	ps.setDouble(6,xcmje);
	ps.setDouble(7,htze);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	parent.close();
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>