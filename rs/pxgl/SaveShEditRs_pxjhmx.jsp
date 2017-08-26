<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String pxlx=null;
String skxs=null;
String kclx=null;
String pxkc=null;
String kcnr=null;
String pxcd=null;
String pxjhbh=null;

long pxrs=0;
double pxfy=0;
long gcrs=0;
long zcrs=0;
long jcrs=0;
long ypxrs=0;//rs_pxjhmx
double ypxfy=0;//rs_pxjhmx
long zpxrs=0;//rs_pxjh
double zpxfy=0;//rs_pxjh

String pxjs=null;
String bz=null;
skxs=cf.GB2Uni(request.getParameter("skxs"));
kclx=cf.GB2Uni(request.getParameter("kclx"));
pxkc=cf.GB2Uni(request.getParameter("pxkc"));
kcnr=cf.GB2Uni(request.getParameter("kcnr"));
pxcd=cf.GB2Uni(request.getParameter("pxcd"));
pxlx=cf.GB2Uni(request.getParameter("pxlx"));

ls=request.getParameter("pxrs");
try{
	if (!(ls.equals("")))  pxrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("pxfy");
try{
	if (!(ls.equals("")))  pxfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pxfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[培训费用]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("gcrs");
try{
	if (!(ls.equals("")))  gcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高层人数]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("zcrs");
try{
	if (!(ls.equals("")))  zcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[中层人数]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("jcrs");
try{
	if (!(ls.equals("")))  jcrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jcrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[基层人数]类型转换发生意外:"+e);
	return;
}
pxjs=cf.GB2Uni(request.getParameter("pxjs"));
bz=cf.GB2Uni(request.getParameter("bz"));
String wherepxmxbh=null;
wherepxmxbh=cf.GB2Uni(request.getParameter("wherepxmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
//Rs_pxjhmx
	ls_sql="select pxrs,pxfy,pxjhbh ";
	ls_sql+=" from  rs_pxjhmx";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxjhbh=rs.getString("pxjhbh");
		ypxrs=rs.getLong("pxrs");
		ypxfy=rs.getDouble("pxfy");
	}
	rs.close();
	ps.close();
//Rs_pxjh
	ls_sql="select pxrs,pxfy ";
	ls_sql+=" from  rs_pxjh";
	ls_sql+=" where  (pxjhbh='"+pxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpxrs=rs.getLong("pxrs");
		zpxfy=rs.getDouble("pxfy");
	}
	rs.close();
	ps.close();
//计算出修改明细后计划汇总培训人数和培训费用
	zpxrs+=pxrs-ypxrs;
	zpxfy+=pxfy-ypxfy;

	conn.setAutoCommit(false);
//更新Rs_pxjh中人数费用
	ls_sql="update rs_pxjh set pxrs=?,pxfy=? ";
	ls_sql+=" where  (pxjhbh='"+pxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,pxrs);
	ps.setDouble(2,pxfy);
	ps.executeUpdate();
	ps.close();

	ls_sql="update rs_pxjhmx set skxs=?,kclx=?,pxkc=?,kcnr=?,pxcd=?,pxrs=?,pxfy=?,pxjs=?,bz=?,pxlx=?,gcrs=?,zcrs=?,jcrs=? ";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,skxs);
	ps.setString(2,kclx);
	ps.setString(3,pxkc);
	ps.setString(4,kcnr);
	ps.setString(5,pxcd);
	ps.setLong(6,pxrs);
	ps.setDouble(7,pxfy);
	ps.setString(8,pxjs);
	ps.setString(9,bz);
	ps.setString(10,pxlx);
	ps.setLong(11,gcrs);
	ps.setLong(12,zcrs);
	ps.setLong(13,jcrs);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功!");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e+ls_sql	 );
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
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>