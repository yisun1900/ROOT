<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='093001'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面结转业绩统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面结转业绩统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


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

String ssdqbm=cf.fillNull(request.getParameter("ssdqbm"));
String fgs=cf.fillNull(request.getParameter("fgs"));
String dwbh=cf.fillNull(request.getParameter("dwbh"));
String jzbz=request.getParameter("jzbz");
String tjsj=request.getParameter("tjsj");
String sfjms=request.getParameter("sfjms");

String wheresql="";
String wheresql1="";


if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
{
	wheresql+=" and cw_qmjzmx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and cw_qmjzmx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and a.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(ssdqbm.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh in(select dwbh from sq_dwxx where dwlx='F0' and ssdqbm='"+ssdqbm+"'))";
	wheresql1+=" and  (a.ssdqbm='"+ssdqbm+"')";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (cw_qmjzmx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (a.ssfgs='"+fgs+"')";
}

if (!(dwbh.equals("")))
{
	wheresql+=" and  cw_qmjzmx.dwbh='"+dwbh+"'";
	wheresql1+=" and  a.dwbh='"+dwbh+"'";
}

if (!jzbz.equals("0"))
{
	wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
}


wheresql+=" and cw_qmjzmx.jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
wheresql+=" and cw_qmjzmx.jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


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

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>

<CENTER >
  <B>店面结转业绩统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>



<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT:95%"> 


<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="320%" style='FONT-SIZE: 14px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="2%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">排名</td>
  <td  width="5%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">分公司</td>
  <td  width="9%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">店面</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约数</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未打折工程额(不含税金管理费)</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣率</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工程签约额(不含税金管理费)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">税金(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">管理费(折后)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签单总额(工程+税金+管理费)</td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">退单额</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装业绩(签单－退单)</font></td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装实收款</font></td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计费</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">服务费</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折后工程增减项(不含税金管理费)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项税金(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项管理费(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减项小计(工程+税金+管理费)</td>

  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减后总额(工程+税金+管理费)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">增减后税金总额</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">单额平均</td>
  <td  width="2%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">平米均价</td>
</tr>
<%
	//获取最大数
	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
	String getdwmc=null;
	int qys=0;
	double qye=0;
	double suijin=0;
	double wdzgce=0;
	double zhzjxje=0;
	double zjxsuijin=0;
	double zjxguanlif=0;
	double suijinze=0;
	long fwmj=0;
	double sjf=0;
	double glf=0;
	double guanlif=0;

	int ALLqys=0;
	double ALLqye=0;
	double ALLsuijin=0;
	double ALLwdzgce=0;
	double ALLzhzjxje=0;
	double ALLzjxsuijin=0;
	double ALLzjxguanlif=0;
	double ALLzjhze=0;
	double ALLsuijinze=0;
	long ALLfwmj=0;
	double ALLsjf=0;
	double ALLglf=0;
	double ALLguanlif=0;


	double zkl=0;
	int pjde=0;
	int pmjj=0;


	int gsqys=0;
	double gsqye=0;
	double gswdzgce=0;
	int cwqys=0;
	double cwqye=0;
	double cwwdzgce=0;
	double cwssk=0;

	int ALLgsqys=0;
	double ALLgsqye=0;
	double ALLgswdzgce=0;
	int ALLcwqys=0;
	double ALLcwqye=0;
	double ALLcwwdzgce=0;
	double ALLcwssk=0;

	double tdje=0;
	double ALLtdje=0;
	double yjje=0;
	double ALLyjje=0;

	int row=0;
	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(suijin,0)),sum(NVL(zhzjxje,0)),sum(NVL(zjxsuijin,0)),sum(NVL(zjxguanlif,0)),sum(NVL(suijin,0)+NVL(zjxsuijin,0)),sum(NVL(sjf,0)),sum(NVL(glf,0)),sum(NVL(guanlif,0)),sum(fwmj)";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx";
	ls_sql+=" where cw_qmjzmx.fgsbh=sq_dwxx.dwbh and cw_qmjzmx.zt in('2','5') and sq_dwxx.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ALLqys=rs.getInt(1);
		ALLwdzgce=rs.getDouble(2);
		ALLqye=rs.getDouble(3);
		ALLsuijin=rs.getDouble(4);
		ALLzhzjxje=rs.getDouble(5);
		ALLzjxsuijin=rs.getDouble(6);
		ALLzjxguanlif=rs.getDouble(7);
		ALLsuijinze=rs.getDouble(8);
		ALLsjf=rs.getDouble(9);
		ALLglf=rs.getDouble(10);
		ALLguanlif=rs.getDouble(11);
		ALLfwmj=rs.getLong(12);
	}
	rs.close();
	ps.close();


	ls_sql=" SELECT fgs,dwbh,dm,sum(qys) qys,sum(qye) qye,sum(suijin) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(suijinze) suijinze,sum(sjf) sjf,sum(glf) glf,sum(guanlif) guanlif,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT b.dwmc fgs,cw_qmjzmx.dwbh dwbh,a.dwmc dm,count(*) qys,sum(qye) qye,sum(NVL(suijin,0)) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(NVL(zjxguanlif,0)) zjxguanlif,sum(NVL(suijin,0)+NVL(zjxsuijin,0)) suijinze,sum(NVL(sjf,0)) sjf,sum(NVL(glf,0)) glf,sum(NVL(guanlif,0)) guanlif,sum(fwmj) fwmj";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where cw_qmjzmx.dwbh=a.dwbh(+) and cw_qmjzmx.fgsbh=b.dwbh(+)";
	ls_sql+=" and cw_qmjzmx.zt in ('2')";
	ls_sql+=" and b.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql;
	ls_sql+=" group by b.dwmc,cw_qmjzmx.dwbh,a.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT b.dwmc fgs,a.dwbh dwbh,a.dwmc dm,0 qys,0 qye,0 suijin,0 wdzgce,0 zhzjxje,0 zjxsuijin,0 zjxguanlif,0 suijinze,0 sjf,0 glf,0 guanlif,0 fwmj ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  a.ssfgs=b.dwbh(+) and a.dwlx='F2' and a.cxbz='N'";
	ls_sql+=" and b.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql1;
	ls_sql+=" group by b.dwmc,a.dwbh,a.dwmc ";
	
	ls_sql+=" )";
	ls_sql+=" group by fgs,dwbh,dm";
	ls_sql+=" order by qye desc,fgs,dwbh";

//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("dwbh");
		dm=rs.getString("dm");
		qys=rs.getInt("qys");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		wdzgce=rs.getDouble("wdzgce");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		suijinze=rs.getDouble("suijinze");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		fwmj=rs.getLong("fwmj");

		String cxbz="";
		String kdsj="";
		String gdsj="";
		ls_sql="SELECT dwmc,kdsj,gdsj,cxbz";
		ls_sql+=" FROM sq_dwxx";
		ls_sql+=" where dwbh='"+getdwbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if(rs1.next())
		{
			getdwmc=rs1.getString("dwmc");
			cxbz=rs1.getString("cxbz");
			kdsj=cf.fillNull(rs1.getDate("kdsj"));
			gdsj=cf.fillNull(rs1.getDate("gdsj"));
		}
		rs1.close();
		ps1.close();
		if (cxbz.equals("Y"))//Y：已撤销；N：未撤销
		{
			getdwmc="<font color=\"#FF0033\">"+getdwmc+"("+kdsj+"至"+gdsj+")</font>";
		}
		else{
			if (!kdsj.equals(""))
			{
				getdwmc=getdwmc+"(开店:"+kdsj+")";
			}
		}

		//退单
		ls_sql="SELECT sum(qye+NVL(guanlif,0)+NVL(suijin,0)) cwsgqye ";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.dwbh='"+getdwbh+"'";
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

		ALLtdje+=tdje;

		yjje=qye+suijin+guanlif-tdje;
		yjje=cf.round(yjje,2);
		ALLyjje+=yjje;

		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+getdwbh+"' and jzkscsj is not null";
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

		ALLgsqys+=gsqys;
		ALLgsqye+=gsqye;
		ALLgswdzgce+=gswdzgce;
	
		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
		ls_sql+=" FROM cw_qmjzmx";
		ls_sql+=" where cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+getdwbh+"' and cwjzkscsj is not null";
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
		
		ALLcwqys+=cwqys;
		ALLcwqye+=cwqye;
		ALLcwwdzgce+=cwwdzgce;
	

		ls_sql=" SELECT sum(fkje) ";
		ls_sql+=" FROM cw_qmjzmx,cw_khfkjl";
		ls_sql+=" where cw_qmjzmx.khbh=cw_khfkjl.khbh and cw_qmjzmx.zt in('2','5')";
		ls_sql+=" and cw_qmjzmx.dwbh='"+getdwbh+"' and cw_khfkjl.fklxbm in('11','54','96') and cw_khfkjl.scbz='N' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cwssk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		ALLcwssk+=cwssk;
		
	
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


		row++;

		if (getfgs.equals(oldfgs))
		{
			getfgs="同上";;
		}
		else{
			oldfgs=getfgs;
		}



		%>
		<tr align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getfgs%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
			<A HREF="ViewDmcz.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank">
			<%=getdwmc%>
			</A>

			
			</td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=qys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)wdzgce)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)qye)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(guanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif))%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)tdje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cf.formatDouble((long)yjje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)cwssk)%></td>


			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(sjf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(glf)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)zhzjxje)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxsuijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(zjxguanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(zjxsuijin+zjxguanlif+zhzjxje))%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif+zhzjxje+zjxsuijin+zjxguanlif))%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijinze)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pjde)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(pmjj)%></td>
		</tr>
		<%	
	}
	rs.close();
	ps.close();

	if (ALLqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(ALLqye/ALLqys);
	}
	if (ALLfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(ALLqye/ALLfwmj);
	}
	if (ALLwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=ALLqye*10/ALLwdzgce;
	}

%>

<tr align="center">
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><font color="#9900ff">总 计</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">&nbsp;</td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ALLqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLqye)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(ALLqye+ALLsuijin+ALLguanlif))%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLtdje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLyjje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLcwssk)%></td>


	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLsjf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLglf)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLzhzjxje)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzjxsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLzjxguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(ALLzhzjxje+ALLzjxsuijin+ALLzjxguanlif))%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(ALLqye+ALLsuijin+ALLguanlif+ALLzhzjxje+ALLzjxsuijin+ALLzjxguanlif))%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLsuijinze)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)pjde)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)pmjj)%></td>
</tr>

	
</table>




  </DIV>


</body>
</html>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>" + ls_sql);
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

