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

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

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
if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

String wheresql1="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}
wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//清除临时表
	ls_sql=" delete from cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into cw_tjlsb41 (xh,yhdlm       ,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh  ,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12,sz13,sz19,sz20,ywy) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh  ,lx ";
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
	ls_sql+=" ,sz19,sz20,ywy ";//其它
	ls_sql+=" FROM (";

	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20,crm_khxx.ywy ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') "+wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,crm_khxx.ywy";

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
	ls_sql+=" FROM cw_tjlsb41";
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
		ls_sql=" update cw_tjlsb41 set yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?";
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

	ls_sql=" update cw_tjlsb41 set sz14=sz3+sz4";
	ls_sql+=" ,sz15=sz3+sz4";
	ls_sql+=" ,sz16=sz3+sz4";
	ls_sql+=" ,sz17=sz3+sz4";
	ls_sql+=" ,sz18=1";
	ls_sql+=" where yhdlm='"+yhdlm+"' ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb41 set sz14=sz3*yjxs11/10+sz4";
	ls_sql+=" ,sz15=sz3*yjxs12/10+sz4";
	ls_sql+=" ,sz16=sz3*yjxs13/10+sz4";
	ls_sql+=" ,sz17=sz3*yjxs14/10+sz4";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ( cxhdmc is not null OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	ls_sql=" update cw_tjlsb41 set sz17=0,sz18=0";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ywy is null";
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
  <B>店面产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="1%">排名</td>
  <td  width="4%">分公司</td>
  <td  width="4%">店面</td>

  <td  width="2%">签约数</td>
  <td  width="4%">店面签约业绩</td>

  <td  width="4%">工程签约额</td>
  <td  width="4%">工程签约额</td>
  <td  width="4%">未打折工程额</td>
  <td  width="3%">项目管理费</td>
  <td  width="3%">税金</td>

  <td  width="3%">增减项金额</td>
  <td  width="3%">增减项项目管理费</td>
  <td  width="3%">增减项税金</td>
  <td  width="3%">减项违约金</td>


  <td  width="4%" >店面完工业绩</td>
  <td  width="3%">合同完工额</td>
  <td  width="4%">家装完工额 </td>

  <td  width="3%">设计费－应收</td>
  <td  width="3%">设计费－实收</td>

  <td  width="3%">家装款－应收</td>
  <td  width="3%">家装款－实收</td>


  <td  width="3%">平均单额</td>
  <td  width="4%">平米造价</td>
  <td  width="3%">平均签单周期</td>


  <td  width="4%">市场部经理签约业绩</td>
  <td  width="3%">市场部签单个数占总签单数比例</td>
  <td  width="3%">市场部签单业绩占总签单业绩比例</td>



</tr>
<%
	//获取最大数
	double maxqye=0;
	String fgsmc=null;
	String fgsbm=null;
	String oldfgsmc="";
	String dmmc=null;
	String getdwbh=null;
	int qys=0;
	double qye=0;
	double suijin=0;
	double guanlif=0;
	double zxse=0;
	double wdzgce=0;
	double zjxje=0;
	double zjhze=0;
	double sjf=0;
	double sfke=0;
	double fjje=0;
	double gsfje=0;

	double dmjlyj=0;
	double sjsyj=0;
	double ywyyj=0;
	double scbjlyj=0;

	double scbjlqys=0;
	double pjqdzq=0;
	double fwmj=0;

	double sssjf=0;

	int allqys=0;
	double allqye=0;
	double allsuijin=0;
	double allguanlif=0;
	double allzxse=0;
	double allwdzgce=0;
	double allzjxje=0;
	double allzjhze=0;
	double allsjf=0;
	double allsfke=0;
	double allfjje=0;
	double allgsfje=0;
	double zkl=0;
	int pjde=0;
	int xspjde=0;
	int pmjj=0;
	int xspmjj=0;

	double allsssjf=0;


	double alldmjlyj=0;
	double allsjsyj=0;
	double allywyyj=0;
	double allscbjlyj=0;

	double allscbjlqys=0;
	double allpjqdzq=0;
	double allfwmj=0;

	double qysbfb=0;
	double qyebfb=0;

	int row=0;

	//sz1:签约数
	//sz2:签约额－折前
	//sz3:签约额－折后
	//sz4:合同管理费
	//sz5:合同税金

	//sz6:增减项
	//sz7:增减项项目管理费
	//sz8:增减项税金
	//sz9:减项违约金

	//sz10:设计费
	//sz11:实收款
	//sz12:返卷总额
	//sz13:公司承担返卷

	//yjxs11 02：店面签约业绩系数
	//yjxs12 04：家装设计师业绩系数
	//yjxs13 06：业务员系数
	//yjxs14 07：市场部经理系数

	//sz14:店面签约业绩＝签约额折后*店面签约业绩系数+合同管理费
	//sz15:家装设计师业绩＝
	//sz16:业务员业绩＝
	//sz17:市场部经理业绩＝
	//sz18:市场部经理签约数＝
	//sz19:平均签单周期
	//sz20:房屋面积


	
	//家装总客户总签约数
	double zjxglf=0;
	double zjxsj=0;
	double jxkk=0;
	double allzjxglf=0;
	double allzjxsj=0;
	double alljxkk=0;
	ls_sql=" select sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) guanlif,sum(sz5) suijin ";
	ls_sql+=" ,sum(sz6) zjxje,sum(sz7) zjxglf,sum(sz8) zjxsj,sum(sz9) jxkk";
	ls_sql+=" ,sum(sz10) sjf,sum(sz11) sfke,sum(sz12) fjje,sum(sz13) gsfje ";
	ls_sql+=" ,sum(sz14) dmjlyj,sum(sz15) sjsyj,sum(sz16) ywyyj,sum(sz17) scbjlyj";
	ls_sql+=" ,sum(sz18) scbjlqys,sum(sz19) pjqdzq,sum(sz20) fwmj";
	ls_sql+=" FROM cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt("qys");
		allwdzgce=rs.getDouble("wdzgce");
		allqye=rs.getDouble("qye");
		allguanlif=rs.getDouble("guanlif");
		allsuijin=rs.getDouble("suijin");

		allzjxje=rs.getDouble("zjxje");
		allzjxglf=rs.getDouble("zjxglf");
		allzjxsj=rs.getDouble("zjxsj");
		alljxkk=rs.getDouble("jxkk");


		allsjf=rs.getDouble("sjf");
		allsfke=rs.getDouble("sfke");
		allfjje=rs.getDouble("fjje");
		allgsfje=rs.getDouble("gsfje");

		alldmjlyj=rs.getDouble("dmjlyj");
		allsjsyj=rs.getDouble("sjsyj");
		allywyyj=rs.getDouble("ywyyj");
		allscbjlyj=rs.getDouble("scbjlyj");

		allscbjlqys=rs.getDouble("scbjlqys");
		allpjqdzq=rs.getDouble("pjqdzq");
		allfwmj=rs.getDouble("fwmj");

	}
	rs.close();
	ps.close();

	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allqye==0)
	{
		return;
	}


	ls_sql=" SELECT fgsmc,dwbh,dmmc ";
	ls_sql+=" ,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(guanlif) guanlif,sum(suijin) suijin ";
	ls_sql+=" ,sum(zjxje) zjxje,sum(zjxglf) zjxglf,sum(zjxsj) zjxsj,sum(jxkk) jxkk";
	ls_sql+=" ,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje ";
	ls_sql+=" ,sum(dmjlyj) dmjlyj,sum(sjsyj) sjsyj,sum(ywyyj) ywyyj,sum(scbjlyj) scbjlyj";
	ls_sql+=" ,sum(scbjlqys) scbjlqys,sum(pjqdzq) pjqdzq,sum(fwmj) fwmj ";
	ls_sql+=" from ( ";

	ls_sql+=" select a.dwmc fgsmc,cw_tjlsb41.qddm dwbh,b.dwmc dmmc";

	ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) guanlif,sum(sz5) suijin ";
	ls_sql+=" ,sum(sz6) zjxje,sum(sz7) zjxglf,sum(sz8) zjxsj,sum(sz9) jxkk";
	ls_sql+=" ,sum(sz10) sjf,sum(sz11) sfke,sum(sz12) fjje,sum(sz13) gsfje ";
	ls_sql+=" ,sum(sz14) dmjlyj,sum(sz15) sjsyj,sum(sz16) ywyyj,sum(sz17) scbjlyj";
	ls_sql+=" ,sum(sz18) scbjlqys,sum(sz19) pjqdzq,sum(sz20) fwmj";
	
	ls_sql+=" FROM cw_tjlsb41,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where cw_tjlsb41.yhdlm='"+yhdlm+"' and  cw_tjlsb41.fgsbh=a.dwbh(+) and cw_tjlsb41.qddm=b.dwbh(+)";
	ls_sql+=" group by a.dwmc,cw_tjlsb41.qddm,b.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgsmc,a.dwbh dwbh,a.dwmc dmmc ";
	ls_sql+=" ,0 qys,0 wdzgce,0 qye,0 guanlif,0 suijin ";
	ls_sql+=" ,0 zjxje,0 zjxglf,0 zjxsj,0 jxkk";
	ls_sql+=" ,0 sjf,0 sfke,0 fjje,0 gsfje ";
	ls_sql+=" ,0 dmjlyj,0 sjsyj,0 ywyyj,0 scbjlyj";
	ls_sql+=" ,0 scbjlqys,0 pjqdzq,0 fwmj ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=wheresql1;

	ls_sql+=" )";
	ls_sql+=" group by fgsmc,dwbh,dmmc";
	ls_sql+=" order by qye desc,fgsmc,dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsmc=rs.getString("fgsmc");
		getdwbh=rs.getString("dwbh");
		dmmc=rs.getString("dmmc");

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

		row++;

		if (fgsmc.equals(oldfgsmc))
		{
			fgsmc="同上";;
		}
		else{
			oldfgsmc=fgsmc;
		}


		ls_sql=" select sum(fkje)";
		ls_sql+=" from cw_khfkjl";
		ls_sql+=" where cw_khfkjl.dwbh='"+getdwbh+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N' ";//53:设计装修费
		ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssjf=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();


		allsssjf+=sssjf;

		
	
		
		if (qys!=0)
		{
			pjde=(int)(qye/qys);
		}
		else{
			pjde=0;
		}
		if (fwmj!=0)
		{
			pmjj=(int)(qye/fwmj);
		}
		else{
			pmjj=0;
		}
		if (qys!=0)
		{
			pjqdzq=pjqdzq/qys;
		}
		else{
			pjqdzq=0;
		}
		if (qys!=0)
		{
			qysbfb=scbjlqys*100/qys;
		}
		else{
			qysbfb=0;
		}
		if (dmjlyj!=0)
		{
			qyebfb=scbjlyj*100/dmjlyj;
		}
		else{
			qyebfb=0;
		}



		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=fgsmc%></td>
			<td ><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>&lx=1" target="_blank"><%=dmmc%></A></td>

			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.formatDouble((int)dmjlyj)%></td>

			<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin)%></td>
			<td  align="right"><%=cf.formatDouble(qye)%></td>
			<td  align="right"><%=cf.formatDouble(wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble(guanlif)%></td>
			<td  align="right"><%=cf.formatDouble(suijin)%></td>
			
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjxglf)%></td>
			<td  align="right"><%=cf.formatDouble((int)zjxsj)%></td>
			<td  align="right"><%=cf.formatDouble((int)jxkk)%></td>

			<td  align="right"><%=cf.formatDouble(dmjlyj+zjxje+zjxglf)%></td>
			<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin+zjxje+zjxglf+zjxsj)%></td>
			<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin+zjxje+zjxglf+zjxsj+jxkk)%></td>


			<td  align="right"><%=sjf%></td>
			<td  align="right"><%=cf.formatDouble((int)sssjf)%></td>
			<td  align="right">&nbsp;</td>
			<td  align="right"><%=cf.formatDouble((int)sfke)%></td>

			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(pjqdzq)%></td>


			<td  align="right"><%=cf.formatDouble((int)scbjlyj)%></td>
			<td  align="right"><%=cf.formatDouble(qysbfb)%>%</td>
			<td  align="right"><%=cf.formatDouble(qyebfb)%>%</td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

		
	if (allqys!=0)
	{
		pjde=(int)(allqye/allqys);
	}
	else{
		pjde=0;
	}
	if (allfwmj!=0)
	{
		pmjj=(int)(allqye/allfwmj);
	}
	else{
		pmjj=0;
	}
	if (allqys!=0)
	{
		pjqdzq=allpjqdzq/allqys;
	}
	else{
		pjqdzq=0;
	}
	if (allqys!=0)
	{
		qysbfb=allscbjlqys*100/allqys;
	}
	else{
		qysbfb=0;
	}
	if (alldmjlyj!=0)
	{
		qyebfb=allscbjlyj*100/alldmjlyj;
	}
	else{
		qyebfb=0;
	}
%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td >&nbsp;</td>


	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmjlyj)%></td>

	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
	
	<td  align="right"><%=cf.formatDouble((int)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((int)allzjxglf)%></td>
	<td  align="right"><%=cf.formatDouble((int)allzjxsj)%></td>
	<td  align="right"><%=cf.formatDouble((int)alljxkk)%></td>

	<td  align="right"><%=cf.formatDouble(alldmjlyj+allzjxje+allzjxglf)%></td>
	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin+allzjxje+allzjxglf+allzjxsj)%></td>
	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin+allzjxje+allzjxglf+allzjxsj+alljxkk)%></td>


	<td  align="right"><%=allsjf%></td>
	<td  align="right"><%=cf.formatDouble((int)allsssjf)%></td>
	<td  align="right">&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((int)allsfke)%></td>

	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(pjqdzq)%></td>


	<td  align="right"><%=cf.formatDouble((int)allscbjlyj)%></td>
	<td  align="right"><%=cf.formatDouble(qysbfb)%>%</td>
	<td  align="right"><%=cf.formatDouble(qyebfb)%>%</td>
	
	
	
	</tr>
</table>


<BR>
<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="1%">排名</td>
  <td  width="8%">分公司</td>

  <td  width="2%">签约数</td>
  <td  width="4%">店面签约业绩</td>

  <td  width="4%">工程签约额</td>
  <td  width="4%">工程签约额</td>
  <td  width="4%">未打折工程额</td>
  <td  width="3%">项目管理费</td>
  <td  width="3%">税金</td>

  <td  width="3%">增减项金额</td>
  <td  width="3%">增减项项目管理费</td>
  <td  width="3%">增减项税金</td>
  <td  width="3%">减项违约金</td>


  <td  width="4%" >店面完工业绩</td>
  <td  width="3%">合同完工额</td>
  <td  width="4%">家装完工额 </td>

  <td  width="3%">设计费－应收</td>
  <td  width="3%">设计费－实收</td>

  <td  width="3%">家装款－应收</td>
  <td  width="3%">家装款－实收</td>


  <td  width="3%">平均单额</td>
  <td  width="4%">平米造价</td>
  <td  width="3%">平均签单周期</td>


  <td  width="4%">市场部经理签约业绩</td>
  <td  width="3%">市场部签单个数占总签单数比例</td>
  <td  width="3%">市场部签单业绩占总签单业绩比例</td>

</tr>
<%
  if (dwbh==null || dwbh.equals(""))
	{

		row=0;

		ls_sql=" SELECT fgsmc,fgsbh";

		ls_sql+=" ,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(guanlif) guanlif,sum(suijin) suijin ";
		ls_sql+=" ,sum(zjxje) zjxje,sum(zjxglf) zjxglf,sum(zjxsj) zjxsj,sum(jxkk) jxkk";
		ls_sql+=" ,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje ";
		ls_sql+=" ,sum(dmjlyj) dmjlyj,sum(sjsyj) sjsyj,sum(ywyyj) ywyyj,sum(scbjlyj) scbjlyj";
		ls_sql+=" ,sum(scbjlqys) scbjlqys,sum(pjqdzq) pjqdzq,sum(fwmj) fwmj ";

		ls_sql+=" from ( ";

		ls_sql+=" select sq_dwxx.dwmc fgsmc,cw_tjlsb41.fgsbh";

		ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) guanlif,sum(sz5) suijin ";
		ls_sql+=" ,sum(sz6) zjxje,sum(sz7) zjxglf,sum(sz8) zjxsj,sum(sz9) jxkk";
		ls_sql+=" ,sum(sz10) sjf,sum(sz11) sfke,sum(sz12) fjje,sum(sz13) gsfje ";
		ls_sql+=" ,sum(sz14) dmjlyj,sum(sz15) sjsyj,sum(sz16) ywyyj,sum(sz17) scbjlyj";
		ls_sql+=" ,sum(sz18) scbjlqys,sum(sz19) pjqdzq,sum(sz20) fwmj";
		
		ls_sql+=" FROM cw_tjlsb41,sq_dwxx";
		ls_sql+=" where cw_tjlsb41.yhdlm='"+yhdlm+"' and  cw_tjlsb41.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" group by sq_dwxx.dwmc,cw_tjlsb41.fgsbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT dwmc fgsmc,dwbh fgsbh ";
		ls_sql+=" ,0 qys,0 wdzgce,0 qye,0 guanlif,0 suijin ";
		ls_sql+=" ,0 zjxje,0 zjxglf,0 zjxsj,0 jxkk";
		ls_sql+=" ,0 sjf,0 sfke,0 fjje,0 gsfje ";
		ls_sql+=" ,0 dmjlyj,0 sjsyj,0 ywyyj,0 scbjlyj";
		ls_sql+=" ,0 scbjlqys,0 pjqdzq,0 fwmj ";
		ls_sql+=" FROM sq_dwxx a";
		ls_sql+=" where  dwlx='F0' and cxbz='N'";
		ls_sql+=wheresql1;

		ls_sql+=" )";
		ls_sql+=" group by fgsmc,fgsbh";
		ls_sql+=" order by qye desc,fgsmc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			fgsmc=rs.getString("fgsmc");
			getdwbh=rs.getString("fgsbh");

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
			ls_sql+=" from cw_khfkjl";
			ls_sql+=" where cw_khfkjl.fgsbh='"+getdwbh+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N' ";//53:设计装修费
			ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sssjf=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();



			row++;

			if (qys!=0)
			{
				pjde=(int)(qye/qys);
			}
			else{
				pjde=0;
			}
			if (fwmj!=0)
			{
				pmjj=(int)(qye/fwmj);
			}
			else{
				pmjj=0;
			}
			if (qys!=0)
			{
				pjqdzq=pjqdzq/qys;
			}
			else{
				pjqdzq=0;
			}
			if (qys!=0)
			{
				qysbfb=scbjlqys*100/qys;
			}
			else{
				qysbfb=0;
			}
			if (dmjlyj!=0)
			{
				qyebfb=scbjlyj*100/dmjlyj;
			}
			else{
				qyebfb=0;
			}

			%>
			<tr align="center">
				<td ><%=row%></td>
				<td ><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>&lx=2" target="_blank"><%=fgsmc%></A></td>

				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)dmjlyj)%></td>

				<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin)%></td>
				<td  align="right"><%=cf.formatDouble(qye)%></td>
				<td  align="right"><%=cf.formatDouble(wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble(guanlif)%></td>
				<td  align="right"><%=cf.formatDouble(suijin)%></td>
				
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxglf)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxsj)%></td>
				<td  align="right"><%=cf.formatDouble((int)jxkk)%></td>

				<td  align="right"><%=cf.formatDouble(dmjlyj+zjxje+zjxglf)%></td>
				<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin+zjxje+zjxglf+zjxsj)%></td>
				<td  align="right"><%=cf.formatDouble(qye+guanlif+suijin+zjxje+zjxglf+zjxsj+jxkk)%></td>


				<td  align="right"><%=sjf%></td>
				<td  align="right"><%=cf.formatDouble((int)sssjf)%></td>
				<td  align="right">&nbsp;</td>
				<td  align="right"><%=cf.formatDouble((int)sfke)%></td>

				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(pjqdzq)%></td>


				<td  align="right"><%=cf.formatDouble((int)scbjlyj)%></td>
				<td  align="right"><%=cf.formatDouble(qysbfb)%>%</td>
				<td  align="right"><%=cf.formatDouble(qyebfb)%>%</td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();


	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>

	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmjlyj)%></td>

	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
	
	<td  align="right"><%=cf.formatDouble((int)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((int)allzjxglf)%></td>
	<td  align="right"><%=cf.formatDouble((int)allzjxsj)%></td>
	<td  align="right"><%=cf.formatDouble((int)alljxkk)%></td>

	<td  align="right"><%=cf.formatDouble(alldmjlyj+allzjxje+allzjxglf)%></td>
	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin+allzjxje+allzjxglf+allzjxsj)%></td>
	<td  align="right"><%=cf.formatDouble(allqye+allguanlif+allsuijin+allzjxje+allzjxglf+allzjxsj+alljxkk)%></td>


	<td  align="right"><%=allsjf%></td>
	<td  align="right"><%=cf.formatDouble((int)allsssjf)%></td>
	<td  align="right">&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((int)allsfke)%></td>

	<td  align="right"><%=cf.formatDouble(pjde)%></td>
	<td  align="right"><%=cf.formatDouble(pmjj)%></td>
	<td  align="right"><%=cf.formatDouble(pjqdzq)%></td>


	<td  align="right"><%=cf.formatDouble((int)allscbjlyj)%></td>
	<td  align="right"><%=cf.formatDouble(qysbfb)%>%</td>
	<td  align="right"><%=cf.formatDouble(qyebfb)%>%</td>
</tr>
</table>

</body>
</html>
<%

	ls_sql=" delete from cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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

