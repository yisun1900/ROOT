<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssbm=null;
String pdrssfgs=null;
String pdsj=null;
String bz=null;
String pdph=request.getParameter("pdph");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql=" select pdph,dm_dqbm.dqmc dqbm,ckmc ckbh,DECODE(pdzt,'1','正在盘点','2','盘点结束') pdzt,pdr,a.dwmc pdrssbm,b.dwmc pdrssfgs,pdsj,jxc_kcpdjl.bz bz ";
	ls_sql+=" from jxc_kcpdjl,dm_dqbm,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where jxc_kcpdjl.dqbm=dm_dqbm.dqbm and jxc_kcpdjl.ckbh=jxc_ckmc.ckbh and jxc_kcpdjl.pdrssbm=a.dwbh and  jxc_kcpdjl.pdrssfgs=b.dwbh ";
	ls_sql+=" and (pdph="+pdph+") ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pdph=cf.fillNull(rs.getString("pdph"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		pdzt=cf.fillNull(rs.getString("pdzt"));
		pdr=cf.fillNull(rs.getString("pdr"));
		pdrssbm=cf.fillNull(rs.getString("pdrssbm"));
		pdrssfgs=cf.fillNull(rs.getString("pdrssfgs"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    盘点批号
  </td>
  <td width="35%"> 
    <%=pdph%>
  </td>
  <td align="right" width="15%"> 
    地区编码
  </td>
  <td width="35%"> 
    <%=dqbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    仓库编号
  </td>
  <td width="35%"> 
    <%=ckbh%>
  </td>
  <td align="right" width="15%"> 
    盘点状态
  </td>
  <td width="35%"> 
    <%=pdzt%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    盘点人
  </td>
  <td width="35%"> 
    <%=pdr%>
  </td>
  <td align="right" width="15%"> 
    盘点人所属部门
  </td>
  <td width="35%"> 
    <%=pdrssbm%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    盘点人所属分公司
  </td>
  <td width="35%"> 
    <%=pdrssfgs%>
  </td>
  <td align="right" width="15%"> 
    盘点时间
  </td>
  <td width="35%"> 
    <%=pdsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    备注
  </td>
  <td width="35%" colspan="3"> 
    <%=bz%>
  </td>
</tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="8%">货架</td>
	<td  width="7%">生产批号</td>
	<td  width="7%">生产日期</td>
	<td  width="9%">材料编码</td>
	<td  width="13%">材料名称</td>
	<td  width="10%">型号</td>
	<td  width="10%">规格</td>
	<td  width="8%">品牌</td>
	<td  width="6%">内部编码</td>
	<td  width="5%">库存数量</td>
	<td  width="5%">实际数量</td>
	<td  width="5%">盘点差异量</td>
	<td  width="5%">盘点结果</td>
</tr>
<%
	ls_sql=" SELECT pdxh,hjmc,jxc_kcpdmx.scph,jxc_kcpdmx.scrq,clbm,clmc,xh,gg,ppmc,nbbm,kczcpsl,pdzcpsl,zcppdcyl,DECODE(pdjg,'1','<font color=blue>盘盈</font>','2','<font color=red>盘亏</font>','3','盘平') pdjg ";
	ls_sql+=" from  jxc_kcpdmx,jxc_hjmc ";
	ls_sql+=" where  jxc_kcpdmx.hjbh=jxc_hjmc.hjbh(+) ";
	ls_sql+=" and pdph="+pdph;
	ls_sql+=" order by pdxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>