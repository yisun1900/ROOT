<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bj_clckd_ckdh=null;
String bj_clckd_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_qyrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String bj_clckd_ckzsl=null;
String bj_clckd_ckzje=null;
String bj_clckd_clzt=null;
String bj_clckd_lrr=null;
String bj_clckd_lrsj=null;
String bj_clckd_bz=null;
String bj_clckd_ckr=null;
String bj_clckd_cksj=null;
String ckdh=null;
ckdh=cf.GB2Uni(request.getParameter("ckdh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select bj_clckd.ckdh as bj_clckd_ckdh,bj_clckd.khbh as bj_clckd_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,bj_clckd.ckzsl as bj_clckd_ckzsl,bj_clckd.ckzje as bj_clckd_ckzje,bj_clckd.clzt as bj_clckd_clzt,bj_clckd.lrr as bj_clckd_lrr,bj_clckd.lrsj as bj_clckd_lrsj,bj_clckd.bz as bj_clckd_bz,bj_clckd.ckr as bj_clckd_ckr,bj_clckd.cksj as bj_clckd_cksj ";
	ls_sql+=" from  bj_clckd,crm_khxx";
	ls_sql+=" where bj_clckd.khbh=crm_khxx.khbh and  (bj_clckd.ckdh='"+ckdh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bj_clckd_ckdh=cf.fillNull(rs.getString("bj_clckd_ckdh"));
		bj_clckd_khbh=cf.fillNull(rs.getString("bj_clckd_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		bj_clckd_ckzsl=cf.fillNull(rs.getString("bj_clckd_ckzsl"));
		bj_clckd_ckzje=cf.fillNull(rs.getString("bj_clckd_ckzje"));
		bj_clckd_clzt=cf.fillNull(rs.getString("bj_clckd_clzt"));
		bj_clckd_lrr=cf.fillNull(rs.getString("bj_clckd_lrr"));
		bj_clckd_lrsj=cf.fillNull(rs.getDate("bj_clckd_lrsj"));
		bj_clckd_bz=cf.fillNull(rs.getString("bj_clckd_bz"));
		bj_clckd_ckr=cf.fillNull(rs.getString("bj_clckd_ckr"));
		bj_clckd_cksj=cf.fillNull(rs.getDate("bj_clckd_cksj"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看出库信息（出库单号：<%=bj_clckd_ckdh%>）</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">客户编号 </td>
    <td width="31%"><%=bj_clckd_khbh%> </td>
    <td align="right" width="18%">合同号 </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 客户姓名 </td>
    <td width="31%"> <%=crm_khxx_khxm%> </td>
    <td align="right" width="18%">联系方式 </td>
    <td width="32%"><%=crm_khxx_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 房屋地址 </td>
    <td colspan="3"> <%=crm_khxx_fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 设计师 </td>
    <td width="31%"> <%=crm_khxx_sjs%> </td>
    <td align="right" width="18%"> 签约日期 </td>
    <td width="32%"> <%=crm_khxx_qyrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 施工队 </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
    <td align="right" width="18%"> 质检 </td>
    <td width="32%"> <%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">处理状态</td>
    <td width="31%"><%
	cf.radioToken(out, "1+未审核&2+已审核",bj_clckd_clzt,true);
%></td>
    <td align="right" width="18%">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 出库总数量 </td>
    <td width="31%"> <%=bj_clckd_ckzsl%> </td>
    <td align="right" width="18%"> 出库总金额 </td>
    <td width="32%"> <%=bj_clckd_ckzje%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 出库人 </td>
    <td width="31%"> <%=bj_clckd_ckr%> </td>
    <td align="right" width="18%"> 出库时间 </td>
    <td width="32%"> <%=bj_clckd_cksj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">录入人 </td>
    <td width="31%"><%=bj_clckd_lrr%> </td>
    <td align="right" width="18%">录入时间 </td>
    <td width="32%"><%=bj_clckd_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">备注 </td>
    <td colspan="3"><%=bj_clckd_bz%> </td>
  </tr>
</table>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">物流材料编码</td>
    <td  width="12%">物流材料名称</td>
	<td  width="11%">型号规格</td>
	<td  width="15%">品牌</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">出库数量</td>
	<td  width="7%">出库金额</td>
	<td  width="6%">结算物料编码</td>
	<td  width="14%">结算物料名称</td>
	<td  width="5%">结算计量单位</td>
	<td  width="5%">物流结算计量单位比</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT bj_clckmx.wlbm,bj_clckmx.glmc,bj_clckmx.xhgg,bj_clckmx.pp,a.cljldwmc jldwbm,TO_CHAR(bj_clckmx.dj),bj_clckmx.sl,bj_clckmx.dj*bj_clckmx.sl,jswlbm,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')',''),b.cljldwmc jsjldwbm,bj_clckmx.wljsbz";
	ls_sql+=" FROM bj_clckmx,bdm_cldlbm,bdm_cljldwbm a,bdm_cljldwbm b,bj_jscljgb ";
	ls_sql+=" where bj_clckmx.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_clckmx.jldwbm=a.cljldwbm(+) and bj_clckmx.jsjldwbm=b.cljldwbm(+) and bj_clckmx.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=" and bj_clckmx.ckdh='"+ckdh+"'";
    ls_sql+=" order by bj_clckmx.wlbm";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%>
</table>

</body>
</html>
