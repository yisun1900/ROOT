<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

String pdph=null;
String dqbm=null;
String ckbh=null;
String pdzt=null;
String pdr=null;
String pdrssbm=null;
String pdrssfgs=null;
String pdsj=null;
String bz=null;
String wherepdph=null;
wherepdph=cf.GB2Uni(request.getParameter("pdph"));
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
	ls_sql+=" and (pdph="+wherepdph+") ";
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
</body>
</html>

<%
	String ls_sql2=null;
	String wheresql2=cf.GB2Uni(request.getParameter("pdph"));
	ls_sql2=" SELECT pdph,dqmc,ckmc,clbm,clmc,xh,gg,nbbm,kczcpsl,kcccpsl,kcbfpsl,pdzcpsl,pdccpsl,pdbfpsl,zcppdcyl,pdzcyl,DECODE(pdjg,'1','<font color=blue>盘盈</font>','2','<font color=red>盘亏</font>','3','盘平') pdjg ";
	ls_sql2+=" from  jxc_kcpdmx,dm_dqbm,jxc_ckmc ";
	ls_sql2+=" where jxc_kcpdmx.dqbm=dm_dqbm.dqbm and jxc_kcpdmx.ckbh=jxc_ckmc.ckbh ";
    ls_sql2+=" and (pdph="+wheresql2+") ";
	ls_sql2+=" order by pdph,dqmc,ckmc ";
    pageObj.sql=ls_sql2;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("pdph","1");//列参数对象加入Hash表
	spanColHash.put("ckmc","1");//列参数对象加入Hash表
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">批号</td>
	<td  width="2%">地区</td>
	<td  width="3%">仓库</td>
	<td  width="4%">材料编码</td>
	<td  width="12%">材料名称</td>
	<td  width="6%">型号</td>
	<td  width="6%">规格</td>
	<td  width="6%">内部编码</td>
	<td  width="3%">库存正常品数量</td>
	<td  width="3%">库存残次品数量</td>
	<td  width="3%">库存报废品数量</td>
	<td  width="3%">盘点正常品数量</td>
	<td  width="3%">盘点残次品数量</td>
	<td  width="3%">盘点报废品数量</td>
	<td  width="3%">正常品盘点差异量</td>
	<td  width="3%">盘点总差异量</td>
	<td  width="6%">盘点结果</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>