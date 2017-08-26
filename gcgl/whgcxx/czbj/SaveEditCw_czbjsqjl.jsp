<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
java.sql.Date wcsj=null;
String wcr=null;
String smhtbh=cf.GB2Uni(request.getParameter("smhtbh"));

ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量wcsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成时间]类型转换发生意外:"+e);
	return;
}
wcr=cf.GB2Uni(request.getParameter("wcr"));

double gxhwdzgce=0;
double gxhzkl=0;
double gxhqye=0;
double gxhhdzsjz=0;
double gxhdjjbfb=0;
double gxhdjjje=0;
double gxhzqgczjf=0;
double gxhzhgczjf=0;
double gxhcdzwjmje=0;
double gxhglfbfb=0;
double gxhzqguanlif=0;
double gxhglfjmje=0;
double gxhguanlif=0;
double gxhsuijinbfb=0;
double gxhzqsuijin=0;
double gxhsjjmje=0;
double gxhsuijin=0;
double gxhzqsjf=0;
double gxhsjf=0;
double gxhzqwjrqyexm=0;
double gxhzhwjrqyexm=0;
String gxhwjrqyexmsm=null;
double gxhzqqtsf=0;
double gxhzhqtsf=0;
String gxhqtsfsm=null;
double gxhhtjz=0;
double gxhsgcbj=0;
double gxhmle=0;
double gxhmll=0;
double gxhyjjz=0;
double gxhyjjzcs=0;
double gxhcbj=0;
double gxhgcjcbj=0;
String bz=null;


ls=request.getParameter("wcsj");
try{
	if (!(ls.equals("")))  wcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[wcsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[完成时间]类型转换发生意外:"+e);
	return;
}
wcr=cf.GB2Uni(request.getParameter("wcr"));
ls=request.getParameter("gxhwdzgce");
try{
	if (!(ls.equals("")))  gxhwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhwdzgce]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前合同总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzkl");
try{
	if (!(ls.equals("")))  gxhzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzkl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后综合折扣]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhqye");
try{
	if (!(ls.equals("")))  gxhqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhqye]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后合同总额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhhdzsjz");
try{
	if (!(ls.equals("")))  gxhhdzsjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhhdzsjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后赠送净值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhdjjbfb");
try{
	if (!(ls.equals("")))  gxhdjjbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhdjjbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后代金券百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhdjjje");
try{
	if (!(ls.equals("")))  gxhdjjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhdjjje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后赠送代金券]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzqgczjf");
try{
	if (!(ls.equals("")))  gxhzqgczjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqgczjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前工程直接费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzhgczjf");
try{
	if (!(ls.equals("")))  gxhzhgczjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzhgczjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后工程直接费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhcdzwjmje");
try{
	if (!(ls.equals("")))  gxhcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhcdzwjmje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后工程费减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhglfbfb");
try{
	if (!(ls.equals("")))  gxhglfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhglfbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后管理费百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzqguanlif");
try{
	if (!(ls.equals("")))  gxhzqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqguanlif]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhglfjmje");
try{
	if (!(ls.equals("")))  gxhglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhglfjmje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后管理费减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhguanlif");
try{
	if (!(ls.equals("")))  gxhguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhguanlif]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhsuijinbfb");
try{
	if (!(ls.equals("")))  gxhsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhsuijinbfb]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后税金百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzqsuijin");
try{
	if (!(ls.equals("")))  gxhzqsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqsuijin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhsjjmje");
try{
	if (!(ls.equals("")))  gxhsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhsjjmje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后税金减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhsuijin");
try{
	if (!(ls.equals("")))  gxhsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhsuijin]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzqsjf");
try{
	if (!(ls.equals("")))  gxhzqsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhsjf");
try{
	if (!(ls.equals("")))  gxhsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhsjf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzqwjrqyexm");
try{
	if (!(ls.equals("")))  gxhzqwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqwjrqyexm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前未记入签约额部分]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzhwjrqyexm");
try{
	if (!(ls.equals("")))  gxhzhwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzhwjrqyexm]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后未记入签约额部分]类型转换发生意外:"+e);
	return;
}
gxhwjrqyexmsm=cf.GB2Uni(request.getParameter("gxhwjrqyexmsm"));
ls=request.getParameter("gxhzqqtsf");
try{
	if (!(ls.equals("")))  gxhzqqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折前记入业绩其它费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhzhqtsf");
try{
	if (!(ls.equals("")))  gxhzhqtsf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzhqtsf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后折后记入业绩其它费]类型转换发生意外:"+e);
	return;
}
gxhqtsfsm=cf.GB2Uni(request.getParameter("gxhqtsfsm"));
ls=request.getParameter("gxhhtjz");
try{
	if (!(ls.equals("")))  gxhhtjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhhtjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后合同净值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhsgcbj");
try{
	if (!(ls.equals("")))  gxhsgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhsgcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后施工成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhmle");
try{
	if (!(ls.equals("")))  gxhmle=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhmle]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后毛利额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhmll");
try{
	if (!(ls.equals("")))  gxhmll=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhmll]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后毛利率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhyjjz");
try{
	if (!(ls.equals("")))  gxhyjjz=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhyjjz]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后业绩净值]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhyjjzcs");
try{
	if (!(ls.equals("")))  gxhyjjzcs=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhyjjzcs]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后业绩净值参数]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhcbj");
try{
	if (!(ls.equals("")))  gxhcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后成本价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gxhgcjcbj");
try{
	if (!(ls.equals("")))  gxhgcjcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhgcjcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后工程基础报价]类型转换发生意外:"+e);
	return;
}


double gxhdjfxje=0;
ls=request.getParameter("gxhdjfxje");
try{
	if (!(ls.equals("")))  gxhdjfxje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhdjfxje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后订金返现金额]类型转换发生意外:"+e);
	return;
}
double gxhzjjmje=0;
ls=request.getParameter("gxhzjjmje");
try{
	if (!(ls.equals("")))  gxhzjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzjjmje]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后直接减免金额]类型转换发生意外:"+e);
	return;
}
double gxhzqhtzcbj=0;
ls=request.getParameter("gxhzqhtzcbj");
try{
	if (!(ls.equals("")))  gxhzqhtzcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzqhtzcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后主材报价－折前]类型转换发生意外:"+e);
	return;
}
double gxhzhhtzcbj=0;
ls=request.getParameter("gxhzhhtzcbj");
try{
	if (!(ls.equals("")))  gxhzhhtzcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[gxhzhhtzcbj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[更新后主材报价－折后]类型转换发生意外:"+e);
	return;
}

bz=cf.GB2Uni(request.getParameter("bz"));

String khbh=request.getParameter("khbh");
java.sql.Date sqsj=null;
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[授权时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where  khbh='"+khbh+"' and wcbz='1'";
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
		out.println("错误！已完成");
		return;
	}

	String bjjb="";
	ls_sql="select bjjb";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	double tcbzjg=0;
	double tcmjzjje=0;
	double tczcsjcj=0;
	double tczccljj=0;
	double tcxsfzc=0;
	double tczcjm=0;
	double tcdpsj=0;
	double tcdpdlsf=0;
	double tcxpx=0;
	double tcwsgzj=0;
	double tcwgccljj=0;
	double tcwzjzc=0;
	double tcsgze=0;
	double tcqtsf=0;
	double zctcje=0;
	double wntcje=0;
	double jytcje=0;
	double sctcje=0;
	double jktcje=0;
	double sjhtsjf=0;
	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		dzbj.Tc tc=new dzbj.Tc();

		tcbzjg=tc.getBzjg(conn,khbh,"yz");//获取:套餐标准价格
		tcmjzjje=tc.getMjzjje(conn,khbh,"yz");//获取:面积增加金额
		tczcsjcj=tc.getZcsjcj(conn,khbh,"yz");//获取:主材升级差价
		tczccljj=tc.getZccljj(conn,khbh,"yz");//获取:主材超量加价
		tcxsfzc=tc.getXsfzc(conn,khbh,"yz");//获取:需收费主材
		tczcjm=tc.getZcjm(conn,khbh,"yz");//获取:主材减免
		tcdpsj=tc.getDpsj(conn,khbh,"yz");//获取:顶配升级
		tcdpdlsf=tc.getDpdlsf(conn,khbh,"yz");//获取:顶配独立收费
		tcxpx=tc.getXpx(conn,khbh,"yz");//获取:选配项
		tcwsgzj=tc.getSgzj(conn,khbh,"yz");//获取:套餐外施工项造价
		tcwgccljj=tc.getGccljj(conn,khbh,"yz");//获取:工程超量加价
		tcwzjzc=tc.getZjzc(conn,khbh,"yz");//获取:套餐外增加主材
		tcsgze=tc.getSgze(conn,khbh,"yz");//获取:施工总额
		tcqtsf=tc.getTcqtsf(conn,khbh,"yz");//获取:套餐－其它收费
		zctcje=tc.getZctcje(conn,khbh,"yz");//获取:主材套餐金额
		wntcje=tc.getWntcje(conn,khbh,"yz");//获取:温暖套餐金额
		jytcje=tc.getJytcje(conn,khbh,"yz");//获取:静音套餐金额
		sctcje=tc.getSctcje(conn,khbh,"yz");//获取:色彩套餐金额
		jktcje=tc.getJktcje(conn,khbh,"yz");//获取:健康套餐金额
	}


	count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//更新：重做报价授权记录
	ls_sql="update cw_czbjsqjl set wcbz=?,wcsj=?,wcr=?,gxhwdzgce=?,gxhzkl=?,gxhqye=?,gxhhdzsjz=?,gxhdjjbfb=?,gxhdjjje=?,gxhzqgczjf=?,gxhzhgczjf=?,gxhcdzwjmje=?,gxhglfbfb=?,gxhzqguanlif=?,gxhglfjmje=?,gxhguanlif=?,gxhsuijinbfb=?,gxhzqsuijin=?,gxhsjjmje=?,gxhsuijin=?,gxhzqsjf=?,gxhsjf=?,gxhzqwjrqyexm=?,gxhzhwjrqyexm=?,gxhwjrqyexmsm=?,gxhzqqtsf=?,gxhzhqtsf=?,gxhqtsfsm=?,gxhhtjz=?,gxhsgcbj=?,gxhmle=?,gxhmll=?,gxhyjjz=?,gxhyjjzcs=?,gxhcbj=?,gxhgcjcbj=?,bz=? ";
	ls_sql+=" ,gxhzqhtzcbj=?,gxhzhhtzcbj=?,gxhdjfxje=?,gxhzjjmje=?";
	ls_sql+=" where  khbh='"+khbh+"' and wcbz='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,"2");
	ps.setDate(2,wcsj);
	ps.setString(3,wcr);
	ps.setDouble(4,gxhwdzgce);
	ps.setDouble(5,gxhzkl);
	ps.setDouble(6,gxhqye);
	ps.setDouble(7,gxhhdzsjz);
	ps.setDouble(8,gxhdjjbfb);
	ps.setDouble(9,gxhdjjje);
	ps.setDouble(10,gxhzqgczjf);
	ps.setDouble(11,gxhzhgczjf);
	ps.setDouble(12,gxhcdzwjmje);
	ps.setDouble(13,gxhglfbfb);
	ps.setDouble(14,gxhzqguanlif);
	ps.setDouble(15,gxhglfjmje);
	ps.setDouble(16,gxhguanlif);
	ps.setDouble(17,gxhsuijinbfb);
	ps.setDouble(18,gxhzqsuijin);
	ps.setDouble(19,gxhsjjmje);
	ps.setDouble(20,gxhsuijin);
	ps.setDouble(21,gxhzqsjf);
	ps.setDouble(22,gxhsjf);
	ps.setDouble(23,gxhzqwjrqyexm);
	ps.setDouble(24,gxhzhwjrqyexm);
	ps.setString(25,gxhwjrqyexmsm);
	ps.setDouble(26,gxhzqqtsf);
	ps.setDouble(27,gxhzhqtsf);
	ps.setString(28,gxhqtsfsm);
	ps.setDouble(29,gxhhtjz);
	ps.setDouble(30,gxhsgcbj);
	ps.setDouble(31,gxhmle);
	ps.setDouble(32,gxhmll);
	ps.setDouble(33,gxhyjjz);
	ps.setDouble(34,gxhyjjzcs);
	ps.setDouble(35,gxhcbj);
	ps.setDouble(36,gxhgcjcbj);
	ps.setString(37,bz);
	ps.setDouble(38,gxhzqhtzcbj);
	ps.setDouble(39,gxhzhhtzcbj);
	ps.setDouble(40,gxhdjfxje);
	ps.setDouble(41,gxhzjjmje);
	ps.executeUpdate();
	ps.close();

	//更新：客户信息
	ls_sql="update crm_khxx ";
	ls_sql+=" set wdzgce=?,zkl=?,qye=?,zqgczjf=?,zhgczjf=?,cdzwjmje=?,glfbfb=?,zqguanlif=?,glfjmje=?,guanlif=?,suijinbfb=?,zqsuijin=?,sjjmje=?,suijin=?,zqsjf=?,sjf=?,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,zqqtsf=?,zhqtsf=?,qtsfsm=?,smhtbh=?";
	ls_sql+=" ,zqhtzcbj=?,zhhtzcbj=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhwdzgce);
	ps.setDouble(2,gxhzkl);
	ps.setDouble(3,gxhqye);
	ps.setDouble(4,gxhzqgczjf);
	ps.setDouble(5,gxhzhgczjf);
	ps.setDouble(6,gxhcdzwjmje);
	ps.setDouble(7,gxhglfbfb);
	ps.setDouble(8,gxhzqguanlif);
	ps.setDouble(9,gxhglfjmje);
	ps.setDouble(10,gxhguanlif);
	ps.setDouble(11,gxhsuijinbfb);
	ps.setDouble(12,gxhzqsuijin);
	ps.setDouble(13,gxhsjjmje);
	ps.setDouble(14,gxhsuijin);
	ps.setDouble(15,gxhzqsjf);
	ps.setDouble(16,gxhsjf);
	ps.setDouble(17,gxhzqwjrqyexm);
	ps.setDouble(18,gxhzhwjrqyexm);
	ps.setString(19,gxhwjrqyexmsm);
	ps.setDouble(20,gxhzqqtsf);
	ps.setDouble(21,gxhzhqtsf);
	ps.setString(22,gxhqtsfsm);
	ps.setString(23,smhtbh);
	ps.setDouble(24,gxhzqhtzcbj);
	ps.setDouble(25,gxhzhhtzcbj);
	ps.executeUpdate();
	ps.close();

	//主材金额计算
	ls_sql=" update jc_zcdd  ";
	ls_sql+=" set sfjrht='Y'";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update jc_zczjx  ";
	ls_sql+=" set sfjrht='Y'";
	ls_sql+=" where khbh='"+khbh+"' and clzt not in('00','99')";//00：录入未完成；01：录入已完成；02：已确认；03：已送货；04：厂家已接收；99；退单
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	double zchtje=0;
	double zchtcb=0;
	ls_sql="SELECT sum(hkze+zjhze),sum(cbze+zjxcbze)";
	ls_sql+=" FROM jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and jc_zcdd.clzt>='09' and jc_zcdd.clzt not in('98','99')";//09：合同已完成
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if(rs.next())
	{
		zchtje=rs.getDouble(1);//主材销售额
		zchtcb=rs.getInt(2);//主材成本额
	}
	rs.close();
	ps.close();

	double khhtml=0;
	if ((zchtje+gxhhtjz)!=0)
	{
		khhtml=cf.round((zchtje-zchtcb+gxhmle)*100/(zchtje+gxhhtjz),2);
	}

	if (count>0)
	{
		ls_sql="update crm_khqye ";
		ls_sql+=" set hdzsjz=?,zxzsjz=?,cbj=?,zxcbj=?,sgcbj=?,zxsgcbj=?,gcjcbj=?,zxgcjcbj=?,htjz=?,zxhtjz=? ";
		ls_sql+=" ,mll=?,zxmll=?,mle=?,zxmle=?,yjjzcs=?,yjjz=?,zxyjjz=?,djjbfb=?,djjje=?,djfxje=?  ,zchtje=?,zchtcb=?,zczxje=?,zczxcb=?,khhtml=?,khzxml=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,gxhhdzsjz);
		ps.setDouble(2,gxhhdzsjz);
		ps.setDouble(3,gxhcbj);
		ps.setDouble(4,gxhcbj);
		ps.setDouble(5,gxhsgcbj);
		ps.setDouble(6,gxhsgcbj);
		ps.setDouble(7,gxhgcjcbj);
		ps.setDouble(8,gxhgcjcbj);
		ps.setDouble(9,gxhhtjz);
		ps.setDouble(10,gxhhtjz);

		ps.setDouble(11,gxhmll);
		ps.setDouble(12,gxhmll);
		ps.setDouble(13,gxhmle);
		ps.setDouble(14,gxhmle);
		ps.setDouble(15,gxhyjjzcs);
		ps.setDouble(16,gxhyjjz);
		ps.setDouble(17,gxhyjjz);
		ps.setDouble(18,gxhdjjbfb);
		ps.setDouble(19,gxhdjjje);
		ps.setDouble(20,gxhdjfxje);

		ps.setDouble(21,zchtje);
		ps.setDouble(22,zchtcb);
		ps.setDouble(23,zchtje);
		ps.setDouble(24,zchtcb);
		ps.setDouble(25,khhtml);
		ps.setDouble(26,khhtml);

		ps.executeUpdate();
		ps.close();
	}
	else{

		ls_sql=" insert into crm_khqye (khbh,dzbjjc,hdzsjz,zxzsjz,djfxje,djjje,zjxdjjje,rzfbfb,htrzf,zjxrzf ";
		ls_sql+=" ,cbj,zxcbj,sgcbj,zxsgcbj,gcjcbj,zxgcjcbj,htjz,zxhtjz,mll,zxmll   ,mle,zxmle,yjjzcs,yjjz,zxyjjz,djjbfb  ,zchtje,zchtcb,zczxje,zczxcb,khhtml,khzxml) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?    ,?,?,?,?,?,?   ,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,"7");
		ps.setDouble(3,gxhhdzsjz);
		ps.setDouble(4,gxhhdzsjz);
		ps.setDouble(5,gxhdjfxje);
		ps.setDouble(6,gxhdjjje);
		ps.setDouble(7,0);
		ps.setDouble(8,0);
		ps.setDouble(9,0);
		ps.setDouble(10,0);

		ps.setDouble(11,gxhcbj);
		ps.setDouble(12,gxhcbj);
		ps.setDouble(13,gxhsgcbj);
		ps.setDouble(14,gxhsgcbj);
		ps.setDouble(15,gxhgcjcbj);
		ps.setDouble(16,gxhgcjcbj);
		ps.setDouble(17,gxhhtjz);
		ps.setDouble(18,gxhhtjz);
		ps.setDouble(19,gxhmll);
		ps.setDouble(20,gxhmll);

		ps.setDouble(21,gxhmle);
		ps.setDouble(22,gxhmle);
		ps.setDouble(23,gxhyjjzcs);
		ps.setDouble(24,gxhyjjz);
		ps.setDouble(25,gxhyjjz);
		ps.setDouble(26,0);

		ps.setDouble(27,zchtje);
		ps.setDouble(28,zchtcb);
		ps.setDouble(29,zchtje);
		ps.setDouble(30,zchtcb);
		ps.setDouble(31,khhtml);
		ps.setDouble(32,khhtml);
		ps.executeUpdate();
		ps.close();
	}

	ls_sql="update crm_khzk set zjjmje=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhzjjmje);
	ps.executeUpdate();
	ps.close();


	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		ls_sql=" insert into cw_tckhqyeczbjq (khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje,sqsj   )  ";
		ls_sql+=" select                      khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje,?   ";
		ls_sql+=" from crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setDouble(2,tcbzjg);
		ps.setDouble(3,tcmjzjje);
		ps.setDouble(4,tczcsjcj);
		ps.setDouble(5,tczccljj);
		ps.setDouble(6,tcxsfzc);
		ps.setDouble(7,tczcjm);
		ps.setDouble(8,tcdpsj);
		ps.setDouble(9,tcdpdlsf);
		ps.setDouble(10,tcxpx);
		ps.setDouble(11,tcwsgzj);
		ps.setDouble(12,tcwgccljj);
		ps.setDouble(13,tcwzjzc);
		ps.setDouble(14,tcsgze);
		ps.setDouble(15,tcqtsf);

		ps.setDouble(16,zctcje);
		ps.setDouble(17,wntcje);
		ps.setDouble(18,jytcje);
		ps.setDouble(19,sctcje);
		ps.setDouble(20,jktcje);

		ps.setDate(21,sqsj);

		ps.executeUpdate();
		ps.close();

		ls_sql=" insert into cw_tckhqyeczbjh (khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje,sqsj     )  ";
		ls_sql+=" values ( ?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setDouble(2,tcbzjg);
		ps.setDouble(3,tcmjzjje);
		ps.setDouble(4,tczcsjcj);
		ps.setDouble(5,tczccljj);
		ps.setDouble(6,tcxsfzc);
		ps.setDouble(7,tczcjm);
		ps.setDouble(8,tcdpsj);
		ps.setDouble(9,tcdpdlsf);
		ps.setDouble(10,tcxpx);
		ps.setDouble(11,tcwsgzj);
		ps.setDouble(12,tcwgccljj);
		ps.setDouble(13,tcwzjzc);
		ps.setDouble(14,tcsgze);
		ps.setDouble(15,tcqtsf);

		ps.setDouble(16,zctcje);
		ps.setDouble(17,wntcje);
		ps.setDouble(18,jytcje);
		ps.setDouble(19,sctcje);
		ps.setDouble(20,jktcje);

		ps.setDate(21,sqsj);
		ps.executeUpdate();
		ps.close();

		
		ls_sql=" delete from crm_tckhqye ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" insert into crm_tckhqye (khbh,tcbzjg,tcmjzjje,tczcsjcj,tczccljj,tcxsfzc,tczcjm,tcdpsj,tcdpdlsf,tcxpx,tcwsgzj,tcwgccljj,tcwzjzc,tcsgze,tcqtsf,zctcje,wntcje,jytcje,sctcje,jktcje   ,tcbzjgzjx,tcmjzjjezjx,tczcsjcjzjx,tczccljjzjx,tcxsfzczjx,tczcjmzjx,tcdpsjzjx,tcdpdlsfzjx,tcxpxzjx,tcwsgzjzjx,tcwgccljjzjx,tcwzjzczjx,tcsgzezjx,tcqtsfzjx   ,zctcjezjx,wntcjezjx,jytcjezjx,sctcjezjx,jktcjezjx)  ";
		ls_sql+=" values ( ?   ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?   ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setDouble(2,tcbzjg);
		ps.setDouble(3,tcmjzjje);
		ps.setDouble(4,tczcsjcj);
		ps.setDouble(5,tczccljj);
		ps.setDouble(6,tcxsfzc);
		ps.setDouble(7,tczcjm);
		ps.setDouble(8,tcdpsj);
		ps.setDouble(9,tcdpdlsf);
		ps.setDouble(10,tcxpx);
		ps.setDouble(11,tcwsgzj);
		ps.setDouble(12,tcwgccljj);
		ps.setDouble(13,tcwzjzc);
		ps.setDouble(14,tcsgze);
		ps.setDouble(15,tcqtsf);

		ps.setDouble(16,zctcje);
		ps.setDouble(17,wntcje);
		ps.setDouble(18,jytcje);
		ps.setDouble(19,sctcje);
		ps.setDouble(20,jktcje);

		ps.setDouble(21,zctcje);
		ps.setDouble(22,wntcje);
		ps.setDouble(23,jytcje);
		ps.setDouble(24,sctcje);
		ps.setDouble(25,jktcje);
		ps.executeUpdate();
		ps.close();


	}
	
	ls_sql=" update cw_qmjzmx ";
	ls_sql+=" set wdzgce=?,zkl=?,qye=?,zqgczjf=?,zhgczjf=?,cdzwjmje=?,glfbfb=?,zqguanlif=?,glfjmje=?,guanlif=?,suijinbfb=?,zqsuijin=?,sjjmje=?,suijin=?,zqsjf=?,sjf=?,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,zqqtsf=?,zhqtsf=?,qtsfsm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,gxhwdzgce);
	ps.setDouble(2,gxhzkl);
	ps.setDouble(3,gxhqye);
	ps.setDouble(4,gxhzqgczjf);
	ps.setDouble(5,gxhzhgczjf);
	ps.setDouble(6,gxhcdzwjmje);
	ps.setDouble(7,gxhglfbfb);
	ps.setDouble(8,gxhzqguanlif);
	ps.setDouble(9,gxhglfjmje);
	ps.setDouble(10,gxhguanlif);
	ps.setDouble(11,gxhsuijinbfb);
	ps.setDouble(12,gxhzqsuijin);
	ps.setDouble(13,gxhsjjmje);
	ps.setDouble(14,gxhsuijin);
	ps.setDouble(15,gxhzqsjf);
	ps.setDouble(16,gxhsjf);
	ps.setDouble(17,gxhzqwjrqyexm);
	ps.setDouble(18,gxhzhwjrqyexm);
	ps.setString(19,gxhwjrqyexmsm);
	ps.setDouble(20,gxhzqqtsf);
	ps.setDouble(21,gxhzhqtsf);
	ps.setString(22,gxhqtsfsm);
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
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>