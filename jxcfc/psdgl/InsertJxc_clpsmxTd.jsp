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

String pssl="";
double psje=0;

String clbm=request.getParameter("clbm");
String dqbm=request.getParameter("dqbm");
String psph=request.getParameter("psph");

String khbh=null;
String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;

double bzlyje=0;
double lyxxje=0;
double lysxje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql=" select khbh";
    ls_sql+=" from jxc_clpsd";
	ls_sql+=" where psph='"+psph+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	ls_sql=" select sgdmc,hth,khxm,fwdz,fgsbh,NVL(guanlif,0)+NVL(suijin,0)+qye qye";
    ls_sql+=" from crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		hth=rs.getString("hth");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		fgsbh=rs.getString("fgsbh");
		qye=rs.getDouble("qye");
		fgsbh=rs.getString("fgsbh");
	}
	rs.close();
	ps.close();

	ls_sql="select nbbm,clmc,xh,gg,DECODE(xsfs,'1','代销品','2','现货销售','3','期货销售','4','允许负库存') xsfsmc,xsfs,jldwbm,dgzjg,zxqdl,cldlbm,clxlbm,ppmc,jxc_cljgb.gysmc,zcpzsl,ccpzsl,bfpzsl,dhsl,ycgsl ";
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

    double sgcbj=0;
    double zxsgcbj=0;
	ls_sql=" select sgcbj,zxsgcbj";
    ls_sql+=" from crm_khqye";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgcbj=rs.getDouble("sgcbj");
		zxsgcbj=rs.getDouble("zxsgcbj");
	}
	rs.close();
	ps.close();

	ls_sql=" select ROUND(bzlybl/100*"+zxsgcbj+",2),ROUND(lyblxx/100*"+zxsgcbj+",2),ROUND(lyblsx/100*"+zxsgcbj+",2)";
	ls_sql+=" from jxc_fclybl";
	ls_sql+=" where dwbh='"+fgsbh+"' and clxlmc='"+clxlbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzlyje=rs.getDouble(1);
		lyxxje=rs.getDouble(2);
		lysxje=rs.getDouble(3);
	}
	rs.close();
	ps.close();


	//材料配送明细:退单数量	 
	ls_sql=" select pssl,psje ";
	ls_sql+=" from jxc_clpsmx ";
	ls_sql+=" where clbm='"+clbm+"'  and psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pssl=cf.fillNull(rs.getString("pssl"));
		psje=rs.getDouble("psje");
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
<title>退料单－录入数量</title>
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
<div align="center">退料单（材料单号：<%=psph%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right"><font color="#0000CC">客户编号</font> </td>
      <td width="16%"><%=khbh%> </td>
      <td width="16%"><font color="#0000CC">施工队：</font><%=sgdmc%></td>
      <td width="18%" align="right"><font color="#0000CC">合同号</font> </td>
      <td width="32%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000CC">客户姓名</font> </td>
      <td colspan="2"><%=khxm%> </td>
      <td align="right"><font color="#0000CC">房屋地址</font></td>
      <td><%=fwdz%></td>
    </tr>
</table>
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


		<form method="post" action="SaveInsertJxc_clpsmxTd.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
        <td colspan="4" align="center" bgcolor="#CCFFCC"><span class="STYLE1">录入数量</span></td>
      </tr>
 
      <tr bgcolor="#FFFFFF">
        <td align="right" ><span class="STYLE3">小类－标准领用额</span></td>
        <td ><%=bzlyje%></td>
        <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
        <td >&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" ><span class="STYLE3">小类领用－下限额</span></td>
        <td ><%=lyxxje%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">小类领用－上限额</span></td>
        <td ><%=lysxje%></td>
      </tr>
	  
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">计量单位</span></td>
        <td bgcolor="#FFFFFF"><%=jldwbm%></td>
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3"><span class="STYLE4">*</span>对工长价格</span></td>
        <td bgcolor="#FFFFFF">
		<input type="text" name="gdj" value="<%=dgzjg%>" size="20" maxlength="20" readonly></td>
      </tr>
	
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">销售方式</span></td>
        <td bgcolor="#FFFFFF" ><%=xsfsmc%>      
        <td align="right">&nbsp;</td>
        <td bgcolor="#FFFFFF" ><input type="hidden" name="zxqdl" value="<%=zxqdl%>" size="20" maxlength="50"  readonly></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE4">*</span>退单数量</td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="pssl" value="<%=pssl%>" size="10" maxlength="20"  onchange="jsjg(insertform);" >
		<strong>(录入负数)        </strong>
        <td width="18%" align="right"><span class="STYLE4">*</span><span class="STYLE3">退单金额</span></td>
        <td width="32%" bgcolor="#FFFFFF" >
		<input type="text" name="psje" value="<%=psje%>" size="20" maxlength="20" readonly></td>
      </tr>
      
      <tr align="center"> 
        <td colspan="4">
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="xsfs" value="<%=xsfs%>"  >
          <input type="hidden" name="psph" value="<%=psph%>"  >
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
	var psje=0;
	psje=FormName.pssl.value*1.0*FormName.gdj.value;
	psje=round(psje,2);
	FormName.psje.value=psje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	jsjg(FormName);

	if(	javaTrim(FormName.gdj)=="") {
		alert("请输入[材料单价]！");
		FormName.gdj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdj, "材料单价"))) {
		return false;
	}

	if(	javaTrim(FormName.pssl)=="") {
		alert("请输入[退单数量]！");
		FormName.pssl.select();
		return false;
	}
	if(!(isFloat(FormName.pssl, "退单数量"))) {
		return false;
	}

	if (parseFloat(FormName.pssl.value)>=0)
	{
		alert("因为是退料，【退单数量】请录入负数！！！");
		FormName.pssl.select();
		return false;
	}

	if(	javaTrim(FormName.psje)=="") {
		alert("请输入[退单金额]！");
		FormName.psje.focus();
		return false;
	}
	if(!(isFloat(FormName.psje, "退单金额"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>