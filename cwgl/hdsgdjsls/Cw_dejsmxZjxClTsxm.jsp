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

double ylclbfb=0; //应领材料百分比，当领料少于这个值，需补材料费 

try {
	conn=cf.getConnection();

	//取：自定义项目成本百分比
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
		out.println("错误！在表sq_xtcsb中无[默认材料费百分比]"+clfbfb);
		return;
	}
	rs.close();
	ps.close();

	//取：应领材料百分比
	ls_sql="SELECT csz";
	ls_sql+=" FROM sq_xtcsb";
    ls_sql+=" where csbm='ylclbfb'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ylclbfb=rs.getDouble("csz");
	}
	else{
		out.println("错误！在表sq_xtcsb中无[应领材料百分比]"+ylclbfb);
		return;
	}
	rs.close();
	ps.close();

	//取客户信息
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


	//取材料成本，用于计算【默认结算比例】，需考虑有【工料分析】和【无工料分析】＋＋＋＋＋＋＋开始
	//有工料分析
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

	//无工料分析
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
	ls_sql+=" from  cw_dejsglfl";//定额结算管理费率
	ls_sql+=" where  qsz<="+allcbje+" and "+allcbje+"<jzz";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzjsblxs=rs.getDouble("jsbl");
	}
	rs.close();
	ps.close();
	//取材料成本，用于计算【默认结算比例】，需考虑有【工料分析】和【无工料分析】==========完成


%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 18px'>
<div align="center"> <b>定额结算-->处理特殊项目（<font color="#0000FF">特殊项目：指[物流]中找不到对应的材料</font>）</b> 
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
<input type="hidden" name="zjxxh" value="" >
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='确定－－结算比例系数' onClick="cf_submit(listform)" >
      </td>
    </tr>
  <tr bgcolor="#CCCCCC" align="center"> 
    <td  width="2%" >序号</td>
    <td  width="4%" >类型</td>
    <td  width="3%" >处理标志</td>
    <td  width="3%" >处理</td>
    <td  width="6%" >项目编号</td>
    <td  width="13%" >项目名称</td>
    <td  width="4%" >单位</td>
    <td  width="5%" >工程量</td>
    <td  width="5%" >对外单价</td>
    <td  width="6%" >对外金额</td>
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

	//设标记，为了把多于项目删除
	ls_sql="update cw_dejsmx set mark='0'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//首先生成临时表：定额结算材料明细（cw_dejsclmx）、定额结算项目材料明细（cw_dejsxmclmx），为下一步算价格做准备＋＋＋＋＋开始

	//定额结算材料明细（cw_dejsclmx），用于统计每种材料的情况，用于临时计算
	ls_sql="delete from cw_dejsclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsclmx (khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,bzdj,dj,ylclyl,slclyl,xbclk,lx) ";
	ls_sql+=" select khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,dj,sum(xhl),0,0,'1'";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='Y' ";//只取材料类，包括不需要物流领料
	ls_sql+=" group by khbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//定额结算项目材料明细（cw_dejsclmx），用于统计每个项目的情况，用于临时计算
	ls_sql="delete from cw_dejsxmclmx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into cw_dejsxmclmx (khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,ylclyl,slclyl,clf,lx) ";
	ls_sql+=" select khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj,sum(xhl),0,0,'1'";
	ls_sql+=" FROM bj_khglfxbh  ";
	ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
	ls_sql+=" and bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='Y' ";//只取材料类，包括不需要物流领料
	ls_sql+=" group by khbh,xmbh,wlbm,glflbm,wlllbz,glmc,pp,xhgg,jldwbm,dj";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//处理需到物流领料的材料单价，计算：材料单价、实领材料用量、需补材料款
	String wlbm=null;
	String jsjldwbm="";
	String ckjldwbm="";
	String wlllbz="";
	double ylclyl=0;
	ls_sql="SELECT wlbm,jldwbm,ylclyl,wlllbz";
	ls_sql+=" FROM cw_dejsclmx ";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.glflbm='1' and cw_dejsclmx.wlllbz='Y' ";//Y：需要；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		//取每种材料
		wlbm=rs.getString("wlbm");
		jsjldwbm=rs.getString("jldwbm");
		ylclyl=rs.getDouble("ylclyl");//应领材料用量
		wlllbz=cf.fillNull(rs.getString("wlllbz"));//是否需要物流领料


		//取材料出库明细，计算平均出库单价，出库数量，注意：出库计量单位与工料分析表中应一致
		double ckdj=0;
		double cksl=0;
		int jls=0;
		ckjldwbm="";
		ls_sql="SELECT jsjldwbm,sum(sl*dj)/sum(sl*wljsbz) dj,sum(sl*wljsbz) sl,count(*) jls";//物流结算计量单位比值
		ls_sql+=" FROM bj_clckmx,bj_clckd ";
		ls_sql+=" where bj_clckmx.ckdh=bj_clckd.ckdh and bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
		ls_sql+=" group by  jsjldwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ckjldwbm=rs1.getString("jsjldwbm");
			ckdj=rs1.getDouble("dj");//平均单价
			cksl=rs1.getDouble("sl");//按结算材料计算的数量，非物流出库数量
			jls=rs1.getInt("jls");//记录数，应该为1，否则错误

			if (!ckjldwbm.equals(jsjldwbm))//判断[计量单位]是否一致，防止初始化数据错误
			{
				out.println("<P>结算材料编码["+wlbm+"]错误！[计量单位]在[出库明细:"+ckjldwbm+"]和[工料分析:"+jsjldwbm+"]中不一致");
				return;
			}
		}
		rs1.close();
		ps1.close();

		if (jls>1)
		{
			out.println("<P>错误！同一种【结算材料编码】对应多个计量单位："+wlbm);
			return;
		}

		if (cksl<=0)//无出库记录，直接取物流最新单价，可能出现：物流无对应材料
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

				if (!ckjldwbm.equals(jsjldwbm))//判断[计量单位]是否一致，防止初始化数据错误
				{
					out.println("<P>结算材料编码["+wlbm+"]错误！[计量单位]在[出库明细:"+ckjldwbm+"]和[工料分析:"+jsjldwbm+"]中不一致");
					return;
				}
			}
			rs1.close();
			ps1.close();

			if (ckdj<=0)//表示虽然需要到物流领了，但【物流没有对应材料】，需设标记做特殊处理，最后由人工录入工料分析
			{
				//类型，1：物流有材料；2：物流无材料
				ls_sql="update cw_dejsclmx set lx='2'";
				ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				//类型，1：物流有材料；2：物流无材料
				ls_sql="update cw_dejsxmclmx set lx='2'";
				ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	

		//更新定额结算材料明细（cw_dejsclmx）：实领材料用量、单价
		ls_sql="update cw_dejsclmx set dj="+ckdj+",slclyl="+cksl;
		ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
		
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		//更新定额结算项目材料明细（cw_dejsxmclmx）：单价、实领材料用量、结算材料费，注意：【实领材料用量】是平均到本项目该种材料的数量，而不是所有项目该种材料的数量
		ls_sql="update cw_dejsxmclmx set dj="+ckdj+",slclyl=ylclyl*"+cksl/ylclyl;
		ls_sql+=" where khbh='"+khbh+"' and wlbm='"+wlbm+"'";

		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	
	}
	rs.close();
	ps.close();

	//计算：定额结算项目材料明细（cw_dejsxmclmx）：结算材料费+++++++++++++开始
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='N' ";//不需要物流领料
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//需要物流领料,多领
	ls_sql="update cw_dejsxmclmx set clf=ylclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl>ylclyl";//多领：单价*应领材料用量
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//需要物流领料,少领
	ls_sql="update cw_dejsxmclmx set clf=slclyl*dj";
	ls_sql+=" where khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl";//少领：单价*实领材料用量
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//计算：定额结算项目材料明细（cw_dejsxmclmx）：结算材料费-----------------结束


	//计算：需补材料款，若少领某个百分比，补材料款
	ls_sql="update cw_dejsclmx set xbclk=(ylclyl-slclyl)*dj";
	ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and wlllbz='Y' and slclyl<ylclyl*"+ylclbfb;//应领材料百分比
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	//首先生成临时表：定额结算材料明细（cw_dejsclmx）、定额结算项目材料明细（cw_dejsxmclmx），为下一步做算价格做准备＝＝＝＝＝＝＝完成

	
	//生成表：定额结算明细（cw_dejsmx）

	//获取项目明细
	double cbdj=0;
	double cbje=0;
	double mll=0;
	double mle=0;
	double nbjsdj=0;
	double nbjsje=0;
	double gsmll=0;
	double gsmlr=0;
	String xclbz="";

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

		//判断工程量是否为0，无工程量项目舍掉
		if (sl<=0)
		{
			continue;
		}

		//初始化
		cbdj=0;
		cbje=0;
		mll=0;
		mle=0;
		nbjsdj=0;
		nbjsje=0;
		gsmll=0;
		gsmlr=0;

		//计算：基价单价、基价金额＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		/*
		1、基价单价计算方式：
		【基价单价】由四部分组成：人工费＋机械费＋材料费（包括:不需到物流零料的材料费、需到物流零料的材料费），[标准项目]和[自定义项目]计算方式不同
		A、标准项目：[人工费]、[机械费]、[不需到物流零料的材料费]可直接从客户工料分析表（bj_khglfxb）中获得，而[需到物流零料的材料费]需要根据出库单计算
		，共分三种情况：有出库单、无出库单但有对应材料、物流无对应材料。
			a、有出库单:     
				若实领>应领：则按应领计算材料费；
				若实领<应领：且没有超过某个百分比，按实际发生额计算材料费，
				超过某个百分比：除了按实际发生额计算材料费外，还需补交材料款。
			b、无出库单但有对应材料：从物流材料价格表中取最新单价
			c、物流无对应材料：由人工录入客户工料分析表，由客户工料分析表计算单价
		B、自定义项目：由人工录入客户工料分析表，由客户工料分析表计算单价

		2、应领材料用量：统计客户工料分析表（bj_khglfxb），获取应领数量
		3、实领材料用量：统计出库明细，获取实领数量
		*/

		//判断项目类型：1:标准项目;2:自定义项目;3:特殊项目
		if (bjlx.equals("1"))//1:标准项目;2:自定义项目
		{
			int count=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM cw_dejsxmclmx  ";
			ls_sql+=" where cw_dejsxmclmx.khbh='"+khbh+"' and cw_dejsxmclmx.xmbh='"+xmbh+"' and lx='2'";//1：物流有材料；2：物流无材料
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				count=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			if (count>0)
			{
				xclbz="N";//N：未处理；Y：已处理
				bjlx="3";
			}
			else{
				xclbz="";//N：未处理；Y：已处理
				bjlx="1";
			}
		}
		else{//自定义项目
			xclbz="N";//N：未处理；Y：已处理
			bjlx="2";
		}

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目;3:特殊项目
		{
			//从【客户工料分析表（bj_khglfxb）】取机械、人工费
			double jxrgf=0;
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and ( bj_khglfxbh.glflbm!='1' OR (bj_khglfxbh.glflbm='1' and bj_khglfxbh.wlllbz='N')  ) ";
			
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
			//out.print(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				clf=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			cbdj=clf+jxrgf;//基价单价

		}
		else if (bjlx.equals("2"))
		{
			//从【客户工料分析表（bj_khglfxb）】取基价单价
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cbdj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
		}
		else if (bjlx.equals("3"))
		{
			//从【客户工料分析表（bj_khglfxb）】取基价单价
			ls_sql="SELECT sum(xhl*dj)";
			ls_sql+=" FROM bj_khglfxbh  ";
			ls_sql+=" where bj_khglfxbh.khbh='"+khbh+"' and bj_khglfxbh.xmbh='"+xmbh+"' and bj_khglfxbh.zjxxh='"+zjxxh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cbdj=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();
		}
			
		cbdj=cf.doubleTrim(cbdj,2);//成本单价、基价单价

		cbje=sl*cbdj;//工程量*成本单价
		cbje=cf.doubleTrim(cbje);//成本金额、基价金额

		//计算：基价单价、基价金额=======================================完成


		mll=(dwbjje-cbje)/dwbjje*100;//（对外报价金额－成本金额）/报价金额
		mll=cf.doubleTrim(mll);//毛利率

		mle=dwbjje-cbje;//毛利率*对外报价金额
		mle=cf.doubleTrim(mle);//毛利金额


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

		//如果已有该项目，取出：结算比例系数、处理标志
		ls_sql="SELECT jsblxs,xclbz";
		ls_sql+=" FROM cw_dejsmx  ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jsblxs=rs1.getDouble(1);
			xclbz=cf.fillNull(rs1.getString(2));

			rs1.close();
			ps1.close();

			//删除
			ls_sql="delete from cw_dejsmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs1.close();
		ps1.close();


		nbjsdj=cbdj*(1+jsblxs/100);//成本单价*(1+结算比例系数)
		nbjsdj=cf.doubleTrim(nbjsdj);//内部结算单价

		nbjsje=nbjsdj*sl;//内部结算单价*工程数量
		nbjsje=cf.doubleTrim(nbjsje);//内部结算金额

		gsmll=(dwbjje-nbjsje)/dwbjje*100;//（对外报价金额－内部结算金额）/对外报价金额
		gsmll=cf.doubleTrim(gsmll);//公司毛利率

		gsmlr=dwbjje-nbjsje;//公司毛利率*对外报价金额
		gsmlr=cf.doubleTrim(gsmlr);//公司毛利润

		//插入表：定额结算明细（cw_dejsmx）
		ls_sql="insert into cw_dejsmx (khbh,xh,xmbh,xmmc,jldwbm,sl,dwbjdj,dwbjje,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,clfbfb,bjlx,xclbz,mark)";
		ls_sql+=" values('"+khbh+"',"+row+",'"+xmbh+"','"+xmmc+"','"+jldwbm+"',"+sl+","+dj+","+dwbjje+","+cbdj+","+cbje+","+mll+","+mle+","+jsblxs+","+nbjsdj+","+nbjsje+","+gsmll+","+gsmlr+","+clfbfb+",'"+bjlx+"','"+xclbz+"','1') ";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();


		row++;

	}
	rs.close();
	ps.close();


	//显示数据
	row=1;
	ls_sql="SELECT bjlx,xmbh,xmmc,cw_dejsmx.jldwbm,jldwmc,sl,dwbjdj,dwbjje,clfbfb,cbdj,cbje,mll,mle,jsblxs,nbjsdj,nbjsje,gsmll,gsmlr,DECODE(xclbz,'N','未处理','Y','处理') xclbz";
	ls_sql+=" FROM cw_dejsmx,jdm_jldwbm";
	ls_sql+=" where cw_dejsmx.jldwbm=jdm_jldwbm.jldwbm and khbh='"+khbh+"'";
	ls_sql+=" order by xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjlx=rs.getString("bjlx");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwbm=rs.getString("jldwbm");
		jldwmc=cf.fillHtml(rs.getString("jldwmc"));
		sl=rs.getDouble("sl");//工程量
		dj=rs.getDouble("dwbjdj");//对外单价
		dwbjje=rs.getDouble("dwbjje");//对外金额
		clfbfb=rs.getDouble("clfbfb");
		cbdj=rs.getDouble("cbdj");
		cbje=rs.getDouble("cbje");
		mll=rs.getDouble("mll");
		mle=rs.getDouble("mle");
		jsblxs=rs.getDouble("jsblxs");
		nbjsdj=rs.getDouble("nbjsdj");
		nbjsje=rs.getDouble("nbjsje");
		gsmll=rs.getDouble("gsmll");
		gsmlr=rs.getDouble("gsmlr");
		xclbz=rs.getString("xclbz");

		if (bjlx.equals("1"))//1:标准项目;2:自定义项目;3:特殊项目
		{
			bjlxmc="标准";
			xsclfbfb="";
		}
		else if (bjlx.equals("2"))
		{
			bjlxmc="自定义";

			xsclfbfb=clfbfb+"";
		}
		else if (bjlx.equals("3"))
		{
			bjlxmc="特殊项目";
			xsclfbfb="";
		}
		else{
			bjlxmc="";
		}

		//计算[小计]
		xjdwbjje+=dwbjje;//对外金额
		xjcbje+=cbje;//基价金额
		xjmle+=mle;//毛利金额
		xjnbjsje+=nbjsje;//内部结算金额
		xjgsmlr+=gsmlr;//公司毛利润

		String clstr="";
		if (xclbz==null)
		{
			xclbz="&nbsp;";
			clstr="&nbsp;";
		}
		else{
			clstr="<A HREF='InsertZjxBj_jzglfxb.jsp?khbh="+khbh+"&zjxxh="+zjxxh+"&gdjsjlh="+gdjsjlh+"&xmbh="+xmbh+"' target='_blank'>修改</A>";
		}

	
		//输出每行数据
		%> 
		  <tr bgcolor="#FFFFFF" align="center"> 
			<td ><%=row%></td>
			<td ><%=bjlxmc%></td>
			<td ><%=xclbz%></td>
			<td ><%=clstr%></td>
			<td ><%=xmbh%></td>
			<td ><%=xmmc%></td>
			<td ><%=jldwmc%></td>
			<td ><%=sl%></td>
			<td ><%=dj%></td>
			<td ><%=dwbjje%></td>
			<td><%=cbdj%></td>
			<td><%=cbje%></td>
			<td><%=mll%>%</td>
			<td><%=mle%></td>
			<td><%=jsblxs%>%</td>
			<td><%=nbjsdj%></td>
			<td><%=nbjsje%></td>
			<td><%=gsmll%>%</td>
			<td><%=gsmlr%></td>
		  </tr>
		<%
		row++;

	}
	rs.close();
	ps.close();

	// 施工队需补材料款
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

	//计算小计【公司毛利率、公司毛利润】
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
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td ><%=xjdwbjje%></td>
	<td >&nbsp;</td>
	<td><%=xjcbje%></td>
	<td><%=xjmll%>%</td>
	<td><%=xjmle%></td>
	<td >&nbsp;</td>
	<td >&nbsp;</td>
	<td><%=xjnbjsje%></td>
	<td><%=xjgsmll%>%</td>
	<td><%=xjgsmlr%></td>
    </tr>
  </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="19" > 
		  <input type=button value='确定－－结算比例系数' onClick="cf_submit(listform)" name="jsblxs">
      </td>
    </tr>
</table>
</form>
</body>
</html>

<%
	//删除不用项目
	ls_sql="delete from cw_dejsmx";
	ls_sql+=" where khbh='"+khbh+"' and mark='0'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="SELECT sum(nbjsje)";
	ls_sql+=" from cw_dejsmx ";
	ls_sql+=" where cw_dejsmx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nbjsje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="update cw_gdjsjl set dejsje="+nbjsje+",xbclk="+xbclk;
	ls_sql+=" where gdjsjlh='"+gdjsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

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
	formName.action="Cw_dejsmxList.jsp";
	formName.submit();
	return true;
} 


//-->
</script>

