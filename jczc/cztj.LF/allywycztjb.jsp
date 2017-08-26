<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}
String yhdlm=(String)session.getAttribute("yhdlm");

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");

String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}


int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql=" delete from cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into cw_tjlsb42 (xh,yhdlm,fgsbh,jzsjs,cxhdmc,cxhdbmxq,cxhdbmzh ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20 ) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,ywy,cxhdbm,cxhdbmxq,cxhdbmzh,lx ";
	//sz1:签约数
	//sz2:签约额－折前
	//sz3:签约额－折后
	//sz4:合同管理费
	//sz5:合同税金
	ls_sql+=" ,sz1,sz2,sz3,sz4,sz5 ";//合同
	//sz6:增减项
	//sz7:增减项项目管理费
	//sz8:增减项税金
	//sz9:减项违约金
	ls_sql+=" ,sz6,sz7,sz8,sz9 ";//增减项
	//sz10:设计费
	//sz11:实收款
	//sz12:返卷总额
	//sz13:公司承担返卷
	ls_sql+=" ,sz10,sz11,sz12,sz13 ";//其它

	//sz19:平均签单周期
	//sz20:房屋面积
	ls_sql+=" ,sz19,sz20 ";//其它
	ls_sql+=" FROM (";

	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20 ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') "+wheresql;
	ls_sql+=" and crm_khxx.ywy is not null";
	
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh";

	ls_sql+=" )";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	String xh=null;
	String fgsbh=null;
	String cxhdmc=null;
	String cxhdbmxq=null;
	String cxhdbmzh=null;
	ls_sql="SELECT xh,fgsbh,cxhdmc,cxhdbmxq,cxhdbmzh";
	ls_sql+=" FROM cw_tjlsb42";
	ls_sql+=" where yhdlm='"+yhdlm+"' and (cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		double yjxs11=10;//02：店面签约业绩系数
		double yjxs12=10;//04：家装设计师业绩系数
		double yjxs13=10;//06：业务员系数
		double yjxs14=10;//07：市场部经理系数

		if (!cxhdmc.equals(""))//公司活动
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs13=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs14=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs21=10;
		double yjxs22=10;
		double yjxs23=10;
		double yjxs24=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs23=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs24=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs31=10;
		double yjxs32=10;
		double yjxs33=10;
		double yjxs34=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='04'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='06'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs33=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='07'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs34=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+ls_sql);
				return;
			}
			rs1.close();
			ps1.close();
		}

		double yjxs1=10;//02：店面签约业绩系数
		double yjxs2=10;//04：家装设计师业绩系数
		double yjxs3=10;//06：业务员系数
		double yjxs4=10;//07：市场部经理系数

		yjxs1=10-(10-yjxs11)-(10-yjxs21)-(10-yjxs31);
		yjxs2=10-(10-yjxs12)-(10-yjxs22)-(10-yjxs32);
		yjxs3=10-(10-yjxs13)-(10-yjxs23)-(10-yjxs33);
		yjxs4=10-(10-yjxs14)-(10-yjxs24)-(10-yjxs34);

		//yjxs11 02：店面签约业绩系数
		//yjxs12 04：家装设计师业绩系数
		//yjxs13 06：业务员系数
		//yjxs14 07：市场部经理系数
		ls_sql=" update cw_tjlsb42 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
		ls_sql+=" where xh='"+xh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDouble(1,yjxs1);
		ps1.setDouble(2,yjxs2);
		ps1.setDouble(3,yjxs3);
		ps1.setDouble(4,yjxs4);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();


	//业绩

	//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
	//sz15:家装设计师业绩＝
	//sz16:业务员业绩＝
	//sz17:市场部经理业绩＝
	//sz18:市场部经理签约数＝

	//sz1:签约数
	//sz2:签约额－折前
	//sz3:签约额－折后
	//sz4:合同管理费
	//sz5:合同税金

	ls_sql=" update cw_tjlsb42 set sz14=sz3+sz4";
	ls_sql+=" ,sz15=sz3+sz4";
	ls_sql+=" ,sz16=sz3+sz4";
	ls_sql+=" ,sz17=sz3+sz4";
	ls_sql+=" ,sz18=1";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb42 set sz14=sz3*yjxs11/10+sz4";
	ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
	ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
	ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>全部业务员产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="170%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">&nbsp;</td>
  <td  width="3%">排名</td>
  <td  width="5%">业务员</td>
  <td  width="11%">分公司</td>

  <td  width="5%">签约数</td>
  <td  width="6%">店面签约业绩</td>
  <td  width="6%">家装顾问签约业绩</td>

  <td  width="6%">工程签约额</td>
  <td  width="6%">工程费</td>
  <td  width="6%">工程签约额</td>
  <td  width="5%">项目管理费</td>
  <td  width="5%">税金</td>

  <td  width="5%">平均单额</td>
  <td  width="5%">平米均价</td>
  <td  width="5%">实收设计费</td>
  <td  width="5%">实收款</td>
  <td  width="5%">返卷总额</td>
  <td  width="5%">公司承担返卷</td>
  <td  width="4%">折扣率</td>

</tr>
<%
	String getywy=null;
	String olddm="";
	String dm=null;

	int qys=0;
	double qye=0;
	double suijin=0;
	double guanlif=0;
	double wdzgce=0;
	double zjxje=0;
	double zjhze=0;
	double sjf=0;
	double fjje=0;
	double gsfje=0;
	double fwmj=0;

	double sssjf=0;

	double sfke=0;
	double dmjlyj=0;
	double sjsyj=0;
	double ywyyj=0;
	double scbjlyj=0;

	double scbjlqys=0;
	double pjqdzq=0;


	int allqys=0;
	double allqye=0;
	double allsuijin=0;
	double allguanlif=0;
	double allwdzgce=0;
	double allzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	double allsssjf=0;
	double allsfke=0;
	double allfjje=0;
	double allgsfje=0;
	long allfwmj=0;

	double alldmjlyj=0;
	double allsjsyj=0;
	double allywyyj=0;
	double allscbjlyj=0;

	double zkl=0;
	int pjde=0;
	int pmjj=0;

	double zjxglf=0;
	double zjxsj=0;
	double jxkk=0;
	double allzjxglf=0;
	double allzjxsj=0;
	double alljxkk=0;

	
	ls_sql=" SELECT ywy,fgsbh,dwmc ";
	ls_sql+=" ,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(guanlif) guanlif,sum(suijin) suijin ";
	ls_sql+=" ,sum(zjxje) zjxje,sum(zjxglf) zjxglf,sum(zjxsj) zjxsj,sum(jxkk) jxkk";
	ls_sql+=" ,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje ";
	ls_sql+=" ,sum(dmjlyj) dmjlyj,sum(sjsyj) sjsyj,sum(ywyyj) ywyyj,sum(scbjlyj) scbjlyj";
	ls_sql+=" ,sum(scbjlqys) scbjlqys,sum(pjqdzq) pjqdzq,sum(fwmj) fwmj ";
	ls_sql+=" from ( ";
	
	ls_sql+=" select jzsjs ywy,cw_tjlsb42.fgsbh,dwmc";

	ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) guanlif,sum(sz5) suijin ";
	ls_sql+=" ,sum(sz6) zjxje,sum(sz7) zjxglf,sum(sz8) zjxsj,sum(sz9) jxkk";
	ls_sql+=" ,sum(sz10) sjf,sum(sz11) sfke,sum(sz12) fjje,sum(sz13) gsfje ";
	ls_sql+=" ,sum(sz14) dmjlyj,sum(sz15) sjsyj,sum(sz16) ywyyj,sum(sz17) scbjlyj";
	ls_sql+=" ,sum(sz18) scbjlqys,sum(sz19) pjqdzq,sum(sz20) fwmj";
	
	ls_sql+=" FROM cw_tjlsb42,sq_dwxx";
	ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" group by jzsjs,cw_tjlsb42.fgsbh,dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT yhmc ywy,sq_yhxx.ssfgs fgsbh,dwmc ";
	ls_sql+=" ,0 qys,0 wdzgce,0 qye,0 guanlif,0 suijin ";
	ls_sql+=" ,0 zjxje,0 zjxglf,0 zjxsj,0 jxkk";
	ls_sql+=" ,0 sjf,0 sfke,0 fjje,0 gsfje ";
	ls_sql+=" ,0 dmjlyj,0 sjsyj,0 ywyyj,0 scbjlyj";
	ls_sql+=" ,0 scbjlqys,0 pjqdzq,0 fwmj ";

	ls_sql+=" FROM sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.ssfgs=sq_dwxx.dwbh and zwbm='19' ";
//	ls_sql+=" and sflz in('N')";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
	}

	ls_sql+=" )";
	ls_sql+=" group by ywy,fgsbh,dwmc";
	ls_sql+=" order by qye desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getywy=rs.getString("ywy");
		dm=rs.getString("dwmc");
		fgsbh=rs.getString("fgsbh");

		qys=rs.getInt("qys");
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");

		zjxje=rs.getDouble("zjxje");
		zjxglf=rs.getDouble("zjxglf");
		zjxsj=rs.getDouble("zjxsj");
		jxkk=rs.getDouble("jxkk");

		sjf=rs.getDouble("sjf");
		sfke=rs.getDouble("sfke");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");

		dmjlyj=rs.getDouble("dmjlyj");
		sjsyj=rs.getDouble("sjsyj");
		ywyyj=rs.getDouble("ywyyj");
		scbjlyj=rs.getDouble("scbjlyj");

		scbjlqys=rs.getDouble("scbjlqys");
		pjqdzq=rs.getDouble("pjqdzq");
		fwmj=rs.getDouble("fwmj");

		ls_sql=" select sum(fkje)";
		ls_sql+=" from cw_khfkjl,crm_khxx";
		ls_sql+=" where cw_khfkjl.khbh=crm_khxx.khbh and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.ywy='"+getywy+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N' ";//53:设计装修费
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		zjhze=qye+zjxje;//增减后总额

		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(int)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		allqys+=qys;
		allwdzgce+=wdzgce;
		allqye+=qye;
		allsuijin+=suijin;
		allguanlif+=guanlif;

		allzjxje+=zjxje;
		allzjxglf+=zjxglf;
		allzjxsj+=zjxsj;
		alljxkk+=jxkk;
		
		allsjf+=sjf;
		allsssjf+=sssjf;
		allsfke+=sfke;
		allfjje+=fjje;
		allgsfje+=gsfje;

		alldmjlyj+=dmjlyj;
		allsjsyj+=sjsyj;
		allywyyj+=ywyyj;
		allscbjlyj+=scbjlyj;


		allfwmj+=fwmj;


		row++;

		if (dm.equals(olddm))
		{
		}
		else{
			olddm=dm;
			if (bgcolor.equals("#FFFFFF"))
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}
		}

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><input name="ywy" type="checkbox" value='<%=getywy+"+"+fgsbh%>' checked></td>
			<td ><%=row%>
			</td>
			<td ><A HREF="ViewYwycz.jsp?jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&ywy=<%=getywy%>&fgsbh=<%=fgsbh%>" target="_blank"><%=getywy%></A></td>
			<td ><%=dm%></td>

			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)dmjlyj)%></td>
			<td  align="right"><%=cf.formatDouble((int)ywyyj)%></td>

			<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin)%></td>
			<td  align="right"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble(qye)%></td>
			<td  align="right"><%=cf.formatDouble(guanlif)%></td>
			<td  align="right"><%=cf.formatDouble(suijin)%></td>

			<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
			<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
			<td  align="right"><%=cf.formatDouble((int)sssjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)sfke)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();


	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td colspan="4">
	<input type=button value='查看被选业务员签单明细' onclick="cf_submit(listform)">
	<input type=button value='导出EXCEL' onclick="cf_do(listform)">
	</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmjlyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allywyyj)%></td>

	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble(allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>

	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsssjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsfke)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
</tr>
</table>
</form> 


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

<script  LANGUAGE="javascript">
<!--

function cf_submit(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.ywy.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.ywy[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewAllYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
function cf_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.ywy.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.ywy[i].checked ){
				choo=1;
				break;
			}
		} 
	} 
	if (choo == 0){
		alert("请选择所要操作的数据");
		return false;
	}
	else{

		formName.action="ViewExecAllYwycz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

