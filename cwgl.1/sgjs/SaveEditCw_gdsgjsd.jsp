<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
double wdzje=0;
double wtj=0;
java.sql.Date wtjrq=null;
double ssk=0;
double jsk=0;
java.sql.Date jsrq=null;
double mgfy=0;
java.sql.Date mgrq=null;
double sdgfy=0;
java.sql.Date sdgrq=null;
double nsgfy=0;
java.sql.Date nsgrq=null;
double yqgfy=0;
java.sql.Date yqgrq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ls=request.getParameter("wdzje");
try{
	if (!(ls.equals("")))  wdzje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wdzje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wtj");
try{
	if (!(ls.equals("")))  wtj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wtj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[委托金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("wtjrq");
try{
	if (!(ls.equals("")))  wtjrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wtjrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[委托金日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ssk");
try{
	if (!(ls.equals("")))  ssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ssk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实收款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsk");
try{
	if (!(ls.equals("")))  jsk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jsrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mgfy");
try{
	if (!(ls.equals("")))  mgfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mgfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[木工费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("mgrq");
try{
	if (!(ls.equals("")))  mgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量mgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[木工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdgfy");
try{
	if (!(ls.equals("")))  sdgfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sdgfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电工费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sdgrq");
try{
	if (!(ls.equals("")))  sdgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sdgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[水电工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("nsgfy");
try{
	if (!(ls.equals("")))  nsgfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量nsgfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[泥水工费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("nsgrq");
try{
	if (!(ls.equals("")))  nsgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量nsgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[泥水工日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yqgfy");
try{
	if (!(ls.equals("")))  yqgfy=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqgfy不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[油漆工费用]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("yqgrq");
try{
	if (!(ls.equals("")))  yqgrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量yqgrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[油漆工日期]类型转换发生意外:"+e);
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));

String kpqk=cf.GB2Uni(request.getParameter("kpqk"));
String wtjzgck=cf.GB2Uni(request.getParameter("wtjzgck"));
double kpje=0;
ls=request.getParameter("kpje");
try{
	if (!(ls.equals("")))  kpje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kpje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[开票金额]类型转换发生意外:"+e);
	return;
}
double tcje=0;
ls=request.getParameter("tcje");
try{
	if (!(ls.equals("")))  tcje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提成金额]类型转换发生意外:"+e);
	return;
}
java.sql.Date dasjsj=null;
ls=request.getParameter("dasjsj");
try{
	if (!(ls.equals("")))  dasjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dasjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[档案上交时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date xgtsj=null;
ls=request.getParameter("xgtsj");
try{
	if (!(ls.equals("")))  xgtsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgtsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[效果图时间]类型转换发生意外:"+e);
	return;
}
java.sql.Date tcrq=null;
ls=request.getParameter("tcrq");
try{
	if (!(ls.equals("")))  tcrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量tcrq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[提成日期]类型转换发生意外:"+e);
	return;
}

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	ls_sql="delete from cw_gdfymx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	String fybm=null;
	String fymc=null;
	int xh=0;
	ls_sql="select fybm,fymc,xh";
	ls_sql+=" from cw_gdfybm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fybm=rs.getString("fybm");
		fymc=rs.getString("fymc");
		xh=rs.getInt("xh");

		String fyjestr=cf.GB2Uni(request.getParameter("fybm"+fybm));
		double fyje=0;
		try{
			fyje=Double.parseDouble(fyjestr.trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>错误！["+fymc+"]录入非数字:"+e);
			return;
		}

		ls_sql="insert into cw_gdfymx (khbh,fybm,fyje,xh)";
		ls_sql+=" values('"+khbh+"','"+fybm+"',"+fyje+","+xh+") ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	double fyze=0;
	ls_sql="select sum(fyje) from cw_gdfymx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fyze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double ye=ssk-fyze;
	double mll=0;
	if (ssk!=0)
	{
		mll=ye*100/ssk;
	}
	else{
		mll=0;
	}

	
	ls_sql="update cw_gdsgjsd set wdzje=?,wtj=?,wtjrq=?,ssk=?,jsk=?,jsrq=?,mgfy=?,mgrq=?,sdgfy=?,sdgrq=?,nsgfy=?,nsgrq=?,yqgfy=?,yqgrq=?,fyze=?,ye=?,mll=?,lrr=?,lrsj=?,lrbm=?,bz=?   ,kpqk=?,kpje=?,dasjsj=?,xgtsj=?,tcje=?,tcrq=?,wtjzgck=?";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,wtj);
	ps.setDate(3,wtjrq);
	ps.setDouble(4,ssk);
	ps.setDouble(5,jsk);
	ps.setDate(6,jsrq);
	ps.setDouble(7,mgfy);
	ps.setDate(8,mgrq);
	ps.setDouble(9,sdgfy);
	ps.setDate(10,sdgrq);
	ps.setDouble(11,nsgfy);
	ps.setDate(12,nsgrq);
	ps.setDouble(13,yqgfy);
	ps.setDate(14,yqgrq);
	ps.setDouble(15,fyze);
	ps.setDouble(16,ye);
	ps.setDouble(17,mll);
	ps.setString(18,lrr);
	ps.setDate(19,lrsj);
	ps.setString(20,lrbm);
	ps.setString(21,bz);

	ps.setString(22,kpqk);
	ps.setDouble(23,kpje);
	ps.setDate(24,dasjsj);
	ps.setDate(25,xgtsj);
	ps.setDouble(26,tcje);
	ps.setDate(27,tcrq);
	ps.setString(28,wtjzgck);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>