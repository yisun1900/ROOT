<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>打印开工证</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String zgsmc=null;


String khbh=request.getParameter("khbh");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String qye=null;
String wdzgce=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String bzdh=null;
String cxhdmc=null;
String dwmc=null;
String kgrq=null;
String jgrq=null;
String bjjbmc=null;
double clf=0;
double sge=0;
double sfke=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="SELECT sfke,clf,sge,khxm,lxfs,fwdz,hth,qye,wdzgce,sjs,zjxm,sq_dwxx.dwmc dm,crm_khxx.sgd,sgdmc,sgbz,cxhdmc,kgrq,jgrq,bjjbmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,jc_cxhd,bdm_bjjbbm";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdbm(+) and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfke=rs.getDouble("sfke");
		clf=rs.getDouble("clf");
		sge=rs.getDouble("sge");
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		hth=cf.fillHtml(rs.getString("hth"));
		qye=cf.fillHtml(rs.getString("qye"));
		wdzgce=cf.fillHtml(rs.getString("wdzgce"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		dwmc=cf.fillHtml(rs.getString("dm"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		cxhdmc=cf.fillHtml(rs.getString("cxhdmc"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		bjjbmc=cf.fillHtml(rs.getString("bjjbmc"));
	}
	rs.close();
	ps.close();

	bzdh="&nbsp;";
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+sgd+"' and yhmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillHtml(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select csz from sq_xtcsb";
	ls_sql+=" where csbm='gsmc' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zgsmc=cf.fillHtml(rs.getString(1));
	}
	rs.close();
	ps.close();

%>
<body bgcolor="#FFFFFF" style='FONT-SIZE: 14px'>
<table width="100%" border="0">
  <tr valign="top"> 
    <td colspan="3" height="27"> 
      <div align="center"><b><font size="5"><%=zgsmc%>工程开工证</font></b></div>
    </td>
  </tr>
  <tr> 
    <td width="25%"> 
      <div align="left"><%=cf.today("YYYY")%>年<%=cf.today("MM")%>月<%=cf.today("DD")%>日 </div>
    </td>
    <td width="43%">指定材料商： </td>
    <td width="32%"> 指定区域： </td>
  </tr>
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td width="11%" height="31" align="right"><b>姓名(电话)</b></td>
    <td colspan="2" height="31"><%=khxm%>(<%=lxfs%>)</td>
    <td width="10%" height="31" align="right"><b>工程地址</b></td>
    <td colspan="3" height="31"><%=fwdz%></td>
    <td width="8%" height="31" align="right"><b>优惠活动</b></td>
    <td colspan="2" height="31"><%=cxhdmc%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>合同工期</b></td>
    <td colspan="3" height="31"><%=kgrq%>(开工)<b> --- </b><%=jgrq%>(竣工)</td>
    <td width="10%" height="31" align="right"><b>档案号</b></td>
    <td width="9%" height="31"><%=hth%></td>
    <td width="10%" height="31" align="right"><b>原报价</b></td>
    <td width="8%" height="31"><%=wdzgce%></td>
    <td width="10%" height="31" align="right"><b>签约额</b></td>
    <td width="11%" height="31"><%=qye%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>店面(设计师)</b></td>
    <td colspan="3" height="31"><%=dwmc%>(<%=sjs%>)</td>
    <td width="10%" height="31" align="right"><b>质检员</b></td>
    <td width="9%" height="31"><%=zjxm%></td>
    <td width="10%" height="31" align="right"><b>施工额</b></td>
    <td width="8%" height="31"><%=sge%></td>
    <td width="10%" height="31" align="right"><b>可用材料款</b></td>
    <td width="11%" height="31"><%=clf%></td>
  </tr>
  <tr> 
    <td width="11%" height="31" align="right"><b>班长(电话)</b></td>
    <td colspan="3" height="31"><%=sgbz%>(<%=bzdh%>)</td>
    <td width="10%" height="31" align="right"><b>施工队长</b></td>
    <td width="9%" height="31"><%=sgdmc%></td>
    <td width="10%" height="31" align="right"><b>报价级别</b></td>
    <td height="31"><%=bjjbmc%></td>
    <td align="right" height="31"><b>首期款情况</b></td>
    <td height="31"><%=sfke%></td>
  </tr>
</table>

<div align="center"><b>**材料领用明细**</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr align="center"> 
    <td width="12%">开单日期</td>
    <td width="8%">配送材料金额</td>
    <td width="9%">可用材料款余额</td>
    <td width="6%">经办人</td>
    <td width="15%">经办单位</td>
    <td width="12%">开单日期</td>
    <td width="8%">配送材料金额</td>
    <td width="9%">可用材料款余额</td>
    <td width="6%">经办人</td>
    <td width="15%">经办单位</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
  <tr> 
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
    <td width="12%" height="29" align="right">年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</td>
    <td width="8%" height="29">&nbsp;</td>
    <td width="9%" height="29">&nbsp;</td>
    <td width="6%" height="29">&nbsp;</td>
    <td width="15%" height="29">&nbsp;</td>
  </tr>
</table>

<div align="center"><b>**部分项目工料分析明细**</b></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
  <tr align="center"> 
    <td width="3%">序号</td>
    <td width="8%">项目编号</td>
    <td width="23%">项目名称</td>
    <td width="6%">工程量</td>
    <td width="25%">材料名称</td>
    <td width="13%">品牌（型号规格）</td>
    <td width="8%">最低用量</td>
    <td width="14%">备注</td>
  </tr>

<%
	int i=0;


	//输出项目明细

		String xmbh=null;
		String xmmc=null;
		double gcl=0;

		String glmc=null;
		String pp=null;
		String xhgg=null;
		String jldwmc=null;
		double dj=0;
		double xhl=0;
		double dxclf=0;


		double xjxhl=0;
		double xjclf=0;

		int rowsl=0;
		int row=0;

		ls_sql="SELECT bj_bjxmmx.xmbh,bj_bjxmmx.xmmc,sum(bj_gclmx.sl) gcl";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
		ls_sql+=" where bj_bjxmmx.khbh=bj_gclmx.khbh and  bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" group by bj_bjxmmx.xmbh,bj_bjxmmx.xmmc";
		ls_sql+=" order by bj_bjxmmx.xmbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			xmbh=cf.fillNull(rs.getString("xmbh"));
			xmmc=cf.fillHtml(rs.getString("xmmc"));
			gcl=rs.getDouble("gcl");


			ls_sql="SELECT count(*) rowsl";
			ls_sql+=" FROM bj_khglfxb  ";
//			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"' and bj_khglfxb.glflbm='1'";//材料费
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"'";//材料费
	//		out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				rowsl=rs1.getInt("rowsl");

			}
			rs1.close();
			ps1.close();

			ls_sql="SELECT bj_khglfxb.glbxh,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,jdm_jldwbm.jldwmc,bj_khglfxb.dj,sum(bj_khglfxb.xhl*"+gcl+") xhl,sum(bj_khglfxb.xhl*"+gcl+"*bj_khglfxb.dj) clf ";
			ls_sql+=" FROM bj_khglfxb,jdm_jldwbm  ";
//			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"' and bj_khglfxb.glflbm='1'";//材料费
			ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and  bj_khglfxb.xmbh='"+xmbh+"'";//材料费
			ls_sql+=" and bj_khglfxb.jldwbm=jdm_jldwbm.jldwbm(+)";
			ls_sql+=" group by bj_khglfxb.glbxh,bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg,jdm_jldwbm.jldwmc,bj_khglfxb.dj";
			ls_sql+=" order by bj_khglfxb.glmc,bj_khglfxb.pp,bj_khglfxb.xhgg";
	//		out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				glmc=cf.fillNull(rs1.getString("glmc"));
				pp=cf.fillNull(rs1.getString("pp"));
				xhgg=cf.fillNull(rs1.getString("xhgg"));
				jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

				dj=rs1.getDouble("dj");

				xhl=rs1.getDouble("xhl");
				dxclf=rs1.getDouble("clf");

				xjxhl+=xhl;
				xjclf+=dxclf;

				row++;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td ><%=row%></td>
					<td rowspan="<%=rowsl%>"><%=xmbh%></td>
					<td rowspan="<%=rowsl%>"><%=xmmc%></td>
					<td rowspan="<%=rowsl%>"><%=gcl%></td>
					<td><%=glmc%></td>
					<td><%=pp+"（"+xhgg+"）"%></td>
					<td><%=cf.formatDouble(xhl)%><%=jldwmc%></td>
					<td>&nbsp;</td>
				  </tr>
				<%
			}

			while (rs1.next())
			{
				glmc=cf.fillNull(rs1.getString("glmc"));
				pp=cf.fillNull(rs1.getString("pp"));
				xhgg=cf.fillNull(rs1.getString("xhgg"));
				jldwmc=cf.fillHtml(rs1.getString("jldwmc"));

				dj=rs1.getDouble("dj");

				xhl=rs1.getDouble("xhl");
				dxclf=rs1.getDouble("clf");

				xjxhl+=xhl;
				xjclf+=dxclf;

				row++;

				//输出每行数据
				%> 
				  <tr bgcolor="#FFFFFF" align="center"> 
					<td ><%=row%></td>
					<td><%=glmc%></td>
					<td><%=pp+"（"+xhgg+"）"%></td>
					<td><%=cf.formatDouble(xhl)%><%=jldwmc%></td>
					<td>&nbsp;</td>
				  </tr>
				<%
			}
			rs1.close();
			ps1.close();
		
		
		
		}
		rs.close();
		ps.close();

	//输出小计
	%> 
</table>


<table border="0" width="100%" cellspacing="1" cellpadding="1"  style='FONT-SIZE: 14px'>
  <tr> 
    <td height="43"> 
      <div align="center">财务签字：</div>
    </td>
    <td height="43"> 
      <div align="center">制单人：</div>
    </td>
  </tr>
</table>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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