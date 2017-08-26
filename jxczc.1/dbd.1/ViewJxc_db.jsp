<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String dbcllx=null;
String dbyy=null;
String dcdq=null;
String dcgs=null;
String drdq=null;
String drgs=null;
String jgzyk=null;
String djck=null;
String shr=null;
String shrq=null;
String shyj=null;
String dbdzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String nian=null;
String bz=null;
String dbzsl=null;
String dbph=null;
dbph=cf.GB2Uni(request.getParameter("dbph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select dbzsl,jxc_db.dbcllx as dbcllx,jxc_db.dbyy,d.dqmc as dcdq,a.dwmc as dcgs,e.dqmc as drdq,b.dwmc as drgs,DECODE(jxc_db.jgzyk,'N','不经过','Y','经过') as jgzyk,ckmc as djck,jxc_db.shr as shr,jxc_db.shrq as shrq,jxc_db.shyj as shyj,jxc_db.dbdzt as dbdzt,jxc_db.lrr as lrr,jxc_db.lrsj as lrsj,c.dwmc as lrbm,jxc_db.nian as nian,jxc_db.bz as bz ";
	ls_sql+=" from  jxc_db,sq_dwxx a,sq_dwxx b,sq_dwxx c,dm_dqbm d,dm_dqbm e,jxc_ckmc";
	ls_sql+=" where jxc_db.dcgs=a.dwbh(+) and jxc_db.drgs=b.dwbh(+) and jxc_db.lrbm=c.dwbh(+)  ";
    ls_sql+=" and jxc_db.dcdq=d.dqbm(+) and jxc_db.drdq=e.dqbm(+)";
    ls_sql+=" and jxc_db.djck=jxc_ckmc.ckbh(+) ";
	ls_sql+=" and jxc_db.dbph='"+dbph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dbzsl=cf.fillNull(rs.getString("dbzsl"));
		dbcllx=cf.fillNull(rs.getString("dbcllx"));
		dbyy=cf.fillNull(rs.getString("dbyy"));
		dcdq=cf.fillNull(rs.getString("dcdq"));
		dcgs=cf.fillNull(rs.getString("dcgs"));
		drdq=cf.fillNull(rs.getString("drdq"));
		drgs=cf.fillNull(rs.getString("drgs"));
		jgzyk=cf.fillNull(rs.getString("jgzyk"));
		djck=cf.fillNull(rs.getString("djck"));
		shr=cf.fillNull(rs.getString("shr"));
		shrq=cf.fillNull(rs.getDate("shrq"));
		shyj=cf.fillNull(rs.getString("shyj"));
		dbdzt=cf.fillNull(rs.getString("dbdzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		nian=cf.fillNull(rs.getString("nian"));
		bz=cf.fillNull(rs.getString("bz"));
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
<div align="center">调拨单</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    调拨批号  </td>
  <td width="32%"> 
    <%=dbph%>  </td>
  <td align="right" width="18%">调拨单状态 </td>
  <td width="32%"><%
	cf.selectToken(out,"0+未提交&1+提交等待审核&2+审核通过等待出库&3+已出库等待入库&7+审核未通过&9+入库完成",dbdzt,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">调拨材料类型 </td>
  <td><%
	cf.radioToken(out, "0+主材&1+辅材",dbcllx,true);
%></td>
  <td align="right">调拨原因 </td>
  <td><%
	cf.selectToken(out,"0+集团调货&1+退货调拨",dbyy,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">调出地区 </td>
  <td width="32%"><%=dcdq%></td>
  <td align="right" width="18%">调出公司 </td>
  <td width="32%"><%=dcgs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">调入地区</td>
  <td width="32%"><%=drdq%></td>
  <td align="right" width="18%">调入公司</td>
  <td width="32%"><%=drgs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">调拨总数量</td>
  <td><%=dbzsl%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否经过总部中央库 </td>
  <td width="32%"><%
	cf.radioToken(out, "N+不经过&Y+经过",jgzyk,true);
%></td>
  <td align="right" width="18%">调经仓库 </td>
  <td width="32%"><%=djck%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核人 </td>
  <td width="32%"><%=shr%></td>
  <td align="right" width="18%">审核日期 </td>
  <td width="32%"><%=shrq%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">审核意见</td>
  <td colspan="3"><%=shyj%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入人 </td>
  <td><%=lrr%> </td>
  <td align="right">录入时间 </td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td>
  <td width="32%"><%=lrbm%></td>
  <td align="right" width="18%">年 </td>
  <td width="32%"><%=nian%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td>
  <td colspan="3"><%=bz%></td>
  </tr>
</table>

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="7%">材料编码</td>
	<td  width="6%">内部编码</td>
	<td  width="12%">材料名称</td>
	<td  width="9%">型号</td>
	<td  width="9%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">调拨数量</td>
	<td  width="4%">出库数量</td>
	<td  width="5%">销售方式</td>
	<td  width="9%">子品牌</td>
	<td  width="13%">供应商</td>
	<td  width="7%">材料大类</td>
	<td  width="9%">材料小类</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jxc_dbmx.dbxh,jxc_dbmx.clbm,jxc_dbmx.nbbm,jxc_dbmx.clmc,jxc_dbmx.xh,jxc_dbmx.gg,jxc_dbmx.jldwbm,jxc_dbmx.dbsl,jxc_dbmx.cksl";
	ls_sql+=" ,DECODE(jxc_dbmx.xsfs,'1','代销品','2','现货','3','期货销售','4','可负库存') xsfsmc ";
	ls_sql+=" ,jxc_dbmx.ppmc,jxc_dbmx.gysmc,jxc_dbmx.cldlbm,jxc_dbmx.clxlbm";
	ls_sql+=" FROM jxc_dbmx ";
	ls_sql+=" where jxc_dbmx.dbph='"+dbph+"' ";
	ls_sql+=" order by jxc_dbmx.dbxh ";
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
