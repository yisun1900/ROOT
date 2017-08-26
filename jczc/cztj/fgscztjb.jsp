<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='090401'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'警告！非法侵入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'进入[店面产值统计]："+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%


String wheresql=request.getParameter("wheresql");
String wheresql1=request.getParameter("wheresql1");
String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");
String jzbz=request.getParameter("jzbz");
String sfjms=request.getParameter("sfjms");



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String getfgs=null;
	String oldfgs="";
	String dm=null;
	String getdwbh=null;
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



	int row=0;
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>




<CENTER >
  <B>分公司产值统计</B><BR>
  <b>(统计时间：<%=sjfw%>--<%=sjfw2%>)</b><BR>
</CENTER>


<DIV onselectstart="return false" style="BORDER-RIGHT: #808080 2px solid; BORDER-TOP: #808080 2px solid; DISPLAY: inline; OVERFLOW: auto; BORDER-LEFT: #808080 2px solid; WIDTH: 100%; CURSOR: default; BORDER-BOTTOM: #808080 2px solid; HEIGHT: 95%"> 

<TABLE style="DISPLAY: inline; BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=2 border=0 width="320%" style='FONT-SIZE: 14px'>
<TR bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
  <td  width="2%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">排名</td>
  <td  width="5%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">分公司</td>
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">饼图</td>
  <td  width="3%" style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">柱状图</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">签约数</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">未打折工程额(不含税金管理费)</td>
  <td  width="3%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">折扣率</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">工程签约额(不含税金管理费)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">税金(折后)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">管理费(折后)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装业绩(工程+税金+管理费)</td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户数(公司已收款)</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">客户数(财务已收款)</td>
  <td  width="5%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600"><font color="#0000FF">家装实收款</font></td>

  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">设计费</td>
  <td  width="4%" style="BORDER-LEFT: #000000 1px solid;BORDER-BOTTOM: #000000 1px solid;POSITION: relative; BACKGROUND-COLOR: #CC6600">服务费</td>
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
	//家装总客户总签约数
	ls_sql="SELECT count(*),sum(wdzgce),sum(qye),sum(NVL(suijin,0)),sum(NVL(zhzjxje,0)),sum(NVL(zjxsuijin,0)),sum(NVL(zjxguanlif,0)),sum(NVL(suijin,0)+NVL(zjxsuijin,0)),sum(NVL(sjf,0)),sum(NVL(glf,0)),sum(NVL(guanlif,0)),sum(fwmj)";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh and crm_khxx.zt in('2','5') and sq_dwxx.sfjms='"+sfjms+"'";//N：否；Y：是
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

	row=0;

	ls_sql=" SELECT fgs,fgsbh,sum(qys) qys,sum(qye) qye,sum(suijin) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(zjxguanlif) zjxguanlif,sum(suijinze) suijinze,sum(sjf) sjf,sum(glf) glf,sum(guanlif) guanlif,sum(fwmj) fwmj";
	ls_sql+=" from ( ";
	ls_sql+=" SELECT sq_dwxx.dwmc fgs,crm_khxx.fgsbh,count(*) qys,sum(qye) qye,sum(NVL(suijin,0)) suijin,sum(wdzgce) wdzgce,sum(zhzjxje) zhzjxje,sum(zjxsuijin) zjxsuijin,sum(NVL(zjxguanlif,0)) zjxguanlif,sum(NVL(suijin,0)+NVL(zjxsuijin,0)) suijinze,sum(NVL(sjf,0)) sjf,sum(NVL(glf,0)) glf,sum(NVL(guanlif,0)) guanlif,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=" and sq_dwxx.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,sq_dwxx.dwmc";

	ls_sql+=" UNION ALL";

	ls_sql+=" SELECT dwmc fgs,dwbh fgsbh,0 qys,0 qye,0 suijin,0 wdzgce,0 zhzjxje,0 zjxsuijin,0 zjxguanlif,0 suijinze,0 sjf,0 glf,0 guanlif,0 fwmj ";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=" and a.sfjms='"+sfjms+"'";//N：否；Y：是
	ls_sql+=wheresql1;
	ls_sql+=" group by dwbh,dwmc";
	
	ls_sql+=" )";
	ls_sql+=" group by fgsbh,fgs";
	ls_sql+=" order by qye desc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		getfgs=rs.getString("fgs");
		getdwbh=rs.getString("fgsbh");
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


		ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(wdzgce) wdzgce";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' and jzkscsj is not null";
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
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' and cwjzkscsj is not null";
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
		ls_sql+=" FROM crm_khxx,cw_khfkjl";
		ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.fgsbh='"+getdwbh+"' and cw_khfkjl.fklxbm in('11','54','96') and cw_khfkjl.scbz='N' ";
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

		%>
		<tr align="center">
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=row%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=getfgs%></td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
			<A HREF="ViewDmczBt.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank">
			饼图
			</A>
			</td>
			<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
			<A HREF="ViewDmczZzt.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&dwbh=<%=getdwbh%>&jzbz=<%=jzbz%>" target="_blank">
			柱状图
			</A>
			</td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=qys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)wdzgce)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)qye)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(suijin)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(guanlif)%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(qye+suijin+guanlif))%></td>

			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=gsqys%></td>
			<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid;"><%=cwqys%></td>
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
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
	&nbsp;
	</td>
	<td style="FONT-WEIGHT: bold;BORDER-RIGHT: #808080 2px solid;BORDER-TOP: black 1px solid; BORDER-BOTTOM: black 1px solid; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
	&nbsp;
	</td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ALLqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.round(zkl,1)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLqye)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble(ALLsuijin)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)ALLguanlif)%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=cf.formatDouble((long)(ALLqye+ALLsuijin+ALLguanlif))%></td>

	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ALLgsqys%></td>
	<td  align="right" style="BORDER-RIGHT: #000 1px solid; BORDER-BOTTOM: #000 1px solid; "><%=ALLcwqys%></td>
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

