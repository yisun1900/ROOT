<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String gdjsjlh=request.getParameter("gdjsjlh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=1;

String dqbm=null;
String xmbh=null;
String xmmc=null;

String jgwzmc=null;
String oldjgwzmc="";
String jldwbm=null;
String jldwmc=null;
String gycl=null;

String khxm=null;
String lxfs=null;
String fwdz=null;
//String hth=null;
String sjs=null;
String kgrq=null;
String jyjdrq=null;
String jgrq=null;
String czmc=null;
String ysmc=null;
String bjjb=null;
String bjlx=null;
String bjlxmc=null;

double bzclfbfb=0;//电子报价中无工料分析，默认材料费百分比
double bzjsblxs=0;
double clfbfb=0;
double jsblxs=0;
String xsclfbfb="";//电子报价中无工料分析，默认材料费百分比
double zjqye=0;

double allcbje=0;

double xjdwbjje=0;
double xjcbje=0;
double xjmll=0;
double xjmle=0;
double xjnbjsje=0;
double xjgsmll=0;
double xjgsmlr=0;
double xbclk=0;

double ylclbfb=0.9; //应领材料百分比，当领料少于这个值，需补材料费 

try {
	conn=cf.getConnection();

	//取自定义项目成本百分比
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='clfbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzclfbfb=rs.getDouble("csz");
	}
	else{
		out.println("错误！在表sq_xtcsb中无默认材料费百分比"+clfbfb);
	}
	rs.close();
	ps.close();

	ls_sql="SELECT khxm,lxfs,fwdz,sjs,bjjbmc bjjb,dqbm";
	ls_sql+=" FROM crm_khxx,bdm_bjjbbm,sq_dwxx";
    ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.fgsbh=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		bjjb=cf.fillHtml(rs.getString("bjjb"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//获取：金额总计
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	zjqye=dzbj.getZjxHBjje(conn,khbh,zjxxh,"hd");


	//取材料成本
	ls_sql="SELECT sum(bj_gclmxh.sl*bj_khglfxbh.xhl*bj_khglfxbh.dj) je";
	ls_sql+=" FROM bj_khglfxbh,bj_gclmxh  ";
	ls_sql+=" where bj_gclmxh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.khbh=bj_gclmxh.khbh and bj_khglfxbh.dqbm=bj_gclmxh.dqbm and bj_khglfxbh.xmbh=bj_gclmxh.xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje=rs.getDouble("je");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.dj) je";
	ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh  ";
	ls_sql+=" where bj_gclmxh.khbh='"+khbh+"' and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" and bj_gclmxh.xmbh not in(select xmbh from bj_khglfxbh where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allcbje+=rs.getDouble("je")*clfbfb/100;
	}
	rs.close();
	ps.close();


	//默认结算比例
	ls_sql="select jsbl";
	ls_sql+=" from  cw_dejsglfl";
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>施工队定额结算</b> 
  <hr>
</div>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td>客户姓名：<%=khxm%></td>
    <td>联系方式：<%=lxfs%> </td>
    <td>金额总计：<%=cf.formatDouble(zjqye,"#########.##")%>元</td>
  </tr>
  <tr> 
    <td>工程地点：<%=fwdz%></td>
    <td>设 计 师：<%=sjs%></td>
    <td>工程等级：<%=bjjb%></td>
  </tr>
</table>

<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
	   <input type=button value='定额结算' onClick="cf_submit(listform)" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='查看材料明细' onClick="window.open('ViewCw_dejsclmx.jsp?khbh=<%=khbh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='物流材料出库汇总清单' onClick="window.open('ViewCw_clckmx.jsp?khbh=<%=khbh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value='查看基价单价' onClick="window.open('ViewZjxCw_dejsxmclmx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>')" >
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		【结算比例系数】调整为：<input type="text" name="tzjsblxs" value="<%=bzjsblxs%>" size="8" maxlength="12" >%
		<input type="button" value='开始调整' onClick="f_tzjsbl(listform)" >
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >序号</td>
    <td  width="4%" >类型</td>
    <td  width="6%" >项目编号</td>
    <td  width="14%" >项目名称</td>
    <td  width="4%" >单位</td>
    <td  width="5%" >工程量</td>
    <td  width="5%" >对外单价</td>
    <td  width="6%" >对外金额</td>
    <td  width="5%" >自定义项目成本百分比</td>
    <td  width="5%" >基价单价</td>
    <td  width="6%" >基价金额</td>
    <td  width="5%" >毛利率</td>
    <td  width="6%" >毛利金额</td>
    <td  width="5%" >结算比例系数</td>
    <td  width="5%" >内部结算单价</td>
    <td  width="6%" >内部结算金额</td>
    <td  width="5%" >公司毛利率</td>
    <td  width="6%" >公司毛利润</td>
  </tr>

<%
	int i=0;

	double dj=0;
	double sl=0;
	double dwbjje=0;

	//定额结算材料明细（cw_dejsclmx），用于统计每种材料的情况
	ls_sql="delete from cw_dejsclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsclmx (khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,bzdj,dj,ylclyl,slclyl,xbclk) ";
	ls_sql+=" select khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,dj,sum(xhl),0,0";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1'  ";//只取材料类，包括不需要物流领料
	ls_sql+=" group by khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//定额结算项目材料明细（cw_dejsclmx），用于统计每个项目的情况
	ls_sql="delete from cw_dejsxmclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsxmclmx (khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,ylclyl,slclyl,clf) ";
	ls_sql+=" select khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,sum(xhl),0,0";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1'  ";//只取材料类，包括不需要物流领料
	ls_sql+=" group by khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

/*
	1、单价计算方式：
	共分两种情况：若是非物流领料，直接取取工料分析表的单价；若是物流领料，如果有出库记录，则取平均单价，若没有出库记录，则从物流材料价格表中取最新单价
	2、应领材料用量：统计客户工料分析表（bj_khglfxb），获取应领数量
	3、实领材料用量：统计出库明细，获取实领数量
	4、定额结算时基价单价计算方法：
	【基价单价】由四部分组成：人工费＋机械费＋非物流材料费＋物流材料费，其中人工费、机械费、非物流材料费三种费用，可直接从客户工料分析表（bj_khglfxb）中获得，而物流材料费需根据领料情况进行计算。若在物流领料超过应领值，则按应领值计算材料费；在物流领料不足时，若没有超过某个百分比，按实际发生额计算材料费，超过某个百分比，除了按实际发生额计算材料费外，还需补交材料款。
*/
	//计算：材料单价、实领材料用量、需补材料款
	String wlbm=null;
	String jsjldwbm="";
	String ckjldwbm="";
	String wlllbz="";
	double ylclyl=0;
	ls_sql="SELECT wlbm,jldwbm,ylclyl,wlllbz";
	ls_sql+=" FROM cw_dejsclmx ";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.glflbm='1' and cw_dejsclmx.wlllbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		//取每种材料
		wlbm=rs.getString("wlbm");
		jsjldwbm=rs.getString("jldwbm");
		ylclyl=rs.getDouble("ylclyl");
		wlllbz=cf.fillNull(rs.getString("wlllbz"));


		//取材料出库明细，计算平均出库单价，出库数量，注意出库计量单位与工料分析不一致
		double ckdj=0;
		double cksl=0;
		ckjldwbm="";
		ls_sql="SELECT jsjldwbm,sum(sl*dj)/sum(sl*wljsbz) dj,sum(sl*wljsbz) sl";
		ls_sql+=" FROM bj_clckmx,bj_clckd ";
		ls_sql+=" where bj_clckmx.ckdh=bj_clckd.ckdh and bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
		ls_sql+=" group by  bj_clckmx.wlbm,jsjldwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ckjldwbm=rs1.getString("jsjldwbm");
			ckdj=rs1.getDouble("dj");
			cksl=rs1.getDouble("sl");
		}
		rs1.close();
		ps1.close();

		if (cksl<=0)//无出库，直接取物流最新单价
		{
			ls_sql="SELECT dj/wljsbz ckdj,jsjldwbm";
			ls_sql+=" FROM bj_jzcljgb";
			ls_sql+=" where dqbm='"+dqbm+"' and jswlbm='"+wlbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				ckdj=rs1.getDouble("ckdj");
				ckjldwbm=rs1.getString("jsjldwbm");
			}
			rs1.close();
			ps1.close();
		}

		if (ckdj<=0)
		{
			out.println("结算材料编码["+wlbm+"]错误！[出库单价]不能小于等于0");
			//return;
		}
	
		if (!ckjldwbm.equals(jsjldwbm))//判断[计量单位]是否一致
		{
			out.println("结算材料编码["+wlbm+"]错误！[计量单位]在[出库明细:"+ckjldwbm+"]和[工料分析:"+jsjldwbm+"]中不一致");
			//return;
		}

		//更新定额结算材料明细（cw_dejsclmx）：实领材料用量、单价
		ls_sql="update cw_dejsclmx set dj="+ckdj+",slclyl="+cksl;
		ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//更新定额结算项目材料明细（cw_dejsxmclmx）：单价、实领材料用量、结算材料费，注意：实领材料用量
		ls_sql="update cw_dejsxmclmx set dj="+ckdj+",slclyl=ylclyl*"+cksl/ylclyl;
		ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();

	//计算：需补材料款，若少领某个百分比，补材料款
	ls_sql="update cw_dejsclmx set xbclk=(ylclyl-slclyl)*dj";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl*"+ylclbfb;//应领材料百分比
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//计算：定额结算项目材料明细（cw_dejsxmclmx）：结算材料费+++++++++++++
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='N' ";//不需要物流领料
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//需要物流领料
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//多领：单价*应领材料用量
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//需要物流领料
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//多领：单价*应领材料用量
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//计算：定额结算项目材料明细（cw_dejsxmclmx）：结算材料费-----------------

	//获取：应领材料用量、实领材料用量汇总
	double xjylclyl=0;
	double xjslclyl=0;
	ls_sql="SELECT sum(ylclyl),sum(slclyl)";
	ls_sql+=" FROM cw_dejsclmx";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xjylclyl=rs.getDouble(1);
		xjslclyl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	//获取项目明细
	ls_sql="SELECT bj_bjxmmxh.xmpx,bj_bjxmmxh.dqbm,bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,bj_bjxmmxh.xmmc,bj_bjxmmxh.jldwbm,jldwmc,bj_bjxmmxh.dj,sum(bj_gclmxh.sl) sl,sum(bj_gclmxh.sl*bj_bjxmmxh.dj) as je";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bj_gclmxh  ";
	ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm ";
	ls_sql+=" and bj_bjxmmxh.khbh='"+khbh+"' and bj_gclmxh.sl*bj_bjxmmxh.dj>0";
	ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_gclmxh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_bjxmmxh.khbh=bj_gclmxh.khbh and bj_bjxmmxh.dqbm=bj_gclmxh.dqbm and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
	ls_sql+=" group by bj_bjxmmxh.xmpx,bj_bjxmmxh.dqbm,bj_bjxmmxh.xmbh,bj_bjxmmxh.bjlx,bj_bjxmmxh.xmmc,bj_bjxmmxh.jldwbm,jldwmc,bj_bjxmmxh.dj";
	ls_sql+=" order by bj_bjxmmxh.xmpx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		bjlx=rs.getString("bjlx");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		dj=rs.getDouble("dj");//对外单价
		sl=rs.getDouble("sl");//工程量
		dwbjje=rs.getDouble("je");//对外金额

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			bjlxmc="标准";
		}
		else{
			bjlxmc="自定义";
		}


		double cbdj=0;
		double cbje=0;
		double mll=0;
		double mle=0;
		double nbjsdj=0;
		double nbjsje=0;
		double gsmll=0;
		double gsmlr=0;

		//取定额预结算表：自定义项目成本百分比、结算比例系数
		jsblxs=0;
		clfbfb=0;
		ls_sql="SELECT jsblxs,clfbfb";
		ls_sql+=" from cw_deyjsmx ";
		ls_sql+=" where cw_deyjsmx.khbh='"+khbh+"' and cw_deyjsmx.xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble("jsblxs");
			clfbfb=rs1.getDouble("clfbfb");
		}
		else{
			//若没有取标准值
			jsblxs=bzjsblxs;
			clfbfb=bzclfbfb;
		}
		rs1.close();
		ps1.close();

		//判断工程量是否为0
		if (sl>0)
		{
			/*
			1、单价计算方式：
			共分两种情况：若是非物流领料，直接取取工料分析表的单价；若是物流领料，如果有出库记录，则取平均单价，若没有出库记录，则从物流材料价格表中取最新单价
			2、应领材料用量：统计客户工料分析表（bj_khglfxb），获取应领数量
			3、实领材料用量：统计出库明细，获取实领数量
			4、定额结算时基价单价计算方法：
			【基价单价】由四部分组成：人工费＋机械费＋非物流材料费＋物流材料费，其中人工费、机械费、非物流材料费三种费用，可直接从客户工料分析表（bj_khglfxb）中获得，而物流材料费需根据领料情况进行计算。若在物流领料超过应领值，则按应领值计算材料费；在物流领料不足时，若没有超过某个百分比，按实际发生额计算材料费，超过某个百分比，除了按实际发生额计算材料费外，还需补交材料款。
			*/

			if (bjlx.equals("1"))//1:标准项目;2:自定义项目
			{
				//取机械、人工费
				double jxrgf=0;
				ls_sql="SELECT sum(xhl*dj)";
				ls_sql+=" FROM bj_khglfxbh  ";
				ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
				ls_sql+=" and bj_khglfxbh.glflbm!='1'  ";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					jxrgf=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				//取材料费
				double clf=0;
				ls_sql="SELECT sum(clf)";
				ls_sql+=" FROM cw_dejsxmclmx  ";
				ls_sql+=" where cw_dejsxmclmx.khbh='"+khbh+"' and cw_dejsxmclmx.xmbh='"+xmbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					clf=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				cbdj=clf+jxrgf;//基价单价

				xsclfbfb="";
			}
			else{
				cbdj=dj*clfbfb/100;
				xsclfbfb=clfbfb+"";
			}


			cbdj=cf.doubleTrim(cbdj,2);

			cbje=sl*cbdj;//工程量*成本单价
			cbje=cf.doubleTrim(cbje);

			mll=(dwbjje-cbje)/dwbjje*100;//（对外报价金额－成本金额）/报价金额
			mll=cf.doubleTrim(mll);

			mle=dwbjje-cbje;//毛利率*对外报价金额
			mle=cf.doubleTrim(mle);


			nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
			nbjsdj=cf.doubleTrim(nbjsdj);

			nbjsje=nbjsdj*sl;//内部结算单价*工程数量
			nbjsje=cf.doubleTrim(nbjsje);

			gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
			gsmll=cf.doubleTrim(gsmll);

			gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
			gsmlr=cf.doubleTrim(gsmlr);
		}

		xjdwbjje+=dwbjje;
		xjcbje+=cbje;
		xjmle+=mle;
		xjnbjsje+=nbjsje;
		xjgsmlr+=gsmlr;

		ls_sql="SELECT sum(xbclk)";
		ls_sql+=" FROM cw_dejsclmx  ";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			xbclk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%>
				<input type="hidden" name="bjlx" value="<%=bjlx%>" >
			</td>
			<td ><%=xmbh%>
				<input type="hidden" name="xmbh" value="<%=xmbh%>" >
			</td>
			<td ><%=xmmc%>
				<input type="hidden" name="xmmc" value="<%=xmmc%>" >
			</td>
			<td ><%=jldwmc%>
				<input type="hidden" name="jldwbm" value="<%=jldwbm%>" >
			</td>
			<td ><%=sl%>
				<input type="hidden" name="sl" value="<%=sl%>" >
			</td>
			<td ><%=dj%>
				<input type="hidden" name="dj" value="<%=dj%>" >
			</td>
			<td ><%=dwbjje%>
				<input type="hidden" name="dwbjje" value="<%=dwbjje%>" >
			</td>
			<td>
<%
			if (bjlx.equals("1"))//1:标准项目;2:自定义项目
			{
				%>
				<%=xsclfbfb%>
				<input type="hidden" name="clfbfb" value="<%=xsclfbfb%>" >
				<%
			}
			else{
				%>
				<input type="text" name="clfbfb" size="6" value="<%=xsclfbfb%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_jsjg(listform,<%=(row-1)%>)">
				%
				<%
			}
%>
			</td>
			<td>
				<input type="text" name="cbdj" size="8" value="<%=cbdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="cbje" size="10" value="<%=cbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="mll" size="6" value="<%=mll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="mle" size="10" value="<%=mle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="jsblxs" size="6" value="<%=jsblxs%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onchange="f_tzxs(listform,<%=(row-1)%>)">
				%
			</td>
			<td>
				<input type="text" name="nbjsdj" size="8" value="<%=nbjsdj%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="nbjsje" size="10" value="<%=nbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
			<td>
				<input type="text" name="gsmll" size="6" value="<%=gsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
				%
			</td>
			<td>
				<input type="text" name="gsmlr" size="10" value="<%=gsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
			</td>
		  </tr>
		
		
		<%
		row++;

	}
	rs.close();
	ps.close();

	if (xjdwbjje==0)
	{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=0;//（对外报价金额－成本金额）/报价金额
		xjgsmll=0;//（对外报价金额－内部结算金额）/对外报价金额
	}
	else{
		xjdwbjje=cf.doubleTrim(xjdwbjje);
		xjcbje=cf.doubleTrim(xjcbje);
		xjmle=cf.doubleTrim(xjmle);
		xjnbjsje=cf.doubleTrim(xjnbjsje);
		xjgsmlr=cf.doubleTrim(xjgsmlr);

		xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//（对外报价金额－成本金额）/报价金额
		xjmll=cf.doubleTrim(xjmll);
		xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		xjgsmll=cf.doubleTrim(xjgsmll);
	}
%>	
  <tr bgcolor="#FFFFFF" align="center"> 
	<td colspan="4">合计</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjcbje" size="10" value="<%=xjcbje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjmll" size="6" value="<%=xjmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjmle" size="10" value="<%=xjmle%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td>
		<input type="text" name="xjnbjsje" size="10" value="<%=xjnbjsje%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
	<td>
		<input type="text" name="xjgsmll" size="6" value="<%=xjgsmll%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
		%
	</td>
	<td>
		<input type="text" name="xjgsmlr" size="10" value="<%=xjgsmlr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	</td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="18" > 
		  <input type=button value='定额结算' onClick="cf_submit(listform)" name="jsblxs">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<B>施工队需补材料款：<%=xbclk%></B>
		<input type="hidden" name="xbclk" value="<%=xbclk%>">
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function cf_submit(formName)
{
	formName.action="SaveCw_dejsmx.jsp";
	formName.submit();
	return true;
} 


//修改：自定义项目成本百分比
function f_jsjg(FormName,xh)
{
	var cbdj=0;//基价单价=对外单价*自定义项目成本百分比
	cbdj=FormName.dj[xh].value*FormName.clfbfb[xh].value/100.0;
	cbdj=round(cbdj,2);
	FormName.cbdj[xh].value=cbdj;

	var cbje=0;//基价金额=基价单价*数量
	cbje=FormName.sl[xh].value*FormName.cbdj[xh].value;
	cbje=round(cbje,2);
	FormName.cbje[xh].value=cbje;

	var mll=0;//毛利率=（对外报价金额－基价金额）*100/对外报价金额
	mll=(FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	mll=round(mll,2);
	FormName.mll[xh].value=mll;

	var mle=0;//毛利金额=毛利率*对外报价金额
	mle=FormName.dwbjje[xh].value*1.0-FormName.cbje[xh].value*1.0;
	mle=round(mle,2);
	FormName.mle[xh].value=mle;

	var nbjsdj=0;//内部结算单价=基价单价*(1+结算比例系数)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//内部结算金额=内部结算单价*工程数量
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//公司毛利率=（对外报价金额－内部结算金额）*100/对外报价金额
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//公司毛利润=公司毛利率*对外报价金额
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 


//修改：结算比例系数
function f_tzxs(FormName,xh)
{
	var nbjsdj=0;//内部结算单价=基价单价*(1+结算比例系数)
	nbjsdj=FormName.cbdj[xh].value*(1+FormName.jsblxs[xh].value/100.0);
	nbjsdj=round(nbjsdj,2);
	FormName.nbjsdj[xh].value=nbjsdj;

	var nbjsje=0;//内部结算金额=内部结算单价*工程数量
	nbjsje=FormName.nbjsdj[xh].value*FormName.sl[xh].value;
	nbjsje=round(nbjsje,2);
	FormName.nbjsje[xh].value=nbjsje;

	var gsmll=0;//公司毛利率=（对外报价金额－内部结算金额）*100/对外报价金额
	gsmll=(FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0)*100/FormName.dwbjje[xh].value;
	gsmll=round(gsmll,2);
	FormName.gsmll[xh].value=gsmll;

	var gsmlr=0;//公司毛利润=公司毛利率*对外报价金额
	gsmlr=FormName.dwbjje[xh].value*1.0-FormName.nbjsje[xh].value*1.0;
	gsmlr=round(gsmlr,2);
	FormName.gsmlr[xh].value=gsmlr;

	f_jsxj(FormName);

} 

//重新计算小计
function f_jsxj(FormName)
{
	var xjdwbjje=<%=xjdwbjje%>;
	var xjcbje=0;
	var xjmle=0;
	var xjnbjsje=0;
	var xjgsmlr=0;
	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		xjcbje=xjcbje+FormName.cbje[i].value*1.0
		xjmle=xjmle+FormName.mle[i].value*1.0
		xjnbjsje=xjnbjsje+FormName.nbjsje[i].value*1.0
		xjgsmlr=xjgsmlr+FormName.gsmlr[i].value*1.0
	}

	xjcbje=round(xjcbje,2);
	FormName.xjcbje.value=xjcbje;
	xjmle=round(xjmle,2);
	FormName.xjmle.value=xjmle;
	xjnbjsje=round(xjnbjsje,2);
	FormName.xjnbjsje.value=xjnbjsje;
	xjgsmlr=round(xjgsmlr,2);
	FormName.xjgsmlr.value=xjgsmlr;

	var xjmll=(xjdwbjje-xjcbje)/xjdwbjje*100;//（对外报价金额－成本金额）/报价金额
	xjmll=round(xjmll,2);
	FormName.xjmll.value=xjmll;
	var xjgsmll=(xjdwbjje-xjnbjsje)/xjdwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
	xjgsmll=round(xjgsmll,2);
	FormName.xjgsmll.value=xjgsmll;

} 



function f_tzjsbl(FormName)
{
	if(	javaTrim(FormName.tzjsblxs)=="") {
		alert("请输入[调整结算比例系数]！");
		FormName.tzjsblxs.focus();
		return false;
	}
	if(!(isFloat(FormName.tzjsblxs, "调整结算比例系数"))) {
		return false;
	}

	for (var i=0;i< <%=(row-1)%> ;i++ )
	{
		FormName.jsblxs[i].value=FormName.tzjsblxs.value;
		f_tzxs(FormName,i);
	}
} 

//-->
</script>

