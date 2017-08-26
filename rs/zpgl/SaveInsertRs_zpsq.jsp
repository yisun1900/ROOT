<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zpsqbh=null;
String fgs=null;
String sqbm=null;
String zbzw=null;
long zprs=0;
double zpfy=0;
String zbly=null;
String zbqt=null;
java.sql.Date xwdgsj=null;
String xbyq=null;
String hyyq=null;
String nlyq=null;
String xl=null;
String zy=null;
String wy=null;
String jsjnl=null;
String gzjy=null;
String gx=null;
String jn=null;
String qt=null;
String rygznr=null;
String sqzt=null;
String ztbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String ssfgs=null;
String bz=null;
zpsqbh=cf.GB2Uni(request.getParameter("zpsqbh"));
fgs=cf.GB2Uni(request.getParameter("fgs"));
sqbm=cf.GB2Uni(request.getParameter("sqbm"));
zbzw=cf.GB2Uni(request.getParameter("zbzw"));
ls=request.getParameter("zprs");
try{
	if (!(ls.equals("")))  zprs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zprs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增补员额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zpfy");
try{
	if (!(ls.equals("")))  zpfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zpfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[招聘费用]类型转换发生意外:"+e);
	return;
}
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
xbyq=cf.GB2Uni(request.getParameter("xbyq"));
hyyq=cf.GB2Uni(request.getParameter("hyyq"));
nlyq=cf.GB2Uni(request.getParameter("nlyq"));
xl=cf.GB2Uni(request.getParameter("xl"));
zy=cf.GB2Uni(request.getParameter("zy"));
wy=cf.GB2Uni(request.getParameter("wy"));
jsjnl=cf.GB2Uni(request.getParameter("jsjnl"));
gzjy=cf.GB2Uni(request.getParameter("gzjy"));
gx=cf.GB2Uni(request.getParameter("gx"));
jn=cf.GB2Uni(request.getParameter("jn"));
qt=cf.GB2Uni(request.getParameter("qt"));
rygznr=cf.GB2Uni(request.getParameter("rygznr"));
sqzt=cf.GB2Uni(request.getParameter("sqzt"));
ztbm=cf.GB2Uni(request.getParameter("ztbm"));
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
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(zpsqbh,6,5)),0)";
	ls_sql+=" from  rs_zpsq";
	ls_sql+=" where fgs='"+fgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
	}
	rs.close();
	ps.close();

	zpsqbh=fgs+cf.addZero(count,5);

	ls_sql="insert into rs_zpsq ( zpsqbh,fgs,sqbm,zbzw,zprs,zpfy,zbly,zbqt,xwdgsj,xbyq,hyyq,nlyq,xl,zy,wy,jsjnl,gzjy,gx,jn,qt,rygznr,sqzt,ztbm,lrr,lrsj,ssfgs,bz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'01',?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zpsqbh);
	ps.setString(2,fgs);
	ps.setString(3,sqbm);
	ps.setString(4,zbzw);
	ps.setLong(5,zprs);
	ps.setDouble(6,zpfy);
	ps.setString(7,zbly);
	ps.setString(8,zbqt);
	ps.setDate(9,xwdgsj);
	ps.setString(10,xbyq);
	ps.setString(11,hyyq);
	ps.setString(12,nlyq);
	ps.setString(13,xl);
	ps.setString(14,zy);
	ps.setString(15,wy);
	ps.setString(16,jsjnl);
	ps.setString(17,gzjy);
	ps.setString(18,gx);
	ps.setString(19,jn);
	ps.setString(20,qt);
	ps.setString(21,rygznr);
	ps.setString(22,ztbm);
	ps.setString(23,lrr);
	ps.setDate(24,lrsj);
	ps.setString(25,ssfgs);
	ps.setString(26,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！生成招聘申请编号<<%=zpsqbh%>>！");
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
		if (rs!= null) rs.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>