<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String gtmc=null;
String jjazwz=null;
String guige=null;
String jjlx=null;
String bcpp=null;
String bclx=null;
String bcys=null;
double bcbfje=0;
double pjbfje=0;
double zj=0;
double zqbcbfje=0;
double zqpjbfje=0;
double zqzj=0;
String bz=null;
String gtxh=null;
gtxh=cf.GB2Uni(request.getParameter("gtxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj,bz ";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		gtmc=cf.fillNull(rs.getString("gtmc"));
		jjazwz=cf.fillNull(rs.getString("jjazwz"));
		guige=cf.fillHtml(rs.getString("guige"));
		jjlx=cf.fillHtml(rs.getString("jjlx"));
		bcpp=cf.fillNull(rs.getString("bcpp"));
		bclx=cf.fillNull(rs.getString("bclx"));
		bcys=cf.fillNull(rs.getString("bcys"));
		bcbfje=rs.getDouble("bcbfje");
		pjbfje=rs.getDouble("pjbfje");
		zj=rs.getDouble("zj");
		zqbcbfje=rs.getDouble("zqbcbfje");
		zqpjbfje=rs.getDouble("zqpjbfje");
		zqzj=rs.getDouble("zqzj");
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center"><%=gtmc%></div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> 柜体序号 </td>
    <td width="32%"> <%=gtxh%> </td>
    <td align="right" width="18%"> 订单编号 </td>
    <td width="32%"> <%=ddbh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">安装位置</td>
    <td><%=jjazwz%></td>
    <td align="right">家具系列</td>
    <td><%=jjlx%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> 规格 </td>
    <td width="32%"> <%=guige%> </td>
    <td align="right" width="18%">板材颜色</td>
    <td width="32%"><%=bcys%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%"> 板材品牌 </td>
    <td width="32%"> <%=bcpp%> </td>
    <td align="right" width="18%">板材类型</td>
    <td width="32%"><%=bclx%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>板材部分金额－折前</strong></td>
    <td><%=zqbcbfje%></td>
    <td align="right"><span class="STYLE1">板材部分金额－折后</span></td>
    <td><%=bcbfje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>配件部分金额－折前</strong></td>
    <td><%=zqpjbfje%></td>
    <td align="right"><span class="STYLE1">配件部分金额－折后</span></td>
    <td><%=pjbfje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>总价－折前</strong></td>
    <td><%=zqzj%></td>
    <td align="right"><span class="STYLE1">总价－折后</span></td>
    <td><%=zj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">备注 </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">板件名称</td>
	<td  width="17%">板材类型</td>
	<td  width="6%">板材厚度</td>
	<td  width="9%">长*宽(mm)</td>
	<td  width="6%">数量</td>
	<td  width="6%"><strong>折前单价</strong></td>
	<td  width="6%"><span class="STYLE1">折后单价</span></td>
	<td  width="9%"><strong>折前金额</strong></td>
	<td  width="9%"><span class="STYLE1">折后金额</span></td>
	<td  width="22%">备注</td>
</tr>
<%
	ls_sql="SELECT bjmc,bcpp,TO_CHAR(bchd),cd||'*'||kd,sl,TO_CHAR(bzdj),TO_CHAR(khdj),zqje,je,bz  ";
	ls_sql+=" FROM jc_gtbjmx  ";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ls_sql+=" order by bjxh";

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="15%">配件名称</td>
	<td  width="11%">型号</td>
	<td  width="11%">规格</td>
	<td  width="7%">计量单位</td>
	<td  width="5%">数量</td>
	<td  width="7%"><strong>折前单价</strong></td>
	<td  width="7%"><span class="STYLE1">折后单价</span></td>
	<td  width="9%"><strong>折前金额</strong></td>
	<td  width="9%"><span class="STYLE1">折后金额</span></td>
	<td  width="19%">备注</td>
</tr>
<%
	ls_sql="SELECT gtpjmc,xinghao,guige,jldwmc,sl,TO_CHAR(bzdj),TO_CHAR(khdj),zqje,je,bz  ";
	ls_sql+=" FROM jc_gtpjmx,jdm_jldwbm  ";
	ls_sql+=" where jc_gtpjmx.jldwbm=jdm_jldwbm.jldwbm(+) and jc_gtpjmx.gtxh='"+gtxh+"'";
	ls_sql+=" order by pjxh";

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
