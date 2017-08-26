<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<style type="text/css">
<!--
.STYLE9 {font-family: "宋体"; font-size: 14; }
.STYLE10 {color: #FF0000}
.STYLE11 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<%
String psph=request.getParameter("psph");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String wzclolr1="red";
String wzclolr2="blue";
String wzclolr3="black";
int i=0;
int row=0;
String clbm=null;
String clmc=null;
String gg=null;
String gdj=null;
String pssl=null;
String psje=null;
String cldlbm=null;
String jldwbm=null;
if (psph.equals(""))
{
	return;
}

String shjl="";
String psdzt="";
String hth=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String sgdmc=null;
String dh=null;
String psfs=null;
String jhshsj=null;
String zjxm=null;
double pszje=0;
double yf=0;
double qtsf=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT jxc_clpsd.shjl,jxc_clpsd.psdzt,hth,zjxm,khxm,lxfs,fwdz,sgdmc,sq_sgd.dh,DECODE(psfs,'1','配送','2','自提','9','其他') psfs,jhshsj,pszje,yf,qtsf  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=jxc_clpsd.khbh(+) and jxc_clpsd.psph='"+psph+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		shjl=cf.fillNull(rs.getString("shjl"));
		psdzt=cf.fillNull(rs.getString("psdzt"));
		hth=cf.fillHtml(rs.getString("hth"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		dh=cf.fillHtml(rs.getString("dh"));
		psfs=cf.fillHtml(rs.getString("psfs"));
		jhshsj=cf.fillHtml(rs.getDate("jhshsj"));
		pszje=rs.getDouble("pszje");
		yf=rs.getDouble("yf");
		qtsf=rs.getDouble("qtsf");
	}
	rs.close();
	ps.close();

	if (  (psdzt.equals("0") || psdzt.equals("1")) || (psdzt.equals("6") && shjl.equals("N")))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过
	{
		out.println("<P>错误！状态不正确，不能打印，只有提交或者审核通过后才能打印");
		return;
	}
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<CENTER >
  <B><font size="3">材料单打印(单号:<%=psph%>)</font></B>
</CENTER>
<form method="post" action="" name="insertform" >
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 15px' >
  <tr> 
    <td width="39%"><span class="STYLE9">客户姓名：<%=khxm%></span></td>
    <td width="33%"><span class="STYLE9">客户电话：<%=lxfs%></span></td>
    <td width="28%"><span class="STYLE9">合同号：<%=hth%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">房屋地址：<%=fwdz%></span></td>
	<td width="33%"><span class="STYLE9">配送方式：<%=psfs%>&nbsp;&nbsp;&nbsp;&nbsp;质检：<%=zjxm%></span></td>
    <td width="28%"><span class="STYLE9">计划送货时间：<%=jhshsj%></span></td>
  </tr>
  <tr> 
    <td width="39%"><span class="STYLE9">项目经理：<%=sgdmc%>（<%=dh%>）</span></td>
    <td width="33%"><span class="STYLE9">总金额：<%=pszje%></td>
    <td width="28%"><span class="STYLE9">运费：<%=yf%>，其它收费：<%=qtsf%></span></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td width="35%" rowspan="4" align="right"><span class="STYLE10">*</span>选择打印方式</td>
    <td width="21%" height="27">
		<input type="radio" name="dyfs" value="1">整单打印
	</td>
    <td width="44%" rowspan="3">
		<input type="hidden" name="psph" value="<%=psph%>" >
		<input type="button"  value="打印材料单" onClick="f_print(insertform)">
	</td>
  </tr>
  <tr>
    <td height="27">
		<input type="radio" name="dyfs" value="2">分供应商打印
	</td>
  </tr>
  <tr>
    <td width="21%" height="27">
		<input type="radio" name="dyfs" value="3">分代销品打印（选择材料）
	</td>
  </tr>
  
</table>
</form>

</body>

</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_print(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.psph)=="") {
		alert("请输入[材料单号]！");
		FormName.psph.focus();
		return false;
	}
	if(	!radioChecked(FormName.dyfs)) {
		alert("请选择[打印方式]！");
		FormName.dyfs[0].focus();
		return false;
	}
	if (FormName.dyfs[0].checked)
	{
		FormName.action="/jxcdy/dypsd.jsp";
	}
	else if (FormName.dyfs[1].checked)
	{
		FormName.action="/jxcdy/gysdy.jsp";
	}
	else{
		FormName.action="/jxcdy/dxpdy.jsp";
	}
	

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
