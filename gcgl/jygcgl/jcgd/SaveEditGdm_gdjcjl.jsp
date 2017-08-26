<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjr=null;
java.sql.Date xjsj=null;
String jclxbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String jcjgbm=request.getParameter("jcjgbm");
xjr=cf.GB2Uni(request.getParameter("xjr"));
ls=request.getParameter("xjsj");
try{
	if (!(ls.equals("")))  xjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[检查时间]类型转换发生意外:"+e);
	return;
}
jclxbm=cf.GB2Uni(request.getParameter("jclxbm"));
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
bz=cf.GB2Uni(request.getParameter("bz"));
String jcwtflbm=cf.GB2Uni(request.getParameter("jcwtflbm"));
double jlje=0;
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jlje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}
String sffszg=cf.GB2Uni(request.getParameter("sffszg"));
String xxlybm=cf.GB2Uni(request.getParameter("xxlybm"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));

String jcjlh=null;
jcjlh=cf.GB2Uni(request.getParameter("jcjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  gdm_gdjcjl";
	ls_sql+=" where jcjlh='"+jcjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("存盘失败！该施工队检查记录已审批");
		return;
	}

	String zrr=null;
	ls_sql="select yhmc";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zrr=rs.getString("yhmc");
	}
	rs.close();
	ps.close();

	ls_sql="update gdm_gdjcjl set xjr=?,xjsj=?,jclxbm=?,lrr=?,lrsj=?,bz=?,jcjgbm=?,jcwtflbm=?,jlje=?,xxlybm=?,sffszg=?,dwbh=?,zrr=?,ygbh=? ";
	ls_sql+=" where  (jcjlh='"+jcjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjr);
	ps.setDate(2,xjsj);
	ps.setString(3,jclxbm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setString(7,jcjgbm);
	ps.setString(8,jcwtflbm);
	ps.setDouble(9,jlje);
	ps.setString(10,xxlybm);
	ps.setString(11,sffszg);
	ps.setString(12,dwbh);
	ps.setString(13,zrr);
	ps.setString(14,ygbh);
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
	out.print("Exception: " + e);
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