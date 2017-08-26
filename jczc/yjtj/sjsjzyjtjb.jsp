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

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String ssdqbm=request.getParameter("ssdqbm");
String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String jzbz=request.getParameter("jzbz");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String wheresql1="";

if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (sq_yhxx.ssfgs in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}

if (!(sjs.equals("")))	wheresql+=" and  cw_qmjzmx.sjs='"+sjs+"'";

if (!jzbz.equals("0"))
{
	wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
}

wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

String getsjs=null;
String olddm="";
String dm=null;
String dmbh=null;
long qys=0;
double qye=0;
double suijin=0;
double wdzgce=0;
double zhzjxje=0;
double zjxsuijin=0;
double zjhze=0;
double suijinze=0;
double sjf=0;
double glf=0;
double guanlif=0;
long fwmj=0;
long allqys=0;
double allqye=0;
double allsuijin=0;
double allwdzgce=0;
double allzhzjxje=0;
double allzjxsuijin=0;
double allzjhze=0;
double allsuijinze=0;
double allsjf=0;
double allglf=0;
double allguanlif=0;
long allfwmj=0;
double zkl=0;
long pjde=0;
long pmjj=0;

int gsqys=0;
double gsqye=0;
double gswdzgce=0;
int cwqys=0;
double cwqye=0;
double cwwdzgce=0;

int allgsqys=0;
double allgsqye=0;
double allgswdzgce=0;
int allcwqys=0;
double allcwqye=0;
double allcwwdzgce=0;
double allcwssk=0;
double cwssk=0;
double zjxguanlif=0;
double allzjxguanlif=0;

double tdje=0;
double alltdje=0;
double yjje=0;
double allyjje=0;


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

<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:550px"> 

<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="320%" style='FONT-SIZE: 13px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="1%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">排名</td>
  <td  width="4%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计师</td>
  <td  width="6%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约数</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未打折工程额(不含税金管理费)</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣率</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工程签约额(不含税金管理费)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">税金(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">管理费(折后)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单总额(工程+税金+管理费)</td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">退单额</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装业绩(签单－退单)</font></td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装实收款</font></td>

  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计费</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">服务费</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后工程增减项(不含税金管理费)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项税金(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项管理费(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项小计(工程+税金+管理费)</td>

  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减后总额(工程+税金+管理费)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减后税金总额</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">单额平均</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米均价</td>
  
 </tr>
<%
	//获取最大数

	ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(qye) qye,sum(suijin) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(zjhze) zjhze,sum(suijinze) suijinze,sum(sjf) sjf,sum(glf) glf,sum(guanlif) guanlif,sum(fwmj) fwmj";
	ls_sql+=" from ";
	ls_sql+=" ( ";
	ls_sql+=" SELECT sjs,dwmc,cw_qmjzmx.dwbh,count(*) qys,sum(qye) qye,sum(NVL(suijin,0)) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(qye+NVL(zhzjxje,0)) zjhze,sum(NVL(suijin,0)+NVL(zjxsuijin,0)) suijinze,sum(NVL(sjf,0)) sjf,sum(NVL(glf,0)) glf,sum(NVL(guanlif,0)) guanlif,sum(fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and cw_qmjzmx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" group by sjs,dwmc,cw_qmjzmx.dwbh";

	if (sjs.equals(""))
	{
		ls_sql+=" UNION ALL";

		ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 qye,0 suijin,0 wdzgce,0 zhzjxje,0 zjxsuijin,0 zjxguanlif,0 zjhze,0 suijinze,0 sjf,0 glf,0 guanlif,0 fwmj";
		ls_sql+=" FROM sq_yhxx,sq_dwxx";
		ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm='04' and sfzszg in('Y','N')";
		ls_sql+=wheresql1;
	}

	ls_sql+=" ) ";

	ls_sql+=" group by sjs,dwmc,dwbh";
	ls_sql+=" order by qye desc";

//		out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getsjs=rs.getString("sjs");
		dm=rs.getString("dwmc");
		dmbh=rs.getString("dwbh");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		zjhze=rs.getDouble("zjhze");
		suijinze=rs.getDouble("suijinze");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		fwmj=rs.getLong("fwmj");

		//退单
		ls_sql="SELECT sum(qye+NVL(guanlif,0)+NVL(suijin,0)) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.dwbh='"+dmbh+"' and cw_qmjzmx.sjs='"+getsjs+"'";
		ls_sql+=" and zt='3' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			tdje=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		alltdje+=tdje;

		yjje=qye+suijin+guanlif-tdje;
		yjje=cf.round(yjje,2);
		allyjje+=yjje;

		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+dmbh+"' and cw_qmjzmx.sjs='"+getsjs+"' and jzkscsj is not null";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			gsqys=rs1.getInt("qys");
			gsqye=rs1.getDouble("qye");
			gswdzgce=rs1.getDouble("wdzgce");
		}
		rs1.close();
		ps1.close();

		allgsqys+=gsqys;
		allgsqye+=gsqye;
		allgswdzgce+=gswdzgce;
	
		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+dmbh+"' and cw_qmjzmx.sjs='"+getsjs+"' and cwjzkscsj is not null";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cwqys=rs1.getInt("qys");
			cwqye=rs1.getDouble("qye");
			cwwdzgce=rs1.getDouble("wdzgce");
		}
		rs1.close();
		ps1.close();
		
		allcwqys+=cwqys;
		allcwqye+=cwqye;
		allcwwdzgce+=cwwdzgce;
		
		
		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM cw_qmjzmx,cw_khfkjl";
		ls_sql+=" where cw_qmjzmx.khbh=cw_khfkjl.khbh and cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+dmbh+"' and cw_qmjzmx.sjs='"+getsjs+"' and cw_khfkjl.fklxbm in('11','54','96') and cw_khfkjl.scbz='N' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cwssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		allcwssk+=cwssk;
		
		if (qys==0)
		{
			pjde=0;
		}
		else{
			pjde=(long)(qye/qys);
		}
		if (fwmj==0)
		{
			pmjj=0;
		}
		else{
			pmjj=(long)(qye/fwmj);
		}
		if (wdzgce==0)
		{
			zkl=0;
		}
		else{
			zkl=qye*10/wdzgce;
		}

		allqys+=qys;
		allqye+=qye;
		allsuijin+=suijin;
		allwdzgce+=wdzgce;
		allfwmj+=fwmj;
		allsjf+=sjf;
		allglf+=glf;
		allguanlif+=guanlif;
		allzhzjxje+=zhzjxje;
		allzjxsuijin+=zjxsuijin;
		allzjxguanlif+=zjxguanlif;
		allzjhze+=zjhze;
		allsuijinze+=suijinze;
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
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" ><input name="sjs" type="checkbox" value='<%=getsjs+"+"+dmbh%>' checked></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" ><%=row%>
			</td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" >
				<A HREF="ViewSjscz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=dmbh%>&jzbz=<%=jzbz%>" target="_blank">
				<%=getsjs%>
				</A>
			</td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff" ><%=dm%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=qys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)wdzgce)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)qye)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(guanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif))%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)tdje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)yjje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)cwssk)%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)sjf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(glf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhzjxje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxsuijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxguanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(zjxsuijin+zjxguanlif+zhzjxje))%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif+zhzjxje+zjxsuijin+zjxguanlif))%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijinze)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)pjde)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)pmjj)%></td>
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
		pjde=(long)(allqye/allqys);
	}
	if (allfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(long)(allqye/allfwmj);
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
	<td colspan="4" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
	<input type=button value='查看被选设计师签单明细' onclick="f_dqmx(listform)">
	<input type=button value='导出EXCEL' onclick="f_exp(listform)">
	</td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=allqys%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allwdzgce)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.round(zkl,1)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allqye)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allsuijin)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allguanlif)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)(allqye+allsuijin+allguanlif))%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)alltdje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)allyjje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)allcwssk)%></td>

	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allsjf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allglf)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)allzhzjxje)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allzjxsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(allzjxguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(allzhzjxje+allzjxsuijin+allzjxguanlif))%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(allqye+allsuijin+allguanlif+allzhzjxje+allzjxsuijin+allzjxguanlif))%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble(allsuijinze)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)pjde)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="right"><%=cf.formatDouble((long)pmjj)%></td>
	<td  style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; " align="left">&nbsp;</td>
</tr>
</table>

  </DIV>

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

function f_jzjc(formName)
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

		formName.action="ViewJzJcSjscz.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&jzbz=<%=jzbz%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
		formName.submit();
		return true;
	}

} 

function f_dqmx(formName)
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

function f_exp(formName)
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

