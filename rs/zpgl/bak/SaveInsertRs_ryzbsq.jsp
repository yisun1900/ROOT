<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sqbh=null;
long zbye=0;
String zbzw=null;
String fgs=null;
String dwbh=null;
String zbly=null;
String zbqt=null;
java.sql.Date xwdgsj=null;
String xb=null;
String hy=null;
String nl=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String jhzt=null;
String ztbm=null;
String lrr=null;
String ssfgs=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("zbye");
try{
	if (!(ls.equals("")))  zbye=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zbye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增补员额]类型转换发生意外:"+e);
	return;
}
zbzw=cf.GB2Uni(request.getParameter("zbzw"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
zbly=cf.GB2Uni(request.getParameter("zbly"));
zbqt=cf.GB2Uni(request.getParameter("zbqt"));
ls=request.getParameter("xwdgsj");
try{
	if (!(ls.equals("")))  xwdgsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xwdgsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[希望到岗时间]类型转换发生意外:"+e);
	return;
}
xb=cf.GB2Uni(request.getParameter("xb"));
hy=cf.GB2Uni(request.getParameter("hy"));
nl=cf.GB2Uni(request.getParameter("nl"));
xl=cf.GB2Uni(request.getParameter("xl"));
zy=cf.GB2Uni(request.getParameter("zy"));
wy=cf.GB2Uni(request.getParameter("wy"));
jsjnl=cf.GB2Uni(request.getParameter("jsjnl"));
gzjy=cf.GB2Uni(request.getParameter("gzjy"));
gx=cf.GB2Uni(request.getParameter("gx"));
jn=cf.GB2Uni(request.getParameter("jn"));
qt=cf.GB2Uni(request.getParameter("qt"));
rygznr=cf.GB2Uni(request.getParameter("rygznr"));
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
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
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;

String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(sqbh,6,3)),0)";
	ls_sql+=" from  rs_ryzbsq";
	ls_sql+=" where fgs='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	sqbh=fgs+cf.addZero(count,3);


	ls_sql="insert into rs_ryzbsq ( sqbh,zbye,zbzw,fgs,dwbh,zbly,zbqt,xwdgsj,xb,hy,nl,xl,zy,wy,gzjy,gx,jn,qt,rygznr,jhzt,ztbm,lrr,ssfgs,lrsj,bz,shjl,jsjjn ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',?,?,?,?,?,'x',? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sqbh);
	ps.setLong(2,zbye);
	ps.setString(3,zbzw);
	ps.setString(4,fgs);
	ps.setString(5,dwbh);
	ps.setString(6,zbly);
	ps.setString(7,zbqt);
	ps.setDate(8,xwdgsj);
	ps.setString(9,xb);
	ps.setString(10,hy);
	ps.setString(11,nl);
	ps.setString(12,xl);
	ps.setString(13,zy);
	ps.setString(14,wy);
	ps.setString(15,gzjy);
	ps.setString(16,gx);
	ps.setString(17,jn);
	ps.setString(18,qt);
	ps.setString(19,rygznr);
	ps.setString(20,ztbm);
	ps.setString(21,lrr);
	ps.setString(22,ssfgs);
	ps.setDate(23,lrsj);
	ps.setString(24,bz);
	ps.setString(25,jsjnl);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！生成支出编号<<%=sqbh%>>！");
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