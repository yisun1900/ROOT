<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
java.sql.Date jsrq=null;
double jsbl=0;
double jsje=0;
double clf=0;
double gdyp=0;
double sjbk=0;
String gdjsjd=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
String jsjs=null;
double htje=0;
double zjxje=0;
double jsjsze=0;
jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
sgd=cf.GB2Uni(request.getParameter("sgd"));
sgbz=cf.GB2Uni(request.getParameter("sgbz"));
ls=request.getParameter("jsrq");
try{
	if (!(ls.equals("")))  jsrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsbl");
try{
	if (!(ls.equals("")))  jsbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsbl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算比例]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsje");
try{
	if (!(ls.equals("")))  jsje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("clf");
try{
	if (!(ls.equals("")))  clf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[clf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[材料费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdyp");
try{
	if (!(ls.equals("")))  gdyp=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gdyp]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工地用品]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjbk");
try{
	if (!(ls.equals("")))  sjbk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sjbk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[实际拨款]类型转换发生意外:"+e);
	return;
}
gdjsjd=cf.GB2Uni(request.getParameter("gdjsjd"));
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
jsjs=cf.GB2Uni(request.getParameter("jsjs"));
ls=request.getParameter("htje");
try{
	if (!(ls.equals("")))  htje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[htje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[合同金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("zjxje");
try{
	if (!(ls.equals("")))  zjxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[zjxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项金额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jsjsze");
try{
	if (!(ls.equals("")))  jsjsze=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jsjsze]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[结算基数总额]类型转换发生意外:"+e);
	return;
}

String sfkclk=request.getParameter("sfkclk");
String sfkgdyp=request.getParameter("sfkgdyp");
String sfkyfgf=request.getParameter("sfkyfgf");

double jzssk=0;
ls=request.getParameter("jzssk");
try{
	if (!(ls.equals("")))  jzssk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jzssk]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[家装实收款]类型转换发生意外:"+e);
	return;
}
double yfgf=0;
ls=request.getParameter("yfgf");
try{
	if (!(ls.equals("")))  yfgf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yfgf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[已付工费]类型转换发生意外:"+e);
	return;
}
double lkhjbfb=0;
ls=request.getParameter("lkhjbfb");
try{
	if (!(ls.equals("")))  lkhjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lkhjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最大领款合计百分比]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_sgdjssqjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zt='1'";//1：未拨工费；2：已拨工费
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("错误！授权记录已拨付");
		return;
	}

	String ygdjsjd="";
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygdjsjd=cf.fillNull(rs.getString("gdjsjd"));
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql =" update  cw_sgdjssqjl set zt='2',jsjlh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and zt='1'";//1：未拨工费；2：已拨工费
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.executeUpdate();
	ps.close();

	
	ls_sql="update crm_khxx set gdjsjd=?,gdjsjlh=?,sgdfbj=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,gdjsjd);
	ps.setString(2,jsjlh);
	ps.setDouble(3,jsjsze);//施工队发包价
	ps.executeUpdate();
	ps.close();
	
	ls_sql="insert into cw_sgdbgfty ( jsjlh,khbh,sgd,sgbz,jsrq,jsbl,jsje,clf,gdyp,sjbk,gdjsjd,lrr,lrsj,lrbm,bz,jsjs,htje,zjxje,jsjsze,sfkclk,sfkgdyp,sfkyfgf,jzssk,yfgf,lkhjbfb,ygdjsjd,spzt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1' ) ";//1：未审批；2：审批同意；3：审批不同意
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,khbh);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setDate(5,jsrq);
	ps.setDouble(6,jsbl);
	ps.setDouble(7,jsje);
	ps.setDouble(8,clf);
	ps.setDouble(9,gdyp);
	ps.setDouble(10,sjbk);
	ps.setString(11,gdjsjd);
	ps.setString(12,lrr);
	ps.setDate(13,lrsj);
	ps.setString(14,lrbm);
	ps.setString(15,bz);
	ps.setString(16,jsjs);
	ps.setDouble(17,htje);
	ps.setDouble(18,zjxje);
	ps.setDouble(19,jsjsze);
	ps.setString(20,sfkclk);
	ps.setString(21,sfkgdyp);
	ps.setString(22,sfkyfgf);
	ps.setDouble(23,jzssk);
	ps.setDouble(24,yfgf);
	ps.setDouble(25,lkhjbfb);
	ps.setString(26,ygdjsjd);
	ps.executeUpdate();
	ps.close();

	if (sfkgdyp.equals("Y"))//是否扣工地用品  Y：是；N：否
	{
		ls_sql="update cw_gdyplyjl set jsbz='1',jsjlh=?";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and jsbz='0'";//0：未结算；1：已结算
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.executeUpdate();
		ps.close();
	}


	//检查领款合计不能大于lkhjbfb％＋＋＋＋＋＋＋＋＋＋＋＋＋开始

	if (sjbk>0)
	{
		double bgfhj=cf.round(yfgf+sjbk,2);//拨工费
		double sgdlkhj=cf.round(bgfhj+clf+gdyp,2);

		if (sgdlkhj>cf.round(jsjsze*lkhjbfb/100+1,2))
		{
			conn.rollback();
			out.println("错误！<P>客户领款合计【材料款("+clf+")＋工地用品("+gdyp+")＋拨工费("+bgfhj+")＝"+sgdlkhj+"】 大于 拨付基数的"+lkhjbfb+"%【"+jsjsze+"×"+lkhjbfb+"％＝"+cf.round(jsjsze*lkhjbfb/100,2)+"】");
			return;
		}
	}
	//检查领款合计不能大于lkhjbfb％＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


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