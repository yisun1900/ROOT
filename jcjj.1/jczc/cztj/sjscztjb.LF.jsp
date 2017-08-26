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

String tjsjlx=request.getParameter("tjsjlx");
String jzsj=request.getParameter("jzsj");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");
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
if (tjsjlx.equals("qyrq"))
{
	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
}
else{
	wheresql+=" and lrsj>=TO_DATE('"+sjfw+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
	wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
}
if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
int qys=0;
double zqye=0;
double wdzgce=0;
double zjxje=0;
double zjhze=0;
double sjf=0;
double ssk=0;
double fjje=0;
double gsfje=0;
long fwmj=0;
double sjsqye=0;
double sjstcqye=0;
int allqys=0;
double allzqye=0;
double allwdzgce=0;
double allzjxje=0;
double allzjhze=0;
double allsjf=0;
double allssk=0;
double allfjje=0;
double allgsfje=0;
long allfwmj=0;
double allsjsqye=0;
double allsjstcqye=0;
double zkl=0;
int pjde=0;
int pmjj=0;

int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" >
<table border="1" width="140%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%">&nbsp;</td>
  <td  width="3%">排名</td>
  <td  width="5%">设计师</td>
  <td  width="9%">店面</td>
  <td  width="4%">签约数</td>
  <td  width="6%">未打折金额</td>
  <td  width="6%">签约额</td>
  <td  width="6%">增减项</td>
  <td  width="6%">增减后总额 </td>
  <td  width="5%">平均单额</td>
  <td  width="4%">平米均价</td>
  <td  width="5%">设计费</td>
  <td  width="6%">实收款</td>
  <td  width="5%">返卷总额</td>
  <td  width="5%">公司承担返卷</td>
  <td  width="4%">折扣率</td>
  <td  width="6%">设计师业绩</td>
  <td  width="6%">设计师提成</td>
  <td  width="9%">总额 </td>
</tr>
<%
	//获取最大数
	double maxqye=0;

	if (px.equals("qye"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zqye desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("qys"))
	{
		ls_sql="SELECT max(count(*))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by qys desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qys*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("pjde"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)/count(*)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,DECODE(sum(qys),0,0,sum(zqye)/sum(qys)) pjde,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by pjde desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");
			pjde=rs.getInt("pjde");

			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pjde*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("pmjj"))
	{
		ls_sql="SELECT TRUNC(max(sum(qye)/sum(fwmj)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
		ls_sql+=" having sum(fwmj)!=0";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,DECODE(sum(fwmj),0,0,sum(zqye)/sum(fwmj)) pmjj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
		ls_sql+=" having sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by pmjj desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");
			pmjj=rs.getInt("pmjj");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pmjj*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("sjf"))
	{
		ls_sql="SELECT TRUNC(max(sum(sjf)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by sjf desc,zqye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=sjf*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

	}
	else if (px.equals("zkl"))
	{
		ls_sql="SELECT max(sum(qye)*100/sum(wdzgce))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
		ls_sql+=" having sum(wdzgce)!=0";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,DECODE(sum(wdzgce),0,0,sum(zqye)*10/sum(wdzgce)) zkl,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zkl desc,zqye desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");
			zkl=rs.getDouble("zkl");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zkl*700/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();
	}
	else if (px.equals("sjsyj"))
	{
		ls_sql="SELECT TRUNC(max(sum(wdzgce)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(NVL(sjf,0)) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(NVL(sjf,0)) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by sjsqye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=sjsqye*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

	}
	else if (px.equals("sjstc"))
	{
		ls_sql="SELECT TRUNC(max(sum(wdzgce)))";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs";
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(zjhze) zjhze,sum(sjf) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(sjsqye) sjsqye,sum(sjstcqye) sjstcqye";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(NVL(sjf,0)) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(crm_khxx.wdzgce*jc_cxhd.sjszkl/10) sjsqye,sum(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(wdzgce) wdzgce,sum(zjxje) zjxje,sum(qye+NVL(zjxje,0)) zjhze,sum(NVL(sjf,0)) sjf,sum(sfke) sfke,sum(fjje) fjje,sum(gsfje) gsfje,sum(fwmj) fwmj,sum(qye-NVL(gsfje,0)) sjsqye,sum(qye-NVL(gsfje,0)) sjstcqye";
		ls_sql+=" FROM crm_khxx,sq_dwxx,jc_cxhd";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 wdzgce,0 zjxje,0 zjhze,0 sjf,0 sfke,0 fjje,0 gsfje,0 fwmj,0 sjsqye,0 sjstcqye";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		if (fgs!=null)
		{
			if (!(fgs.equals("")))	ls_sql+=" and  sq_yhxx.ssfgs='"+fgs+"'";
		}
		if (dwbh!=null)
		{
			if (!(dwbh.equals("")))	ls_sql+=" and  sq_yhxx.dwbh='"+dwbh+"'";
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by sjstcqye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			wdzgce=rs.getDouble("wdzgce");
			zjxje=rs.getDouble("zjxje");
			zjhze=rs.getDouble("zjhze");
			sjf=rs.getDouble("sjf");
			ssk=rs.getDouble("sfke");
			fjje=rs.getDouble("fjje");
			gsfje=rs.getDouble("gsfje");
			fwmj=rs.getLong("fwmj");
			sjsqye=rs.getDouble("sjsqye");
			sjstcqye=rs.getDouble("sjstcqye");

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			allqys+=qys;
			allzqye+=zqye;
			allwdzgce+=wdzgce;
			allfwmj+=fwmj;
			allsjf+=sjf;
			allssk+=ssk;
			allfjje+=fjje;
			allgsfje+=gsfje;
			allsjsqye+=sjsqye;
			allsjstcqye+=sjstcqye;
			allzjxje+=zjxje;
			allzjhze+=zjhze;
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
				<td ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
				<td ><%=row%>
				</td>
				<td ><%=getsjs%></td>
				<td ><%=dm%></td>
				<td  align="right"><%=qys%></td>
				<td  align="right"><%=cf.formatDouble((int)wdzgce)%></td>
				<td  align="right"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right"><%=cf.formatDouble((int)zjhze)%></td>
				<td  align="right"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right"><%=cf.formatDouble((int)ssk)%></td>
				<td  align="right"><%=cf.formatDouble((int)fjje)%></td>
				<td  align="right"><%=cf.formatDouble((int)gsfje)%></td>
				<td  align="right"><%=cf.round(zkl,1)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjsqye)%></td>
				<td  align="right"><%=cf.formatDouble((int)sjstcqye)%></td>
				<td  align="left"><A HREF="ViewSjscz.jsp?tjsjlx=<%=tjsjlx%>&jzsj=<%=jzsj%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=sjstcqye*70/maxqye%>" height="14"></A></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();

	}



	if (allqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(allzqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(allzqye/allfwmj);
	}
	if (allwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=allzqye*10/allwdzgce;
	}


%>
<tr align="center">
	<td colspan="4">
	<input type=button value='查看被选设计师签单明细' onclick="cf_submit(listform)">
	<input type=button value='导出EXCEL' onclick="cf_do(listform)">
	</td>
	<td  align="right"><%=allqys%></td>
	<td  align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allzjhze)%></td>
	<td  align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right"><%=cf.formatDouble((long)allssk)%></td>
	<td  align="right"><%=cf.formatDouble((long)allfjje)%></td>
	<td  align="right"><%=cf.formatDouble((long)allgsfje)%></td>
	<td  align="right"><%=cf.round(zkl,1)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjsqye)%></td>
	<td  align="right"><%=cf.formatDouble((long)allsjstcqye)%></td>
	<td  align="left">&nbsp;</td>
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
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
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

		formName.action="ViewAllSjscz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
function cf_do(formName)
{
	var choo=0;

	var i = 0;
	if (<%=row%>==1){
		if( formName.sjs.checked ){
			choo=1;
		}
	} 
	else{ 
		for (i=0;i < <%=row%>;i++ ){
			if( formName.sjs[i].checked ){
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

		formName.action="ViewExecAllSjscz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 
//-->
</script>

