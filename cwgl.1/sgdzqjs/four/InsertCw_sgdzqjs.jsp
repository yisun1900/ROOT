<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #CC0033;
	font-weight: bold;
}
.STYLE5 {color: #CC0033; font-weight: bold; }
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";

double clf=0;
double gdyp=0;
double jzssk=0;
double yfgf=0;


String bfjs=null;
double bfbl=0;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;

String sjbkStr="";
String htjeStr="合同金额";
String zjxjeStr="增减项金额";

double jsjsze=0;
double htje=0;
double zjxje=0;
double jsbl=15;
double jsje=0;
double sjbk=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!gdjsjd.equals("J"))//A:可以第三次拨工费
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje) ";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jzssk=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//材料单
	ls_sql="select sum(pszje)";
	ls_sql+=" from  jxc_clpsd";
	ls_sql+=" where khbh='"+khbh+"' and psdzt in('2','3','5')";
	//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clf=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//工地用品领用记录
	ls_sql="select sum(je)";
	ls_sql+=" from  cw_gdyplyjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N'";//0：未结算；1：已结算
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdyp=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	
	//已付工费
	ls_sql="select sum(sjbk)";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//施工队结算参数表
	ls_sql="select bfjs,bfbl,sfkclk,sfkgdyp,sfkyfgf";
	ls_sql+=" from  dm_sgdjscsb";
	ls_sql+=" where fgsbh='"+fgsbh+"' and bfcs=4 and sfwgjs='N'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bfjs=rs.getString("bfjs");
		bfbl=rs.getDouble("bfbl");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));//是否扣材料款
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));//是否扣工地用品
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));//是否扣已付工费
	}

	rs.close();
	ps.close();

	if (bfjs==null)
	{
		out.println("错误！无【结算参数设置】，不能进行拨付");
		return;
	}

	jsbl=bfbl;

	sjbkStr="实际拨款＝拨付金额";
	if (sfkclk.equals("Y"))//是否扣材料款
	{
		sjbkStr+="－材料款";
	}
	if (sfkgdyp.equals("Y"))//是否扣工地用品
	{
		sjbkStr+="－工地用品";
	}
	if (sfkyfgf.equals("Y"))//是否扣已付工费
	{
		sjbkStr+="－已付工费";
	}

	//1：工程费、2：工程费＋其它费、3：实收款总额、4：一期款、5：二期款、6：三期款、7：工程基础报价、8：工程基础报价＋其它费基础报价、9：工程施工成本价、A：工程施工成本价＋其它费施工成本、B：工程成本价、C：工程成本价＋其它费成本
	if (bfjs.equals("1"))//1：工程费
	{
		htjeStr="（工程费）合同金额";
		zjxjeStr="（工程费）增减项金额";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();

		htje=zqgczjf;

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额

	}
	else if (bfjs.equals("2"))//2：工程费＋其它费
	{
		htjeStr="（工程费＋其它费）合同额";
		zjxjeStr="（工程费＋其它费）增减项";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//有增减项
		{
			ls_sql="select zqsfje";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=zqgczjf+htqtf;
		zjxje=zjxje+(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("3"))//3：实收款总额
	{
		htjeStr="（工程费）合同额";
		zjxjeStr="（工程费）增减项";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=jzssk;//结算基数总额
	}
	else if (bfjs.equals("4"))//4：一期款
	{
		htjeStr="（工程费）合同额";
		zjxjeStr="（工程费）增减项";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=1";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsze=fk;//结算基数总额
	}
	else if (bfjs.equals("5"))//5：二期款
	{
		htjeStr="（工程费）合同额";
		zjxjeStr="（工程费）增减项";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=2";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsze=fk;//结算基数总额
	}
	else if (bfjs.equals("6"))//6：三期款
	{
		htjeStr="（工程费）合同额";
		zjxjeStr="（工程费）增减项";

		double zqgczjf=0;
		ls_sql="select zqgczjf,zjxje";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("zqgczjf");
			zjxje=rs.getDouble("zjxje");
		}
		rs.close();
		ps.close();


		htje=zqgczjf;
		zjxje=zjxje;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		double fk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='11' and fkcs=3";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fk=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		jsjsze=fk;//结算基数总额
	}
	else if (bfjs.equals("7"))//7：工程基础报价
	{
		htjeStr="（工程基础报价）合同金额";
		zjxjeStr="（工程基础报价）增减项金额";

		double gcjcbj=0;
		double zjxgcjcbj=0;
		ls_sql="select gcjcbj,zjxgcjcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjcbj=rs.getDouble("gcjcbj");
			zjxgcjcbj=rs.getDouble("zjxgcjcbj");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje*gcjcbjbfb/100";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//有增减项
		{
			ls_sql="select zqsfje*gcjcbjbfb/100";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=gcjcbj-htqtf;
		zjxje=zjxgcjcbj-(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("8"))//8：工程基础报价＋其它费基础报价
	{
		htjeStr="（工程基础报价＋其它费基础报价）合同金额";
		zjxjeStr="（工程基础报价＋其它费基础报价）增减项金额";

		double gcjcbj=0;
		double zjxgcjcbj=0;
		ls_sql="select gcjcbj,zjxgcjcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			gcjcbj=rs.getDouble("gcjcbj");
			zjxgcjcbj=rs.getDouble("zjxgcjcbj");
		}
		rs.close();
		ps.close();

		htje=gcjcbj;
		zjxje=zjxgcjcbj;

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("9"))//9：工程施工成本价
	{
		htjeStr="（工程施工成本价）合同金额";
		zjxjeStr="（工程施工成本价）增减项金额";

		//合同工程费施工成本
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			htje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//增减项工程费施工成本
		if (zjxxh==null || zjxxh.equals(""))
		{
			zjxje=0;
		}
		else{
			double newsgcb=0;//最新施工成本
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newsgcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			zjxje=newsgcb-htje;
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("A"))//A：工程施工成本价＋其它费施工成本
	{
		htjeStr="（工程施工成本价＋其它费施工成本）合同金额";
		zjxjeStr="（工程施工成本价＋其它费施工成本）增减项金额";

		//合同工程费施工成本
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.sgcbj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bdm_xmdlbm";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			htje=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//其它收费项目明细
		ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htje+=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
		ls_sql+=" FROM bj_sfxmmx";
		ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
		//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htje+=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		//增减项工程费施工成本
		if (zjxxh==null || zjxxh.equals(""))
		{
			zjxje=0;
		}
		else{
			double newsgcb=0;//最新施工成本
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.sgcbj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				newsgcb=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			//其它收费项目明细
			ls_sql="SELECT sum(zqsfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				newsgcb+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			ls_sql="SELECT sum(sfje*sgcbjbfb/100)";
			ls_sql+=" FROM bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and sfcysgdjs='Y' ";
			ls_sql+=" and cbjjsfs!='1' ";//1:折前;2:折后
			//1：间接工程费；2：工程相关费；3：设计费；4：公司购主材间接费；5：工程管理费；6：工程税金；7：公司购主材管理费；8：公司购主材税金；A：自购主材管理费；B：自购主材税金；C：自购主材间接费；9：其它
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				newsgcb+=rs.getDouble(1);
			}
			rs.close();
			ps.close();

			zjxje=newsgcb-htje;
		}


		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("B"))//B：工程成本价
	{
		htjeStr="（工程成本价）合同金额";
		zjxjeStr="（工程成本价）增减项金额";

		double cbj=0;
		double zjxcbj=0;
		ls_sql="select cbj,zjxcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbj=rs.getDouble("cbj");
			zjxcbj=rs.getDouble("zjxcbj");
		}
		rs.close();
		ps.close();

		double htqtf=0;
		ls_sql="select zqsfje*sgcbjbfb/100";
		ls_sql+=" from  bj_sfxmmx";
		ls_sql+=" where khbh='"+khbh+"' and sfcysgdjs='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			htqtf=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double zjxhqtf=0;
		if (!zjxxh.equals(""))//有增减项
		{
			ls_sql="select zqsfje*sgcbjbfb/100";
			ls_sql+=" from  bj_sfxmmxh";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and sfcysgdjs='Y' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				zjxhqtf=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			zjxhqtf=htqtf;
		}

		htje=cbj-htqtf;
		zjxje=zjxcbj-(zjxhqtf-htqtf);

		htje=cf.round(htje,2);
		zjxje=cf.round(zjxje,2);

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else if (bfjs.equals("C"))//C：工程成本价＋其它费成本
	{
		htjeStr="（工程成本价＋其它费成本）合同金额";
		zjxjeStr="（工程成本价＋其它费成本）增减项金额";

		double cbj=0;
		double zjxcbj=0;
		ls_sql="select cbj,zjxcbj";
		ls_sql+=" from  crm_khqye";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			cbj=rs.getDouble("cbj");
			zjxcbj=rs.getDouble("zjxcbj");
		}
		rs.close();
		ps.close();

		htje=cbj;
		zjxje=zjxcbj;

		jsjsze=cf.round(htje+zjxje,2);//结算基数总额
	}
	else
	{
		out.println("错误！【拨付基数】设置不正确："+bfjs);
		return;
	}


	jsje=cf.round(jsjsze*jsbl/100,2);//结算金额
	sjbk=jsje;//实际拨款
	if (sfkclk.equals("Y"))//是否扣材料款
	{
		sjbk=sjbk-clf;
	}
	if (sfkgdyp.equals("Y"))//是否扣工地用品
	{
		sjbk=sjbk-gdyp;
	}
	if (sfkyfgf.equals("Y"))//是否扣已付工费
	{
		sjbk=sjbk-yfgf;
	}

	sjbk=cf.round(sjbk,2);

	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_sgdzqjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_sgdzqjs.jsp" name="insertform" >
<div align="center">施工队拨工费</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
	<td  width="8%">类型</td>
	<td  width="7%">结算日期</td>
	<td  width="7%">合同金额</td>
	<td  width="6%">增减项金额</td>
	<td  width="8%">结算基数</td>
	<td  width="7%">结算基数总额</td>
	<td  width="4%">结算比例</td>
	<td  width="7%">结算金额</td>
	<td  width="5%">材料费</td>
	<td  width="5%">工地用品</td>
	<td  width="7%">实际拨款</td>
	<td  width="5%">录入人</td>
	<td  width="54%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,TO_CHAR(cw_sgdzqjs.htje),TO_CHAR(cw_sgdzqjs.zjxje), DECODE(cw_sgdzqjs.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','工程施工成本价','A','工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),TO_CHAR(cw_sgdzqjs.jsjsze),cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,TO_CHAR(cw_sgdzqjs.clf),TO_CHAR(cw_sgdzqjs.gdyp),cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="电子报价">
      <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="验收记录">
      <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="付款信息">
      <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="领料单"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">结算记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">类型</span></td>
    <td><select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='K'","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨付基数</span></td>
    <td>
	<select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"1+工程费&2+工程费＋其它费&3+实收款总额&4+一期款&5+二期款&6+三期款&7+工程基础报价&8+工程基础报价＋其它费基础报价&9+工程施工成本价&A+工程施工成本价＋其它费施工成本&B+工程成本价&C+工程成本价＋其它费成本",bfjs,false);
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣材料款</span></td>
    <td><%
	cf.radioToken(out, "sfkclk","Y+是&N+否",sfkclk,true);
%>    </td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣工地用品</span></td>
    <td><%
	cf.radioToken(out, "sfkgdyp","Y+是&N+否",sfkgdyp,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">是否扣已付工费</span></td>
    <td><%
	cf.radioToken(out, "sfkyfgf","Y+是&N+否",sfkyfgf,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2"><%=htjeStr%></span></td> 
  <td width="32%"><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2"><%=zjxjeStr%></span></td> 
  <td width="32%"><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">家装实收款</span></td>
    <td><input type="text" name="jzssk" value="<%=jzssk%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">已付工费</span></td>
    <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">材料费</span></td>
    <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">工地用品</span></td>
    <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="right">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">拨付基数总额</span></td> 
  <td width="32%"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>拨付比例</td> 
  <td width="32%"><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" onchange="f_jsje(insertform)">
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">拨付金额</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">拨付金额=拨付基数总额×拨付比例</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">实际拨款</span></td> 
  <td colspan="3"><input type="text" name="sjbk" value="<%=sjbk%>" size="20" maxlength="17" readonly>
    <span class="STYLE3"><%=sjbkStr%></span></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><span class="STYLE1">*</span>拨付日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsje(FormName)//参数FormName:Form的名称
{
	var jsje=FormName.jsjsze.value*1.0*FormName.jsbl.value/100.0;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	var sjbk=FormName.jsje.value*1.0;

	if ("<%=sfkclk%>"=="Y")//是否扣材料款
	{
		sjbk=sjbk-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//是否扣工地用品
	{
		sjbk=sjbk-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//是否扣已付工费
	{
		sjbk=sjbk-FormName.yfgf.value*1.0;
	}
	sjbk=round(sjbk,2);

	FormName.sjbk.value=sjbk;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[拨付记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("请输入[合同金额]！");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "合同金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("请输入[家装实收款]！");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "家装实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("请输入[工地用品]！");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "工地用品"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgf)=="") {
		alert("请输入[已付工费]！");
		FormName.yfgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgf, "已付工费"))) {
		return false;
	}


	if(	javaTrim(FormName.jsjsze)=="") {
		alert("请输入[结算基数总额]！");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "结算基数总额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[拨付比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "拨付比例"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("请输入[拨付金额]！");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "拨付金额"))) {
		return false;
	}
	if(	javaTrim(FormName.sjbk)=="") {
		alert("请输入[实际拨款]！");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "实际拨款"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
