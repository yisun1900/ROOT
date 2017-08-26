<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long xqbh=0;
String xqhdmc=null;
String fgsbh=null;
String xqmc=null;
String scbfzr=null;
String scbfzrdh=null;
long scbzrs=0;
String scbsffz=null;
long gjjzgwrs=0;
double ryydl=0;
java.sql.Date lhkssj=null;
java.sql.Date jhjssj=null;
long sqlxcs=0;
String bgsfqs=null;
long yjfy=0;
long yjcc=0;
String fymd=null;
String lxjlcf=null;
String fjdkhzq=null;
String fjdyjfy=null;
String fjdyjcc=null;
String kfql=null;
String kfxs=null;
String kfmb=null;
String kfms=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
ls=request.getParameter("xqbh");
try{
	if (!(ls.equals("")))  xqbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xqbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[小区编号]类型转换发生意外:"+e);
	return;
}
xqhdmc=cf.GB2Uni(request.getParameter("xqhdmc"));
fgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
xqmc=cf.GB2Uni(request.getParameter("xqmc"));
scbfzr=cf.GB2Uni(request.getParameter("scbfzr"));
scbfzrdh=cf.GB2Uni(request.getParameter("scbfzrdh"));
ls=request.getParameter("scbzrs");
try{
	if (!(ls.equals("")))  scbzrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量scbzrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[市场部总人数]类型转换发生意外:"+e);
	return;
}
scbsffz=cf.GB2Uni(request.getParameter("scbsffz"));
ls=request.getParameter("gjjzgwrs");
try{
	if (!(ls.equals("")))  gjjzgwrs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gjjzgwrs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[高级家装顾问人数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ryydl");
try{
	if (!(ls.equals("")))  ryydl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ryydl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[人员异动率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("lhkssj");
try{
	if (!(ls.equals("")))  lhkssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lhkssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划开始时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhjssj");
try{
	if (!(ls.equals("")))  jhjssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhjssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划结束时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sqlxcs");
try{
	if (!(ls.equals("")))  sqlxcs=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqlxcs不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请立项次数]类型转换发生意外:"+e);
	return;
}
bgsfqs=cf.GB2Uni(request.getParameter("bgsfqs"));
ls=request.getParameter("yjfy");
try{
	if (!(ls.equals("")))  yjfy=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yjcc");
try{
	if (!(ls.equals("")))  yjcc=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjcc不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计产出]类型转换发生意外:"+e);
	return;
}
fymd=cf.GB2Uni(request.getParameter("fymd"));
lxjlcf=cf.GB2Uni(request.getParameter("lxjlcf"));
fjdkhzq=cf.GB2Uni(request.getParameter("fjdkhzq"));
fjdyjfy=cf.GB2Uni(request.getParameter("fjdyjfy"));
fjdyjcc=cf.GB2Uni(request.getParameter("fjdyjcc"));
kfql=cf.GB2Uni(request.getParameter("kfql"));
kfxs=cf.GB2Uni(request.getParameter("kfxs"));
kfmb=cf.GB2Uni(request.getParameter("kfmb"));
kfms=cf.GB2Uni(request.getParameter("kfms"));

lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
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
String ls_sql=null;
try {
	conn=cf.getConnection();

	String dqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	
	conn.setAutoCommit(false);

	ls_sql="insert into yx_xqcxhdgl ( xqbh,xqhdmc,fgsbh,xqmc,scbfzr,scbfzrdh,scbzrs,scbsffz,gjjzgwrs,ryydl,lhkssj,jhjssj,sqlxcs,bgsfqs,yjfy,yjcc,fymd,lxjlcf,fjdkhzq,fjdyjfy,fjdyjcc,kfql,kfxs,kfmb,kfms,lrr,lrsj,bz,sjfy,sjcc,spzt,fasfwc ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,0,'1','N' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,xqbh);
	ps.setString(2,xqhdmc);
	ps.setString(3,fgsbh);
	ps.setString(4,xqmc);
	ps.setString(5,scbfzr);
	ps.setString(6,scbfzrdh);
	ps.setLong(7,scbzrs);
	ps.setString(8,scbsffz);
	ps.setLong(9,gjjzgwrs);
	ps.setDouble(10,ryydl);
	ps.setDate(11,lhkssj);
	ps.setDate(12,jhjssj);
	ps.setLong(13,sqlxcs);
	ps.setString(14,bgsfqs);
	ps.setLong(15,yjfy);
	ps.setLong(16,yjcc);
	ps.setString(17,fymd);
	ps.setString(18,lxjlcf);
	ps.setString(19,fjdkhzq);
	ps.setString(20,fjdyjfy);
	ps.setString(21,fjdyjcc);
	ps.setString(22,kfql);
	ps.setString(23,kfxs);
	ps.setString(24,kfmb);
	ps.setString(25,kfms);
	ps.setString(26,lrr);
	ps.setDate(27,lrsj);
	ps.setString(28,bz);
	ps.executeUpdate();
	ps.close();

	ls_sql="update yx_lsdcb set kfjd='2'";
	ls_sql+=" where xqmc='"+xqmc+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (conn != null) cf.close(conn); 
	}
}
%>