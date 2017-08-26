<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

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

<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String ddbh=request.getParameter("ddbh");
%>

<body bgcolor="#FFFFFF">
<div align="center"><b>订单（<%=ddbh%>）柜体信息</b></div>

<%
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
int sl=0;
int zjhsl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select gtxh,ddbh,gtmc,jjazwz,guige,jjlx,bcpp,bclx,bcys,bcbfje,pjbfje,zj,zqbcbfje,zqpjbfje,zqzj,bz,sl,zjhsl ";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by gtxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gtxh=cf.fillNull(rs.getString("gtxh"));
		ddbh=cf.fillNull(rs.getString("ddbh"));
		gtmc=cf.fillNull(rs.getString("gtmc"));
		jjazwz=cf.fillHtml(rs.getString("jjazwz"));
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
		sl=rs.getInt("sl");
		zjhsl=rs.getInt("zjhsl");

		%>
<BR>
<center><b><%=gtmc%>（柜体序号：<%=gtxh%>）（合同数量：<%=sl%>；增减后数量：<%=zjhsl%>）</b></center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 14px'>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="18%">安装位置</td>
    <td width="32%"><%=jjazwz%></td>
    <td align="right" width="18%">家具系列</td>
    <td width="32%"><%=jjlx%></td>
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
    <td width="18%" align="right"><strong>板材部分金额－折前</strong></td> 
    <td width="32%"><%=zqbcbfje%></td>
    <td align="right" width="18%"><span class="STYLE1">板材部分金额－折后</span></td>
    <td width="32%"><%=bcbfje%></td>
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

		<%

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

<P>
<div align="center"><b>（<%=ddbh%>）型材门信息</b></div>
<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="2%" rowspan="2">型材门类型</td>
  <td  width="3%" rowspan="2">型材门名称</td>
  <td  width="2%" rowspan="2">其它收费</td>
  <td  width="3%" rowspan="2"><strong>折前总价</strong></td>
  <td  width="3%" rowspan="2"><span class="STYLE1">折后总价</span></td>
  <td  width="2%" rowspan="2">合同数量</td>
  <td  width="2%" rowspan="2">增减后数量</td>
  <td  width="3%" rowspan="2">安装位置</td>
  <td  width="3%" rowspan="2">高*宽(mm)</td>
  <td  width="6%" rowspan="2" align="left"><strong>推拉门</strong>：边框型号<BR>
	  <strong>吸塑</strong>：刀型<BR>
	  <strong>包覆</strong>：刀型<BR>
    <strong>板材铝门</strong>：门型</td>
  <td  width="3%" rowspan="2">边框颜色</td>
  <td  width="6%" rowspan="2">装饰线条</td>
  <td  width="8%" rowspan="2">产品说明</td>
  <td colspan="6">面板一</td>
  <td colspan="6">面板二</td>
  <td  width="12%" rowspan="2">备注</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">面板1编码</td>
	<td  width="6%" align="left"><strong>推拉门</strong>：材料<BR>
	  <strong>吸塑</strong>：花色<BR>
	  <strong>包覆</strong>：花色<BR>
    <strong>板材铝门</strong>：材料</td>
	<td  width="6%">芯板配置</td>
	<td  width="2%"><strong>平米单价</strong></td>
	<td  width="2%"><span class="STYLE1">延米单价</span></td>
	<td  width="3%">规格(mm)</td>

	<td  width="2%">面板2编码</td>
	<td  width="6%" align="left"><strong>推拉门</strong>：材料<BR>
	  <strong>吸塑</strong>：花色<BR>
	  <strong>包覆</strong>：花色<BR>
    <strong>板材铝门</strong>：材料</td>
	<td  width="6%">芯板配置</td>
	<td  width="2%"><strong>平米单价</strong></td>
	<td  width="2%"><span class="STYLE1">延米单价</span></td>
	<td  width="3%">规格(mm)</td>
  </tr>
<%
	ls_sql="SELECT xcmlxmc,xcmmc,qtsf,zqzj,zj,sl,zjhsl,azwz,gd||'*'||kd gg,bklxxh,bkys,zsxt,bjbz,xcmbm1,mbcl1,xbpz1,TO_CHAR(pmdj1),TO_CHAR(ymdj1),gd1||'*'||kd1,xcmbm2,mbcl2,xbpz2,TO_CHAR(pmdj2),TO_CHAR(ymdj2),gd2||'*'||kd2,bz  ";
	ls_sql+=" FROM jc_jjxcmmx,jdm_xcmlxbm  ";
    ls_sql+=" where jc_jjxcmmx.xcmlxbm=jdm_xcmlxbm.xcmlxbm(+) and ddbh='"+ddbh+"'";
    ls_sql+=" order by xcmxh";

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
%> 
</table>
<P>
<div align="center"><b>（<%=ddbh%>）成品家具订单明细</b></div>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">编号</td>
	<td  width="4%"><strong>折前单价</strong></td>
	<td  width="4%"><span class="STYLE1">折后单价</span></td>
	<td  width="4%">合同数量</td>
	<td  width="5%"><strong>折前-合同总价</strong></td>
	<td  width="5%"><span class="STYLE1">折后-合同总价</span></td>
	<td  width="4%">增减后数量</td>
	<td  width="5%"><strong>折前-增减后总价</strong></td>
	<td  width="5%"><span class="STYLE1">折后-增减后总价</span></td>
	<td  width="6%">风格</td>
	<td  width="5%">名称</td>
	<td  width="5%">型号</td>
	<td  width="6%">规格</td>
	<td  width="7%">系列名称</td>
	<td  width="9%">材质</td>
	<td  width="10%">花色纹理</td>
	<td  width="13%">备注</td>
</tr>
<%
	ls_sql="SELECT cpjjbh,TO_CHAR(bzdj),TO_CHAR(khdj),sl,zqzj,zj,zjhsl,zqzjhzj,zjhzj,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,cpjjhs,bz  ";
	ls_sql+=" FROM jc_cpjjddmx  ";
    ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" order by cpjjbh";

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
