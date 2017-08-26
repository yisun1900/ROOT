<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ls=null;
String clmc=null;
String sfyh=null;
String cldlbm=null;
String clxlbm=null;
String xh=null;
String gg=null;
double lsj=0;
double xsj=0;
String ppmc=null;
String zp=null;
String bz=null;
String cllbbm=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
long pjts=0;
clmc=cf.GB2Uni(request.getParameter("clmc"));
sfyh=cf.GB2Uni(request.getParameter("sfyh"));
cldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
xh=cf.GB2Uni(request.getParameter("xh"));
gg=cf.GB2Uni(request.getParameter("gg"));
ls=request.getParameter("lsj");
try{
	if (!(ls.equals("")))  lsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[零售价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xsj");
try{
	if (!(ls.equals("")))  xsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[优惠价]类型转换发生意外:"+e);
	return;
}
ppmc=cf.GB2Uni(request.getParameter("ppmc"));
zp=cf.GB2Uni(request.getParameter("zp"));
bz=cf.GB2Uni(request.getParameter("bz"));
cllbbm=cf.GB2Uni(request.getParameter("cllbbm"));
clysbm=cf.GB2Uni(request.getParameter("clysbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));
sfbhpj=cf.GB2Uni(request.getParameter("sfbhpj"));
ls=request.getParameter("pjts");
try{
	if (!(ls.equals("")))  pjts=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pjts不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配件套数]类型转换发生意外:"+e);
	return;
}

double cbj=0;
double cxcbj=0;
double lscxhdbl=0;
String sfycx=null;
double cxj=0;
java.sql.Date cxkssj=null;
java.sql.Date cxjzsj=null;

ls=request.getParameter("cbj");
try{
	if (!(ls.equals("")))  cbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxcbj");
try{
	if (!(ls.equals("")))  cxcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxcbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结算价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lscxhdbl");
try{
	if (!(ls.equals("")))  lscxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lscxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销期计入活动比例]类型转换发生意外:"+e);
	return;
}
sfycx=request.getParameter("sfycx");
ls=request.getParameter("cxj");
try{
	if (!(ls.equals("")))  cxj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxkssj");
try{
	if (!(ls.equals("")))  cxkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxkssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("cxjzsj");
try{
	if (!(ls.equals("")))  cxjzsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjzsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结束时间]类型转换发生意外:"+e);
	return;
}

double jsbl=0;
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
double cxhdbl=0;
ls=request.getParameter("cxhdbl");
try{
	if (!(ls.equals("")))  cxhdbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计入促销活动比例]类型转换发生意外:"+e);
	return;
}
String cpjb=cf.GB2Uni(request.getParameter("cpjb"));
String fgsx=cf.GB2Uni(request.getParameter("fgsx"));
String cd=cf.GB2Uni(request.getParameter("cd"));
String cpsm=cf.GB2Uni(request.getParameter("cpsm"));
String sftjcp=request.getParameter("sftjcp");
String nbbm=cf.GB2Uni(request.getParameter("nbbm"));

String xsfs=cf.GB2Uni(request.getParameter("xsfs"));
String jsfs=cf.GB2Uni(request.getParameter("jsfs"));
double zdxsj=0;
ls=request.getParameter("zdxsj");
try{
	if (!(ls.equals("")))  zdxsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最低销售限价]类型转换发生意外:"+e);
	return;
}
double yjjrj=0;
ls=request.getParameter("yjjrj");
try{
	if (!(ls.equals("")))  yjjrj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjjrj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[业绩记入价]类型转换发生意外:"+e);
	return;
}
double cxjsbl=0;
ls=request.getParameter("cxjsbl");
try{
	if (!(ls.equals("")))  cxjsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxjsbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销结算比例]类型转换发生意外:"+e);
	return;
}

String clbm=cf.GB2Uni(request.getParameter("clbm"));
String dqbm=request.getParameter("dqbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String scsmc=null;
	ls_sql=" select scsmc" ;
	ls_sql+=" from jxc_ppxx " ;
	ls_sql+=" where ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		scsmc = rs.getString("scsmc");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>错误，不存在的[子品牌]："+ppmc);
		return;
	}
	rs.close();
	ps.close();

	String gysmc=null;
	ls_sql=" select gysmc" ;
	ls_sql+=" from jxc_ppgysdzb " ;
	ls_sql+=" where ppmc='"+ppmc+"' and ssfgs in(select dwbh from sq_dwxx where dqbm='"+dqbm+"')";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		gysmc = rs.getString("gysmc");			    
	}
	else{
		rs.close();
		ps.close();
		out.println("<BR>错误，子品牌在[子子品牌对照表]中不存在");
		return;
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql="update jxc_clbm set cldlbm=?,clxlbm=?,ppmc=?,scsmc=?,cllbbm=?,clmc=?,xh=?,gg=?,clysbm=?,jldwbm=?   ,sfbhpj=?,pjts=?,cpjb=?,fgsx=?,cpsm=?,cd=?,lrr=?,lrsj=SYSDATE,bz=?,nbbm=?";
	ls_sql+=" where  clbm='"+clbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cldlbm);
	ps.setString(2,clxlbm);
	ps.setString(3,ppmc);
	ps.setString(4,scsmc);
	ps.setString(5,cllbbm);
	ps.setString(6,clmc);
	ps.setString(7,xh);
	ps.setString(8,gg);
	ps.setString(9,clysbm);
	ps.setString(10,jldwbm);

	ps.setString(11,sfbhpj);
	ps.setLong(12,pjts);
	ps.setString(13,cpjb);
	ps.setString(14,fgsx);
	ps.setString(15,cpsm);
	ps.setString(16,cd);
	ps.setString(17,yhmc);
	ps.setString(18,bz);
	ps.setString(19,nbbm);
	ps.executeUpdate();
	ps.close();


	ls_sql="update jxc_cljgb set gysmc=?,lsj=?,xsj=?,cbj=?,jsbl=?,cxhdbl=?,sfycx=?,cxkssj=?,cxjzsj=?,cxj=?  ,cxcbj=?,lscxhdbl=?,sfyh=?,sftjcp=? ,lrr=?,lrsj=SYSDATE,bz=?,xsfs=?,jsfs=?,zdxsj=?,yjjrj=?,cxjsbl=?";
	ls_sql+=" where  clbm='"+clbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gysmc);
	ps.setDouble(2,lsj);
	ps.setDouble(3,xsj);
	ps.setDouble(4,cbj);
	ps.setDouble(5,jsbl);
	ps.setDouble(6,cxhdbl);
	ps.setString(7,sfycx);
	ps.setDate(8,cxkssj);
	ps.setDate(9,cxjzsj);
	ps.setDouble(10,cxj);

	ps.setDouble(11,cxcbj);
	ps.setDouble(12,lscxhdbl);
	ps.setString(13,sfyh);
	ps.setString(14,sftjcp);
	ps.setString(15,yhmc);
	ps.setString(16,bz);
	ps.setString(17,xsfs);
	ps.setString(18,jsfs);
	ps.setDouble(19,zdxsj);
	ps.setDouble(20,yjjrj);
	ps.setDouble(21,cxjsbl);
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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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