<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dwmc=null;

String cxhdmc=null;
String fgsbh=null;
int dj=0;
double fxgck=0;
double fxzck=0;

double zdzk=0;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
double qtsfxmzk=0;

double clfzk=10;
double zcfzk=10;
double rgfzk=10;
double ysfzk=10;
double jxfzk=10;
double shfzk=10;
double qtfzk=10;

String zjxzklx=null;
String sfybfxmzk=null;

String hdlx=null;
String kgxqthd=null;
String zklx="";
String bz=null;
String fjmc=null;
String jsbz=null;
String spbz=null;


String yxbffydz="";//是否允许部分费用打折  1：允许；9：不允许

double bzjgzk=10;
double mjzjzk=10;
double zcsjzk=10;
double zcclzk=10;
double zcsfzk=10;
double zcjmzk=10;
double ddzccjzk=10;
double ddzcclzk=10;
double tcwgczk=10;
double tcgcclzk=10;

double gczjxfzk=10;
double glfzjxzk=10;
double sjzjxzk=10;
double sjfzjxzk=10;
double qtsfxmzjxzk=10;


String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select cxhdmc,fgsbh,dj,fxgck,fxzck,zdzk,gcfzk,glfzk,hdlx,kgxqthd,zklx,bz,sjzk,sjfzk,qtsfxmzk";
	ls_sql+=" ,zjxzklx,sfybfxmzk,fjmc,DECODE(jsbz,'N','未结束','Y','结束' ) jsbz,DECODE(spbz,'N','未审批','Y','审批') spbz";
	ls_sql+=" from  jc_cxhd";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jsbz=cf.fillNull(rs.getString("jsbz"));
		spbz=cf.fillNull(rs.getString("spbz"));
		fjmc=cf.fillNull(rs.getString("fjmc"));
		zjxzklx=cf.fillNull(rs.getString("zjxzklx"));
		sfybfxmzk=cf.fillNull(rs.getString("sfybfxmzk"));

		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dj=rs.getInt("dj");
		fxgck=rs.getDouble("fxgck");
		fxzck=rs.getDouble("fxzck");
		zdzk=rs.getDouble("zdzk");
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		qtsfxmzk=rs.getDouble("qtsfxmzk");
		hdlx=cf.fillNull(rs.getString("hdlx"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
		zklx=cf.fillNull(rs.getString("zklx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select clfzk,zcfzk,rgfzk,ysfzk,jxfzk,shfzk,qtfzk ";
	ls_sql+=" from  jc_cxhdbffyzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clfzk=rs.getDouble("clfzk");
		zcfzk=rs.getDouble("zcfzk");
		rgfzk=rs.getDouble("rgfzk");
		ysfzk=rs.getDouble("ysfzk");
		jxfzk=rs.getDouble("jxfzk");
		shfzk=rs.getDouble("shfzk");
		qtfzk=rs.getDouble("qtfzk");
	}
	rs.close();
	ps.close();

	ls_sql="select bzjgzk,mjzjzk,zcsjzk,zcclzk,zcsfzk,zcjmzk,ddzccjzk,ddzcclzk,tcwgczk,tcgcclzk ";
	ls_sql+=" from  jc_cxhdtczk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzjgzk=rs.getDouble("bzjgzk");
		mjzjzk=rs.getDouble("mjzjzk");
		zcsjzk=rs.getDouble("zcsjzk");
		zcclzk=rs.getDouble("zcclzk");
		zcsfzk=rs.getDouble("zcsfzk");
		zcjmzk=rs.getDouble("zcjmzk");
		ddzccjzk=rs.getDouble("ddzccjzk");
		ddzcclzk=rs.getDouble("ddzcclzk");
		tcwgczk=rs.getDouble("tcwgczk");
		tcgcclzk=rs.getDouble("tcgcclzk");
	}
	rs.close();
	ps.close();

	ls_sql="select gczjxfzk,glfzjxzk,sjzjxzk,sjfzjxzk,qtsfxmzjxzk ";
	ls_sql+=" from  jc_cxhdzjxzk";
	ls_sql+=" where  (cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gczjxfzk=rs.getDouble("gczjxfzk");
		glfzjxzk=rs.getDouble("glfzjxzk");
		sjzjxzk=rs.getDouble("sjzjxzk");
		sjfzjxzk=rs.getDouble("sjfzjxzk");
		qtsfxmzjxzk=rs.getDouble("qtsfxmzjxzk");
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dwmc";
	ls_sql+=" FROM sq_dwxx  ";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	String xqmc="";
	ls_sql="SELECT xqmc";
	ls_sql+=" FROM jc_cxhdxq  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  xqmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xqmc+=cf.fillNull(rs.getString("xqmc"))+"、";
	}
	rs.close();
	ps.close();

	String dmmc="";
	ls_sql="SELECT dwmc";
	ls_sql+=" FROM jc_cxhddm,sq_dwxx  ";
	ls_sql+=" where jc_cxhddm.dwbh=sq_dwxx.dwbh and cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  dwmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		dmmc+=cf.fillNull(rs.getString("dwmc"))+"、";
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 促销活动</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    促销活动编码  </td>
  <td width="32%"> 
    <%=cxhdbm%>  </td>
  <td align="right" width="18%">分公司 </td>
  <td width="32%"><%=dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">促销活动名称</td>
  <td><%=cxhdmc%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">活动类型</td>
  <td><%
	cf.radioToken(out, "1+无活动&2+公司活动&3+小区活动&4+展会活动",hdlx,true);
%></td>
  <td align="right">是否可共享其它活动</td>
  <td><%
	cf.radioToken(out, "1+不可共享&2+可共享",kgxqthd,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">订金</td>
  <td><%=dj%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right">多倍返现工程款</td>
  <td><%=fxgck%>倍返现</td>
  <td align="right">多倍返现主材款</td>
    <td><%=fxzck%>倍返现</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">附件名称</td>
  <td colspan="3"><A HREF="/yx/cxhd/file/<%=fjmc%>" target="_blank">点击查看：<%=fjmc%></A></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>参加活动小区</strong></td>
  <td colspan="3"><%=xqmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><strong>参加活动店面</strong></td>
  <td colspan="3"><%=dmmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 结束标志 </td>
  <td><%
	cf.radioToken(out, "N+未结束&Y+结束",jsbz,true);
%>  </td>
  <td align="right"> 审批标志 </td>
  <td><%
	cf.radioToken(out, "N+未审批&Y+审批",spbz,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 备注 </td>
  <td colspan="3"><%=bz%> </td>
</tr>
</table>




<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right">折扣类型</td>
  <td width="32%"><%
	cf.radioToken(out, "4+无折扣&1+整单打折&2+单项打折&3+部分费用打折",zklx,true);
%></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">整单折扣</td>
  <td><%=zdzk%></td><td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><p>工程费部分打折</p></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="18%" align="right">工程－辅材费折扣</td>
  <td width="32%"><%=clfzk%></td>
  <td width="18%" align="right">工程－主材费折扣</td>
    <td width="32%"><%=zcfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">工程－人工费折扣</td>
  <td><%=rgfzk%></td>
  <td align="right">工程－运输费折扣</td>
    <td><%=ysfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">工程－机械费折扣</td>
  <td><%=jxfzk%></td>
  <td align="right">工程－损耗费折扣</td>
    <td><%=shfzk%></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">工程－其它费折扣</td>
  <td><%=qtfzk%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFCC">
  <td align="right">增减项折扣类型</td>
  <td>
	
<%
	cf.radioToken(out, "1+同合同&2+独立折扣",zjxzklx,true);
%></td>
  <td align="right">是否有部分项目打折</td>
  <td>
<%
	cf.radioToken(out, "Y+有&N+无",sfybfxmzk,true);
%>

</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">工程费折扣</td>
  <td width="32%"> 
    <%=gcfzk%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    管理费折扣  </td>
  <td width="32%"> 
    <%=glfzk%>  </td>
  <td align="right" width="18%">税金折扣</td>
  <td width="32%"><%=sjzk%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">设计费折扣</td>
  <td><%=sjfzk%></td>
  <td align="right">其它收费项目折扣</td>
  <td><%=qtsfxmzk%></td></tr>
</table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">套餐标准价格折扣</td>
      <td width="32%"><%=bzjgzk%></td>
      <td width="18%" align="right">面积增加金额折扣</td>
      <td width="32%"><%=mjzjzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">主材升级差价折扣</td>
      <td><%=zcsjzk%></td>
      <td align="right">主材超量加价折扣</td>
      <td><%=zcclzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">需收费主材折扣</td>
      <td><%=zcsfzk%></td>
      <td align="right">主材减免折扣</td>
      <td><%=zcjmzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">顶配主材折扣</td>
      <td><%=ddzccjzk%></td>
      <td align="right">选配主材折扣</td>
      <td><%=ddzcclzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">套餐外施工项折扣</td>
      <td><%=tcwgczk%></td>
      <td align="right">工程超量加价折扣</td>
      <td><%=tcgcclzk%></td>
    </tr>
  </table>
<P>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right">工程增减项折扣</td>
      <td width="32%"><%=gczjxfzk%></td>
      <td width="18%" align="right">管理费增减项折扣</td>
      <td width="32%"><%=glfzjxzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">税金增减项折扣</td>
      <td><%=sjzjxzk%></td>
      <td align="right">设计费增减项折扣</td>
      <td><%=sjfzjxzk%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目增减项折扣</td>
      <td><%=qtsfxmzjxzk%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td colspan="3" align="center">部分报价项目折扣</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="38%"><strong>项目分类</strong></td>
  <td width="24%"><strong>折扣</strong></td>
  </tr>
<%
	int row=0;
	String xmflmc=null;
	double zk=0;
	ls_sql="SELECT xmflmc,zk";
	ls_sql+=" FROM jc_hdbfxmdz,bdm_xmflbm  ";
	ls_sql+=" where jc_hdbfxmdz.xmflbm=bdm_xmflbm.xmflbm and cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  jc_hdbfxmdz.xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflmc=cf.fillNull(rs.getString("xmflmc"));
		zk=rs.getDouble("zk");

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=xmflmc%></td>
		  <td><%=zk%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12;" bgcolor="#999999" cellpadding="2" cellspacing="2"  id="bfdz" >
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">活动有效时间</td>
  </tr>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><strong>时间段</strong></td>
		  <td>开始时间(>=)</td>
		  <td>促销结束时间(<=)</td>
		  <td>签单结束时间(<=)</td>
  </tr>
<%
	String kssj=null;
	String cxjssj=null;
	String qdjssj=null;
	row=0;
	ls_sql="SELECT kssj,cxjssj,qdjssj";
	ls_sql+=" FROM jc_cxhdsj  ";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by  kssj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		kssj=cf.fillNull(rs.getDate("kssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		qdjssj=cf.fillNull(rs.getDate("qdjssj"));

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td width="10%"><strong><%=row%></strong></td>
		  <td width="30%"><%=kssj%></td>
		  <td width="30%"><%=cxjssj%></td>
		  <td width="30%"><%=qdjssj%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();

%>
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">多选赠送信息</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="31%"><strong>赠送项目</strong></td>
  <td width="7%"><strong>计量单位</strong></td>
  <td width="9%"><strong>成本单价</strong></td>
  <td width="9%"><strong>市场单价</strong></td>
  <td width="9%"><strong>赠送数量下限</strong></td>
  <td width="9%"><strong>赠送数量上限</strong></td>
  <td width="26%"><strong>备注</strong></td>
  </tr>
<%
	String zsxm=null;
	String jldw=null;
	double cbdj=0;
	double scdj=0;
	String zsslsx=null;
	String zsslxx=null;
	String getbz=null;
	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hdzsxx";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslxx=rs.getString("zsslxx");
		zsslsx=rs.getString("zsslsx");
		getbz=cf.fillHtml(rs.getString("bz"));

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=zsxm%></td>
		  <td><%=jldw%></td>
		  <td><%=cbdj%></td>
		  <td><%=scdj%></td>
		  <td><%=zsslxx%></td>
		  <td><%=zsslsx%></td>
		  <td align="left"><%=getbz%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">单选赠送信息</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="31%"><strong>赠送项目</strong></td>
  <td width="7%"><strong>计量单位</strong></td>
  <td width="9%"><strong>成本单价</strong></td>
  <td width="9%"><strong>市场单价</strong></td>
  <td width="9%"><strong>赠送数量下限</strong></td>
  <td width="9%"><strong>赠送数量上限</strong></td>
  <td width="26%"><strong>备注</strong></td>
  </tr>
<%
	ls_sql="SELECT zsxm,jldw,cbdj,scdj,zsslsx,zsslxx,bz ";
	ls_sql+=" FROM jc_hddxzsxx";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ls_sql+=" order by zsxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zsxm=cf.fillNull(rs.getString("zsxm"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cbdj=rs.getDouble("cbdj");
		scdj=rs.getDouble("scdj");
		zsslxx=rs.getString("zsslxx");
		zsslsx=rs.getString("zsslsx");
		getbz=cf.fillHtml(rs.getString("bz"));

		row++;

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=zsxm%></td>
		  <td><%=jldw%></td>
		  <td><%=cbdj%></td>
		  <td><%=scdj%></td>
		  <td><%=zsslxx%></td>
		  <td><%=zsslsx%></td>
		  <td align="left"><%=getbz%></td>
  </tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>

<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="7" align="center" bgcolor="#FFFFCC">促销活动赠送代金券</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="40%"><strong>代金券赠送方式</strong></td>
  <td width="30%"><strong>赠送固定金额</strong></td>
  <td width="30%"><strong>赠送百分比</strong></td>
  </tr>
<%
	String djjzsfs=null;
	String zsjs=null;
	double zsgdje=0;
	double zsbfb=0;
	ls_sql="SELECT DECODE(djjzsfs,'1','固定金额','2','工程费百分比','3','整单百分比') djjzsfs,DECODE(zsjs,'1','固定金额','2','工程费百分比','3','整单百分比') zsjs";
	ls_sql+=" FROM jc_hddjj";
	ls_sql+=" where cxhdbm='"+cxhdbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		djjzsfs=cf.fillNull(rs.getString("djjzsfs"));
		zsjs=cf.fillNull(rs.getString("zsjs"));

		%>
		<tr align="center" bgcolor="#FFFFFF">
		  <td><%=djjzsfs%></td>
		  <td><%=zsjs%></td>
		  <td><%=zsbfb%>%</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>


<P>

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">业绩系数编码</td>
	<td  width="25%">业绩系数名称</td>
	<td  width="25%">业绩系数</td>
</tr>
<%
	String yjxsbm=null;
	String yjxsmc=null;
	String yjxsstr=null;
	double yjxs=0;

	ls_sql="SELECT yjxsbm,yjxsmc";
	ls_sql+=" FROM jc_cxhdyjxsbm  ";
	ls_sql+=" order by  yjxsbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		yjxsbm=cf.fillNull(rs.getString("yjxsbm"));
		yjxsmc=cf.fillNull(rs.getString("yjxsmc"));

		yjxs=0;
		ls_sql="SELECT yjxs";
		ls_sql+=" FROM jc_cxhdyjxs";
		ls_sql+=" where jc_cxhdyjxs.cxhdbm='"+cxhdbm+"' and yjxsbm='"+yjxsbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yjxs=rs1.getDouble("yjxs");
		}
		rs1.close();
		ps1.close();

		if (yjxs==0)
		{
			yjxsstr="&nbsp;";
		}
		else{
			yjxsstr=""+yjxs;
		}


		%>
		<tr align="center">
			<td><%=yjxsbm%>
			</td>
			<td><%=yjxsmc%></td>
			<td><%=yjxsstr%>
			</td>
		</tr>
		<%

	}
	rs.close();
	ps.close();
%>
</table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
