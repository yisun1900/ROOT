<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

double zchtje=0;
double zczjxje=0;

double jchte=0;//集成合同额
double jczjx=0;//集成增减项
double jcysk=0;//集成应收款
double jcssk=0;//集成已收款
double jcmqqk=0;//集成目前欠款


String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;



String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;


try {
	conn=cf.getConnection();


	ls_sql="select khxm,fwdz,lxfs,xb,sjs,zxdm,ssfgs,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();




%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE4 {
	font-family: "楷体_GB2312";
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#CCCCFF">
<div align="center">客户信息 
  <label></label>
</div>


          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">客户编号</td>
              <td width="34%"><%=khbh%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">房屋地址              </td>
              <td width="34%"> <%=fwdz%></td>
              <td width="18%" align="right">客户姓名              </td>
              
    <td width="32%"><%=khxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">签约店面              </td>
              <td width="34%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td bgcolor="#FFFFFF" align="right" width="18%">设计师</td>
              <td width="32%"> <%=sjs%></td>
            </tr>
</table>
<P>    
      
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="6" align="center" bgcolor="#FFFFFF"><strong>促销活动</strong></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="16%" align="right">参加公司促销活动</td>
    <td colspan="5" ><%=cxhdbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">参加小区促销活动</td>
    <td colspan="5" ><%=cxhdbmxq%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">参加展会促销活动</td>
    <td colspan="5" ><%=cxhdbmzh%></td>
  </tr>
</table>

      
<P>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td colspan="18"><b>电子报价综合取费</b></td>
  </tr>
 <tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">收费项目</td>
	<td  width="8%">收费计算方式</td>
	<td  width="4%">百分比</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">数量</td>
	<td  width="5%">单价</td>
	<td  width="6%">折前金额</td>
	<td  width="3%">折扣</td>
	<td  width="6%">折后金额</td>
	<td  width="4%">记入签约额</td>
	<td  width="4%">记入税金</td>
	<td  width="4%">记入管理费</td>
	<td  width="4%">是否可打折</td>
	<td  width="3%">最低折扣</td>
	<td  width="5%">收费项目类型</td>
	<td  width="4%">施工队结算</td>
	<td  width="20%">备注</td>
</tr>
  <%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sfxmmc,DECODE(sflx,'1','工程直接费百分比（不可改）','A','工程直接费百分比（可改）','2','固定金额(可改)','3','税金（折后合同额×税率）','8','税金（折前税金×税金折扣）','4','固定金额(不可改)','5','管理费','6','公司购主材百分比','7','自购主材百分比','9','按百分比收设计费','B','精装工程管理费','C','精装主材管理费','D','精装工程费百分比','E','精装主材费百分比') sflx ";
	ls_sql+=" ,bj_sfxmmx.sfbfb||'%' sfbfb,bj_sfxmmx.jldw,TO_CHAR(bj_sfxmmx.sl) sl,TO_CHAR(bj_sfxmmx.dj) dj,bj_sfxmmx.zqsfje,TO_CHAR(bj_sfxmmx.dxzkl) dxzkl,bj_sfxmmx.sfje ";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'2','记入','1','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz,DECODE(bj_sfxmmx.sfkdz,'N','不可打','Y','可打') sfkdz,TO_CHAR(zdzk) zdzk,DECODE(bj_sfxmmx.sfxmlx,'1','间接工程费','2','工程相关费','3','设计费','9','其它') sfxmlx,DECODE(bj_sfxmmx.sfcysgdjs,'N','否','Y','是') sfcysgdjs,bj_sfxmmx.bz";
	ls_sql+=" FROM bj_sfxmmx  ";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_sfxmmx.sfxmbm";

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>



<P>


<table width="100%" border="1" style="FONT-SIZE:13" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="9" align="center" bgcolor="#CCCCCC"><b>集成订单－收款情况</b></td>
  </tr>
  <tr align="center" bgcolor="#E8E8FF"> 
    <td width="15%" align="center" rowspan="2"><b>品牌</b></td>
    <td width="9%" rowspan="2"><strong>订单编号</strong></td>
    <td width="11%" rowspan="2"><b>合同额</b></td>
    <td colspan="3"><b>增减项信息</b></td>
    <td width="13%" rowspan="2"><font color="#0000CC"><b>合同额＋增减项</b></font></td>
    <td width="11%" rowspan="2"><b>已收款</b></td>
    <td width="14%" rowspan="2"><font color="#CC0000"><b>欠款=应收款-实收款</b></font></td>
  </tr>
  <tr align="center" bgcolor="#E8E8FF"> 
    <td width="10%"><b>发生时间</b></td>
    <td width="10%"><b>增减项金额</b></td>
    <td width="10%"><b>付款金额</b></td>
  </tr>



<%
	//主材
	String ppbm=null;
	String clzt=null;
	String ddbh="";

	ls_sql="select distinct ppbm";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where khbh='"+khbh+"'";//1:现金；2：支票；3：预付款冲减
	ls_sql+=" and clzt not in('98')";
	ls_sql+=" and (hkze!=0 OR zjhze!=0)";
	ls_sql+=" order by ppbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		ppbm=rs2.getString(1);

		double zcfkje=0;
		double zjxfkje=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and gysbh='"+ppbm+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcfkje=rs1.getDouble(1);//已收主材款
		}
		rs1.close();
		ps1.close();

		//品牌合同、增减项小计
		double zcyshtk=0;
		double zcyszjx=0;
		ls_sql="select sum(hkze),sum(zjhze)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and clzt not in('98')";
		ls_sql+=" and (hkze!=0 OR zjhze!=0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zcyshtk=rs1.getDouble(1);
			zcyszjx=rs1.getDouble(2);
		}
		rs1.close();
		ps1.close();

		jchte+=zcyshtk;//订单总计：合同额
		jczjx+=zcyszjx;//订单总计：增减项
		jcssk+=zcfkje;//订单总计：已收款
		jcysk+=zcyshtk+zcyszjx;//订单总计：合同额＋增减项
		jcmqqk=jcysk-jcssk;//订单总计：目前欠款


		//品牌增减项数、增减项订单数
		int allzczjcs=0;
		int zjxdds=0;
		ls_sql="select count(*),count(distinct ddbh)";
		ls_sql+=" from  jc_zczjx";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and ddbh in(select ddbh from jc_zcdd where khbh='"+khbh+"' and ppbm='"+ppbm+"' and clzt not in('98') and (hkze!=0 OR zjhze!=0) )";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			allzczjcs=rs1.getInt(1);
			zjxdds=rs1.getInt(2);
		}
		rs1.close();
		ps1.close();

		//品牌订单数
		int ddsl=0;
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'";
		ls_sql+=" and clzt not in('98')";
		ls_sql+=" and (hkze!=0 OR zjhze!=0)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ddsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (ddsl==1 && allzczjcs==0)//一个订单，无增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			%>
			<tr bgcolor="#FFFFFF" align="right"> 
				<td align="center" ><%=ppbm%></td>
				<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
				<td><%=cf.formatDouble(zchtje)%></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
				<td><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
				<td><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
			</tr>
			<%
		}
		else if (ddsl==1 && allzczjcs==1)//一个订单，一个增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			double dczjxze=0;
			String lrsj=null;
			String zjxbh=null;
			ls_sql="select zjxze,lrsj,zjxbh";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				dczjxze=rs1.getDouble(1);//
				lrsj=cf.fillNull(rs1.getDate(2));
				zjxbh=cf.fillNull(rs1.getString(3));
			}
			rs1.close();
			ps1.close();

			zjxfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zjxfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			%>
			<tr bgcolor="#FFFFFF" align="right"> 
				<td align="center"><%=ppbm%></td>
				<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
				<td align="right"><%=cf.formatDouble(zchtje)%></td>
				<td ><%=lrsj%></td>
				<td ><%=cf.formatDouble(dczjxze)%></td>
				<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
				<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
				<td><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
				<td><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
			</tr>
			<%
		}
		else if (ddsl==1 && allzczjcs>1)//一个订单，多个增减项
		{
			ls_sql="select ddbh,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				ddbh=rs.getString(1);
				zchtje=rs.getDouble(2);//主材合同额
				zczjxje=rs.getDouble(3);//增减项总额

				clzt=rs.getString(4);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}
			}
			rs.close();
			ps.close();

			zcfkje=0;
			ls_sql="select sum(fkje)";
			ls_sql+=" from  cw_khfkjl";
			ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zcfkje=rs1.getDouble(1);//已收主材款
			}
			rs1.close();
			ps1.close();

			double dczjxze=0;
			String lrsj=null;
			String zjxbh=null;
			int row=0;
			ls_sql="select zjxze,lrsj,zjxbh";
			ls_sql+=" from  jc_zczjx";
			ls_sql+=" where ddbh='"+ddbh+"'";
			ls_sql+=" order by zjxbh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				dczjxze=rs1.getDouble(1);//
				lrsj=cf.fillNull(rs1.getDate(2));
				zjxbh=cf.fillNull(rs1.getString(3));

				zjxfkje=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					zjxfkje=rs3.getDouble(1);//已收主材款
				}
				rs3.close();
				ps3.close();

				row++;

				if (row==1)
				{
					%>
					<tr bgcolor="#FFFFFF" align="right"> 
						<td align="center" rowspan="<%=allzczjcs%>"><%=ppbm%></td>
						<td align="center" rowspan="<%=allzczjcs%>"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
						<td rowspan="<%=allzczjcs%>"><%=cf.formatDouble(zchtje)%></td>
						<td ><%=row%>：<%=lrsj%></td>
						<td ><%=cf.formatDouble(dczjxze)%></td>
						<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
						<td rowspan="<%=allzczjcs%>"><font color="#0000CC" ><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
						<td rowspan="<%=allzczjcs%>"><%=cf.formatDouble(zcfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
						<td rowspan="<%=allzczjcs%>"><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
					</tr>
					<%
				}
				else{
					%>
					<tr bgcolor="#FFFFFF" align="right"> 
						<td ><%=row%>：<%=lrsj%></td>
						<td ><%=cf.formatDouble(dczjxze)%></td>
						<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
					</tr>
					<%
				}
			}
			rs1.close();
			ps1.close();
		}
		else{//多个订单
			ddsl=ddsl+allzczjcs-zjxdds+1;

			int ppmark=0;

			ls_sql="select ddbh,ppbm,hkze,zjhze,clzt";
			ls_sql+=" from  jc_zcdd";
			ls_sql+=" where khbh='"+khbh+"' and ppbm='"+ppbm+"'"; 
			ls_sql+=" and clzt not in('98')";
			ls_sql+=" and (hkze!=0 OR zjhze!=0)";
			ls_sql+=" order by ddbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			while (rs.next())
			{
				ddbh=rs.getString(1);
				ppbm=rs.getString(2);
				zchtje=rs.getDouble(3);//主材合同额
				zczjxje=rs.getDouble(4);//增减项总额

				clzt=rs.getString(5);

				if (clzt.equals("99"))
				{
					clzt="<font color='#FF0000'><B>（已退单）</B></font>";
				}
				else{
					clzt="";
				}

				double ddfkje=0;
				ls_sql="select sum(fkje)";
				ls_sql+=" from  cw_khfkjl";
				ls_sql+=" where khbh='"+khbh+"' and ddbh='"+ddbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					ddfkje=rs1.getDouble(1);//已收主材款
				}
				rs1.close();
				ps1.close();

				int zczjcs=0;
				ls_sql="select count(*)";
				ls_sql+=" from  jc_zczjx";
				ls_sql+=" where ddbh='"+ddbh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zczjcs=rs1.getInt(1);
				}
				rs1.close();
				ps1.close();

				if (zczjcs==0)//无增减项
				{
					ppmark++;

					if (ppmark==1)
					{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td><%=cf.formatDouble(zchtje)%></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%
					}
					else{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td ><%=cf.formatDouble(zchtje)%></td>
							<td >&nbsp;</td>
							<td >&nbsp;</td>
							<td >&nbsp;</td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%
					}

				}
				else if (zczjcs==1)//1个增减项
				{
					ppmark++;

					double dczjxze=0;
					String lrsj=null;
					String zjxbh=null;
					ls_sql="select zjxze,lrsj,zjxbh";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						dczjxze=rs1.getDouble(1);//
						lrsj=cf.fillNull(rs1.getDate(2));
						zjxbh=cf.fillNull(rs1.getString(3));
					}
					rs1.close();
					ps1.close();

					zjxfkje=0;
					ls_sql="select sum(fkje)";
					ls_sql+=" from  cw_khfkjl";
					ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					if (rs1.next())
					{
						zjxfkje=rs1.getDouble(1);//已收主材款
					}
					rs1.close();
					ps1.close();

					if (ppmark==1)
					{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td align="right"><%=cf.formatDouble(zchtje)%></td>
							<td ><%=lrsj%></td>
							<td ><%=cf.formatDouble(dczjxze)%></td>
							<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%

					}
					else{
						%>
						<tr bgcolor="#E8E8FF" align="right"> 
							<td align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
							<td align="right"><%=cf.formatDouble(zchtje)%></td>
							<td ><%=lrsj%></td>
							<td ><%=cf.formatDouble(dczjxze)%></td>
							<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
							<td><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
							<td ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
							<td ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
						</tr>
						<%

					}
				}
				else{//多个增减项
					double dczjxze=0;
					String lrsj=null;
					String zjxbh=null;
					int row=0;
					ls_sql="select zjxze,lrsj,zjxbh";
					ls_sql+=" from  jc_zczjx";
					ls_sql+=" where ddbh='"+ddbh+"'";
					ls_sql+=" order by zjxbh";
					ps1= conn.prepareStatement(ls_sql);
					rs1 =ps1.executeQuery();
					while (rs1.next())
					{
						dczjxze=rs1.getDouble(1);//
						lrsj=cf.fillNull(rs1.getDate(2));
						zjxbh=cf.fillNull(rs1.getString(3));

						zjxfkje=0;
						ls_sql="select sum(fkje)";
						ls_sql+=" from  cw_khfkjl";
						ls_sql+=" where khbh='"+khbh+"' and zjxbh='"+zjxbh+"' and fklxbm='23' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
						ps3= conn.prepareStatement(ls_sql);
						rs3 =ps3.executeQuery();
						if (rs3.next())
						{
							zjxfkje=rs3.getDouble(1);//已收主材款
						}
						rs3.close();
						ps3.close();


						ppmark++;

						row++;

						if (ppmark==1)
						{
							%>
							<tr bgcolor="#E8E8FF" align="right"> 
								<td align="center" rowspan="<%=ddsl%>"><%=ppbm%></td>
								<td rowspan="<%=zczjcs%>" align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
								<td rowspan="<%=zczjcs%>"><%=cf.formatDouble(zchtje)%></td>
								<td><%=row%>：<%=lrsj%></td>
								<td><%=cf.formatDouble(dczjxze)%></td>
								<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
								<td rowspan="<%=zczjcs%>"><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
								<td rowspan="<%=zczjcs%>" ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
								<td rowspan="<%=zczjcs%>" ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
							</tr>
							<%
						}
						else{
							if (row==1)
							{
								%>
								<tr bgcolor="#E8E8FF" align="right"> 
									<td rowspan="<%=zczjcs%>" align="center"><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target='_blank'><%=ddbh%></A><%=clzt%></td>
									<td rowspan="<%=zczjcs%>" align="right"><%=cf.formatDouble(zchtje)%></td>
									<td><%=row%>：<%=lrsj%></td>
									<td><%=cf.formatDouble(dczjxze)%></td>
									<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
									<td rowspan="<%=zczjcs%>"><font color="#0000CC"><%=cf.formatDouble(zchtje+zczjxje)%></font></td>
									<td rowspan="<%=zczjcs%>" ><%=cf.formatDouble(ddfkje)%><A HREF="ViewDdSk.jsp?ddbh=<%=ddbh%>" target="_blank">查看</A></td>
									<td rowspan="<%=zczjcs%>" ><font color="#CC0000"><%=cf.formatDouble(zchtje+zczjxje-ddfkje)%></font></td>
								</tr>
								<%
							}
							else{
								%>
								<tr bgcolor="#E8E8FF" align="right"> 
									<td ><%=row%>：<%=lrsj%></td>
									<td ><%=cf.formatDouble(dczjxze)%></td>
									<td ><%=cf.formatDouble(zjxfkje)%><A HREF="ViewZjxSk.jsp?zjxbh=<%=zjxbh%>" target="_blank">查看</A></td>
								</tr>
								<%
							}
						}
					}
					rs1.close();
					ps1.close();
				}
			}
			rs.close();
			ps.close();
			
			%>
			<tr bgcolor="#FFFFCC" align="right"> 
				<td align="center" >小计</td>
				<td ><%=cf.formatDouble(zcyshtk)%></td>
				<td>&nbsp;</td>
				<td ><%=cf.formatDouble(zcyszjx)%></td>
				<td>&nbsp;</td>
				<td ><font color="#0000CC"><%=cf.formatDouble(zcyshtk+zcyszjx)%></font></td>
				<td ><%=cf.formatDouble(zcfkje)%></td>
				<td ><font color="#CC0000"><%=cf.formatDouble(zcyshtk+zcyszjx-zcfkje)%></font></td>
			</tr>
			<%
		
		
		}
	}
	rs2.close();
	ps2.close();


%>
  <tr bgcolor="#FFFFFF" align="right"> 
    <td align="center"><b>订 单 总 计</b></td>
    <td align="center" >&nbsp;</td>
    <td ><%=cf.formatDouble(jchte)%></td>
	<td >&nbsp;</td>
    <td ><%=cf.formatDouble(jczjx)%></td>
	<td >&nbsp;</td>
    <td ><font color="#0000CC"><%=cf.formatDouble(jcysk)%></font></td>
    <td ><%=cf.formatDouble(jcssk)%></td>
    <td ><font color="#CC0000"><%=cf.formatDouble(jcmqqk)%></font></td>
  </tr>
</table>
<P>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr> 
    <td colspan="20" align="center" bgcolor="#CCCCCC"><b>实收款情况 
        <label>
        <input name="button" type="button" onClick="window.open('/khxx/zkjl.jsp?khbh=<%=khbh%>')" value="查看转款记录">
        <input name="button2" type="button" onClick="window.open('/khxx/fkjl.jsp?khbh=<%=khbh%>')" value="查看付款记录">
        </label>
</b></td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">收款序号</td>
	<td  width="5%">收款类型</td>
	<td  width="4%">收款期数</td>
	<td  width="9%" bgcolor="#CCCCCC">收款品牌</td>
	<td  width="4%" bgcolor="#CCCCCC">收款订单号</td>
	<td  width="5%" bgcolor="#CCCCCC">收款增减项编号</td>
	<td  width="5%">实收款金额</td>
	<td  width="3%">是否财务收款</td>
	<td  width="3%">已上缴</td>
	<td  width="4%">支付方式</td>
	<td  width="5%">转帐款项</td>
	<td  width="9%">转帐品牌</td>
	<td  width="4%">转帐订单号</td>
	<td  width="5%">转帐增减项编号</td>
	<td  width="5%">收据编号</td>
	<td  width="3%">应收款率</td>
	<td  width="5%">应收款金额</td>
	<td  width="3%">收款人</td>
	<td  width="5%">收款时间</td>
	<td  width="10%">备注</td>
</tr>

<%

	String getfkxh=null;
	String fklxmc=null;
	String getfkcsmc=null;
	String getgysbh=null;
	String getddbh=null;
	String getzjxbh=null;
	double fkje=0;
	double xjfkje=0;
	double zjfkje=0;
	String skdd=null;
	String dsksjbz=null;
	String zffsmc=null;
	String zckx=null;
	String zcgysbh=null;
	String zcddbh=null;
	String zczjxbh=null;
	String sksj=null;

	double getyfkbl=0;
	double getyfkje=0;
	String getskr=null;
	String getsjbh=null;
	String getbz=null;

	String oldfklxmc="";
	String	getyfkblstr=null;
	String	getyfkjestr=null;

	int row=1;
	String bgcolor="";

	ls_sql="SELECT fkxh,a.fklxmc,fkcsmc,gysbh,cw_khfkjl.ddbh,cw_khfkjl.zjxbh,cw_khfkjl.fkje,DECODE(skdd,'1','财务','2','非财务') skdd";
	ls_sql+=" ,DECODE(dsksjbz,'N','未审核','Y','审核通过','M','审核未通过') dsksjbz,zffsmc,b.fklxmc zckx,zcgysbh,zcddbh,zczjxbh,cw_khfkjl.sjbh,cw_khfkjl.yfkbl";
	ls_sql+=" ,cw_khfkjl.yfkje,cw_khfkjl.skr,cw_khfkjl.sksj,cw_khfkjl.bz";
	ls_sql+=" FROM cw_khfkjl,sq_dwxx,cw_fklxbm a,cw_fklxbm b,cw_zffsbm,cw_fkcs  ";
	ls_sql+=" where cw_khfkjl.skdw=sq_dwxx.dwbh ";
	ls_sql+=" and cw_khfkjl.zffs=cw_zffsbm.zffsbm and cw_khfkjl.fklxbm=a.fklxbm(+) and cw_khfkjl.zckx=b.fklxbm(+)";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) ";
	ls_sql+=" order by cw_khfkjl.fklxbm,gysbh,fkxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getfkxh=rs.getString("fkxh");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		getfkcsmc=cf.fillHtml(rs.getString("fkcsmc"));
		getgysbh=cf.fillHtml(rs.getString("gysbh"));
		getddbh=cf.fillHtml(rs.getString("ddbh"));
		getzjxbh=cf.fillHtml(rs.getString("zjxbh"));
		fkje=rs.getDouble("fkje");
		skdd=cf.fillHtml(rs.getString("skdd"));
		dsksjbz=cf.fillHtml(rs.getString("dsksjbz"));
		zffsmc=cf.fillHtml(rs.getString("zffsmc"));
		zckx=cf.fillHtml(rs.getString("zckx"));
		zcgysbh=cf.fillHtml(rs.getString("zcgysbh"));
		zcddbh=cf.fillHtml(rs.getString("zcddbh"));
		zczjxbh=cf.fillHtml(rs.getString("zczjxbh"));
		getyfkbl=rs.getDouble("yfkbl");
		getyfkje=rs.getDouble("yfkje");
		sksj=cf.fillHtml(rs.getDate("sksj"));
		getskr=cf.fillHtml(rs.getString("skr"));
		getsjbh=cf.fillHtml(rs.getString("sjbh"));
		getbz=cf.fillHtml(rs.getString("bz"));

		if (getyfkbl>0)
		{
			getyfkblstr=getyfkbl+"%";
			getyfkjestr=getyfkje+"";
		}
		else{
			getyfkblstr="&nbsp;";
			getyfkjestr="&nbsp;";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (!oldfklxmc.equals(fklxmc))
		{
			if (!oldfklxmc.equals(""))
			{
				%>
				<tr bgcolor="#FFFFCC"  align="center">
					<td colspan='3'><B>[<%=oldfklxmc%>]小计</B></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<%
			}

			oldfklxmc=fklxmc;
			xjfkje=0;
		}

		xjfkje+=fkje;
		zjfkje+=fkje;

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><A target='_blank' HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=getfkxh%>"><%=getfkxh%></A></td>
			<td><%=fklxmc%></td>
			<td><%=getfkcsmc%></td>
			<td><%=getgysbh%></td>
			<td><%=getddbh%></td>
			<td><%=getzjxbh%></td>
			<td align="right"><%=cf.formatDouble(fkje)%></td>
			<td><%=skdd%></td>
			<td><%=dsksjbz%></td>
			<td><%=zffsmc%></td>
			<td><%=zckx%></td>
			<td><%=zcgysbh%></td>
			<td><%=zcddbh%></td>
			<td><%=zczjxbh%></td>
			<td><%=getsjbh%></td>
			<td><%=getyfkblstr%></td>
			<td><%=getyfkjestr%></td>
			<td><%=getskr%></td>
			<td><%=sksj%></td>
			<td><%=getbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFCC"  align="center">
		<td colspan='3'><B>[<%=fklxmc%>]小计</B></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td align="right"><B><%=cf.formatDouble(xjfkje)%></B></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr bgcolor="#FFFFCC"  align="center">
		<td colspan='5'><B>总 计</B></td>
		<td>&nbsp;</td>
		<td align="right"><B><%=cf.formatDouble(zjfkje)%></B></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3 != null) ps3.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>

  
</body>
</html>
