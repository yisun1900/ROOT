<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xgjlh=null;
String khbh=null;
double xgqzkl=0;
double xgqzjxzkl=0;
double xgqcdzwjmje=0;
double xgqglfjmje=0;
double xgqsjjmje=0;
double xgqwdzgce=0;
double xgqqye=0;
double xgqsuijinbfb=0;
double xgqsuijin=0;
double xgqglfbfb=0;
double xgqzqguanlif=0;
double xgqguanlif=0;
double xgqzqwjrqyexm=0;
double xgqzhwjrqyexm=0;
String xgqwjrqyexmsm=null;
double xgqsjf=0;
double xgqglf=0;

double xghzkl=0;
double xghzjxzkl=0;
double xghcdzwjmje=0;
double xghglfjmje=0;
double xghsjjmje=0;
double xghwdzgce=0;
double xghqye=0;
double xghsuijinbfb=0;
double xghsuijin=0;
double xghglfbfb=0;
double xghzqguanlif=0;
double xghguanlif=0;
double xghzqwjrqyexm=0;
double xghzhwjrqyexm=0;
String xghwjrqyexmsm=null;
double xghsjf=0;
double xghglf=0;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
xgjlh=cf.GB2Uni(request.getParameter("xgjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ls=request.getParameter("xgqzkl");
try{
	if (!(ls.equals("")))  xgqzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前合同折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqzjxzkl");
try{
	if (!(ls.equals("")))  xgqzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前增减项折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqcdzwjmje");
try{
	if (!(ls.equals("")))  xgqcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqcdzwjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前合同减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqglfjmje");
try{
	if (!(ls.equals("")))  xgqglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqglfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前管理费减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqsjjmje");
try{
	if (!(ls.equals("")))  xgqsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqsjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前税金减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqwdzgce");
try{
	if (!(ls.equals("")))  xgqwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqwdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前工程原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqqye");
try{
	if (!(ls.equals("")))  xgqqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqqye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前签约额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("xgqsuijinbfb");
try{
	if (!(ls.equals("")))  xgqsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqsuijinbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前税金百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqsuijin");
try{
	if (!(ls.equals("")))  xgqsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqsuijin不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqglfbfb");
try{
	if (!(ls.equals("")))  xgqglfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqglfbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前管理费百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqzqguanlif");
try{
	if (!(ls.equals("")))  xgqzqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqzqguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前折前管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqguanlif");
try{
	if (!(ls.equals("")))  xgqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前折后管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqzqwjrqyexm");
try{
	if (!(ls.equals("")))  xgqzqwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqzqwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前折前未记入签约额项目]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqzhwjrqyexm");
try{
	if (!(ls.equals("")))  xgqzhwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqzhwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前折后未记入签约额项目]类型转换发生意外:"+e);
	return;
}
xgqwjrqyexmsm=cf.GB2Uni(request.getParameter("xgqwjrqyexmsm"));
ls=request.getParameter("xgqsjf");
try{
	if (!(ls.equals("")))  xgqsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqsjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xgqglf");
try{
	if (!(ls.equals("")))  xgqglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xgqglf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改前服务费]类型转换发生意外:"+e);
	return;
}








ls=request.getParameter("xghzkl");
try{
	if (!(ls.equals("")))  xghzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后合同折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghzjxzkl");
try{
	if (!(ls.equals("")))  xghzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后增减项折扣率]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghcdzwjmje");
try{
	if (!(ls.equals("")))  xghcdzwjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghcdzwjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后合同减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghglfjmje");
try{
	if (!(ls.equals("")))  xghglfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghglfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后管理费减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghsjjmje");
try{
	if (!(ls.equals("")))  xghsjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghsjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后税金减免额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghwdzgce");
try{
	if (!(ls.equals("")))  xghwdzgce=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghwdzgce不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后工程原报价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghqye");
try{
	if (!(ls.equals("")))  xghqye=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghqye不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后签约额]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("xghsuijinbfb");
try{
	if (!(ls.equals("")))  xghsuijinbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghsuijinbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后税金百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghsuijin");
try{
	if (!(ls.equals("")))  xghsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghsuijin不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后税金]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghglfbfb");
try{
	if (!(ls.equals("")))  xghglfbfb=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghglfbfb不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后管理费百分比]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghzqguanlif");
try{
	if (!(ls.equals("")))  xghzqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghzqguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后折前管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghguanlif");
try{
	if (!(ls.equals("")))  xghguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后折后管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghzqwjrqyexm");
try{
	if (!(ls.equals("")))  xghzqwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghzqwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后折前未记入签约额项目]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghzhwjrqyexm");
try{
	if (!(ls.equals("")))  xghzhwjrqyexm=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghzhwjrqyexm不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后折后未记入签约额项目]类型转换发生意外:"+e);
	return;
}
xghwjrqyexmsm=cf.GB2Uni(request.getParameter("xghwjrqyexmsm"));
ls=request.getParameter("xghsjf");
try{
	if (!(ls.equals("")))  xghsjf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghsjf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后设计费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("xghglf");
try{
	if (!(ls.equals("")))  xghglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xghglf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[修改后服务费]类型转换发生意外:"+e);
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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xghzxjwbm=null;
	ls_sql="select zxjwbm";
	ls_sql+=" from  dm_zxjwbm";
	ls_sql+=" where  qd<"+xghqye+" and "+xghqye+"<=zd";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xghzxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int fwmj=0;
	int xgqpmjj=0;
	String xgqzxjwbm=null;
	ls_sql="select fwmj,pmjj,zxjwbm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwmj=rs.getInt("fwmj");
		xgqpmjj=rs.getInt("pmjj");
		xgqzxjwbm=rs.getString("zxjwbm");
	}
	rs.close();
	ps.close();

	int xghpmjj=0;

	if (fwmj!=0)
	{
		xghpmjj=(int)xghqye/fwmj;
	}
	else{
		xghpmjj=0;
	}


	conn.setAutoCommit(false);

	ls_sql =" insert into cw_qyexgjl (xgjlh,khbh";
	ls_sql+=" ,xgqzkl,xgqzjxzkl,xgqcdzwjmje,xgqglfjmje,xgqsjjmje,xgqwdzgce,xgqqye,xgqpmjj,xgqzxjwbm,xgqsuijinbfb,xgqsuijin,xgqglfbfb,xgqzqguanlif,xgqguanlif,xgqzqwjrqyexm,xgqzhwjrqyexm,xgqwjrqyexmsm,xgqsjf,xgqglf ";
	ls_sql+=" ,xghzkl,xghzjxzkl,xghcdzwjmje,xghglfjmje,xghsjjmje,xghwdzgce,xghqye,xghpmjj,xghzxjwbm,xghsuijinbfb,xghsuijin,xghglfbfb,xghzqguanlif,xghguanlif,xghzqwjrqyexm,xghzhwjrqyexm,xghwjrqyexmsm,xghsjf,xghglf ";
	ls_sql+=" ,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" values(?,?  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);

	ps.setDouble(3,xgqzkl);
	ps.setDouble(4,xgqzjxzkl);
	ps.setDouble(5,xgqcdzwjmje);
	ps.setDouble(6,xgqglfjmje);
	ps.setDouble(7,xgqsjjmje);
	ps.setDouble(8,xgqwdzgce);
	ps.setDouble(9,xgqqye);
	ps.setInt(10,xgqpmjj);
	ps.setString(11,xgqzxjwbm);
	ps.setDouble(12,xgqsuijinbfb);
	ps.setDouble(13,xgqsuijin);
	ps.setDouble(14,xgqglfbfb);
	ps.setDouble(15,xgqzqguanlif);
	ps.setDouble(16,xgqguanlif);
	ps.setDouble(17,xgqzqwjrqyexm);
	ps.setDouble(18,xgqzhwjrqyexm);
	ps.setString(19,xgqwjrqyexmsm);
	ps.setDouble(20,xgqsjf);
	ps.setDouble(21,xgqglf);

	ps.setDouble(22,xghzkl);
	ps.setDouble(23,xghzjxzkl);
	ps.setDouble(24,xghcdzwjmje);
	ps.setDouble(25,xghglfjmje);
	ps.setDouble(26,xghsjjmje);
	ps.setDouble(27,xghwdzgce);
	ps.setDouble(28,xghqye);
	ps.setLong(29,xghpmjj);
	ps.setString(30,xghzxjwbm);
	ps.setDouble(31,xghsuijinbfb);
	ps.setDouble(32,xghsuijin);
	ps.setDouble(33,xghglfbfb);
	ps.setDouble(34,xghzqguanlif);
	ps.setDouble(35,xghguanlif);
	ps.setDouble(36,xghzqwjrqyexm);
	ps.setDouble(37,xghzhwjrqyexm);
	ps.setString(38,xghwjrqyexmsm);
	ps.setDouble(39,xghsjf);
	ps.setDouble(40,xghglf);

	ps.setString(41,lrr);
	ps.setDate(42,lrsj);
	ps.setString(43,lrbm);
	ps.setString(44,bz);
	ps.executeUpdate();
	ps.close();


	ls_sql=" update crm_khxx set zkl=?,zjxzkl=?,cdzwjmje=?,glfjmje=?,sjjmje=?,wdzgce=?,qye=?,pmjj=?,zxjwbm=?,suijinbfb=?,suijin=?,glfbfb=?,zqguanlif=?,guanlif=?,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,sjf=?,glf=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghzkl);
	ps.setDouble(2,xghzjxzkl);
	ps.setDouble(3,xghcdzwjmje);
	ps.setDouble(4,xghglfjmje);
	ps.setDouble(5,xghsjjmje);
	ps.setDouble(6,xghwdzgce);
	ps.setDouble(7,xghqye);
	ps.setInt(8,xghpmjj);
	ps.setString(9,xghzxjwbm);
	ps.setDouble(10,xghsuijinbfb);
	ps.setDouble(11,xghsuijin);
	ps.setDouble(12,xghglfbfb);
	ps.setDouble(13,xghzqguanlif);
	ps.setDouble(14,xghguanlif);
	ps.setDouble(15,xghzqwjrqyexm);
	ps.setDouble(16,xghzhwjrqyexm);
	ps.setString(17,xghwjrqyexmsm);
	ps.setDouble(18,xghsjf);
	ps.setDouble(19,xghglf);
	ps.executeUpdate();
	ps.close();

	//修改：电子报价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	ls_sql=" update bj_sfxmmx set sfbfb=?,dj=?,zqsfje=?,sfje=?,dxzkl=? ";
	ls_sql+=" where khbh='"+khbh+"' and sflx='5'";//5:管理费
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghglfbfb);
	ps.setDouble(2,xghzqguanlif);
	ps.setDouble(3,xghzqguanlif);
	ps.setDouble(4,(xghguanlif+xghglfjmje));
	ps.setDouble(5,xghzkl);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update bj_sfxmmx set sfbfb=?,dj=?,zqsfje=?,sfje=? ";
	ls_sql+=" where khbh='"+khbh+"' and sflx='3'";//3:税金
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghsuijinbfb);
	ps.setDouble(2,(xghsuijin+xghsjjmje));
	ps.setDouble(3,(xghsuijin+xghsjjmje));
	ps.setDouble(4,(xghsuijin+xghsjjmje));
	ps.executeUpdate();
	ps.close();

	ls_sql=" update bj_sfxmmx set dxzkl=?,sfje=zqsfje*?/10 ";
	ls_sql+=" where khbh='"+khbh+"' and sflx not in('3','5')";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghzkl);
	ps.setDouble(2,xghzkl);
	ps.executeUpdate();
	ps.close();
	//修改：电子报价＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


	ls_sql=" update crm_zjxdj set jzjje=zjje*?/10.0,zhguanlif=zqguanlif*?/10.0,zjxsuijin=(zjje*?/10.0+zqguanlif*?/10.0)*?/100.0";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghzjxzkl);
	ps.setDouble(2,xghzjxzkl);
	ps.setDouble(3,xghzjxzkl);
	ps.setDouble(4,xghzjxzkl);
	ps.setDouble(5,xghsuijinbfb);
	ps.executeUpdate();
	ps.close();

	double alljzjje=0;
	double allguanlif=0;
	double allzjxsuijin=0;

	ls_sql="select sum(jzjje),sum(zhguanlif),sum(zjxsuijin)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		alljzjje=rs.getDouble(1);
		allguanlif=rs.getDouble(2);
		allzjxsuijin=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zhzjxje=?,zjxguanlif=?,zjxsuijin=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,alljzjje);
	ps.setDouble(2,allguanlif);
	ps.setDouble(3,allzjxsuijin);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" update cw_qmjzmx set zkl=?,zjxzkl=?,cdzwjmje=?,glfjmje=?,sjjmje=?,wdzgce=?,qye=?,suijinbfb=?,suijin=?,glfbfb=?,zqguanlif=?,guanlif=?,zqwjrqyexm=?,zhwjrqyexm=?,wjrqyexmsm=?,sjf=?,glf=?";
	ls_sql+=" ,zhzjxje=?,zjxguanlif=?,zjxsuijin=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setDouble(1,xghzkl);
	ps.setDouble(2,xghzjxzkl);
	ps.setDouble(3,xghcdzwjmje);
	ps.setDouble(4,xghglfjmje);
	ps.setDouble(5,xghsjjmje);
	ps.setDouble(6,xghwdzgce);
	ps.setDouble(7,xghqye);
	ps.setDouble(8,xghsuijinbfb);
	ps.setDouble(9,xghsuijin);
	ps.setDouble(10,xghglfbfb);
	ps.setDouble(11,xghzqguanlif);
	ps.setDouble(12,xghguanlif);
	ps.setDouble(13,xghzqwjrqyexm);
	ps.setDouble(14,xghzhwjrqyexm);
	ps.setString(15,xghwjrqyexmsm);
	ps.setDouble(16,xghsjf);
	ps.setDouble(17,xghglf);

	ps.setDouble(18,alljzjje);
	ps.setDouble(19,allguanlif);
	ps.setDouble(20,allzjxsuijin);
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