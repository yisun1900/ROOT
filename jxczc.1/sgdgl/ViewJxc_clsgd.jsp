<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jxc_clsgd_sgph=null;
String jxc_clsgd_sglb=null;
String sq_dwxx_dwmc=null;
String jxc_clsgd_sgr=null;
String jxc_clsgd_sgrq=null;
String jxc_clsgd_sgzsl=null;
String jxc_clsgd_sgzje=null;
String jxc_clsgd_psfs=null;
String jxc_clsgd_jhshsj=null;
String jxc_clsgd_shr=null;
String jxc_clsgd_shrq=null;
String jxc_clsgd_shyj=null;
String jxc_clsgd_sfsk=null;
String jxc_clsgd_skqrr=null;
String jxc_clsgd_skqrsj=null;
String jxc_clsgd_sfzcgd=null;
String jxc_clsgd_ckph=null;
String jxc_clsgd_rkph=null;
String jxc_clsgd_sgdzt=null;
String jxc_clsgd_lrr=null;
String jxc_clsgd_lrsj=null;
String jxc_clsgd_ssbm=null;
String jxc_clsgd_nian=null;
String jxc_clsgd_bz=null;
String sgph=null;
sgph=cf.GB2Uni(request.getParameter("sgph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String ssfgs=null;
String dqbm=null;
try {
	conn=cf.getConnection();
	ls_sql="select jxc_clsgd.sgph as jxc_clsgd_sgph,jxc_clsgd.sglb as jxc_clsgd_sglb,jxc_clsgd.ssfgs,sq_dwxx.dwmc as sq_dwxx_dwmc,jxc_clsgd.sgr as jxc_clsgd_sgr,jxc_clsgd.sgrq as jxc_clsgd_sgrq,jxc_clsgd.sgzsl as jxc_clsgd_sgzsl,jxc_clsgd.sgzje as jxc_clsgd_sgzje,jxc_clsgd.psfs as jxc_clsgd_psfs,jxc_clsgd.jhshsj as jxc_clsgd_jhshsj,jxc_clsgd.shr as jxc_clsgd_shr,jxc_clsgd.shrq as jxc_clsgd_shrq,jxc_clsgd.shyj as jxc_clsgd_shyj,jxc_clsgd.sfsk as jxc_clsgd_sfsk,jxc_clsgd.skqrr as jxc_clsgd_skqrr,jxc_clsgd.skqrsj as jxc_clsgd_skqrsj,jxc_clsgd.sfzcgd as jxc_clsgd_sfzcgd,jxc_clsgd.ckph as jxc_clsgd_ckph,jxc_clsgd.rkph as jxc_clsgd_rkph,jxc_clsgd.sgdzt as jxc_clsgd_sgdzt,jxc_clsgd.lrr as jxc_clsgd_lrr,jxc_clsgd.lrsj as jxc_clsgd_lrsj,jxc_clsgd.ssbm as jxc_clsgd_ssbm,jxc_clsgd.nian as jxc_clsgd_nian,jxc_clsgd.bz as jxc_clsgd_bz ";
	ls_sql+=" from  jxc_clsgd,sq_dwxx";
	ls_sql+=" where jxc_clsgd.ssfgs=sq_dwxx.dwbh and  (jxc_clsgd.sgph='"+sgph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jxc_clsgd_sgph=cf.fillNull(rs.getString("jxc_clsgd_sgph"));
		jxc_clsgd_sglb=cf.fillNull(rs.getString("jxc_clsgd_sglb"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jxc_clsgd_sgr=cf.fillNull(rs.getString("jxc_clsgd_sgr"));
		jxc_clsgd_sgrq=cf.fillNull(rs.getDate("jxc_clsgd_sgrq"));
		jxc_clsgd_sgzsl=cf.fillNull(rs.getString("jxc_clsgd_sgzsl"));
		jxc_clsgd_sgzje=cf.fillNull(rs.getString("jxc_clsgd_sgzje"));
		jxc_clsgd_psfs=cf.fillNull(rs.getString("jxc_clsgd_psfs"));
		jxc_clsgd_jhshsj=cf.fillNull(rs.getDate("jxc_clsgd_jhshsj"));
		jxc_clsgd_shr=cf.fillNull(rs.getString("jxc_clsgd_shr"));
		jxc_clsgd_shrq=cf.fillNull(rs.getDate("jxc_clsgd_shrq"));
		jxc_clsgd_shyj=cf.fillNull(rs.getString("jxc_clsgd_shyj"));
		jxc_clsgd_sfsk=cf.fillNull(rs.getString("jxc_clsgd_sfsk"));
		jxc_clsgd_skqrr=cf.fillNull(rs.getString("jxc_clsgd_skqrr"));
		jxc_clsgd_skqrsj=cf.fillNull(rs.getDate("jxc_clsgd_skqrsj"));
		jxc_clsgd_sfzcgd=cf.fillNull(rs.getString("jxc_clsgd_sfzcgd"));
		jxc_clsgd_ckph=cf.fillNull(rs.getString("jxc_clsgd_ckph"));
		jxc_clsgd_rkph=cf.fillNull(rs.getString("jxc_clsgd_rkph"));
		jxc_clsgd_sgdzt=cf.fillNull(rs.getString("jxc_clsgd_sgdzt"));
		jxc_clsgd_lrr=cf.fillNull(rs.getString("jxc_clsgd_lrr"));
		jxc_clsgd_lrsj=cf.fillNull(rs.getString("jxc_clsgd_lrsj"));
		jxc_clsgd_ssbm=cf.fillNull(rs.getString("jxc_clsgd_ssbm"));
		jxc_clsgd_nian=cf.fillNull(rs.getString("jxc_clsgd_nian"));
		jxc_clsgd_bz=cf.fillNull(rs.getString("jxc_clsgd_bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>材料申购单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">材料申购单</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申购批号  </td>
  <td width="32%"> 
    <%=jxc_clsgd_sgph%>  </td>
  <td align="right" width="18%">申购单状态 </td>
  <td width="32%"><%
	cf.selectToken(out,"0+未提交&1+已提交&2+审核通过&5+部分出库&3+已出库&4+已入库",jxc_clsgd_sgdzt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申购公司  </td>
  <td width="32%"> 
    <%=sq_dwxx_dwmc%>  </td>
  <td align="right" width="18%">申购类别</td>
  <td width="32%"><%
	cf.radioToken(out, "0+主材&1+辅材",jxc_clsgd_sglb,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">申购日期</td>
  <td><%=jxc_clsgd_sgrq%></td>
  <td align="right">申购人</td>
  <td><%=jxc_clsgd_sgr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">申购总数量</td>
  <td width="32%"><%=jxc_clsgd_sgzsl%></td>
  <td align="right" width="18%">申购总金额 </td>
  <td width="32%"><%=jxc_clsgd_sgzje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">配送方式</td>
  <td width="32%"><%
	cf.radioToken(out, "1+配送&2+自取&9+其他",jxc_clsgd_psfs,true);
%></td>
  <td align="right" width="18%">计划送货时间</td>
  <td width="32%"><%=jxc_clsgd_jhshsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核人</td>
  <td width="32%"><%=jxc_clsgd_shr%></td>
  <td align="right" width="18%">审核日期 </td>
  <td width="32%"><%=jxc_clsgd_shrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核意见</td>
  <td colspan="3"><%=jxc_clsgd_shyj%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">收款确认人</td>
  <td><%=jxc_clsgd_skqrr%></td>
  <td align="right">收款确认时间 </td>
  <td><%=jxc_clsgd_skqrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否已转采购单</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+转为采购计划&N+未转&M+转为供应商订单",jxc_clsgd_sfzcgd,true);
%></td>
  <td align="right" width="18%">是否收款</td>
  <td width="32%"><%
	cf.radioToken(out, "Y+已收款&N+未收款",jxc_clsgd_sfsk,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    出库批号  </td>
  <td width="32%"> 
    <%=jxc_clsgd_ckph%>  </td>
  <td align="right" width="18%"> 
    入库批号  </td>
  <td width="32%"> 
    <%=jxc_clsgd_rkph%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td>
  <td width="32%"><%=jxc_clsgd_lrr%></td>
  <td align="right" width="18%">录入时间</td>
  <td width="32%"><%=jxc_clsgd_lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td>
  <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",jxc_clsgd_ssbm,true);
%></td>
  <td align="right" width="18%">年</td>
  <td width="32%"><%=jxc_clsgd_nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注 </td>
  <td colspan="3"><%=jxc_clsgd_bz%></td>
  </tr>
</table>

<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">材料编码</td>
	<td  width="5%">内部编码</td>
	<td  width="9%">材料名称</td>
	<td  width="5%">型号</td>
	<td  width="6%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="4%">最小起订量</td>
	<td  width="4%">申购价格</td>
	<td  width="4%">申购数量</td>
	<td  width="4%">申购金额</td>
	<td  width="5%">审核价格</td>
	<td  width="4%">审核数量</td>
	<td  width="4%">审核后金额</td>
	<td  width="4%">出库数量</td>
	<td  width="7%">子品牌</td>
	<td  width="11%">供应商</td>
	<td  width="7%">材料大类</td>
	<td  width="7%">材料小类</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jxc_clsgmx.sgxh,jxc_clsgmx.clbm,jxc_clsgmx.nbbm,jxc_clsgmx.clmc,jxc_clsgmx.xh,jxc_clsgmx.gg,jxc_clsgmx.jldwbm,TO_CHAR(zxqdl),TO_CHAR(jxc_clsgmx.sgjg),jxc_clsgmx.sgsl,jxc_clsgmx.sgje,TO_CHAR(jxc_clsgmx.shjg),jxc_clsgmx.shsl,jxc_clsgmx.shje,jxc_clsgmx.ycksl";
	ls_sql+=" ";
	ls_sql+=" ,jxc_clsgmx.ppmc,jxc_clsgmx.gysmc,jxc_clsgmx.cldlbm,jxc_clsgmx.clxlbm";
	ls_sql+=" FROM jxc_clsgmx,jxc_cljgb ";
	ls_sql+=" where jxc_clsgmx.sgph='"+sgph+"' ";
	ls_sql+=" and  jxc_cljgb.dqbm='"+dqbm+"'";
	ls_sql+=" and  jxc_cljgb.clbm=jxc_clsgmx.clbm";
	ls_sql+=" order by jxc_clsgmx.sgxh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>



</body>
</html>
