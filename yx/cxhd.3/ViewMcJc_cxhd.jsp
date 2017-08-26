<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dj=null;
double gcfzk=0;
double glfzk=0;
double sjzk=0;
double sjfzk=0;
String fjmc=null;
String hdlx=null;
String zklx=null;
String jsbz=null;
String spbz=null;
String bz=null;
String kgxqthd=null;


String cxhdmc=null;
String cxhdbm=cf.GB2Uni(request.getParameter("cxhdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cxhd.cxhdbm,jc_cxhd.cxhdmc,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_cxhd.dj as dj,jc_cxhd.gcfzk as gcfzk,jc_cxhd.glfzk as glfzk,jc_cxhd.fjmc as fjmc,jc_cxhd.hdlx as hdlx,jc_cxhd.zklx as zklx,jc_cxhd.jsbz as jsbz,jc_cxhd.spbz as spbz,jc_cxhd.bz as bz,jc_cxhd.sjzk as sjzk,jc_cxhd.sjfzk,jc_cxhd.kgxqthd as kgxqthd ";
	ls_sql+=" from  jc_cxhd,sq_dwxx";
	ls_sql+=" where jc_cxhd.fgsbh=sq_dwxx.dwbh and  (jc_cxhd.cxhdbm='"+cxhdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdmc=cf.fillNull(rs.getString("cxhdmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dj=cf.fillNull(rs.getString("dj"));
		gcfzk=rs.getDouble("gcfzk");
		glfzk=rs.getDouble("glfzk");
		sjzk=rs.getDouble("sjzk");
		sjfzk=rs.getDouble("sjfzk");
		fjmc=cf.fillNull(rs.getString("fjmc"));
		hdlx=cf.fillNull(rs.getString("hdlx"));
		zklx=cf.fillNull(rs.getString("zklx"));
		jsbz=cf.fillNull(rs.getString("jsbz"));
		spbz=cf.fillNull(rs.getString("spbz"));
		bz=cf.fillNull(rs.getString("bz"));
		kgxqthd=cf.fillNull(rs.getString("kgxqthd"));
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
  <td width="32%"><%=sq_dwxx_dwmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">促销活动名称</td>
  <td><%=cxhdmc%></td>
  <td align="right">活动类型</td>
  <td><%
	cf.radioToken(out, "1+无活动&2+公司活动&3+小区活动&4+展会活动",hdlx,true);
%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否可共享其它活动</td>
  <td width="32%"><%
	cf.radioToken(out, "1+不可共享&2+可共享",kgxqthd,true);
%></td>
  <td align="right" width="18%">订金</td>
  <td width="32%"> 
    <%=dj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">附件名称</td>
  <td colspan="3"><A HREF="/jcjj/cxhd/file/<%=fjmc%>" target="_blank">点击查看：<%=fjmc%></A></td>
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
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">活动有效时间</td>
  </tr>
<%
	String kssj=null;
	String cxjssj=null;
	String qdjssj=null;
	int row=0;
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
		<tr bgcolor="#FFFFFF">
		  <td colspan="2" align="center"><strong>时间段：<%=row%></strong></td>
		  <td align="right">开始时间(>=)</td>
		  <td><%=kssj%></td>
		</tr>
		<tr bgcolor="#FFFFFF">
		  <td align="right">促销结束时间(<=)</td>
		  <td><%=cxjssj%></td>
		  <td align="right">签单结束时间(<=)</td>
		  <td><%=qdjssj%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

%>

<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC">活动折扣</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">折扣类型</td>
  <td><%
	cf.radioToken(out, "4+无折扣&1+整单打折&2+单项打折&3+部分费用打折",zklx,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>
<P>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td colspan="3" align="center">部分报价项目折扣</td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td width="38%"><strong>项目分类</strong></td>
  <td width="24%"><strong>折扣</strong></td>
  </tr>
<%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
