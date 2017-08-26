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

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String px=request.getParameter("px");
String jzbz=request.getParameter("jzbz");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";

if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

if (!jzbz.equals("0"))
{
	wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
}

wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
String rzsj="";
String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
String sjsfgs="";
int qys=0;
double zqye=0;
double sjf=0;
long fwmj=0;
int allqys=0;
double allzqye=0;
double allsjf=0;
long allfwmj=0;
double zjxje=0;
double allzjxje=0;
double wdzgce=0;
double allwdzgce=0;

double zkl=0;
int pds=0;//派单数
int allpds=0;//全部派单数

int pjde=0;
int pmjj=0;
int sjfnum=0;
int allsjfnum=0;

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

	String xtrzip=request.getRemoteHost();
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String xtrzyhmc=(String)session.getAttribute("yhmc");
	ls_sql="insert into sq_ckxxrz ( xh,ip,yhdlm,dlsj,bz ) ";
	ls_sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),?,?,SYSDATE,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xtrzip);
	ps.setString(2,xtrzyhdlm);
	ps.setString(3,xtrzyhmc+"：设计师家装产值统计："+sjfw+"："+sjfw2+"："+fgs+"："+dwbh+"：");
	ps.executeUpdate();
	ps.close();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE2 {
	BORDER-LEFT: #000000 1px solid;
	BORDER-BOTTOM: #000000 1px solid;
	POSITION: relative;
	BACKGROUND-COLOR: #CC6600;
}
.STYLE3 {
	FONT-WEIGHT: bold;
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft);
	POSITION: relative;
	BACKGROUND-COLOR: #efe1ff;
}
.STYLE4 {
	BORDER-RIGHT: #000 1px solid;
	BORDER-BOTTOM: #000 1px solid;
}
.STYLE_TR {
	FONT-WEIGHT: bold;
	Z-INDEX: 5; 
	POSITION: relative;
	TOP: expression(this.offsetParent.scrollTop)
}
.STYLE_TAB {
	DISPLAY: inline;
	BORDER-COLLAPSE: collapse;
}
.STYLE_DIV {
	BORDER-RIGHT: #808080 2px solid;
	BORDER-TOP: #808080 2px solid;
	DISPLAY: inline;
	OVERFLOW: auto;
	BORDER-LEFT: #808080 2px solid;
	WIDTH: 100%;
	CURSOR: default;
	BORDER-BOTTOM: #808080 2px solid;
	HEIGHT:95%;
}
-->
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师家装产值统计<BR>
  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<DIV onselectstart="return false" class="STYLE_DIV"> 

<table border="1" width="150%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 13px' class="STYLE_TAB">
<tr bgcolor="#CCCCCC"  align="center" class="STYLE_TR">
  <td  width="3%" class="STYLE1">排名</td>
  <td  width="5%" class="STYLE1">设计师</td>
  <td  width="6%" class="STYLE2">入职时间</td>
  <td  width="7%" class="STYLE2">分公司</td>
  <td  width="7%" class="STYLE2">店面</td>
  <td  width="5%" class="STYLE2">派单数</td>
  <td  width="5%" class="STYLE2">签约数</td>
  <td  width="9%" class="STYLE2">签约额</td>
  <td  width="9%" class="STYLE2">增减项</td>
  <td  width="8%" class="STYLE2">平均单额</td>
  <td  width="6%" class="STYLE2">平米均价</td>
  <td  width="7%" class="STYLE2">设计费</td>
  <td  width="7%" class="STYLE2">折扣率</td>
  <td  width="12%" class="STYLE2">总额 </td>
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


		ls_sql=" SELECT distinct sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce ";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT distinct sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj,0 zjxje,0 wdzgce";
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
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by zqye desc";
//out.print(ls_sql);

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			rzsj=null;
			getsjs=rs.getString("sjs");
			dm=rs.getString("dwmc");
			dmbh=rs.getString("dwbh");
			qys=rs.getInt("qys");
			zqye=rs.getDouble("zqye");
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			zjxje=rs.getDouble("zjxje");
			wdzgce=rs.getDouble("wdzgce");

//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"' and sfzszg in('Y','N')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();

//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();
//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;
//派单数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.pdclzt='2' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				pds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allpds+=pds;

			if (rzsj==null)
			{rzsj="未录入";}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

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
			allwdzgce+=wdzgce;
			allzjxje+=zjxje;
			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
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
				<td class="STYLE3"><%=row%></td>
				<td class="STYLE3"><%=getsjs%></td>
				<td class="STYLE4"><%=rzsj%></td>
				<td class="STYLE4"><%=sjsfgs%></td>
				<td class="STYLE4"><%=dm%></td>
				<td  align="right" class="STYLE4"><%=pds%></td>
				<td  align="right" class="STYLE4"><%=qys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=zqye*90/maxqye%>" height="14"></A></td>
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce ";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(wdzgce)!=0 and sum(fwmj)!=0";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj,0 zjxje,0 wdzgce ";
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
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			zjxje=rs.getDouble("zjxje");
			wdzgce=rs.getDouble("wdzgce");

//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"' and sfzszg in('Y','N')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;

//派单数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.pdclzt='2' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				pds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allpds+=pds;

			if (rzsj==null)
			{rzsj="未录入";}


			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

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
			allwdzgce+=wdzgce;
			allzjxje+=zjxje;
			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
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
				<td class="STYLE3"><%=row%></td>
				<td class="STYLE3"><%=getsjs%></td>
				<td class="STYLE4"><%=rzsj%></td>
				<td class="STYLE4"><%=sjsfgs%></td>
				<td class="STYLE4"><%=dm%></td>
				<td  align="right" class="STYLE4"><%=pds%></td>
				<td  align="right" class="STYLE4"><%=qys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=qys*90/maxqye%>" height="14"></A></td>
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,DECODE(sum(qys),0,0,sum(zqye)/sum(qys)) pjde,sum(zjxje) zjxje,sum(wdzgce) wdzgce";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj,0 zjxje,0 wdzgce";
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
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			pjde=rs.getInt("pjde");
			zjxje=rs.getDouble("zjxje");
			wdzgce=rs.getDouble("wdzgce");
//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"' and sfzszg in('Y','N')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;

//派单数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.pdclzt='2' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				pds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allpds+=pds;

			if (rzsj==null)
			{rzsj="未录入";}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(zqye/fwmj);
			}

			allwdzgce+=wdzgce;
			allzjxje+=zjxje;
			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
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
				<td class="STYLE3"><%=row%></td>
				<td class="STYLE3"><%=getsjs%></td>
				<td class="STYLE4"><%=rzsj%></td>
				<td class="STYLE4"><%=sjsfgs%></td>
				<td class="STYLE4"><%=dm%></td>
				<td  align="right" class="STYLE4"><%=pds%></td>
				<td  align="right" class="STYLE4"><%=qys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pjde*90/maxqye%>" height="14"></A></td>
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,DECODE(sum(fwmj),0,0,sum(zqye)/sum(fwmj)) pmjj,sum(zjxje) zjxje,sum(wdzgce) wdzgce ";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce ";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";
//		ls_sql+=" having sum(fwmj)!=0";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj,0 zjxje,0 wdzgce ";
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
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			pmjj=rs.getInt("pmjj");
			zjxje=rs.getDouble("zjxje");
			wdzgce=rs.getDouble("wdzgce");
//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"' and sfzszg in('Y','N')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;

//派单数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.pdclzt='2' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				pds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allpds+=pds;

			if (rzsj==null)
			{rzsj="未录入";}

			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(zqye/qys);
			}
			allwdzgce+=wdzgce;
			allzjxje+=zjxje;
			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
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
				<td class="STYLE3"><%=row%></td>
				<td class="STYLE3"><%=getsjs%></td>
				<td class="STYLE4"><%=rzsj%></td>
				<td class="STYLE4"><%=sjsfgs%></td>
				<td class="STYLE4"><%=dm%></td>
				<td  align="right" class="STYLE4"><%=pds%></td>
				<td  align="right" class="STYLE4"><%=qys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=pmjj*90/maxqye%>" height="14"></A></td>
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


		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(zqye) zqye,sum(sjf) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(qye) zqye,sum(NVL(sjf,0)) sjf,sum(fwmj) fwmj,sum(zjxje) zjxje,sum(wdzgce) wdzgce";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.zt='2'";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 zqye,0 sjf,0 fwmj,0 zjxje,0 wdzgce";
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
			sjf=rs.getDouble("sjf");
			fwmj=rs.getLong("fwmj");
			zjxje=rs.getDouble("zjxje");
			wdzgce=rs.getDouble("wdzgce");
//入职时间
			ls_sql="SELECT TO_CHAR(sq_yhxx.rzsj,'YYYY-MM-DD') rzsj";
			ls_sql+=" FROM sq_yhxx ";
			ls_sql+=" where sq_yhxx.yhmc='"+getsjs+"' and sfzszg in('Y','N')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				rzsj=rs1.getString("rzsj");
			}
			rs1.close();
			ps1.close();
//所属分公司
			ls_sql="";
			ls_sql+=" SELECT b.dwmc fgs ";
			ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
			ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N' and a.dwbh='"+dmbh+"' ";
			ls_sql+=" group by b.dwmc ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjsfgs=rs1.getString("fgs");
			}
			rs1.close();
			ps1.close();

//收设计费数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where sjf is not null and sjf!='0' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sjfnum=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allsjfnum+=sjfnum;

//派单数
			ls_sql="SELECT count(*) ";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.pdclzt='2' and crm_khxx.sjs='"+getsjs+"' and crm_khxx.zt='2'";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				pds=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
			allpds+=pds;

			if (rzsj==null)
			{rzsj="未录入";}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=zqye*10/wdzgce;
			}

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

			allwdzgce+=wdzgce;
			allzjxje+=zjxje;
			allqys+=qys;
			allzqye+=zqye;
			allfwmj+=fwmj;
			allsjf+=sjf;
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
				<td class="STYLE3"><%=row%></td>
				<td class="STYLE3"><%=getsjs%></td>
				<td class="STYLE4"><%=rzsj%></td>
				<td class="STYLE4"><%=sjsfgs%></td>
				<td class="STYLE4"><%=dm%></td>
				<td  align="right" class="STYLE4"><%=pds%></td>
				<td  align="right" class="STYLE4"><%=qys%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zqye)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)zjxje)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pjde)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)pmjj)%></td>
				<td  align="right" class="STYLE4"><%=cf.formatDouble((int)sjf)%></td>
				<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
				<td  align="left"><A HREF="ViewSjssjf.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank"><img src="/images/ColuGif.gif" width="<%=sjf*90/maxqye%>" height="14"></A></td>
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
	<td colspan="2" class="STYLE3">总计</td>
	<td  align="left" class="STYLE4">&nbsp;</td>
	<td  align="left" class="STYLE4">&nbsp;</td>
	<td  align="left" class="STYLE4">&nbsp;</td>
	<td  align="right" class="STYLE4"><%=allpds%></td>
	<td  align="right" class="STYLE4"><%=allqys%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzqye)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allzjxje)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)pmjj)%></td>
	<td  align="right" class="STYLE4"><%=cf.formatDouble((long)allsjf)%></td>
	<td  align="right" class="STYLE4"><%=cf.round(zkl,1)%></td>
	<td  align="left" class="STYLE4">&nbsp;</td>

</tr>
</table>
  </DIV>


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
		if (rs!= null) rs1.close(); 
		if (ps!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
