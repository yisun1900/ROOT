<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%!
public String lastDayHB(String dateStr)
{
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
	if (dateStr==null)
	{
		return null;
	}

	String yearStr=dateStr.substring(0,4);
	String monthStr=dateStr.substring(5,7);
	java.sql.Date data1=java.sql.Date.valueOf(yearStr+"-"+monthStr+"-"+"01");

	String endStr=new java.sql.Date(data1.getTime()-24*3600*1000).toString();

	return endStr;
}

public String lastDayTB(String dateStr)
{
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
	if (dateStr==null)
	{
		return null;
	}

	String getYearStr=dateStr.substring(0,4);
	String getMonthStr=dateStr.substring(5,7);
	int year=Integer.parseInt(getYearStr);
	int month=Integer.parseInt(getMonthStr);

	String monthStr=getMonthStr;
	String yearStr=cf.addZero(String.valueOf(year-1),4);

	String endStr=cf.lastDay(yearStr,monthStr);

	return endStr;
}

public String firstDayHB(String dateStr)
{
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
	if (dateStr==null)
	{
		return null;
	}

	String getYearStr=dateStr.substring(0,4);
	String getMonthStr=dateStr.substring(5,7);
	int year=Integer.parseInt(getYearStr);
	int month=Integer.parseInt(getMonthStr);

	if (month==1)
	{
		String monthStr="12";
		String yearStr=cf.addZero(String.valueOf(year-1),4);

		String endStr=yearStr+"-"+monthStr+"-01";

		return endStr;
	}
	else{
		String monthStr=cf.addZero(String.valueOf(month-1),2);
		String yearStr=getYearStr;

		String endStr=yearStr+"-"+monthStr+"-01";

		return endStr;
	}

}

public String firstDayTB(String dateStr)
{
	ybl.common.CommonFunction cf=new ybl.common.CommonFunction();
	if (dateStr==null)
	{
		return null;
	}

	String getYearStr=dateStr.substring(0,4);
	String getMonthStr=dateStr.substring(5,7);
	int year=Integer.parseInt(getYearStr);
	int month=Integer.parseInt(getMonthStr);

	String monthStr=getMonthStr;
	String yearStr=cf.addZero(String.valueOf(year-1),4);

		String endStr=yearStr+"-"+monthStr+"-01";

	return endStr;

}


%>

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

String fgs=request.getParameter("fgs");


String wheresql="";

if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}


String sjfwTB=firstDayTB(sjfw);
String sjfw2TB=lastDayTB(sjfw2);
String sjfwHB=firstDayHB(sjfw);
String sjfw2HB=lastDayHB(sjfw2);


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

	//本期
	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'0' lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20 ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and crm_khxx.ywy is not null";
	
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh";

	ls_sql+=" UNION ALL ";

	//环比
	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'1' lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20 ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfwHB+"','YYYY-MM-DD') and crm_khxx.qyrq<=TO_DATE('"+sjfw2HB+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	ls_sql+=" and crm_khxx.ywy is not null";
	
	ls_sql+=" group by crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh";

	ls_sql+=" UNION ALL ";

	//同比
	ls_sql+=" select crm_khxx.fgsbh,crm_khxx.ywy,crm_khxx.cxhdbm,crm_khxx.cxhdbmxq,crm_khxx.cxhdbmzh,'2' lx";
	ls_sql+=" ,count(*) sz1,sum(wdzgce) sz2,sum(qye) sz3,sum(guanlif) sz4,sum(suijin) sz5 ";//合同
	ls_sql+=" ,sum(zhzjxje) sz6,sum(zjxguanlif) sz7,sum(zjxsuijin) sz8,sum(kglf) sz9";//增减项
	ls_sql+=" ,sum(crm_khxx.sjf) sz10,sum(sfke) sz11,sum(fjje) sz12,sum(gsfje) sz13";//其它
	ls_sql+=" ,sum(crm_khxx.qyrq-crm_zxkhxx.lrsj) sz19,sum(crm_khxx.fwmj) sz20 ";//其它
	ls_sql+=" FROM crm_khxx,crm_zxkhxx";
	ls_sql+=" where crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.zt in('2','5') ";
	ls_sql+=wheresql;
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfwTB+"','YYYY-MM-DD') and crm_khxx.qyrq<=TO_DATE('"+sjfw2TB+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

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
  <B>市场部统计表<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="170%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>

<tr bgcolor="#CCCCCC"  align="center">
  <td  width="3%">编号</td>
  <td  width="11%">分公司</td>

  <td  width="6%">市场部业绩</td>
  <td  width="5%">市场部客流量</td>
  <td  width="5%">定金数量</td>

  <td  width="5%">累计定金数量</td>
  <td  width="5%">签单数量</td>
  <td  width="4%">定金占客流量比</td>
  <td  width="4%">签单占定金比</td>
  <td  width="5%">小区开发数量</td>
  <td  width="5%">市场活动次数</td>

  <td  width="4%">折扣率</td>
  <td  width="5%">产值同比</td>
  <td  width="5%">同比增量</td>
  <td  width="5%">产值环比</td>
  <td  width="5%">环比增量</td>
  <td  width="5%">新增定金环比</td>
  <td  width="4%">环比增量</td>
  <td  width="5%">市场部客流量环比</td>
  <td  width="4%">环比增量</td>

</tr>
<%
	String fgsmc=null;

	double scbjlyj=0;
	double wdzgce=0;
	double qye=0;
	double scbjlyjHB=0;
	double wdzgceHB=0;
	double qyeHB=0;
	double scbjlyjTB=0;
	double wdzgceTB=0;
	double qyeTB=0;
	int scbkl=0;
	int djsl=0;
	int ljdjsl=0;
	int qdsl=0;

	int scbklhb=0;
	int djslhb=0;

	double zkl=0;

	double djzklb=0;
	double qdzdjb=0;

	double scbklhbzl=0;
	double djslhbzl=0;
	double scbjlyjHBzl=0;
	double scbjlyjTBzl=0;

	double allscbjlyj=0;
	double allwdzgce=0;
	double allqye=0;
	double allscbjlyjHB=0;
	double allwdzgceHB=0;
	double allqyeHB=0;
	double allscbjlyjTB=0;
	double allwdzgceTB=0;
	double allqyeTB=0;
	int allscbkl=0;
	int alldjsl=0;
	int allljdjsl=0;
	int allqdsl=0;

	int allscbklhb=0;
	int alldjslhb=0;

	ls_sql=" select dwbh,dwmc ";
	ls_sql+=" FROM sq_dwxx ";
	ls_sql+=" where  dwlx='F0' and cxbz='N' ";
	if (!fgs.equals(""))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
	ls_sql+=" order by dwbh ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fgsbh=rs1.getString("dwbh");
		fgsmc=rs1.getString("dwmc");
		
		//本期市场部业绩
		ls_sql=" select sum(sz17) scbjlyj,sum(sz2) wdzgce,sum(sz3) qye";
		ls_sql+=" FROM cw_tjlsb42";
		ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh='"+fgsbh+"'";
		ls_sql+=" and lx='0' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scbjlyj=rs.getDouble("scbjlyj");
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");
		}
		rs.close();
		ps.close();
		
		//市场部业绩环比
		ls_sql=" select sum(sz17) scbjlyj,sum(sz2) wdzgce,sum(sz3) qye";
		ls_sql+=" FROM cw_tjlsb42";
		ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh='"+fgsbh+"'";
		ls_sql+=" and lx='1' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scbjlyjHB=rs.getDouble("scbjlyj");
			wdzgceHB=rs.getDouble("wdzgce");
			qyeHB=rs.getDouble("qye");
		}
		rs.close();
		ps.close();
		
		//市场部业绩同比
		ls_sql=" select sum(sz17) scbjlyj,sum(sz2) wdzgce,sum(sz3) qye";
		ls_sql+=" FROM cw_tjlsb42";
		ls_sql+=" where cw_tjlsb42.yhdlm='"+yhdlm+"' and cw_tjlsb42.fgsbh='"+fgsbh+"'";
		ls_sql+=" and lx='2' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scbjlyjTB=rs.getDouble("scbjlyj");
			wdzgceTB=rs.getDouble("wdzgce");
			qyeTB=rs.getDouble("qye");
		}
		rs.close();
		ps.close();
		
		//市场部客流量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scbkl=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		//定金数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			djsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		//累计定金数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ljdjsl=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		//签单数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.zxzt in('3') ";
		ls_sql+=" and crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			qdsl=rs.getInt(1);
		}
		rs.close();
		ps.close();

		
		//市场部客流量环比
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfwHB+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2HB+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			scbklhb=rs.getInt(1);
		}
		rs.close();
		ps.close();
		
		//新增定金环比
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_zxkhxx ";
		ls_sql+=" where crm_zxkhxx.ssfgs='"+fgsbh+"' ";
		ls_sql+=" and crm_zxkhxx.ywy is not null";
		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";
		ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfwHB+"','YYYY-MM-DD')";
		ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2HB+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			djslhb=rs.getInt(1);
		}
		rs.close();
		ps.close();


		allscbjlyj+=scbjlyj;
		allwdzgce+=wdzgce;
		allqye+=qye;
		allscbjlyjHB+=scbjlyjHB;
		allwdzgceHB+=wdzgceHB;
		allqyeHB+=qyeHB;
		allscbjlyjTB+=scbjlyjTB;
		allwdzgceTB+=wdzgceTB;
		allqyeTB+=qyeTB;
		allscbkl+=scbkl;
		alldjsl+=djsl;
		allljdjsl+=ljdjsl;
		allqdsl+=qdsl;

		allscbklhb+=scbklhb;
		alldjslhb+=djslhb;


		if (scbklhb==0)
		{
			scbklhbzl=0;
		}
		else{
			scbklhbzl=(scbkl-scbklhb)*100.0/scbklhb;
		}
		scbklhbzl=cf.round(scbklhbzl,2);

		if (djslhb==0)
		{
			djslhbzl=0;
		}
		else{
			djslhbzl=(djsl-djslhb)*100.0/djslhb;
		}
		djslhbzl=cf.round(djslhbzl,2);

		if (scbjlyjHB==0)
		{
			scbjlyjHBzl=0;
		}
		else{
			scbjlyjHBzl=(scbjlyj-scbjlyjHB)*100.0/scbjlyjHB;
		}
		scbjlyjHBzl=cf.round(scbjlyjHBzl,2);

		if (scbjlyjTB==0)
		{
			scbjlyjTBzl=0;
		}
		else{
			scbjlyjTBzl=(scbjlyj-scbjlyjTB)*100.0/scbjlyjTB;
		}
		scbjlyjTBzl=cf.round(scbjlyjTBzl,2);

		if (scbkl!=0)
		{
			djzklb=djsl*100.0/scbkl;
		}
		else{
			djzklb=0;
		}

		djzklb=cf.round(djzklb,2);

		if (djsl!=0)
		{
			qdzdjb=qdsl*100.0/djsl;
		}
		else{
			qdzdjb=0;
		}

		qdzdjb=cf.round(qdzdjb,2);

		if (wdzgce!=0)
		{
			zkl=qye*10.0/wdzgce;
		}
		else{
			zkl=10;
		}
		zkl=cf.round(zkl,2);

		row++;

		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
			<td ><%=row%>
			</td>
			<td ><%=fgsmc%></td>

			<td  align="right"><%=cf.formatDouble((int)scbjlyj)%></td>
			<td  align="right"><%=scbkl%></td>
			<td  align="right"><%=djsl%></td>
			<td  align="right"><%=ljdjsl%></td>
			<td  align="right"><%=qdsl%></td>
			<td  align="right"><%=djzklb%>%</td>
			<td  align="right"><%=qdzdjb%>%</td>
			<td  align="right">&nbsp;</td>
			<td  align="right">&nbsp;</td>
			<td  align="right"><%=zkl%></td>
			<td  align="right"><%=cf.formatDouble((int)scbjlyjTB)%></td>
			<td  align="right"><%=scbjlyjTBzl%>%</td>
			<td  align="right"><%=cf.formatDouble((int)scbjlyjHB)%></td>
			<td  align="right"><%=scbjlyjHBzl%>%</td>
			<td  align="right"><%=djslhb%></td>
			<td  align="right"><%=djslhbzl%>%</td>
			<td  align="right"><%=scbklhb%></td>
			<td  align="right"><%=scbklhbzl%>%</td>
		</tr>
		<%	
	}
	rs1.close();
	ps1.close();


	if (allscbklhb==0)
	{
		scbklhbzl=0;
	}
	else{
		scbklhbzl=(allscbkl-allscbklhb)*100.0/allscbklhb;
	}
	scbklhbzl=cf.round(scbklhbzl,2);

	if (alldjslhb==0)
	{
		djslhbzl=0;
	}
	else{
		djslhbzl=(alldjsl-alldjslhb)*100.0/alldjslhb;
	}
	djslhbzl=cf.round(djslhbzl,2);

	if (allscbjlyjHB==0)
	{
		scbjlyjHBzl=0;
	}
	else{
		scbjlyjHBzl=(allscbjlyj-allscbjlyjHB)*100.0/allscbjlyjHB;
	}
	scbjlyjHBzl=cf.round(scbjlyjHBzl,2);

	if (allscbjlyjTB==0)
	{
		scbjlyjTBzl=0;
	}
	else{
		scbjlyjTBzl=(allscbjlyj-allscbjlyjTB)*100.0/allscbjlyjTB;
	}
	scbjlyjTBzl=cf.round(scbjlyjTBzl,2);

	if (allscbkl!=0)
	{
		djzklb=alldjsl*100.0/allscbkl;
	}
	else{
		djzklb=0;
	}

	djzklb=cf.round(djzklb,2);

	if (alldjsl!=0)
	{
		qdzdjb=allqdsl*100.0/alldjsl;
	}
	else{
		qdzdjb=0;
	}

	qdzdjb=cf.round(qdzdjb,2);

	if (allwdzgce!=0)
	{
		zkl=allqye*10.0/allwdzgce;
	}
	else{
		zkl=10;
	}
	zkl=cf.round(zkl,2);

	%>

	<tr align="center" bgcolor="<%=bgcolor%>">
		<td colspan="2">小 计</td>

		<td  align="right"><%=cf.formatDouble((int)allscbjlyj)%></td>
		<td  align="right"><%=allscbkl%></td>
		<td  align="right"><%=alldjsl%></td>
		<td  align="right"><%=allljdjsl%></td>
		<td  align="right"><%=allqdsl%></td>
		<td  align="right"><%=djzklb%>%</td>
		<td  align="right"><%=qdzdjb%>%</td>
		<td  align="right">&nbsp;</td>
		<td  align="right">&nbsp;</td>
		<td  align="right"><%=zkl%></td>
		<td  align="right"><%=cf.formatDouble((int)allscbjlyjTB)%></td>
		<td  align="right"><%=scbjlyjTBzl%>%</td>
		<td  align="right"><%=cf.formatDouble((int)allscbjlyjHB)%></td>
		<td  align="right"><%=scbjlyjHBzl%>%</td>
		<td  align="right"><%=alldjslhb%></td>
		<td  align="right"><%=djslhbzl%>%</td>
		<td  align="right"><%=allscbklhb%></td>
		<td  align="right"><%=scbklhbzl%>%</td>
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

		formName.action="ViewAllYwycz.jsp?fgs=<%=fgs%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
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

		formName.action="ViewExecAllYwycz.jsp?fgs=<%=fgs%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

