<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;
String dwbh=null;
String lrsj=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
double qye=0;
double guanlif=0;
double suijin=0;
double sjf=0;
double glf=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String xqbm=null;
String sjs=null;
String sjsdh=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;
String kgsjqd=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ybjfwdz="";
String ybjsjs="";
String ybjsgd="";
String ybjsgbz="";
String ybjzjxm="";

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

String deflbm="";
String deflmc="";
String kpjlh=null;
String yxzssgd=null;
String yxfzssgd=null;
String hdsgd=null;
String hdsgbz=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int kxsgds=10;//候选数量

try {
	conn=cf.getConnection();

	ls_sql="select hdsgd,hdsgbz,fgsbh,kgsjqd,DECODE(jzbz,'1','家装工程','2','公装工程') jzbz,DECODE(NVL(kgzbz,'N'),'Y','已出开工证','N','未出开工证') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,xqbm,sgbz,pmjj,qye,guanlif,suijin,sjf,glf,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		hth=cf.fillNull(rs.getString("hth"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		ybjssmc=cf.fillNull(rs.getString("ybjssmc"));
		hdsfssmc=cf.fillNull(rs.getString("hdsfssmc"));
	}
	rs.close();
	ps.close();

/*
	if (kgsjqd.equals("N"))
	{
		out.println("不能派单，开工时间未确定");
		return;
	}
*/
	if (sgd.equals(""))
	{
		sgd="0";
	}

	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'（'||sq_sgd.sgd||'）' sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  khbh='"+ybjbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybjfwdz=cf.fillNull(rs.getString("fwdz"));
		ybjsjs=cf.fillNull(rs.getString("sjs"));
		ybjsgd=cf.fillNull(rs.getString("sgd"));
		ybjsgbz=cf.fillNull(rs.getString("sgbz"));
		ybjzjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();


	ls_sql="select dh";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' and yhmc='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>派单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">电子派单（根据设置，候选『<%=kxsgds%>』个）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">

<%
	String getsgd=null;
	String sgdmc=null;
	String bzmc=null;
	String getkhmyd=null;
	String zbj=null;
	String bzjb=null;
	String sgdjb=null;
	String mqzsgds=null;
	String getkygrsl=null;

	String hxsgdstr="";

	int count=0;

	double zxzbj=0;
	int grs=0;
	double khmyd=0;
	ls_sql=" select zbj,grs,khmyd";
	ls_sql+=" from  kp_yzfdzpdcs";
	ls_sql+=" where ssfgs='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxzbj=rs.getDouble("zbj");
		grs=rs.getInt("grs");
		khmyd=rs.getDouble("khmyd");
	}
	rs.close();
	ps.close();

	if (hdsfssmc.equals("未核实"))
	{
		out.println("<font color='#FF00FF'><B>提醒！回单未核实，按非回单处理</B></font>");
	}
	else if (hdsfssmc.equals("不属实"))
	{
		out.println("<font color='#FF00FF'><B>提醒！回单不属实，按非回单处理</B></font>");
	}

	double qyeall=qye+guanlif+suijin;

	//生成派单条件SQL语句＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	//必要派单条件：
	String BYsql="";
	BYsql =" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' or (sq_sgd.tdbz='Y' and sq_sgd.tdzzsj < SYSDATE )) ";
	BYsql+=" and sq_bzxx.tdbz='N' ";
	BYsql+=" and sq_sgd.zbj>="+zxzbj;//风险押金（押金不足的不能派单，押金多的优于少的）
	BYsql+=" and sq_sgd.khmyd>="+khmyd;//客户满意度[派单月之前三个月内完工工程，满意度（满意与非常满意之和）低于80%的项目经理不能派单。
	BYsql+=" and sq_bzxx.kygrsl>=2";//可用工人数量
	BYsql+=" and sq_bzxx.kjdzdz>="+qyeall;//单额 < 可接单额最大值
	BYsql+=" and sq_bzxx.mqzsgds<sq_bzxx.zdzsgds";// 目前在施工地数 < 班组最大在施工地数， 每个班组在施工地不超过3个单

	//高一级的项目经理或班组在派单数大于50%的情况下，才能向下一级派单，同一级项目经理或班组轮流派单
	String GJsql=" and sq_bzxx.mqzsgds<sq_bzxx.zxzsgds";//目前在施工地数 < 班组最小在施工地数
	GJsql+=" and sq_bzxx.kjdzxz<="+qyeall;//派单额 > 可接单额最小值

	//同小区派单，优先派本小区的施工队
	//查询班长同小区在施工地
	String XQsql=" and sq_bzxx.bzmc in(select sgbz from crm_khxx where gcjdbm in('1','2') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  xqbm='"+xqbm+"' and crm_khxx.sgd=sq_bzxx.sgd)";//可用工人数量
	
	//同城区派单，优先派本城区的施工队
	//查询班长同城区在施工地
	String CQsql=" and sq_bzxx.bzmc in(select sgbz from crm_khxx where gcjdbm in('1','2') and crm_khxx.zt='2' and fgsbh='"+ssfgs+"' and  cqbm='"+cqbm+"' and crm_khxx.sgd=sq_bzxx.sgd)";//可用工人数量
	//生成派单条件SQL语句＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	//优先派回单，派给回单人
	if ( hdsfssmc.equals("属实") && (hdbz.equals("3") || hdbz.equals("6")) )//1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他
	{
		ls_sql=" select sq_bzxx.sgd";
		ls_sql+=" from  sq_bzxx,sq_sgd";
		ls_sql+=" where sq_bzxx.sgd=sq_sgd.sgd and sq_bzxx.bzmc='"+hdsgbz+"' and sq_sgd.sgdmc='"+hdsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsgd=rs.getString("sgd");
		}
		else{
			out.println("错误！不存在的回单信息，回单工地队长["+hdsgd+"]；回单工地班长["+hdsgbz+"]");
			return;
		}
		rs.close();
		ps.close();

		hxsgdstr+="<option value=\""+getsgd+"*"+hdsgbz+"\">"+hdsgbz+"("+hdsgd+")（回单）</option>";
	}
	else{
		hxsgdstr+="<option value=''></option>";

		//清空临时表
		ls_sql=" delete from pd_yzfpdlsb where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//同小区派单，先满足上级接单
		ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
		ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','1',rownum ";
		ls_sql+=" from (";
		ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
		ls_sql+=" from sq_sgd,sq_bzxx";
		ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
		//必要派单条件：
		ls_sql+=BYsql;
		//同小区派单
		ls_sql+=XQsql;

		//高一级的项目经理或班组在派单数大于50%的情况下，才能向下一级派单，同一级项目经理或班组轮流派单
		ls_sql+=GJsql;

		ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
		ls_sql+=" )";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();



		//同小区派单，无施工队可满足，可向下级接单
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
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
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','1',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//必要派单条件：
			ls_sql+=BYsql;
			//同小区派单
			ls_sql+=XQsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}


		//同城区派单，先满足上级接单
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
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
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','2',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//必要派单条件：
			ls_sql+=BYsql;
			//同城区派单
			ls_sql+=CQsql;

			//高一级的项目经理或班组在派单数大于50%的情况下，才能向下一级派单，同一级项目经理或班组轮流派单
			ls_sql+=GJsql;

			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//同城区派单，无施工队可满足，可向下级接单
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
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
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','2',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//必要派单条件：
			ls_sql+=BYsql;
			//同城区派单
			ls_sql+=CQsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//无本小区接单，无本城区接单，先满足上级接单
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
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
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','9',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//必要派单条件：
			ls_sql+=BYsql;

			//高一级的项目经理或班组在派单数大于50%的情况下，才能向下一级派单，同一级项目经理或班组轮流派单
			ls_sql+=GJsql;

			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

		//无施工队可满足，可向下级接单
		ls_sql=" select count(*) from pd_yzfpdlsb where khbh='"+khbh+"'";
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
			ls_sql =" insert into pd_yzfpdlsb (khbh,sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,sfbxz,lx,xh) ";
			ls_sql+=" select '"+khbh+"',sgd,sgdmc,sgdjb,zbj,khmyd,bzmc,bzjb,mqzsgds,kygrsl,'N','9',rownum ";
			ls_sql+=" from (";
			ls_sql+=" select sq_bzxx.kygrsl,sq_sgd.sgd,sq_sgd.sgdmc,sq_bzxx.bzmc,sq_sgd.zbj,sq_sgd.khmyd,sq_bzxx.sgdjbbm bzjb,sq_sgd.sgdjbbm sgdjb,sq_bzxx.mqzsgds ";
			ls_sql+=" from sq_sgd,sq_bzxx";
			ls_sql+=" where sq_sgd.sgd=sq_bzxx.sgd and sq_sgd.ssfgs='"+ssfgs+"' ";
			//必要派单条件：
			ls_sql+=BYsql;
			ls_sql+=" order by sq_bzxx.sgdjbbm,sq_sgd.sgdjbbm,sq_sgd.zbj desc,sq_sgd.khmyd desc,sq_bzxx.mqzsgds";
			ls_sql+=" )";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}


	//处理重复施工队
	int js=0;
	ls_sql =" select sgd,bzmc";
	ls_sql+=" from pd_yzfpdlsb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsgd=cf.fillNull(rs.getString("sgd"));
		bzmc=cf.fillNull(rs.getString("bzmc"));

		//判断施工队是否已选择
		count=0;
		ls_sql =" select count(*)";
		ls_sql+=" from pd_yzfpdlsb ";
		ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and sfbxz='Y'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count==0)//未选择，则设选择标志
		{
			ls_sql=" update pd_yzfpdlsb set sfbxz='Y'  ";
			ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and bzmc='"+bzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			js++;

			if (js>kxsgds)
			{
				break;
			}
		}
	}
	rs.close();
	ps.close();

	//判断是否满足数量，数量不足，补充
	if (js<kxsgds)
	{
		ls_sql =" select sgd,bzmc";
		ls_sql+=" from pd_yzfpdlsb ";
		ls_sql+=" where khbh='"+khbh+"' and sfbxz='N'";
		ls_sql+=" order by xh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getsgd=cf.fillNull(rs.getString("sgd"));
			bzmc=cf.fillNull(rs.getString("bzmc"));

			ls_sql=" update pd_yzfpdlsb set sfbxz='Y'  ";
			ls_sql+=" where khbh='"+khbh+"' and sgd='"+getsgd+"' and bzmc='"+bzmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();

			js++;

			if (js>kxsgds)
			{
				break;
			}
		}
		rs.close();
		ps.close();
	}

	//显示施工队
	String lxmc=null;
	ls_sql =" select kygrsl,sgd,sgdmc,bzmc,zbj,khmyd,bzjb,sgdjb,mqzsgds,DECODE(lx,'1','（同小区）','2','（同城区）','9','') lxmc ";
	ls_sql+=" from pd_yzfpdlsb ";
	ls_sql+=" where khbh='"+khbh+"' and sfbxz='Y'";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getkygrsl=cf.fillNull(rs.getString("kygrsl"));
		getsgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		bzmc=cf.fillNull(rs.getString("bzmc"));
		zbj=cf.fillNull(rs.getString("zbj"));
		getkhmyd=cf.fillNull(rs.getString("khmyd"));
		bzjb=cf.fillNull(rs.getString("bzjb"));
		sgdjb=cf.fillNull(rs.getString("sgdjb"));
		mqzsgds=cf.fillNull(rs.getString("mqzsgds"));
		lxmc=cf.fillNull(rs.getString("lxmc"));

		hxsgdstr+="\r\n<option value=\""+getsgd+"*"+bzmc+"\">"+bzmc+"(可用工人数"+getkygrsl+")("+sgdmc+")"+lxmc+"</option>";
	}
	rs.close();
	ps.close();

	//清空临时表
	ls_sql=" delete from pd_yzfpdlsb where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
%>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">合同号</div>              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>（<%=lxfs%>）</font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#000000">是否家装</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">城区</font></td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"><%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">小区</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=xqbm%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF" align="right">签单店面</td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right">设计师</td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>（电话：<%=sjsdh%>）</font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>              </td>
              <td width="36%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">录入时间</font></div>              </td>
              <td width="33%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">参观样板间编号</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">样板间地址</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">设计师</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">质检姓名</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">施工队</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">施工班组</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">回单标志</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">回单人</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">回单工地队长</font></td>
              <td width="36%" bgcolor="#FFFFFF"><font color="#000000"><%=hdsgd%></font></td>
              <td width="17%" bgcolor="#FFFFFF" align="right"><font color="#660066">回单工地班长</font></td>
              <td width="33%" bgcolor="#FFFFFF"><font color="#660066"><%=hdsgbz%></font></td>
            </tr>
            <tr> 
              <td width="14%" align="right" bgcolor="#FFFFFF"><font color="#660066">回单装修地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="14%" align="right">样板间是否属实</td>
              <td width="36%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="17%" align="right">回单是否属实</td>
              <td width="33%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b><font color="#0000FF">客户类型</font></b></td>
              <td width="36%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="17%" align="right"><b>建议交底日期</b></td>
              <td width="33%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="14%" align="right"><b>合同开工日期</b></td>
              <td width="36%"><font color="#000000"><%=kgrq%></font></td>
              <td width="17%" align="right"><b>合同竣工日期</b></td>
              <td width="33%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">出开工证标志</td>
              <td width="36%" bgcolor="#FFFFCC"><%=kgzbz%></td>
              <td width="17%" align="right" bgcolor="#FFFFCC">签约额</td>
              <td width="33%" bgcolor="#FFFFCC"><font color="#000000"><%=cf.formatDouble(qyeall)%></font> </td>
            </tr>
            <tr>
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>派单类型</td>
              <td width="36%" bgcolor="#FFFFCC">
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:182PX" >
                  <option value="8">电子派单</option>
                </select>              </td>
              <td width="17%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>是否占派单指标</td>
              <td width="33%" bgcolor="#FFFFCC">
                <input type="radio" name="shzzb" value="Y" checked>占指标              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">派单人</font></div>              </td>
              <td width="36%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="24" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="17%" bgcolor="#FFFFCC"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">派单时间</font></div>              </td>
              <td width="33%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right"><font color="#CC0000">*</font>施工班长</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:668PX" onChange="changeSgd(editform)" >
                  <%=hxsgdstr%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFCC" align="right">质检</td>
              <td width="36%" bgcolor="#FFFFCC"><select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%>
              </select></td>
              <td width="17%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="33%" bgcolor="#FFFFCC">&nbsp;</td>
            </tr>
            <tr> 
              <td width="14%" bgcolor="#FFFFFF"> 
                <div align="right">派单说明</div>              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="pdsm" cols="73" rows="3"><%=pdsm%></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
                <input type="hidden"  name="kpjlh" value="<%=kpjlh%>">
                <input type="hidden"  name="deflbm" value="<%=deflbm%>">
                <input type="button"  value="保存" onClick="f_do(editform)">
                <input type="button" onClick="f_pdpm(editform)"  value="施工队派单排名">
                <%
if (!hdbz.equals("1"))
{
%> 
                <input type="button"  value="核实回单" onClick="window.open('/sgdgl/yzfdzpd/hshd/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')">
                <%
}
if (ybjss.equals("0"))
{
%> 
                <input type="button"  value="核实样板间" onClick="window.open('/gcgl/hsybj/EditCrm_khxx.jsp?khbh=<%=wherekhbh%>')" name="button">
                <%
}
%> 
                <input type="button"  value="施工队派单统计" onClick="f_cksgd(editform)">
                <input type="button"  value="查询附近在施工程" onClick="f_ckbz(editform)" >
                <input type="reset"  value="重输">
                <input type="button"  value="打印派工单" onClick="window.open('/pdgl/pd/DyPdCrm_khxx.jsp?khbh=<%=wherekhbh%>')">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>



<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function changeSgd(FormName)
{
	if (FormName.sgd.value=='')
	{
		return;
	}

	editform.sgbz.options.length=1;

	var str="SgdCx.jsp?sgd="+FormName.sgd.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function addItem(str1,str2)
{
	var op1=document.createElement("OPTION");
	op1.value=str1;
	op1.text=str2;
	editform.sgbz.add(op1);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jlbz)=="") {
		alert("请输入[派单类型]！");
		FormName.jlbz.focus();
		return false;
	}
	if(	javaTrim(FormName.shzzb)=="") {
		alert("请输入[是否占派单指标]！");
		FormName.shzzb.focus();
		return false;
	}
	if(	javaTrim(FormName.pdsj)=="") {
		alert("请输入[派单时间]！");
		FormName.pdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pdsj, "派单时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sgbz)=="") {
		alert("请输入[施工班长]！");
		FormName.sgbz.focus();
		return false;
	}



	FormName.action="SaveEditDzpdCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}

function f_pdpm(FormName)//参数FormName:Form的名称
{
	FormName.action="PdPm.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_cksgd(FormName)//参数FormName:Form的名称
{
	FormName.action="PdTjb.jsp?ssfgs=<%=ssfgs%>";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_ckbz(FormName)//参数FormName:Form的名称
{

	FormName.action="EnterFwdz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>


