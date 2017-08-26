<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String bgypbm=null;
String dwbh=null;
String slr=null;
String lrr=null;
java.sql.Date lrrq=null;
long slqsl=0;
java.sql.Date lqsj=null;
String bz=null;
bgypbm=cf.GB2Uni(request.getParameter("bgypbm"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
slr=cf.GB2Uni(request.getParameter("slr"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrrq");
try{
	if (!(ls.equals("")))  lrrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("slqsl");
try{
	if (!(ls.equals("")))  slqsl=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量slqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领取数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lqsj");
String lqsjstr=ls;
try{
	if (!(ls.equals("")))  lqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[领取日期]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String MonStart=lqsjstr.substring(0,8)+"01";
String MonEnd=cf.lastDay(lqsjstr.substring(0,4),lqsjstr.substring(5,7));

try {
	conn=cf.getConnection();

	double ylqje=0;
	double wlqje=0;
	double xlqje=0;
	double alllqje=0;
	
	double bzje=0;

	ls_sql="select je";
	ls_sql+=" from  oa_bgypbz";
	ls_sql+=" where dwbh='"+dwbh+"' and xm='"+slr+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzje=rs.getDouble(1);
	}
	ps.close();
	rs.close();

	//已领取金额
	ls_sql="select sum(dj*slqsl)";
	ls_sql+=" from  oa_lqsq,oa_bgypbm";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and lqzt='Y' ";
	ls_sql+=" and lqsj>=TO_DATE('"+MonStart+"','YYYY-MM-DD')";
	ls_sql+=" and lqsj<=TO_DATE('"+MonEnd+"','YYYY-MM-DD')";
	ls_sql+=" and slr='"+slr+"' and dwbh='"+dwbh+"'";
	ls_sql+=" and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ylqje=rs.getDouble(1);
	}
	ps.close();
	rs.close();

	//未领取金额
	ls_sql="select sum(dj*jhlqsl)";
	ls_sql+=" from  oa_lqsq,oa_bgypbm";
	ls_sql+=" where oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
	ls_sql+=" and lqzt='N' ";
	ls_sql+=" and jhlqrq>=TO_DATE('"+MonStart+"','YYYY-MM-DD')";
	ls_sql+=" and jhlqrq<=TO_DATE('"+MonEnd+"','YYYY-MM-DD')";
	ls_sql+=" and slr='"+slr+"' and dwbh='"+dwbh+"'";
	ls_sql+=" and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wlqje=rs.getDouble(1);
	}
	ps.close();
	rs.close();
	
	//查询单价
	double dj=0;
	ls_sql="select dj";
	ls_sql+=" from  oa_bgypbm";
	ls_sql+=" where bgypbm='"+bgypbm+"'";
	ls_sql+=" and oa_bgypbm.fgsbh=(select ssfgs from sq_dwxx where dwbh='"+dwbh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dj=rs.getDouble(1);
	}
	ps.close();
	rs.close();

	xlqje=slqsl*dj;


	alllqje=ylqje+wlqje+xlqje;

	if (alllqje>bzje)
	{
		out.println("！！！警告本月领取已超标，标准为："+bzje);
		out.println("<BR>目前累计："+alllqje+",其中已领:"+ylqje+";未领:"+wlqje+";本次申请:"+xlqje);
//		return;
	}
	
	//客户编号
	int xh=0;
	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  oa_lqsq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	ps.close();
	rs.close();

	ls_sql="insert into oa_lqsq ( bgypbm,dwbh,slr,lrr,lrrq,slqsl,lqsj,bz,xh,lqzt,lqlx,blr,jhlqsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,SYSDATE,?,?,'Y','2',?,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,bgypbm);
	ps.setString(2,dwbh);
	ps.setString(3,slr);
	ps.setString(4,lrr);
	ps.setDate(5,lrrq);
	ps.setLong(6,slqsl);
	ps.setString(7,bz);
	ps.setInt(8,xh);
	ps.setString(9,lrr);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！生成申请序号<%=xh%>");
	window.close();
	//-->
	</SCRIPT>
	<%
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