<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String ls=null;

//基本信息
String xb=request.getParameter("xb");
String email=cf.GB2Uni(request.getParameter("email"));
String nlqjbm=request.getParameter("nlqjbm");
String zybm=request.getParameter("zybm");
String czrkbm=request.getParameter("czrkbm");
String jtjgbm=request.getParameter("jtjgbm");
String xfwdz=cf.GB2Uni(request.getParameter("xfwdz"));

String louhao=cf.GB2Uni(request.getParameter("louhao"));
String fwdz=cf.GB2Uni(request.getParameter("fwdz"));


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
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
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
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String ysy=cf.GB2Uni(request.getParameter("ysy"));
String zcsfss=request.getParameter("zcsfss");
String sfxjz=request.getParameter("sfxjz");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


String ssfgs=null;
String yzxdm=null;
String yzxzt=null;
String ysjs=null;
String ysfxhf=null;
java.sql.Date yhfrq=null;
String ylfbz=null;
java.sql.Date ylfsj=null;
String yctbz=null;
java.sql.Date yctsj=null;
String ydmjdjlh=null;
String ysjsjdjlh=null;
String ykhfwjlh=null;
String ysbyybm=null;
String sfzdzbj=null;

try {
	conn=cf.getConnection();

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

	int zxcs=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zxcs=rs.getInt(1);
	}
	rs.close();
	ps.close();

	//取客户信息
	ls_sql="select ssfgs,zxdm,zxzt,sjs,sbyybm,sfxhf,hfrq,lfbz,lfsj,ctbz,ctsj,khfwjlh,dmjdjlh,sjsjdjlh,sfzdzbj";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		yzxdm=rs.getString("zxdm");
		yzxzt=rs.getString("zxzt");
		ysjs=rs.getString("sjs");
		ysbyybm=cf.fillNull(rs.getString("sbyybm"));
		ysfxhf=rs.getString("sfxhf");
		yhfrq=rs.getDate("hfrq");
		ylfbz=rs.getString("lfbz");
		ylfsj=rs.getDate("lfsj");
		yctbz=rs.getString("ctbz");
		yctsj=rs.getDate("ctsj");
		ykhfwjlh=cf.fillNull(rs.getString("khfwjlh"));
		ydmjdjlh=cf.fillNull(rs.getString("dmjdjlh"));
		ysjsjdjlh=cf.fillNull(rs.getString("sjsjdjlh"));
		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！不存在的客户编号");
		return;
	}
	rs.close();
	ps.close();


	//检查设计师是否存在
	int count=0;

	//生成客户服务记录号
	String khfwjlh=null;
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	khfwjlh=khbh+cf.addZero(count+1,3);


	conn.setAutoCommit(false);


	//修改客户信息
	ls_sql="update crm_zxkhxx set";
	ls_sql+="  xb=?,email=?,nlqjbm=?,zybm=?,czrkbm=?,jtjgbm=?,xfwdz=?";//基本信息
	ls_sql+=" ,fwlxbm=?,yjzxsj=?,hxbm=?,fwmj=?,lcbm=?,fjfwbm=?,cxbm=?,cgbm=?,fgyqbm=?,scqxbm=?,fwytbm=?";//房屋及个人取向情况
	ls_sql+=" ,zxysbm=?,zxzc=?,hqpszc=?,jjzczc=?,jdzj=?";//家居理财专业建议
	ls_sql+=" ,bjjb=?,jzbz=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?,cxgtbz=?,cxgtsj=?,csgtbz=?,csgtsj=?";//设计师咨询情况
	ls_sql+=" ,khfwjlh=?,zxjlh=?";//隐藏信息
	ls_sql+=" ,louhao=?,fwdz=?,bjbbh=?,ysy=?,zcsfss=?,sfxjz=?";
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

	//隐藏信息
	ps.setString(34,khfwjlh);
	ps.setString(35,zxjlh);

	ps.setString(36,louhao);
	ps.setString(37,fwdz);
	ps.setString(38,bjbbh);
	ps.setString(39,ysy);
	ps.setString(40,zcsfss);
	ps.setString(41,sfxjz);

	ps.executeUpdate();
	ps.close();


	//插入表：咨询客户服务记录（crm_zxkhfwjl）
	ls_sql="insert into crm_zxkhfwjl (khfwjlh,khbh,ssfgs,zxdm,sjs,sbyybm,sbyyxs,czlx,xzxzt,yzxzt,ysfxhf,yhfrq,yzxdm,ysjs,ysbyybm,ykhfwjlh,lrr,lrsj,lrbm)";
	ls_sql+=" values ( ?,?,?,?,?,?,?,'9',?,?,?,?,?,?,?,?,?,TRUNC(SYSDATE),?)";//9: 设计师咨询
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,khfwjlh);
	ps.setString(2,khbh);
	ps.setString(3,ssfgs);
	ps.setString(4,dwbh);
	ps.setString(5,sjs);
	ps.setString(6,"");
	ps.setString(7,zxqk);
	ps.setString(8,yzxzt);
	ps.setString(9,yzxzt);
	ps.setString(10,ysfxhf);
	ps.setDate(11,yhfrq);
	ps.setString(12,yzxdm);
	ps.setString(13,ysjs);
	ps.setString(14,ysbyybm);
	ps.setString(15,ykhfwjlh);
	ps.setString(16,lrr);
	ps.setString(17,dwbh);
	ps.executeUpdate();
	ps.close();

	//插入：设计师咨询情况（crm_sjszxqk）
	ls_sql="insert into crm_sjszxqk (zxjlh,khbh,dwbh,sjs,zxsj,zxzt,zxqk,sfxhf,hfrq,lrr,lrsj,ysfxhf,yhfrq,ylfbz,ylfsj,yctbz,yctsj,khfwjlh)";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,zxjlh);
	ps.setString(2,khbh);
	ps.setString(3,dwbh);
	ps.setString(4,sjs);
	ps.setDate(5,zxsj);

	ps.setString(6,yzxzt);
	ps.setString(7,zxqk);
	ps.setString(8,"");
	ps.setDate(9,null);
	ps.setString(10,lrr);
	ps.setDate(11,lrsj);

	ps.setString(12,ysfxhf);
	ps.setDate(13,yhfrq);
	ps.setString(14,ylfbz);
	ps.setDate(15,ylfsj);
	ps.setString(16,yctbz);
	ps.setDate(17,yctsj);
	ps.setString(18,khfwjlh);

	ps.executeUpdate();
	ps.close();

	//取电子报价必选项目

	if (getbjbbh==null || getbjbbh.equals(""))//第一次做报价，允许修改
	{
		ls_sql="update crm_zxkhxx set bjbbh=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,bjbbh);
		ps.executeUpdate();
		ps.close();
	}

	if (getbjjb==null || getbjjb.equals(""))//第一次做报价，允许修改
	{
		ls_sql="update crm_zxkhxx set sczbjsj=TRUNC(SYSDATE),bjjb=? ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,bjjb);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="delete from bj_fjxx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		
		ls_sql="insert into bj_fjxx (khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,fjzcxq,bz,xuhao,fjlx)";
		ls_sql+=" select                ?,jgwzmc,fjmj,0  ,0      ,0      ,jgwzmc   ,''    ,'',xuhao,fjlx";
		ls_sql+=" from bdm_hxfjdzb  ";
		ls_sql+=" where hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from bj_bjxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		long xh=0;
		ls_sql="select NVL(max(xh)+1,0)";
		ls_sql+=" from  bj_bjxmmx";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xh=rs.getLong(1);
		}
		rs.close();
		ps.close();

		int xmpx=0;//项目排序
		ls_sql="select NVL(max(xmpx)+1,0)";
		ls_sql+=" from  bj_bjxmmx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xmpx=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (lx.equals("1"))//1：非套餐；2：套餐
		{
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj,sfxycl,sfxyyjd ) ";
			ls_sql+=" select            ?+rownum,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,?   ,'1' ,'1' ,?   ,'N'   ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' and sfbxx in('1','2') ";//1：必报项；2：必列项；3：可选项；9：作废项
			ls_sql+=" and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,khbh);
			ps.setString(3,bjjb);
			ps.setInt(4,xmpx);
			ps.setString(5,yhdlm);
			ps.executeUpdate();
			ps.close();

			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb  ,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{//套餐，需要取：套餐标准主材项目、套餐标准工程项目
			//增加报价项目，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj   ,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select   ?+rownum,?,bj_jzbjb.xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,bj_jzbjb.dqbm,?,'1','1',?,'N'  ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd,'Y'";//1：需要；2：不需要
			ls_sql+=" from bj_jzbjb,tc_csrjbzgcxm ";
			ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.dqbm='"+dqbm+"' and tc_csrjbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and tc_csrjbzgcxm.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_jzbjb.xmbh=tc_csrjbzgcxm.xmbh ";
			ls_sql+=" and bj_jzbjb.xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,xh);
			ps.setString(2,khbh);
			ps.setString(3,bjjb);
			ps.setInt(4,xmpx);
			ps.setString(5,yhdlm);
			ps.executeUpdate();
			ps.close();
			//增加报价项目，来源：套餐标准工程项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户工料分析表（bj_khglfxb）
			ls_sql="delete from bj_khglfxb ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khglfxb (khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx) ";
			ls_sql+="                   select ?,glbxh,dqbm,bjjbbm,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
			ls_sql+=" from bj_jzglfxb ";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		
			//客户套餐价格表＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjgb "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjgb (khbh,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj)"; 
			ls_sql+=" select                     ?,tcmc,mjpmdj,tnzxjjmj,cfdj,cfbzmj,cfccmjdj,wsjdj,wsjbzmj,wsjccmjdj,tlgbzjmj";
			ls_sql+=" from tc_csrjtcjgb";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户套餐价格表＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
		
			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcgjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcgjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzsl,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzsl,bzsl,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcgjmj,bj_fjxx";
			ls_sql+=" where tc_csrjcgjmj.dqbm='"+dqbm+"' and tc_csrjcgjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=1";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户橱柜价格表（tc_csrjkhcgjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户木门价格表（tc_khmmjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhmmjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhmmjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,zdsl,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,tcnbz,sfbxx,bzmj,bzsl,mtmzjmj,0   ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjmmjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhmmjmj set zdsl=bzsl+FLOOR(("+fwmj+"-bzmj)/mtmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"' and sfxzsl!='1'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户木门价格表（tc_khmmjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户洁具价格表（tc_khjjjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhjjjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhjjjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjjjjmj,bj_fjxx";
			ls_sql+=" where tc_csrjjjjmj.dqbm='"+dqbm+"' and tc_csrjjjjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx=2";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户洁具价格表（tc_khjjjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户磁砖价格表（tc_khczjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhczjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj,bj_fjxx";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm not in(25,26)";//大地砖/大地砖踢脚线
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhczjmj (khbh,tccplbbm,jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,'其它',tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjczjmj";
			ls_sql+=" where tc_csrjczjmj.dqbm='"+dqbm+"' and tc_csrjczjmj.bjjbbm='"+bjjb+"'";
			ls_sql+=" and tc_csrjczjmj.tccplbbm in(25,26)";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户磁砖价格表（tc_khczjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户铝扣板价格表（tc_khlkbjgb）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhlkbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhlkbjmj (khbh,tccplbbm,jgwzbm        ,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,bj_fjxx.jgwzbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjlkbjmj,bj_fjxx";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_fjxx.khbh='"+khbh+"'";
			ls_sql+=" and bj_fjxx.fjlx in(1,2)";//1：厨房；2：卫生间；3：卧室；4：客厅；5：餐厅；6：阳台
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户铝扣板价格表（tc_khlkbjgb）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户地板减免价（tc_csrjkhdbjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhdbjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhdbjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,sjjmsl,sjjmje,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,tcnbz,sfbxx,0     ,0     ,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjdbjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户地板减免价（tc_csrjkhdbjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户衣柜减免价（tc_csrjkhygjmj）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhygjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhygjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                       ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dyygpm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjygjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhygjmj set zdpms=dyygpm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户衣柜减免价（tc_csrjkhygjmj）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户五金电器减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhwjdqjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhwjdqjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,sfxzsl,bzsl,tcnbz,sfbxx,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,sfxzsl,bzsl,tcnbz,sfbxx,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjwjdqjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//v＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加:客户过门石减免价＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgmsjmj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgmsjmj (khbh,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,sjjmsl,sjjmje,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,zdpms,sjpms,lrr      ,lrsj)"; 
			ls_sql+=" select                        ?,tccplbbm,tccpdlbm,sfyqxtpp,jldw,sfkjm,jmdj,0     ,0     ,tcnbz,sfbxx,sfxzsl,fjbzmj,dypm,pmzjmj,0    ,0    ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjgmsjmj";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql="update tc_csrjkhgmsjmj set zdpms=dypm+FLOOR(("+fwmj+"-fjbzmj)/pmzjmj)"; //最大数量
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//增加:客户过门石减免价＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
			
			
			//增加:客户常用套餐外项目（tc_khcytcwxm）＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhcytcwxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhcytcwxm (khbh,tccplbbm,tccpdlbm,sjsl,lrr      ,lrsj)"; 
			ls_sql+=" select                         ?,tccplbbm,tccpdlbm,0   ,'"+lrr+"',SYSDATE";
			ls_sql+=" from tc_csrjcytcwxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//增加:客户常用套餐外项目（tc_khcytcwxm）＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户标准项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhbzxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhbzxm (khbh,xmmc,ppmc,xh,jldw,bhsl,bz,lrr,lrsj)"; 
			ls_sql+=" select                      ?,xmmc,ppmc,xh,jldw,bhsl,bz,?  ,SYSDATE";
			ls_sql+=" from tc_csrjbzxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setString(2,lrr);
			ps.executeUpdate();
			ps.close();
			//客户标准项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


			//客户工程项目小计＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from tc_csrjkhgcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into tc_csrjkhgcxmxj (khbh,xmbh,bzsl,sfxzsl,sjsl,xjjsl,tcnxmbz)"; 
			ls_sql+=" select                        ?,xmbh,bzsl,sfxzsl,0   ,0    ,'Y'";
			ls_sql+=" from tc_csrjbzgcxm";
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
			//客户工程项目小计＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			
			ls_sql="delete from tc_csrjkhzcqd "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (sfxjz.equals("Y"))
			{
				ls_sql="delete from tc_csrjkhmmjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhczjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" and tccplbbm in(25,26)";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhdbjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhygjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhwjdqjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql="delete from tc_csrjkhgmsjmj "; 
				ls_sql+=" where khbh='"+khbh+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}
		
		
		}

		ls_sql="insert into bj_khglxmb (khbh,xmbh,glxmbh) ";
		ls_sql+=" select ?,xmbh,glxmbh";
		ls_sql+=" from bj_glxmb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' ";
		ls_sql+=" and xmbh in ";
		ls_sql+=" ( ";
		ls_sql+=" select xmbh ";
		ls_sql+=" from bj_jzbjb ";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"' and sfbxx in('1','2') ";//1：必报项；2：必列项；3：可选项；9：作废项
		ls_sql+=" and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"') ";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_sfxmmx (khbh,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfbfb,zqsfje   ,dxzkl,sfje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,dj  ,jldw,sl,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz ) ";
		ls_sql+=" select               ?   ,sfxmbm,sfxmmc,sflx,sfbxx,sfjrqye,jrsjbz,jrglfbz,0    ,gdje     ,10   ,gdje,bz,sfkdz,zdzk,sfxmlx,sfcysgdjs,gdje,jldw,1 ,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb,sffqsk,cbjjsfs,sfjrhtjz";
		ls_sql+=" from bdm_sfxmbm ";
		ls_sql+=" where dqbm='"+dqbm+"' and sfbxx='1' and sfxmbm not in(select sfxmbm from bj_sfxmmx where khbh='"+khbh+"')";//1：必选；2：非必选；
		ls_sql+=" and (sfxsq='1' OR (sfxsq='2' and sfxmbm in(select sfxmbm from sq_sfxmsq where ygbh='"+ygbh+"')))";//1：不需授权；2：需授权使用
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();
	}

	dzbj.Tzk tzk=new dzbj.Tzk();

	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

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