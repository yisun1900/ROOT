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
String sfyckh=cf.GB2Uni(request.getParameter("sfyckh"));


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

	//取客户信息
	String getbjjb="";
	String getbjbbh="";
	String sqhxbm=null;
	ls_sql="select sqhxbm,bjjb,bjbbh,ssfgs,zxdm,zxzt,sjs,sbyybm,sfxhf,hfrq,lfbz,lfsj,ctbz,ctsj,khfwjlh,dmjdjlh,sjsjdjlh,sfzdzbj";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqhxbm=cf.fillNull(rs.getString("sqhxbm"));
		getbjjb=cf.fillNull(rs.getString("bjjb"));
		getbjbbh=cf.fillNull(rs.getString("bjbbh"));
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

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐，删除现有报价项目及工程量
	{
		String tctybz="";//套餐停用标志
		ls_sql="select tctybz";
		ls_sql+=" from  dm_hxbm";
		ls_sql+=" where hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tctybz=cf.fillNull(rs.getString("tctybz"));
		}
		rs.close();
		ps.close();

		if (tctybz.equals("Y"))
		{ 
			if (!sqhxbm.equals(hxbm))
			{
				out.println("错误！户型已停用，未授权");
				return;
			}
		}
	}


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
	ls_sql+=" ,jzbz=?,lfbz=?,lfsj=?,ctbz=?,ctsj=?,cxgtbz=?,cxgtsj=?,csgtbz=?,csgtsj=?";//设计师咨询情况
	ls_sql+=" ,khfwjlh=?,zxjlh=?";//隐藏信息
	ls_sql+=" ,louhao=?,fwdz=?,ysy=?,zcsfss=?";
	ls_sql+=" ,zjzbjsj=TRUNC(SYSDATE),sfyckh=?";
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
	ps.setString(24,jzbz);
	ps.setString(25,lfbz);
	ps.setDate(26,lfsj);
	ps.setString(27,ctbz);
	ps.setDate(28,ctsj);
	ps.setString(29,cxgtbz);
	ps.setDate(30,cxgtsj);
	ps.setString(31,csgtbz);
	ps.setDate(32,csgtsj);

	//隐藏信息
	ps.setString(33,khfwjlh);
	ps.setString(34,zxjlh);

	ps.setString(35,louhao);
	ps.setString(36,fwdz);
	ps.setString(37,ysy);
	ps.setString(38,zcsfss);
	ps.setString(39,sfyckh);

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
			ls_sql="insert into bj_bjxmmx (xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,zqdj,zk,dj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,bjjb,xmlx,jzbz,xmpx,sfzgzc,glxmbh,bjlx,sfbxx,lrr,lrsj   ,sfxycl,sfxyyjd,tcnxmbz ) ";
			ls_sql+=" select            ?+rownum,?,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,clcb,rgcb,jxcb,cbenj,sgcbj,sgdbj,bj  ,10,bj,sfyxdz,zdzk,gycl,flmcgg,bz,dqbm,?   ,'1' ,'1' ,?   ,'N'   ,glxmbh,'1' ,sfbxx,?  ,SYSDATE,sfxycl,sfxyyjd,'N'";//1：需要；2：不需要
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
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"'";
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
			ls_sql+=" from bj_jzbjb,bj_tcbzgcxm ";
			ls_sql+=" where bj_jzbjb.dqbm='"+dqbm+"' and bj_jzbjb.bjjbbm='"+bjjb+"' and bj_jzbjb.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.dqbm='"+dqbm+"' and bj_tcbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.bjjbbm='"+bjjb+"' and bj_tcbzgcxm.hxbm='"+hxbm+"'";
			ls_sql+=" and bj_jzbjb.xmbh=bj_tcbzgcxm.xmbh ";
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
			ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and bjbbh='"+bjbbh+"'";
			ls_sql+=" and xmbh in(select xmbh from bj_bjxmmx where khbh='"+khbh+"' )";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			//增加房间，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from bj_fjxx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			int xuhao=0;
			ls_sql="SELECT max(xuhao)";
			ls_sql+=" FROM bj_fjxx";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xuhao=rs.getInt(1);
			}
			rs.close();
			ps.close();

			//房间信息，从套餐标准主材项目建立
			ls_sql="insert into bj_fjxx ( khbh,jgwzbm,xuhao,oldjgwzbm ) ";
			ls_sql+=" select ?,jgwzbm,?+rownum,jgwzbm ";
			ls_sql+=" from ( ";
			ls_sql+=" select distinct jgwzbm ";
			ls_sql+=" from bj_tcbzzcxm";
			ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"'";
			ls_sql+=" and bj_tcbzzcxm.bjjbbm='"+bjjb+"' and bj_tcbzzcxm.hxbm='"+hxbm+"'";
			ls_sql+=" ) ";
			ls_sql+=" where jgwzbm not in(select jgwzbm from bj_fjxx where khbh='"+khbh+"') ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setInt(2,xuhao);
			ps.executeUpdate();
			ps.close();
			//增加房间，来源：套餐标准主材项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户套餐价格表（bj_khtcjgb）
			ls_sql="delete from bj_khtcjgb "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khtcjgb (khbh,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj)"; 
			ls_sql+=" select ?,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj";
			ls_sql+=" from bj_tcjgb";
			ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			//客户材料小类数量限制
			ls_sql="delete from bj_khclxlxz "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khclxlxz (khbh,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl)"; 
			ls_sql+=" select ?,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl";
			ls_sql+=" from jxc_clxlbm";
			ls_sql+=" where sfxzsl!='1' OR sfkjm!='1'";//1：不限制；2：不能超量；3：可超量需加价 ;  1：不限制；2：限制
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			//客户工程项目小计，来源：套餐标准工程项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from bj_khgcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khgcxmxj (khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz) "; 
			ls_sql+=" select ?,xmbh,bzsl,sfxzsl,ccbfjj,0,0,'Y'";
			ls_sql+=" from bj_tcbzgcxm";
			ls_sql+=" where bj_tcbzgcxm.dqbm='"+dqbm+"' and bj_tcbzgcxm.bjjbbm='"+bjjb+"' and bj_tcbzgcxm.bjbbh='"+bjbbh+"'";
			ls_sql+=" and bj_tcbzgcxm.hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();


			ls_sql="select count(*)";
			ls_sql+=" from  bj_khgcxmxj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				conn.rollback();
				out.println("错误！【套餐标准工程项目】未初始化");
				return;
			}

			//客户工程项目小计，来源：套餐标准工程项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

			//增加客户主材项目小计，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
			ls_sql="delete from bj_khzcxmxj "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfycx,sjsfsl,sjcj,sjsfje)"; 
			ls_sql+=" select                 ?   ,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,0   ,0      ,0     ,0     ,bjjbbm  ,bjjbbm,'1'    ,0     ,0   ,0";//1：无促销；2：无数量限制促销；3：有数量限制促销
			ls_sql+=" from bj_tcbzzcxm";
			ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"'";
			ls_sql+=" and bj_tcbzzcxm.hxbm='"+hxbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();


			ls_sql="select count(*)";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"'  ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				count=rs.getInt(1);
			}
			rs.close();
			ps.close();
			if (count==0)
			{
				conn.rollback();
				out.println("错误！【套餐标准主材项目】未初始化");
				return;
			}
			//增加客户主材项目小计，来源：套餐标准主材项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

		
			ls_sql="delete from bj_khzcxm "; 
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String getjgwzbm=null;
			String gettccplbbm=null;
			double bzsl=0;
			String sfxzsl=null;
			ls_sql="select jgwzbm,tccplbbm,bzsl,sfxzsl";
			ls_sql+=" from  bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and sfbxx='Y'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				getjgwzbm=rs.getString("jgwzbm");
				gettccplbbm=rs.getString("tccplbbm");
				bzsl=rs.getDouble("bzsl");
				sfxzsl=rs.getString("sfxzsl");

			
				count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  bj_tczcbj";
				ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and tccplbbm='"+gettccplbbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					count=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (count==1)
				{
					int sxh=0;
					ls_sql="select NVL(max(sxh),0)";
					ls_sql+=" from  bj_khzcxm";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						sxh=rs1.getInt(1);
					}
					rs1.close();
					ps1.close();

					ls_sql="insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj,jsfs,jsj,jsbl,sh,sfcscp,bz,sfkgdj,zclx,sl,ptcpsm,bjjbbm,ddcljjfs,xdsl)";
					ls_sql+=" select    "+sxh+"+rownum,?   ,?     ,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,dj   ,tccldj,dj,'1' ,jsj,0   ,sh,sfcscp,bz,sfkgdj,'1' ,? ,?     ,?     ,'0','1'";
					ls_sql+=" from bj_tczcbj";
					ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					ps1.setString(1,khbh);
					ps1.setString(2,getjgwzbm);
					ps1.setDouble(3,bzsl);
					ps1.setString(4,"");
					ps1.setString(5,bjjb);
					ps1.executeUpdate();
					ps1.close();

					double sjsl=0;
					double sjjshsl=0;
					ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
					ls_sql+=" FROM bj_khzcxm";
					ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+getjgwzbm+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						sjsl=rs1.getDouble(1);
						sjjshsl=rs1.getDouble(2);
					}
					rs1.close();
					ps1.close();


					ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
					ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+getjgwzbm+"' and tccplbbm='"+gettccplbbm+"'";
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
			
			
			}
			rs.close();
			ps.close();
		
		}

		ls_sql="delete from bj_khglxmb ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


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

		ls_sql="delete from bj_sfxmmx ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		if (lx.equals("1"))//1：非套餐；2：套餐
		{
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