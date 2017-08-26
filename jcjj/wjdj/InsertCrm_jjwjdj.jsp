<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");


String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
double khjsje=0;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String djjlh=null;

int zcsl=0;
int jjsl=0;
int mmsl=0;
int cgsl=0;
int js=0;

try {
	conn=cf.getConnection();

	//检查是否允许完结
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_mmydd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('20','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmsl=rs.getInt(1);
		js+=mmsl;
	}
	rs.close();
	ps.close();


	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_cgdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgsl=rs.getInt(1);
		js+=cgsl;
	}
	rs.close();
	ps.close();


	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_jjdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('35','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjsl=rs.getInt(1);
		js+=jjsl;
	}
	rs.close();
	ps.close();


	ls_sql="SELECT count(*)";
	ls_sql+=" FROM jc_zcdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt not in('30','98','99')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcsl=rs.getInt(1);
		js+=zcsl;
	}
	rs.close();
	ps.close();


	
	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,khjsje";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjsje=rs.getDouble("khjsje");
	}
	rs.close();
	ps.close();


%>


<body bgcolor="#FFFFFF">

      <div align="center">家居完结登记（客户编号：<%=khbh%>）</div>

<form method="post" action="SaveInsertCrm_jjwjdj.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                客户姓名              </td>
              <td width="33%"> <%=khxm%></td>
              <td width="16%" align="right"> 
                合同号              </td>
              <td width="34%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">房屋地址</td>
              <td width="33%"><%=fwdz%></td>
              <td width="16%" align="right">质检</td>
              <td width="34%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                签约店面              </td>
              <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="16%" align="right"> 
                设计师              </td>
              <td width="34%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                签约日期              </td>
              <td width="33%"><%=qyrq%> </td>
              <td width="16%" align="right"> 
                工程签约额              </td>
              <td width="34%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right"> 
                施工队              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="16%" align="right"> 
                班长              </td>
              <td width="34%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">合同开工日期</td>
              <td width="33%"><font color="#000000"><%=kgrq%></font></td>
              <td width="16%" align="right">合同竣工日期</td>
              <td width="34%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">实际开工日期</td>
              <td width="33%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="16%" align="right">实际竣工日期</td>
              <td width="34%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
        </table>

<%
	String ddbh=null;
	String clztmc=null;
	String xmzy=null;
	String clgw=null;
	String ztjjgw=null;
	String pdgc=null;
	String htrq=null;
	double zqzjhze=0;
	double zjhze=0;
	String lrsj=null;

	if (js>0)
	{

	%>
	  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
		<tr bgcolor="#CCCCCC"  align="center">
		  <td height="27" colspan="11"><span class="STYLE1">提醒，只有所有订单完结，才能做集成完结，请处理下述订单。。。。。。（未签合同的预订单可删除）</span></td>
		  </tr>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="6%">&nbsp;</td>
			<td  width="7%">订单编号</td>
			<td  width="9%">处理状态</td>
			<td  width="7%">项目专员</td>
			<td  width="7%">驻店顾问</td>
			<td  width="7%">展厅顾问</td>
			<td  width="21%">厂商</td>
			<td  width="8%">签约日期</td>
			<td  width="10%">增减后总额-折前</td>
			<td  width="10%">增减后总额-折后</td>
			<td  width="8%">录入时间</td>
		</tr>
<%

	if (mmsl>0)
	{
		//木门
		ls_sql="SELECT  yddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,htrq,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_mmydd,jdm_mmyddzt  ";
		ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_mmydd.clzt not in('20','98','99')";
		ls_sql+=" and jc_mmydd.clzt<'04'";//04：签订合同
		ls_sql+=" order by yddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/mmdd/DeleteTqJc_mmyd.jsp?yddbh=<%=ddbh%>" target="_blank">删除未完成订单</A></td>
				<td><A HREF="/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT  yddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,htrq,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_mmydd,jdm_mmyddzt  ";
		ls_sql+=" where jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_mmydd.clzt not in('20','98','99')";
		ls_sql+=" and jc_mmydd.clzt>='04' ";//04：签订合同
		ls_sql+=" order by yddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/mmcl/wjdj/WjdjJc_mmydd.jsp?yddbh=<%=ddbh%>" target="_blank">木门完结</A></td>
				<td><A HREF="/jcjj/mmdd/ViewJc_mmydd.jsp?yddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}

	if (cgsl>0)
	{
		//橱柜
		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,qhtsj,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt  ";
		ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_cgdd.clzt not in('35','98','99')";
		ls_sql+=" and jc_cgdd.clzt<'13' ";//13：签订合同
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/cgdd/DeleteTqJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank">删除未完成订单</A></td>
				<td><A HREF="/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,qhtsj,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt  ";
		ls_sql+=" where jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_cgdd.clzt not in('35','98','99')";
		ls_sql+=" and jc_cgdd.clzt>='13' ";//13：签订合同
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/cgcl/wjdj/WjdjJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank">橱柜完结</A></td>
				<td><A HREF="/jcjj/cgdd/ViewJc_cgdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

	}

	if (zcsl>0)
	{

		//主材
		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,ppbm,qhtsj,wdzje+zqzjhze,hkze+zjhze,lrsj ";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt  ";
		ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_zcdd.clzt<'09'";
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/zcdd/DeleteTqJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank">删除未完成订单</A></td>
				<td><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,ppbm,qhtsj,wdzje+zqzjhze,hkze+zjhze,lrsj ";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt  ";
		ls_sql+=" where jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_zcdd.clzt not in('30','98','99') and jc_zcdd.clzt>='09'";
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/zccl/wjdj/WjdjJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank">主材完结</A></td>
				<td><A HREF="/jcjj/zcdd/ViewJc_zcdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

	}

	if (jjsl>0)
	{
		//家具
		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,qhtsj,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_jjdd,jdm_jjddzt  ";
		ls_sql+=" where jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_jjdd.clzt not in('35','98','99')";
		ls_sql+=" and jc_jjdd.clzt<'13' ";//13：签订合同
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/jjdd/DeleteTqJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank">删除未完成订单</A></td>
				<td><A HREF="/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		ls_sql="SELECT  ddbh,clztmc,xmzy,clgw,ztjjgw,pdgc,qhtsj,zqzjhze,zjhze,lrsj ";
		ls_sql+=" FROM jc_jjdd,jdm_jjddzt  ";
		ls_sql+=" where jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
		ls_sql+=" and  khbh='"+khbh+"' and jc_jjdd.clzt not in('35','98','99')";
		ls_sql+=" and jc_jjdd.clzt>='13' ";//13：签订合同
		ls_sql+=" order by ddbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			ddbh=cf.fillHtml(rs.getString(1));
			clztmc=cf.fillHtml(rs.getString(2));
			xmzy=cf.fillHtml(rs.getString(3));
			clgw=cf.fillHtml(rs.getString(4));
			ztjjgw=cf.fillHtml(rs.getString(5));
			pdgc=cf.fillHtml(rs.getString(6));
			htrq=cf.fillHtml(rs.getDate(7));
			zqzjhze=rs.getDouble(8);
			zjhze=rs.getDouble(9);
			lrsj=cf.fillHtml(rs.getDate(10));
			
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td><A HREF="/jcjj/jjddcl/wjdj/WjdjJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank">家具完结</A></td>
				<td><A HREF="/jcjj/jjdd/ViewJc_jjdd.jsp?ddbh=<%=ddbh%>" target="_blank"><%=ddbh%></A></td>
				<td><%=clztmc%></td>
				<td><%=xmzy%></td>
				<td><%=clgw%></td>
				<td><%=ztjjgw%></td>
				<td><%=pdgc%></td>
				<td><%=htrq%></td>
				<td><%=zqzjhze%></td>
				<td><%=zjhze%></td>
				<td><%=lrsj%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();
	}

		%>
		</table>
		<%
	}
%>

		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right"><font color="#FF0000">*</font>家居完结标志</td>
              <td colspan="3"><input name="jjwjbz" type="radio" value="Y" checked>
              家居完结，<font color="#0000CC"><strong>注意:完结后不能再修改集成家居订单</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000FF">录入人</font>              </td>
              <td width="33%"> 
                <input type="text" name="jjwjr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="16%" align="right"> 
                <font color="#FF0000">*</font><font color="#0000FF">录入时间</font>              </td>
              <td width="34%"> 
                <input type="text" name="jjwjsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)"></td>
            </tr>
        </table>
</form>

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
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

