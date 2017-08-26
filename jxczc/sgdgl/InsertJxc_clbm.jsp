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
double bzgg=0;
String cldlbm=null; 
String clxlbm=null;

String ppmc=null;
String gysmc=null;

double zcpzsl=0;
double ccpzsl=0;
double bfpzsl=0;
double dhsl=0;
double ycgsl=0;

String sgsl="";
double sgjg=0;
double sgje=0;

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String sgph=request.getParameter("sgph");

String ssfgs=null;
String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql=" select ssfgs";
    ls_sql+=" from jxc_clsgd";
	ls_sql+=" where sgph='"+sgph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=rs.getString("ssfgs");
	}
	rs.close();
	ps.close();

	ls_sql="select xsj,nbbm,bzgg,clmc,xh,gg,DECODE(xsfs,'1','代销品','2','现货销售','3','期货销售','4','允许负库存') xsfsmc,xsfs,jldwbm,dgzjg,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
	ls_sql+=" from  jxc_cljgb,jxc_clbm";
	ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm"; 
	ls_sql+=" and  jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgjg=rs.getDouble("xsj");
		nbbm=cf.fillNull(rs.getString("nbbm"));
		bzgg=rs.getDouble("bzgg");
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
	ls_sql=" select sgsl,sgjg,sgje ";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where clbm='"+clbm+"'  and sgph='"+sgph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sgsl=cf.fillNull(rs.getString("sgsl"));
		sgjg=rs.getDouble("sgjg");
		sgje=rs.getDouble("sgje");
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
<title>材料申购单－录入数量</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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
<div align="center">材料申购单（申购批号：<%=sgph%>）</div>

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


		<form method="post" action="SaveInsertJxc_clbm.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="center" bgcolor="#CCFFCC"><span class="STYLE1">录入数量</span></td>
      </tr>
 
	  
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">计量单位</span></td>
        <td bgcolor="#FFFFFF"><%=jldwbm%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">销售方式</span></td>
        <td bgcolor="#FFFFFF"><%=xsfsmc%></td>
      </tr>
	
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">最小起订量</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="zxqdl" value="<%=zxqdl%>" size="20" maxlength="50"  readonly>
        <td align="right"><span class="STYLE3">包装规格</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="bzgg" value="<%=bzgg%>" size="20" maxlength="50"  readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><span class="STYLE4">*</span>申购价格</span></td>
        <td bgcolor="#FFFFFF" ><input type="text" name="sgjg" value="<%=sgjg%>" size="20" maxlength="20" readonly>      
        <td align="right">&nbsp;</td>
        <td bgcolor="#FFFFFF" >&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>数量</td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="sgsl" value="<%=sgsl%>" size="20" maxlength="20"  onchange="jsjg(insertform);" >
        <td width="18%" align="right"><span class="STYLE4">*</span><span class="STYLE3">金额</span></td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="sgje" value="<%=sgje%>" size="20" maxlength="20" readonly></td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="sgph" value="<%=sgph%>"  >
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
function jsjg(FormName)
{	
	var sgje=0;
	sgje=FormName.sgsl.value*1.0*FormName.sgjg.value;
	sgje=round(sgje,2);
	FormName.sgje.value=sgje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	jsjg(FormName);

	if(	javaTrim(FormName.sgjg)=="") {
		alert("请输入[申购价格]！");
		FormName.sgjg.focus();
		return false;
	}
	if(!(isFloat(FormName.sgjg, "申购价格"))) {
		return false;
	}

	if(	javaTrim(FormName.sgsl)=="") {
		alert("请输入[数量]！");
		FormName.sgsl.select();
		return false;
	}
	if(!(isFloat(FormName.sgsl, "数量"))) {
		return false;
	}

	if (parseFloat(FormName.sgsl.value)<=0)
	{
		alert("【数量】必须大于零！！！");
		FormName.sgsl.select();
		return false;
	}
	if (parseFloat(FormName.sgsl.value) < parseFloat(FormName.zxqdl.value))
	{
		alert("【数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
		FormName.sgsl.select();
		return false;
	}
	if (parseFloat(FormName.sgsl.value) % parseFloat(FormName.bzgg.value) !=0)
	{
		alert("【数量】必须是【包装规格"+FormName.bzgg.value+"】的整数倍！！！");
		FormName.sgsl.select();
		return false;
	}


	if(	javaTrim(FormName.sgje)=="") {
		alert("请输入[金额]！");
		FormName.sgje.focus();
		return false;
	}
	if(!(isFloat(FormName.sgje, "金额"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>