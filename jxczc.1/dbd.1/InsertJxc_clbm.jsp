<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String xsfsmc=null;
String xsfs=null;
String jldwbm=null;
double dgzjg=0;
double zxqdl=0;
String cldlbm=null; 
String clxlbm=null;

String ppmc=null;
String gysmc=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;
double dhsl=0;
double ycgsl=0;

String dbsl="";

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String dbph=request.getParameter("dbph");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select nbbm,clmc,xh,gg,DECODE(xsfs,'1','代销品','2','现货调拨','3','期货调拨','4','允许负库存') xsfsmc,xsfs,jldwbm,dgzjg,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nbbm=cf.fillNull(rs.getString("nbbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		xsfs=cf.fillNull(rs.getString("xsfs"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dgzjg=rs.getDouble("dgzjg");
		zxqdl=rs.getDouble("zxqdl");
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysmc=cf.fillNull(rs.getString("gysmc"));

		zcpzsl=rs.getDouble("zcpzsl");
		ccpzsl=rs.getDouble("ccpzsl");
		bfpzsl=rs.getDouble("bfpzsl");
		dhsl=rs.getDouble("dhsl");
		ycgsl=rs.getDouble("ycgsl");
	}
	rs.close();
	ps.close();


	//材料配送明细:数量	 
	ls_sql=" select dbsl ";
	ls_sql+=" from jxc_dbmx ";
	ls_sql+=" where clbm='"+clbm+"'  and dbph='"+dbph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dbsl=cf.fillNull(rs.getString("dbsl"));
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
<title>调拨单－录入数量</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	font-size: 14px;
	font-weight: bold;
	color: #0000CC;
}
.STYLE3 {color: #0000CC}
.STYLE4 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">调拨单（材料单号：<%=dbph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">材料编码</td>
  <td bgcolor="#FFFFFF"><%=clbm%></td>
  <td align="right" bgcolor="#FFFFFF">内部编码</td>
  <td bgcolor="#FFFFFF"><%=nbbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">材料名称</td>
  <td bgcolor="#FFFFFF"><%=clmc%></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">型号</td>
  <td bgcolor="#FFFFFF"><%=xh%></td>
  <td align="right" bgcolor="#FFFFFF">规格</td>
  <td bgcolor="#FFFFFF"><%=gg%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">供应商</td>
  <td bgcolor="#FFFFFF"><%=gysmc%></td>
  <td align="right" bgcolor="#FFFFFF">子品牌</td>
  <td bgcolor="#FFFFFF"><%=ppmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">材料大类</td>
  <td width="32%" bgcolor="#FFFFFF"><%=cldlbm%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">材料小类</td>
  <td width="32%" bgcolor="#FFFFFF"><%=clxlbm%></td>
</tr>
</table>
<BR>

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF"><strong>库存、订货数量</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">正常品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=zcpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF">残次品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=ccpzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF">报废品库存数</td>
  <td width="32%" bgcolor="#FFFFFF"><%=bfpzsl%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><strong>可订货数</strong></td>
  <td width="32%" bgcolor="#FFFFFF"><%=cf.formatDouble(zcpzsl-dhsl)%></td>
</tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right" bgcolor="#FFFFFF">订货数量</td>
    <td width="32%" bgcolor="#FFFFFF"><%=dhsl%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF">已采购数量</td>
    <td width="32%" bgcolor="#FFFFFF"><%=ycgsl%></td>
  </tr>
</table>
<BR>


		<form method="post" action="SaveInsertJxc_clbm.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="center" bgcolor="#CCFFCC"><span class="STYLE1">录入数量</span></td>
      </tr>
	  
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">计量单位</span></td>
        <td bgcolor="#FFFFFF"><%=jldwbm%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">对工长价格</span></td>
        <td bgcolor="#FFFFFF"><%=dgzjg%></td>
      </tr>
	
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">销售方式</span></td>
        <td bgcolor="#FFFFFF" ><%=xsfsmc%>      
        <td align="right"><span class="STYLE3">最小起订量</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="zxqdl" value="<%=zxqdl%>" size="20" maxlength="50"  readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>数量</td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="dbsl" value="<%=dbsl%>" size="20" maxlength="20" >
        <td width="18%" align="right">&nbsp;</td>
        <td width="32%" bgcolor="#FFFFFF" >&nbsp;</td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="xsfs" value="<%=xsfs%>"  >
          <input type="hidden" name="dbph" value="<%=dbph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="dqbm" value="<%=dqbm%>"  >
		  <input type="hidden" name="kdhsl" value="<%=(zcpzsl-dhsl)%>" >	    </td>
      </tr>
    </table>
		</form>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dbsl)=="") {
		alert("请输入[数量]！");
		FormName.dbsl.select();
		return false;
	}
	if(!(isFloat(FormName.dbsl, "数量"))) {
		return false;
	}

	if (parseFloat(FormName.dbsl.value)<=0)
	{
		alert("【数量】必须大于零！！！");
		FormName.dbsl.select();
		return false;
	}
	if (parseFloat(FormName.dbsl.value) < parseFloat(FormName.zxqdl.value))
	{
		alert("【数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
		FormName.dbsl.select();
		return false;
	}

	if ("<%=xsfs%>"=="2")//1：代销品；2：现货调拨；3：期货调拨
	{
		if (parseFloat(FormName.dbsl.value) > parseFloat(FormName.kdhsl.value))
		{
			alert("错误！现货调拨，【数量】不能大于【可订货数量"+FormName.kdhsl.value+"】，可订货数量＝正常品库存－订货");
			FormName.dbsl.select();
			return false;
		}
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>