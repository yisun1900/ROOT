<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ckbh=null;
String lrr=null;
String lrsj=null;
String ssfgs=null;
String lrbm=null;
String bz=null;
String tzph=request.getParameter("tzph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="SELECT tzph,ckmc ckbh,lrr,lrsj,a.dwmc ssfgs,b.dwmc lrbm,jxc_hjtzjl.bz bz  ";
	ls_sql+=" FROM jxc_hjtzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where jxc_hjtzjl.ckbh=jxc_ckmc.ckbh and jxc_hjtzjl.ssfgs=a.dwbh and jxc_hjtzjl.lrbm=b.dwbh ";
	ls_sql+=" and tzph='"+tzph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tzph=cf.fillNull(rs.getString("tzph"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
    调整批号  </td>
  <td width="35%"> 
    <%=tzph%>  </td>
  <td align="right" width="15%">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    仓库编号  </td>
  <td width="35%"> 
    <%=ckbh%>  </td>
  <td align="right" width="15%"> 
    调整人  </td>
  <td width="35%"> 
    <%=lrr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    调整日期  </td>
  <td width="35%"> 
    <%=lrsj%>  </td>
  <td align="right" width="15%"> 
    所属分公司  </td>
  <td width="35%"> 
    <%=ssfgs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属部门  </td>
  <td width="35%"> 
    <%=lrbm%>  </td>
  <td align="right" width="15%"> 
    备注  </td>
  <td width="35%"> 
    <%=bz%>  </td>
</tr>
</table>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="select tzxh,clbm,clmc,ppmc,xh,nbbm,scph,tzsl,ylsh,a.hjmc yhjbh,b.hjmc xhjbh,yhwbh,xlsh,xhwbh";
	ls_sql+=" FROM jxc_hjtzmx,jxc_hjmc a,jxc_hjmc b ";
	ls_sql+=" where jxc_hjtzmx.yhjbh=a.hjbh(+) and jxc_hjtzmx.xhjbh=b.hjbh(+)";
	ls_sql+=" and tzph='"+tzph+"'";
	ls_sql+=" order by tzxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);

%>

<CENTER >
&nbsp;<br>
 调整明细
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="7%">材料编码</td>
	<td  width="10%">材料名称</td>
	<td  width="7%">子品牌</td>
	<td  width="10%">型号</td>
	<td  width="7%">内部编码</td>
	<td  width="7%">生产批号</td>
	<td  width="5%">调整数量</td>
	<td  width="7%">原流水号</td>
	<td  width="9%">原货架</td>
	<td  width="9%">新货架</td>
	<td  width="6%">原货位</td>
	<td  width="7%">新流水号</td>
	<td  width="6%">新货位</td>

</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
%> 

</body>
</html>
