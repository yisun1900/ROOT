<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;

//基本信息
String xb=request.getParameter("xb");
String email=cf.GB2Uni(request.getParameter("email"));
String nlqjbm=request.getParameter("nlqjbm");
String zybm=request.getParameter("zybm");
String czrkbm=request.getParameter("czrkbm");
String jtjgbm=request.getParameter("jtjgbm");
String xfwdz=cf.GB2Uni(request.getParameter("xfwdz"));



//房屋及个人取向情况
String fwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
java.sql.Date yjzxsj=null;
ls=request.getParameter("yjzxsj");
try{
	if (!(ls.equals("")))  yjzxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yjzxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预计装修时间]类型转换发生意外:"+e);
	return;
}
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
int fwmj=0;
ls=request.getParameter("fwmj");
try{
	if (!(ls.equals("")))  fwmj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fwmj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[套内建筑面积]类型转换发生意外:"+e);
	return;
}
String lcbm=cf.GB2Uni(request.getParameter("lcbm"));
String cxbm=cf.GB2Uni(request.getParameter("cxbm"));
String cgbm=cf.GB2Uni(request.getParameter("cgbm"));
String fgyqbm=cf.GB2Uni(request.getParameter("fgyqbm"));
String scqxbm=cf.GB2Uni(request.getParameter("scqxbm"));
String fwytbm=cf.GB2Uni(request.getParameter("fwytbm"));
String fjfwbm=cf.GB2Uni(request.getParameter("fjfwbm"));


//家居理财专业建议
String zxysbm=cf.GB2Uni(request.getParameter("zxysbm"));
int zxzc=0;
ls=request.getParameter("zxzc");
try{
	if (!(ls.equals("")))  zxzc=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zxzc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[装修支出]类型转换发生意外:"+e);
	return;
}
int hqpszc=0;
ls=request.getParameter("hqpszc");
try{
	if (!(ls.equals("")))  hqpszc=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[hqpszc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[后期配饰支出]类型转换发生意外:"+e);
	return;
}
int jjzczc=0;
ls=request.getParameter("jjzczc");
try{
	if (!(ls.equals("")))  jjzczc=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jjzczc]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家居主材支出]类型转换发生意外:"+e);
	return;
}
int jdzj=0;
ls=request.getParameter("jdzj");
try{
	if (!(ls.equals("")))  jdzj=Integer.parseInt(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jdzj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[机动资金]类型转换发生意外:"+e);
	return;
}

//隐藏信息
String zxjlh=cf.GB2Uni(request.getParameter("zxjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String sjs=cf.GB2Uni(request.getParameter("sjs"));
java.sql.Date zxsj=null;
ls=request.getParameter("zxsj");
try{
	if (!(ls.equals("")))  zxsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zxsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[咨询时间]类型转换发生意外:"+e);
	return;
}
String lrr=cf.GB2Uni(request.getParameter("lrr"));
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

//设计师咨询情况
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String jzbz=cf.GB2Uni(request.getParameter("jzbz"));
String lfbz=cf.GB2Uni(request.getParameter("lfbz"));
java.sql.Date lfsj=null;
ls=request.getParameter("lfsj");
try{
	if (!(ls.equals("")))  lfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[量房时间]类型转换发生意外:"+e);
	return;
}
String ctbz=cf.GB2Uni(request.getParameter("ctbz"));
java.sql.Date ctsj=null;
ls=request.getParameter("ctsj");
try{
	if (!(ls.equals("")))  ctsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ctsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出平面图时间]类型转换发生意外:"+e);
	return;
}
String zxqk=cf.GB2Uni(request.getParameter("zxqk"));

String cxgtbz=cf.GB2Uni(request.getParameter("cxgtbz"));
java.sql.Date cxgtsj=null;
ls=request.getParameter("cxgtsj");
try{
	if (!(ls.equals("")))  cxgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxgtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出效果图时间]类型转换发生意外:"+e);
	return;
}
String csgtbz=cf.GB2Uni(request.getParameter("csgtbz"));
java.sql.Date csgtsj=null;
ls=request.getParameter("csgtsj");
try{
	if (!(ls.equals("")))  csgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量csgtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出施工图时间]类型转换发生意外:"+e);
	return;
}

String ysy=cf.GB2Uni(request.getParameter("ysy"));
String zcsfss=request.getParameter("zcsfss");
String sfxjz=request.getParameter("sfxjz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


String newkhbh=null;
String newdwbh=null;
String newsjs=null;
String newsfxhf=null;
String newhfrq=null;
String newzxzt=null;

String ysfxhf=null;
java.sql.Date yhfrq=null;
String ylfbz=null;
java.sql.Date ylfsj=null;
String yctbz=null;
java.sql.Date yctsj=null;

String nowzxjlh=null;
String nowzxdm=null;
String nowzxzt=null;
String nowsjs=null;
String nowsfxhf=null;
String nowhfrq=null;

try {
	conn=cf.getConnection();

	int zxcs=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxcs=rs.getInt(1);
	}
	rs.close();
	ps.close();


	String ykhfwjlh=null;
	ls_sql="select dwbh,sjs,sfxhf,hfrq,zxzt,ysfxhf,yhfrq,ylfbz,ylfsj,yctbz,yctsj,khfwjlh";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where zxjlh='"+zxjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newdwbh=rs.getString("dwbh");
		newsjs=cf.fillNull(rs.getString("sjs"));
		newsfxhf=cf.fillNull(rs.getString("sfxhf"));
		newhfrq=cf.fillNull(rs.getDate("hfrq"));
		newzxzt=cf.fillNull(rs.getString("zxzt"));

		ysfxhf=rs.getString("ysfxhf");
		yhfrq=rs.getDate("yhfrq");
		ylfbz=rs.getString("ylfbz");
		ylfsj=rs.getDate("ylfsj");
		yctbz=rs.getString("yctbz");
		yctsj=rs.getDate("yctsj");
		ykhfwjlh=cf.fillNull(rs.getString("khfwjlh"));
	}
	else{
		out.println("错误！不存在的咨询记录");
		return;
	}
	ps.close();
	rs.close();

	if (ylfbz==null)
	{
		ylfbz="N";
	}
	if (yctbz==null)
	{
		yctbz="N";
	}

	ls_sql="select zxdm,sfxhf,hfrq,zxzt,sjs,zxjlh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nowzxdm=cf.fillNull(rs.getString("zxdm"));
		nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
		nowhfrq=cf.fillNull(rs.getDate("hfrq"));
		nowzxzt=rs.getString("zxzt");
		nowsjs=cf.fillNull(rs.getString("sjs"));
		nowzxjlh=cf.fillNull(rs.getString("zxjlh"));
	}
	else{
		out.println("错误！不存在的客户编号");
		return;
	}
	ps.close();
	rs.close();

	if (!nowzxjlh.equals(zxjlh))
	{
		out.println("错误！只能修改最新的咨询记录"+nowzxjlh);
		return;
	}


//判断是否可修改---------------------------------------
	if (!nowzxzt.equals(newzxzt))
	{
		out.println("错误！[咨询状态]已改变，修改失败");
		return;
	}
	if (!nowzxdm.equals(newdwbh))
	{
		out.println("错误！[咨询店面]已改变，修改失败");
		return;
	}

	conn.setAutoCommit(false);

	//修改客户信息
	ls_sql="update crm_zxkhxx set";
	ls_sql+="  xb=?,email=?,nlqjbm=?,zybm=?,czrkbm=?,jtjgbm=?,xfwdz=?";//基本信息
	ls_sql+=" ,fwlxbm=?,yjzxsj=?,hxbm=?,fwmj=?,lcbm=?,fjfwbm=?,cxbm=?,cgbm=?,fgyqbm=?,scqxbm=?,fwytbm=?";//房屋及个人取向情况
	ls_sql+=" ,zxysbm=?,zxzc=?,hqpszc=?,jjzczc=?,jdzj=?";//家居理财专业建议
	ls_sql+=" ,bjjb=?,jzbz=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?,cxgtbz=?,cxgtsj=?,csgtbz=?,csgtsj=?,ysy=?,zcsfss=?,sfxjz=?";//设计师咨询情况
	ls_sql+=" ,zjzbjsj=TRUNC(SYSDATE)";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);

	//基本信息
	ps.setString(1,xb);
	ps.setString(2,email);
	ps.setString(3,nlqjbm);
	ps.setString(4,zybm);
	ps.setString(5,czrkbm);
	ps.setString(6,jtjgbm);
	ps.setString(7,xfwdz);

	//房屋及个人取向情况
	ps.setString(8,fwlxbm);
	ps.setDate(9,yjzxsj);
	ps.setString(10,hxbm);
	ps.setInt(11,fwmj);
	ps.setString(12,lcbm);
	ps.setString(13,fjfwbm);
	ps.setString(14,cxbm);
	ps.setString(15,cgbm);
	ps.setString(16,fgyqbm);
	ps.setString(17,scqxbm);
	ps.setString(18,fwytbm);

	//家居理财专业建议
	ps.setString(19,zxysbm);
	ps.setDouble(20,zxzc);
	ps.setDouble(21,hqpszc);
	ps.setDouble(22,jjzczc);
	ps.setDouble(23,jdzj);

	//设计师咨询情况
	ps.setString(24,bjjb);
	ps.setString(25,jzbz);
	ps.setString(26,lfbz);
	ps.setDate(27,lfsj);
	ps.setString(28,ctbz);
	ps.setDate(29,ctsj);
	ps.setString(30,cxgtbz);
	ps.setDate(31,cxgtsj);
	ps.setString(32,csgtbz);
	ps.setDate(33,csgtsj);
	ps.setString(34,ysy);
	ps.setString(35,zcsfss);
	ps.setString(36,sfxjz);

	ps.executeUpdate();
	ps.close();


	//修改表：咨询客户服务记录（crm_zxkhfwjl）
	ls_sql="update crm_zxkhfwjl set sbyyxs=?";
	ls_sql+=" where khfwjlh='"+ykhfwjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxqk);
	ps.executeUpdate();
	ps.close();

	//修改表：设计师咨询情况（crm_sjszxqk）
	ls_sql="update crm_sjszxqk set zxqk=?";
	ls_sql+=" where zxjlh='"+zxjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxqk);

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
	out.print("<BR>出错:" + e);
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