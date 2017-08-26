<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String khbh=null;
String[] zjxyybm=null;
String zjxyysm=null;
double zjje=0;
double kglf=0;
double kqtk=0;
double jzjje=0;
java.sql.Date lrsj=null;
java.sql.Date fssj=null;
String lrdw=request.getParameter("lrdw");
String zjxxh=request.getParameter("zjxxh");
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String zjxfsjd=request.getParameter("zjxfsjd");
khbh=cf.GB2Uni(request.getParameter("khbh"));
zjxyybm=request.getParameterValues("zjxyybm");
zjxyysm=cf.GB2Uni(request.getParameter("zjxyysm"));
ls=request.getParameter("zjje");
try{
	if (!(ls.equals("")))  zjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生额]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kglf");
try{
	if (!(ls.equals("")))  kglf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kglf不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣管理费]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("kqtk");
try{
	if (!(ls.equals("")))  kqtk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量kqtk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[扣其它款]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jzjje");
try{
	if (!(ls.equals("")))  jzjje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jzjje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项发生额]类型转换发生意外:"+e);
	return;
}
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
ls=request.getParameter("fssj");
try{
	if (!(ls.equals("")))  fssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fssj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项发生时间]类型转换发生意外:"+e);
	return;
}
double zjxsuijin=0;
ls=request.getParameter("zjxsuijin");
try{
	if (!(ls.equals("")))  zjxsuijin=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxsuijin不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项税金]类型转换发生意外:"+e);
	return;
}
double zqguanlif=0;
ls=request.getParameter("zqguanlif");
try{
	if (!(ls.equals("")))  zqguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zqguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折前增减项管理费]类型转换发生意外:"+e);
	return;
}
double zhguanlif=0;
ls=request.getParameter("zhguanlif");
try{
	if (!(ls.equals("")))  zhguanlif=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zhguanlif不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[折后增减项管理费]类型转换发生意外:"+e);
	return;
}

String zjxwcbz=request.getParameter("zjxwcbz");

double zjxjme=0;
ls=request.getParameter("zjxjme");
try{
	if (!(ls.equals("")))  zjxjme=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zjxjme不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[增减项减免额]类型转换发生意外:"+e);
	return;
}
double glfjmje=0;
ls=request.getParameter("glfjmje");
try{
	if (!(ls.equals("")))  glfjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费减免额]类型转换发生意外:"+e);
	return;
}
double sjjmje=0;
ls=request.getParameter("sjjmje");
try{
	if (!(ls.equals("")))  sjjmje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjjmje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[税金减免额]类型转换发生意外:"+e);
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
double cxhdzjxzkl=0;
ls=request.getParameter("cxhdzjxzkl");
try{
	if (!(ls.equals("")))  cxhdzjxzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdzjxzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销活动增减项折扣]类型转换发生意外:"+e);
	return;
}
double glfzkl=0;
ls=request.getParameter("glfzkl");
try{
	if (!(ls.equals("")))  glfzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量glfzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[管理费折扣]类型转换发生意外:"+e);
	return;
}
double cxhdglfzkl=0;
ls=request.getParameter("cxhdglfzkl");
try{
	if (!(ls.equals("")))  cxhdglfzkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cxhdglfzkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[促销活动管理费折扣]类型转换发生意外:"+e);
	return;
}



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldzjxwcbz=null;
	String oldzjxxh=null;
	double getwdzgce=0;
	double getzjxje=0;
	double getzqguanlif=0;
	double getguanlif=0;
	double getsuijin=0;
	double getzqzjxguanlif=0;
	double getzjxguanlif=0;
	double getzjxsuijin=0;
	ls_sql="select zjxwcbz,zjxxh,wdzgce,zjxje,zqguanlif,guanlif,suijin,zqzjxguanlif,zjxguanlif,zjxsuijin";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		oldzjxwcbz=rs.getString("zjxwcbz");//增减项完成标志
		oldzjxxh=cf.fillNull(rs.getString("zjxxh"));
		getwdzgce=rs.getDouble("wdzgce");
		getzjxje=rs.getDouble("zjxje");
		getzqguanlif=rs.getDouble("zqguanlif");
		getguanlif=rs.getDouble("guanlif");
		getsuijin=rs.getDouble("suijin");
		getzqzjxguanlif=rs.getDouble("zqzjxguanlif");
		getzjxguanlif=rs.getDouble("zjxguanlif");
		getzjxsuijin=rs.getDouble("zjxsuijin");
	}
	rs.close();
	ps.close();
	if (oldzjxwcbz.equals("2"))//1：未完成；2：已完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	double yqgcze=getwdzgce+getzjxje;//增减前工程总额
	double yglf=getzqguanlif+getzqzjxguanlif;//增减前管理费总额
	double ysuijin=getsuijin+getzjxsuijin;//增减前税金总额

	conn.setAutoCommit(false);

	String lx="1";//1：有明细；2：无明细

	ls_sql="insert into crm_zjxdj (zjxxh,khbh,fssj,zjxfsjd,zjxyysm,zjxwcbz,lx,lrr,lrsj,lrdw ";
	ls_sql+=" ,zjje,jzjje,zjxsuijin,zqguanlif,zhguanlif,zjxjme,glfjmje,sjjmje,zjxzkl,cxhdzjxzkl   ,glfzkl,cxhdglfzkl,kglf,kqtk,yqgcze,yglf,ysuijin,sfwc   ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,'N') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setString(2,khbh);
	ps.setDate(3,fssj);
	ps.setString(4,zjxfsjd);
	ps.setString(5,zjxyysm);
	ps.setString(6,zjxwcbz);
	ps.setString(7,lx);
	ps.setString(8,lrr);
	ps.setDate(9,lrsj);
	ps.setString(10,lrdw);

	ps.setDouble(11,zjje);
	ps.setDouble(12,jzjje);
	ps.setDouble(13,zjxsuijin);
	ps.setDouble(14,zqguanlif);
	ps.setDouble(15,zhguanlif);
	ps.setDouble(16,zjxjme);
	ps.setDouble(17,glfjmje);
	ps.setDouble(18,sjjmje);
	ps.setDouble(19,zjxzkl);
	ps.setDouble(20,cxhdzjxzkl);

	ps.setDouble(21,glfzkl);
	ps.setDouble(22,cxhdglfzkl);
	ps.setDouble(23,kglf);
	ps.setDouble(24,kqtk);
	ps.setDouble(25,yqgcze);
	ps.setDouble(26,yglf);
	ps.setDouble(27,ysuijin);

	ps.executeUpdate();
	ps.close();

	for (int i=0;i<zjxyybm.length ;i++ )
	{
		ls_sql="insert into crm_zjxyydj ( zjxxh,khbh,zjxyybm) ";
		ls_sql+=" values ( ?,?,? ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,khbh);
		ps.setString(3,zjxyybm[i]);
		ps.executeUpdate();
		ps.close();
	}

	double allzjxje=0;
	double alljzjje=0;
	double allzjxsuijin=0;
	double allzqguanlif=0;
	double allzhguanlif=0;
	double allkglf=0;
	double allkqtk=0;

	ls_sql="select sum(zjje),sum(jzjje),sum(zjxsuijin),sum(zqguanlif),sum(zhguanlif),sum(kglf),sum(kqtk)";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allzjxje=rs.getDouble(1);
		alljzjje=rs.getDouble(2);
		allzjxsuijin=rs.getDouble(3);
		allzqguanlif=rs.getDouble(4);
		allzhguanlif=rs.getDouble(5);
		allkglf=rs.getDouble(6);
		allkqtk=rs.getDouble(7);
	}
	rs.close();
	ps.close();

	ls_sql="update crm_khxx set zjxxh=?,zjxsj=?,zjxwcbz=? ";
	ls_sql+=" ,zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zjxxh);
	ps.setDate(2,fssj);
	ps.setString(3,zjxwcbz);

	ps.setDouble(4,allzjxje);
	ps.setDouble(5,alljzjje);
	ps.setDouble(6,allzjxsuijin);
	ps.setDouble(7,allzqguanlif);
	ps.setDouble(8,allzhguanlif);
	ps.setDouble(9,allkglf);
	ps.setDouble(10,allkqtk);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set zjxje=?,zhzjxje=?,zjxsuijin=?,zqzjxguanlif=?,zjxguanlif=?,kglf=?,kqtk=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,allzjxje);
	ps.setDouble(2,alljzjje);
	ps.setDouble(3,allzjxsuijin);
	ps.setDouble(4,allzqguanlif);
	ps.setDouble(5,allzhguanlif);
	ps.setDouble(6,allkglf);
	ps.setDouble(7,allkqtk);
	ps.executeUpdate();
	ps.close();

/*
	ls_sql="delete from bj_bjxmmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglfxbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_dwgclzcylq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_zcbjmxq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khglfxbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khglfxbq ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


//////////

	ls_sql="delete from bj_bjxmmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_fjxxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_sfxmmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khglfxbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_dwgclzcylh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_zcbjmxh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khglfxbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="delete from bj_khglfxbh ";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
*/

	//保存增减前后的对比明细
	if (oldzjxxh.equals(""))//目前无增减项，取原报价
	{
		//保存增减项前报价信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,NVL(sfbxx,'3'),zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,NVL(sfxyyjd,'N'),sfzgzc,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,NVL(sfbxx,'3'),sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		ls_sql="insert into bj_dwgclzcylq (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcyl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxq (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//保存增减项前报价信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

		//保存增减项后报价信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,NVL(sfbxx,'3'),zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,NVL(sfxyyjd,'N'),sfzgzc,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
		ls_sql+=" from bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,NVL(sfbxx,'3'),sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz";
		ls_sql+=" from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxb ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		ls_sql="insert into bj_dwgclzcylh (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcyl ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxh (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmx ";
		ls_sql+=" where khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//保存增减项后报价信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成
	}
	else{//取增减项报价
		//保存增减项前报价信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="insert into bj_bjxmmxq (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,NVL(sfbxx,'3'),zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,NVL(sfxyyjd,'N'),sfzgzc,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxq (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxq (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxq (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,NVL(sfbxx,'3'),sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbq (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		ls_sql="insert into bj_dwgclzcylq (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcylh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxq (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//保存增减项前报价信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成

		//保存增减项后报价信息＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="insert into bj_bjxmmxh (zjxxh,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj)";
		ls_sql+=" select ?,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,cldj,rgdj,jxdj,dj,cbenj,sgdbj,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,gycl,flmcgg,bz,bjjb,dqbm,bjlx,NVL(sfbxx,'3'),zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,NVL(sfxyyjd,'N'),sfzgzc,xmpx,glxmbh,?,?";
		ls_sql+=" from bj_bjxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,zjxxh);
		ps.setString(2,lrr);
		ps.setDate(3,lrsj);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_fjxxh (zjxxh,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao)";
		ls_sql+=" select '"+zjxxh+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao";
		ls_sql+=" from bj_fjxxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_gclmxh (zjxxh,khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,sl,zjhsl,wcl,bjbz,fjnxh";
		ls_sql+=" from bj_gclmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmxh (zjxxh,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,NVL(sfbxx,'3'),sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,cxhdzkl,sfje,bz";
		ls_sql+=" from bj_sfxmmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khglfxbh (zjxxh,khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz) ";
		ls_sql+=" select '"+zjxxh+"',khbh,glbxh,dqbm,xmbh,bjjb,glflbm,glmc,pp,xh,gg,jldwbm,xhl,dj,wlbm,wlllbz";
		ls_sql+=" from bj_khglfxbh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

/*
		ls_sql="insert into bj_dwgclzcylh (zjxxh,khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf)";
		ls_sql+=" select '"+zjxxh+"',khbh,dqbm,xmbh,jgwzbm,zcmc,zcgg,zcjldwbm,zcyl,zcf";
		ls_sql+=" from bj_dwgclzcylh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_zcbjmxh (zjxxh,xh,khbh,zcmc,jldwbm,sl,dj,je,bz)";
		ls_sql+=" select '"+zjxxh+"',xh,khbh,zcmc,jldwbm,sl,dj,je,bz";
		ls_sql+=" from bj_zcbjmxh ";
		ls_sql+=" where zjxxh='"+oldzjxxh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
*/
		//保存增减项后报价信息＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成
	}

	
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>