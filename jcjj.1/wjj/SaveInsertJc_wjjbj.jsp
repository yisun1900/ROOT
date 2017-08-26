<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
int xh=0;
String wjjbm=null;
String xinghao=null;
String jldw=null;
double dj=0;
String bz=null;
wjjbm=cf.GB2Uni(request.getParameter("wjjbm"));
xinghao=cf.GB2Uni(request.getParameter("xinghao"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String wjazwzbm=cf.GB2Uni(request.getParameter("wjazwzbm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wjmc=cf.GB2Uni(request.getParameter("wjmc"));

String dqbm=request.getParameter("dqbm");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String lrbm=cf.GB2Uni(request.getParameter("lrbm"));
java.sql.Date lrsj=null;
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

	ls_sql="select NVL(max(xh)+1,1)";
	ls_sql+=" from  jc_wjjbj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="insert into jc_wjjbj ( xh,wjjbm,xinghao,jldw,dj,dwbh,bz,wjazwzbm,wjmc  ,dqbm,lrr,lrsj,lrbm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?  ,?,?,SYSDATE,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setInt(1,xh);
	ps.setString(2,wjjbm);
	ps.setString(3,xinghao);
	ps.setString(4,jldw);
	ps.setDouble(5,dj);
	ps.setString(6,dwbh);
	ps.setString(7,bz);
	ps.setString(8,wjazwzbm);
	ps.setString(9,wjmc);

	ps.setString(10,dqbm);
	ps.setString(11,lrr);
	ps.setString(12,lrbm);
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