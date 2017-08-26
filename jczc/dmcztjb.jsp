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

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_xtrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_xtrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：店面家装业绩："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();


	ls_sql=" delete from cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" insert into cw_tjlsb41 (xh,yhdlm,fgsbh,qddm,cxhdmc,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4   ,sz5,sz6,sz7,sz8,sz9,sz10,sz11   ,sz12) ";
	ls_sql+=" select '"+yhdlm+"'||rownum,'"+yhdlm+"',fgsbh,dwbh,cxhdbm,cxhdbmxq,cxhdbmzh,lx,sz1,sz2,sz3,sz4,sz5,sz6,sz7,sz8,sz9,sz10,sz11,sz12";
	ls_sql+=" FROM (";

	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.dwbh,cxhdbm,cxhdbmxq,cxhdbmzh,'0' lx,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(zjxje) sz4 ";
	ls_sql+=" ,sum(sjf) sz5,sum(sfke) sz6,sum(fjje) sz7,sum(gsfje) sz8,sum(fwmj) sz9,sum(guanlif) sz10,sum(suijin) sz11";
	ls_sql+=" ,sum(NVL(crm_khxx.wdzgce,0)+NVL(crm_khxx.suijin,0)+NVL(crm_khxx.guanlif,0)) sz12";
	ls_sql+=" FROM crm_khxx";
	ls_sql+=" where crm_khxx.zt in('2','5') "+wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.dwbh,cxhdbm,cxhdbmxq,cxhdbmzh";

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

		String hdlx1="";
		double yjxs11=10;
		double yjxs12=10;
		double yjxs13=10;
		double yjxs14=10;
		if (!cxhdmc.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx1=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='01'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs11=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs12=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdmc+"' and jc_cxhdyjxs.yjxsbm='03'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs13=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
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
				yjxs14=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdmc);
				return;
			}
			rs1.close();
			ps1.close();
		}

		String hdlx2="";
		double yjxs21=10;
		double yjxs22=10;
		double yjxs23=10;
		double yjxs24=10;
		if (!cxhdbmxq.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmxq+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx2=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='01'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs21=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs22=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmxq+"' and jc_cxhdyjxs.yjxsbm='03'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs23=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
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
				yjxs24=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmxq);
				return;
			}
			rs1.close();
			ps1.close();
		}

		String hdlx3="";
		double yjxs31=10;
		double yjxs32=10;
		double yjxs33=10;
		double yjxs34=10;
		if (!cxhdbmzh.equals(""))
		{
			ls_sql=" select hdlx";
			ls_sql+=" from jc_cxhd";
			ls_sql+=" where fgsbh='"+fgsbh+"' and cxhdmc='"+cxhdbmzh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				hdlx3=rs1.getString("hdlx");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='01'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs31=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='02'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs32=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();

			ls_sql=" select yjxs";
			ls_sql+=" from jc_cxhdyjxs";
			ls_sql+=" where jc_cxhdyjxs.fgsbh='"+fgsbh+"' and jc_cxhdyjxs.cxhdmc='"+cxhdbmzh+"' and jc_cxhdyjxs.yjxsbm='03'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				yjxs33=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
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
				yjxs34=rs1.getDouble("yjxs");
			}
			else{
				out.println("错误！找不到活动参数："+cxhdbmzh);
				return;
			}
			rs1.close();
			ps1.close();
		}

		//01：店面销售业绩、02：店面经理销售业绩、03：客户经理销售业绩、04：家装设计师销售业绩

	
		//01：店面销售业绩、02：店面经理销售业绩、03：客户经理销售业绩、04：家装设计师销售业绩

		//01：店面销售业绩、02：店面经理销售业绩、03：客户经理销售业绩、04：家装设计师销售业绩


		ls_sql=" update cw_tjlsb41 set hdlx1=?,yjxs11=?,yjxs12=?,yjxs13=?,yjxs14=?,hdlx2=?,yjxs21=?,yjxs22=?,yjxs23=?,yjxs24=?,hdlx3=?,yjxs31=?,yjxs32=?,yjxs33=?,yjxs34=?";
		ls_sql+=" where xh='"+xh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setString(1,hdlx1);
		ps1.setDouble(2,yjxs11);
		ps1.setDouble(3,yjxs12);
		ps1.setDouble(4,yjxs13);
		ps1.setDouble(5,yjxs14);

		ps1.setString(6,hdlx2);
		ps1.setDouble(7,yjxs21);
		ps1.setDouble(8,yjxs22);
		ps1.setDouble(9,yjxs23);
		ps1.setDouble(10,yjxs24);

		ps1.setString(11,hdlx3);
		ps1.setDouble(12,yjxs31);
		ps1.setDouble(13,yjxs32);
		ps1.setDouble(14,yjxs33);
		ps1.setDouble(15,yjxs34);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

	//业绩＝折前签约额－计算促销成本
	ls_sql=" update cw_tjlsb41 set lx='1',sz13=sz12-sz12*(10-yjxs11)/10-sz12*(10-yjxs21)/10-sz12*(10-yjxs31)/10";
	ls_sql+=" ,sz14=sz12-sz12*(10-yjxs12)/10-sz12*(10-yjxs22)/10-sz12*(10-yjxs32)/10";
	ls_sql+=" ,sz15=sz12-sz12*(10-yjxs13)/10-sz12*(10-yjxs23)/10-sz12*(10-yjxs33)/10";
	ls_sql+=" ,sz16=sz12-sz12*(10-yjxs14)/10-sz12*(10-yjxs24)/10-sz12*(10-yjxs34)/10";
	ls_sql+=" where yhdlm='"+yhdlm+"' and ((cxhdmc is not null and hdlx1!='1') OR cxhdbmxq is not null OR cxhdbmzh is not null) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.executeUpdate();
	ps1.close();

	//业绩＝签约额－公司承担返卷
	ls_sql=" update cw_tjlsb41 set sz13=sz3-sz8";
	ls_sql+=" ,sz14=sz3-sz8";
	ls_sql+=" ,sz15=sz3-sz8";
	ls_sql+=" ,sz16=sz3-sz8";
	ls_sql+=" where yhdlm='"+yhdlm+"' and lx='0'";
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
  <td  width="3%">签约数</td>
  <td  width="3%">签约数比例</td>
  <td  width="4%">未打折金额</td>
  <td  width="4%">签约额</td>
  <td  width="4%">税金</td>
  <td  width="4%">项目管理费</td>
  <td  width="4%" bgcolor="#CC0000">销售额</td>
  <td  width="3%">签约额比例</td>
  <td  width="3%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="3%">工程平均单额</td>
  <td  width="3%" bgcolor="#CC0000">销售平均单额</td>
  <td  width="3%">工程平米均价</td>
  <td  width="3%" bgcolor="#CC0000">销售平米均价</td>
  <td  width="3%">设计费</td>
  <td  width="3%">实收款</td>
  <td  width="3%">返卷总额</td>
  <td  width="3%">公司承担返卷</td>
  <td  width="3%">平均直接折扣率</td>

  <td  width="4%">店面销售业绩</td>
  <td  width="4%">店面经理销售业绩</td>
  <td  width="4%">客户经理销售业绩</td>
  <td  width="4%">家装设计师销售业绩</td>

  <td  width="6%">签约额条状图 </td>
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
	long fwmj=0;
	double sjf=0;
	double sfke=0;
	double fjje=0;
	double gsfje=0;

	double dmxsyj=0;
	double dmjlxsyj=0;
	double zlxsyj=0;
	double sjsxsyj=0;

	int allqys=0;
	double allqye=0;
	double allsuijin=0;
	double allguanlif=0;
	double allzxse=0;
	double allwdzgce=0;
	double allzjxje=0;
	double allzjhze=0;
	long allfwmj=0;
	double allsjf=0;
	double allsfke=0;
	double allfjje=0;
	double allgsfje=0;
	double zkl=0;
	int pjde=0;
	int xspjde=0;
	int pmjj=0;
	int xspmjj=0;

	double alldmxsyj=0;
	double alldmjlxsyj=0;
	double allzlxsyj=0;
	double allsjsxsyj=0;

	double qysbfb=0;
	double qyebfb=0;

	int row=0;
	//家装总客户总签约数
	ls_sql=" select sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) zjxje ";
	ls_sql+=" ,sum(sz5) sjf,sum(sz6) sfke,sum(sz7) fjje,sum(sz8) gsfje,sum(sz9) fwmj";
	ls_sql+=" ,sum(sz10) guanlif,sum(sz11) suijin";
	ls_sql+=" ,sum(sz13) dmxsyj,sum(sz14) dmjlxsyj,sum(sz15) zlxsyj,sum(sz16) sjsxsyj";
	ls_sql+=" FROM cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		allqys=rs.getInt("qys");
		allwdzgce=rs.getDouble("wdzgce");
		allqye=rs.getDouble("qye");
		allzjxje=rs.getDouble("zjxje");


		allsjf=rs.getDouble("sjf");
		allsfke=rs.getDouble("sfke");
		allfjje=rs.getDouble("fjje");
		allgsfje=rs.getDouble("gsfje");
		allfwmj=rs.getLong("fwmj");

		allguanlif=rs.getDouble("guanlif");
		allsuijin=rs.getDouble("suijin");

		alldmxsyj=rs.getDouble("dmxsyj");
		alldmjlxsyj=rs.getDouble("dmjlxsyj");
		allzlxsyj=rs.getDouble("zlxsyj");
		allsjsxsyj=rs.getDouble("sjsxsyj");

	}
	rs.close();
	ps.close();

	allzjhze=allqye+allzjxje;//增减后总额
	allzxse=allqye+allguanlif+allsuijin;//销售额

	//当没有客户时，返回。
	if(allqys==0)
	{
		return;
	}
	if(allqye==0)
	{
		return;
	}

	ls_sql="SELECT TRUNC(max(sum(sz3)))";
	ls_sql+=" FROM cw_tjlsb41";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ls_sql+=" group by qddm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxqye=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (maxqye==0)
	{
		return;
	}


	ls_sql=" SELECT fgsmc,dwbh,dmmc,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(guanlif) guanlif,sum(suijin) suijin,sum(dmxsyj) dmxsyj,sum(dmjlxsyj) dmjlxsyj,sum(zlxsyj) zlxsyj,sum(sjsxsyj) sjsxsyj";
	ls_sql+=" from ( ";

	ls_sql+=" select a.dwmc fgsmc,cw_tjlsb41.qddm dwbh,b.dwmc dmmc";
	ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) zjxje ";
	ls_sql+=" ,sum(sz5) sjf,sum(sz6) sfke,sum(sz7) fjje,sum(sz8) gsfje,sum(sz9) fwmj";
	ls_sql+=" ,sum(sz10) guanlif,sum(sz11) suijin";
	ls_sql+=" ,sum(sz13) dmxsyj,sum(sz14) dmjlxsyj,sum(sz15) zlxsyj,sum(sz16) sjsxsyj";
	
	ls_sql+=" FROM cw_tjlsb41,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where cw_tjlsb41.yhdlm='"+yhdlm+"' and  cw_tjlsb41.fgsbh=a.dwbh(+) and cw_tjlsb41.qddm=b.dwbh(+)";
	ls_sql+=" group by a.dwmc,cw_tjlsb41.qddm,b.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgsmc,a.dwbh dwbh,a.dwmc dmmc,0 qys,0 qye,0 wdzgce,0 zjxje,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 guanlif,0 suijin,0 dmxsyj,0 dmjlxsyj,0 zlxsyj,0 sjsxsyj";
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
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");
		zjxje=rs.getDouble("zjxje");

		sjf=rs.getDouble("sjf");
		sfke=rs.getDouble("sfke");
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		fwmj=rs.getLong("fwmj");

		guanlif=rs.getDouble("guanlif");
		suijin=rs.getDouble("suijin");

		dmxsyj=rs.getDouble("dmxsyj");
		dmjlxsyj=rs.getDouble("dmjlxsyj");
		zlxsyj=rs.getDouble("zlxsyj");
		sjsxsyj=rs.getDouble("sjsxsyj");

		zjhze=qye+zjxje;//增减后总额
		zxse=qye+guanlif+suijin;//销售额


		if (qys==0)
		{
			pjde=0;
			xspjde=0;
		}
		else{
			pjde=(int)(qye/qys);
			xspjde=(int)(zxse/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
			xspmjj=0;
		}
		else{
			pmjj=(int)(qye/fwmj);
			xspmjj=(int)(zxse/fwmj);
		}

		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		row++;

		if (fgsmc.equals(oldfgsmc))
		{
			fgsmc="同上";;
		}
		else{
			oldfgsmc=fgsmc;
		}

		qysbfb=qys*100.0/allqys;
		qyebfb=qye*100.0/allqye;

		%>
		<tr align="center">
			<td ><%=row%></td>
			<td ><%=fgsmc%></td>
			<td ><%=dmmc%></td>
			<td  align="right"><%=qys%></td>
			<td  align="right"><%=cf.round(qysbfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
			<td  align="right"><%=cf.formatDouble(qye)%></td>
			<td  align="right"><%=cf.formatDouble(suijin)%></td>
			<td  align="right"><%=cf.formatDouble(guanlif)%></td>
			<td  align="right"><%=cf.formatDouble(zxse)%></td>
			<td  align="right"><%=cf.round(qyebfb,1)%>%</td>
			<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
			<td  align="right"><%=cf.formatDouble((int)(qye+zjxje))%></td>
			<td  align="right"><%=cf.formatDouble(pjde)%></td>
			<td  align="right"><%=cf.formatDouble(xspjde)%></td>
			<td  align="right"><%=cf.formatDouble(pmjj)%></td>
			<td  align="right"><%=cf.formatDouble(xspmjj)%></td>
			<td  align="right"><%=cf.formatDouble(sjf)%></td>
			<td  align="right"><%=cf.formatDouble((int)sfke)%></td>
			<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
			<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
			<td  align="right"><%=cf.round(zkl,1)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmxsyj)%></td>
			<td  align="right"><%=cf.formatDouble((int)dmjlxsyj)%></td>
			<td  align="right"><%=cf.formatDouble((int)zlxsyj)%></td>
			<td  align="right"><%=cf.formatDouble((int)sjsxsyj)%></td>
			<td  align="left"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>&lx=1" target="_blank"><img src="/images/ColuGif.gif" width="<%=qye*90/maxqye%>" height="14"></A></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (allqys==0)
	{
		pjde=0;
		xspjde=0;
	}
	else{
		pjde=(int)(allqye/allqys);
		xspjde=(int)(allzxse/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
		xspmjj=0;
	}
	else{
		pmjj=(int)(allqye/allfwmj);
		xspmjj=(int)(allzxse/allfwmj);
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
	<td >&nbsp;</td>
	<td >总计</td>
	<td >&nbsp;</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble(allzxse)%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)xspjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)xspmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsfke)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)alldmjlxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzlxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjsxsyj)%></td>
	<td  align="left">&nbsp;</td>
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
  <td  width="3%">签约数</td>
  <td  width="3%">签约数比例</td>
  <td  width="4%">未打折金额</td>
  <td  width="4%">签约额</td>
  <td  width="4%">税金</td>
  <td  width="4%">项目管理费</td>
  <td  width="4%" bgcolor="#CC0000">销售额</td>
  <td  width="3%">签约额比例</td>
  <td  width="3%">增减项</td>
  <td  width="5%">增减后总额 </td>
  <td  width="3%">工程平均单额</td>
  <td  width="3%" bgcolor="#CC0000">销售平均单额</td>
  <td  width="3%">工程平米均价</td>
  <td  width="3%" bgcolor="#CC0000">销售平米均价</td>
  <td  width="3%">设计费</td>
  <td  width="3%">实收款</td>
  <td  width="3%">返卷总额</td>
  <td  width="3%">公司承担返卷</td>
  <td  width="3%">平均直接折扣率</td>

  <td  width="4%">店面销售业绩</td>
  <td  width="4%">店面经理销售业绩</td>
  <td  width="4%">客户经理销售业绩</td>
  <td  width="4%">家装设计师销售业绩</td>

  <td  width="6%">签约额条状图 </td>
</tr>
<%
	if (dwbh==null)
	{
		//获取最大数
		ls_sql="SELECT TRUNC(max(sum(sz3)))";
		ls_sql+=" FROM cw_tjlsb41";
		ls_sql+=" where yhdlm='"+yhdlm+"'";
		ls_sql+=" group by fgsbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			maxqye=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (maxqye==0)
		{
			return;
		}


		row=0;

		ls_sql=" SELECT fgsmc,fgsbh,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zjxje) zjxje,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(guanlif) guanlif,sum(suijin) suijin,sum(dmxsyj) dmxsyj,sum(dmjlxsyj) dmjlxsyj,sum(zlxsyj) zlxsyj,sum(sjsxsyj) sjsxsyj";
		ls_sql+=" from ( ";

		ls_sql+=" select sq_dwxx.dwmc fgsmc,cw_tjlsb41.fgsbh";
		ls_sql+=" ,sum(sz1) qys,sum(sz2) wdzgce,sum(sz3) qye,sum(sz4) zjxje ";
		ls_sql+=" ,sum(sz5) sjf,sum(sz6) sfke,sum(sz7) fjje,sum(sz8) gsfje,sum(sz9) fwmj";
		ls_sql+=" ,sum(sz10) guanlif,sum(sz11) suijin";
		ls_sql+=" ,sum(sz13) dmxsyj,sum(sz14) dmjlxsyj,sum(sz15) zlxsyj,sum(sz16) sjsxsyj";
		
		ls_sql+=" FROM cw_tjlsb41,sq_dwxx";
		ls_sql+=" where cw_tjlsb41.yhdlm='"+yhdlm+"' and  cw_tjlsb41.fgsbh=sq_dwxx.dwbh(+)";
		ls_sql+=" group by sq_dwxx.dwmc,cw_tjlsb41.fgsbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT dwmc fgsmc,dwbh fgsbh ,0 qys,0 qye,0 wdzgce,0 zjxje,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 guanlif,0 suijin,0 dmxsyj,0 dmjlxsyj,0 zlxsyj,0 sjsxsyj";
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
			qye=rs.getDouble("qye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");

			sjf=rs.getDouble("sjf");
			sfke=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");

			guanlif=rs.getDouble("guanlif");
			suijin=rs.getDouble("suijin");

			dmxsyj=rs.getDouble("dmxsyj");
			dmjlxsyj=rs.getDouble("dmjlxsyj");
			zlxsyj=rs.getDouble("zlxsyj");
			sjsxsyj=rs.getDouble("sjsxsyj");

			zjhze=qye+zjxje;//增减后总额
			zxse=qye+guanlif+suijin;//销售额


			if (qys==0)
			{
				pjde=0;
				xspjde=0;
			}
			else{
				pjde=(int)(qye/qys);
				xspjde=(int)(zxse/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
				xspmjj=0;
			}
			else{
				pmjj=(int)(qye/fwmj);
				xspmjj=(int)(zxse/fwmj);
			}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=qye*10/wdzgce;
			}

			row++;


			qysbfb=qys*100.0/allqys;
			qyebfb=qye*100.0/allqye;

			%>
			<tr align="center">
				<td ><%=row%></td>
				<td ><%=fgsmc%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.round(qysbfb,1)%>%</td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble(qye)%></td>
				<td  align="right"><%=cf.formatDouble(suijin)%></td>
				<td  align="right"><%=cf.formatDouble(guanlif)%></td>
				<td  align="right"><%=cf.formatDouble(zxse)%></td>
				<td  align="right"><%=cf.round(qyebfb,1)%>%</td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)(qye+zjxje))%></td>
				<td  align="right"><%=cf.formatDouble(pjde)%></td>
				<td  align="right"><%=cf.formatDouble(xspjde)%></td>
				<td  align="right"><%=cf.formatDouble(pmjj)%></td>
				<td  align="right"><%=cf.formatDouble(xspmjj)%></td>
				<td  align="right"><%=cf.formatDouble(sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)sfke)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)dmxsyj)%></td>
				<td  align="right"><%=cf.formatDouble((int)dmjlxsyj)%></td>
				<td  align="right"><%=cf.formatDouble((int)zlxsyj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsxsyj)%></td>
				<td  align="left"><A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>&lx=2" target="_blank"><img src="/images/ColuGif.gif" width="<%=qye*90/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

		if (allqys==0)
		{
			pjde=0;
			xspjde=0;
		}
		else{
			pjde=(int)(allqye/allqys);
			xspjde=(int)(allzxse/allqys);
		}
		if (allfwmj==0)
		{
			pmjj=0;
			xspmjj=0;
		}
		else{
			pmjj=(int)(allqye/allfwmj);
			xspmjj=(int)(allzxse/allfwmj);
		}
		if (allwdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=allqye*10/allwdzgce;
		}

	}


%>
<tr align="center">
	<td >&nbsp;</td>
	<td >总计</td>
	<td  align="right"><%=allqys%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  align="right"><%=cf.formatDouble(allsuijin)%></td>
	<td  align="right"><%=cf.formatDouble(allguanlif)%></td>
	<td  align="right"><%=cf.formatDouble(allzxse)%></td>
	<td >&nbsp;</td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)xspjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)xspmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsfke)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((int)alldmxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)alldmjlxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzlxsyj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjsxsyj)%></td>
	<td  align="left">&nbsp;</td>
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

