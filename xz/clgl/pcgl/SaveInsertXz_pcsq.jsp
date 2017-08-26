<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dwbh=null;
java.sql.Date sqrq=null;
String ycsj=null;
String ycsj1=null;
String ycsj2=null;
String fhsj=null;
String fhsj1=null;
String fhsj2=null;
int gls=0;
String lxfs=null;
String mdd=null;
String ycsy=null;
String sqr=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;


dwbh=cf.GB2Uni(request.getParameter("dwbh"));
ls=request.getParameter("sqrq");
try{
	if (!(ls.equals("")))  sqrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请日期]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("gls");
try{
	if (!(ls.equals("")))  gls=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cksl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[公里数]类型转换发生意外:"+e);
	return;
}
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

ycsj=cf.GB2Uni(request.getParameter("ycsj"));
ycsj1=cf.GB2Uni(request.getParameter("ycsj1"));
ycsj2=cf.GB2Uni(request.getParameter("ycsj2"));
fhsj=cf.GB2Uni(request.getParameter("fhsj"));
fhsj1=cf.GB2Uni(request.getParameter("fhsj1"));
fhsj2=cf.GB2Uni(request.getParameter("fhsj2"));

lxfs=cf.GB2Uni(request.getParameter("lxfs"));
mdd=cf.GB2Uni(request.getParameter("mdd"));
ycsy=cf.GB2Uni(request.getParameter("ycsy"));
sqr=cf.GB2Uni(request.getParameter("sqr"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long sqxh=0;
	ls_sql="select NVL(max(sqxh)+1,1)";
	ls_sql+=" from  xz_pcsq";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	ls_sql="insert into xz_pcsq ( sqxh,dwbh,sqrq,ycsj,mdd,ycsy,sqr,lxfs,gls,fhsj,lrr,lrsj,bz,clzt ) ";
	ls_sql+=" values ( ?,?,?,TO_DATE('"+ycsj+" "+ycsj1+":"+ycsj2+":00','YYYY-MM-DD HH24:MI:SS'),?,?,?,?,?,TO_DATE('"+fhsj+" "+fhsj1+":"+fhsj2+":00','YYYY-MM-DD HH24:MI:SS'),?,?,?,'1') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sqxh);
	ps.setString(2,dwbh);
	ps.setDate(3,sqrq);
	ps.setString(4,mdd);
	ps.setString(5,ycsy);
	ps.setString(6,sqr);
	ps.setString(7,lxfs);
	ps.setDouble(8,gls);
	ps.setString(9,lrr);
	ps.setDate(10,lrsj);
	ps.setString(11,bz);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！等待派车审批");
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