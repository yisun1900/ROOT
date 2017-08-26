<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String zjxbh=null;
String ddbh=null;
String khbh=null;
String zczjxyybm=null;
double zjxze=0;
java.sql.Date htshsj=null;
String lrr=null;
java.sql.Date lrsj=null;
String dwbh=null;
String bz=null;
zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
ddbh=cf.GB2Uni(request.getParameter("ddbh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
zczjxyybm=cf.GB2Uni(request.getParameter("zczjxyybm"));
ls=request.getParameter("zjxze");
try{
	if (!(ls.equals("")))  zjxze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxze不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("htshsj");
try{
	if (!(ls.equals("")))  htshsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htshsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同送货时间]类型转换发生意外:"+e);
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
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ddlx=cf.GB2Uni(request.getParameter("ddlx"));

java.sql.Date zjxfssj=null;
ls=request.getParameter("zjxfssj");
try{
	if (!(ls.equals("")))  zjxfssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxfssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}

double zjxzkl=0;
ls=request.getParameter("zjxzkl");
try{
	if (!(ls.equals("")))  zjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项折扣]类型转换发生意外:"+e);
	return;
}
String dzyy=cf.GB2Uni(request.getParameter("dzyy"));

String fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String qddm=cf.GB2Uni(request.getParameter("qddm"));
String jzsjs=cf.GB2Uni(request.getParameter("jzsjs"));
String zcdlbm=cf.GB2Uni(request.getParameter("zcdlbm"));
String zcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
String ppbm=cf.GB2Uni(request.getParameter("ppbm"));
String gys=cf.GB2Uni(request.getParameter("gys"));
String ppmc=cf.GB2Uni(request.getParameter("ppmc"));
String clgw=cf.GB2Uni(request.getParameter("clgw"));
String ztjjgw=cf.GB2Uni(request.getParameter("ztjjgw"));
String xmzy=cf.GB2Uni(request.getParameter("xmzy"));
String jjsjs=cf.GB2Uni(request.getParameter("jjsjs"));
String khjl=cf.GB2Uni(request.getParameter("khjl"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql=" select kjxsj-SYSDATE";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count<0)
	{
		out.println("提醒！已超出可减项截止时间");
	}

	conn.setAutoCommit(false);

	ls_sql="update jc_zcdd set zjxbh='"+zjxbh+"'";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into jc_zczjx ( ddbh,zjxbh,khbh,zczjxyybm,zqzjxze,zjxze,zjxcxhdje,zjxcbze,zjxzkl,dzyy   ,htshsj,ddlx,zjxfssj,fgsbh,qddm,jzsjs,zcdlbm,zcxlbm,ppbm,gys    ,ppmc,clgw,ztjjgw,xmzy,jjsjs,khjl,lrr,lrsj,dwbh,bz,clzt ";
	ls_sql+=" ,zqzjxclf,zhzjxclf,zjxycf,zjxqtf,sfck,ycksl,yckje,zsje,sfjs,sfjrht,jmje,zjxyjjrje,sskje,shsskje  ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,SYSDATE,?,?,'00','0',0,0 ";
	ls_sql+=" ,0,0,0,0,0,'N','N',0,0,0,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ddbh);
	ps.setString(2,zjxbh);
	ps.setString(3,khbh);
	ps.setString(4,zczjxyybm);
	ps.setDouble(5,zjxze);
	ps.setDouble(6,zjxze);
	ps.setDouble(7,0);
	ps.setDouble(8,0);
	ps.setDouble(9,zjxzkl);
	ps.setString(10,dzyy);

	ps.setDate(11,htshsj);
	ps.setString(12,ddlx);
	ps.setDate(13,zjxfssj);
	ps.setString(14,fgsbh);
	ps.setString(15,qddm);
	ps.setString(16,jzsjs);
	ps.setString(17,zcdlbm);
	ps.setString(18,zcxlbm);
	ps.setString(19,ppbm);
	ps.setString(20,gys);

	ps.setString(21,ppmc);
	ps.setString(22,clgw);
	ps.setString(23,ztjjgw);
	ps.setString(24,xmzy);
	ps.setString(25,jjsjs);
	ps.setString(26,khjl);
	ps.setString(27,lrr);
	ps.setString(28,dwbh);
	ps.setString(29,bz);

	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
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