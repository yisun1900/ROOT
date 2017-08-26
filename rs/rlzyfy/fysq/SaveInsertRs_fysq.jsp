<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String fysqbh=null;
String fgs=null;
java.sql.Date sqsj=null;
String xqlx=null;
String ytxs=null;
double fy=0;
String bz=null;
String hzbh=null;
String sfkg=null;
String lrr=null;
String nianyue=null;

int count=0;
java.sql.Date lrsj=null;
fgs=cf.GB2Uni(request.getParameter("fgs"));
ls=request.getParameter("sqsj");
nianyue=ls;
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
xqlx=cf.GB2Uni(request.getParameter("xqlx"));
ytxs=cf.GB2Uni(request.getParameter("ytxs"));
ls=request.getParameter("fy");
try{
	if (!(ls.equals("")))  fy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[费用]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
sfkg=cf.GB2Uni(request.getParameter("sfkg"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	//自动产生序号
	ls_sql="select NVL(max(substr(fysqbh,6,5)),0)";
	ls_sql+=" from  rs_fysq";
	ls_sql+=" where fgs='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	fysqbh=fgs+cf.addZero(count,5);
	hzbh=fgs+nianyue.substring(0,4)+nianyue.substring(5,7);
//如果提交则不能加入新纪录
	String kgbz=null;
	ls_sql="select distinct sfkg";
	ls_sql+=" from  rs_fysq";
	ls_sql+=" where hzbh='"+hzbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kgbz=rs.getString("sfkg");
	}
	rs.close();
	ps.close();

	if ((kgbz!="") && (kgbz!=null) && (kgbz.equals("N")))
	{
	out.print("已经提交，不能插入新纪录");
	return;
	}
	ls_sql="insert into rs_fysq ( fysqbh,fgs,sqsj,xqlx,ytxs,fy,bz,hzbh,sfkg,lrr,lrsj ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,'Y',?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fysqbh);
	ps.setString(2,fgs);
	ps.setDate(3,sqsj);
	ps.setString(4,xqlx);
	ps.setString(5,ytxs);
	ps.setDouble(6,fy);
	ps.setString(7,bz);
	ps.setString(8,hzbh);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！申请编号：<<%=fysqbh%>>");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e+ls_sql);
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