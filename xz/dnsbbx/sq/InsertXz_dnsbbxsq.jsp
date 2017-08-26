<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #FF0000}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String fgsbh=null;
String dwbh=null;
String gdzcmc=null;
String bgr=null;
String bmbh=null;
String gdzcflbm=null;
String xh=null;
String pp=null;
String pz1=null;
String pz2=null;
String pz3=null;
String pz4=null;
String pz5=null;
String pz6=null;

String gsbh=cf.GB2Uni(request.getParameter("gsbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,gdzcmc,bgr,bmbh,gdzcflbm,xh,pp,pz1,pz2,pz3,pz4,pz5,pz6";
	ls_sql+=" from  xz_gdzcb";
	ls_sql+=" where gsbh='"+gsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		gdzcmc=cf.fillNull(rs.getString("gdzcmc"));
		bgr=cf.fillNull(rs.getString("bgr"));
		bmbh=cf.fillNull(rs.getString("bmbh"));
		gdzcflbm=cf.fillNull(rs.getString("gdzcflbm"));
		xh=cf.fillNull(rs.getString("xh"));
		pp=cf.fillNull(rs.getString("pp"));
		pz1=cf.fillNull(rs.getString("pz1"));
		pz2=cf.fillNull(rs.getString("pz2"));
		pz3=cf.fillNull(rs.getString("pz3"));
		pz4=cf.fillNull(rs.getString("pz4"));
		pz5=cf.fillNull(rs.getString("pz5"));
		pz6=cf.fillNull(rs.getString("pz6"));
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

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertXz_dnsbbxsq.jsp" name="insertform" target="_blank">
<div align="center">填写－电脑及设备报修申请</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="20%" align="right"><span class="STYLE1">报修分公司</span></td>
    <td width="30%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
    </select></td>
    <td width="20%" align="right">&nbsp;</td>
    <td width="30%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">固定资产编号</span></td>
    <td><input type="text" name="gsbh" value="<%=gsbh%>" size="20" maxlength="20" readonly></td>
    <td align="right"><span class="STYLE1">部门内编号</span></td>
    <td><input type="text" name="bmbh" value="<%=bmbh%>" size="20" maxlength="20" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">固定资产名称</span></td>
    <td><input type="text" name="gdzcmc" value="<%=gdzcmc%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">固定资产分类</span></td>
    <td><select name="gdzcflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select gdzcflmc c1,gdzcflmc c2 from xz_gdzcflbm where gdzcflbm='"+gdzcflbm+"'","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">型号</span></td>
    <td><input type="text" name="xh" value="<%=xh%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">品牌</span></td>
    <td><input type="text" name="pp" value="<%=pp%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">配置(CPU)</span></td>
    <td><input type="text" name="pz1" value="<%=pz1%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">配置(内存)</span></td>
    <td><input type="text" name="pz2" value="<%=pz2%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">配置(硬盘)</span></td>
    <td><input type="text" name="pz3" value="<%=pz3%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">配置(主板)</span></td>
    <td><input type="text" name="pz4" value="<%=pz4%>" size="20" maxlength="50" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">配置(显卡)</span></td>
    <td><input type="text" name="pz5" value="<%=pz5%>" size="20" maxlength="50" readonly>    </td>
    <td align="right"><span class="STYLE1">配置(显示器)</span></td>
    <td><input type="text" name="pz6" value="<%=pz6%>" size="20" maxlength="50" readonly>    </td>
  </tr>
</table>
<P>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>报修部门</span></td>
    <td width="30%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
    </select></td>
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span></span>报修申请人</td>
    <td><input type="text" name="sqr" value="<%=bgr%>" size="20" maxlength="20" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span>设备保管人</span></td>
    <td><input type="text" name="bgr" value="<%=bgr%>" size="20" maxlength="20" readonly></td>
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span></span>电脑及设备分类</td>
    <td><select name="dnsbflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dnsbflmc c1,dnsbflmc c2 from xz_dnsbflbm order by dnsbflbm","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span></span>电脑及设备故障分类</td>
    <td><select name="dnsbgzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dnsbgzmc c1,dnsbgzmc c2 from xz_dnsbgzbm order by dnsbgzbm","");
%>
    </select></td>
    <td align="right"><span class="STYLE1"><span class="STYLE3">*</span></span>希望完成日期</td>
    <td><input type="text" name="jhlqrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1"><span class="STYLE3">*</span>报修日期</span></td> 
  <td><input type="text" name="bxrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  <td align="right" width="20%"><span class="STYLE1"><span class="STYLE3">*</span>录入人</span></td> 
  <td width="30%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1"><span class="STYLE3">*</span></span>设备中是否有重要数据</td> 
  <td colspan="3"><input type="radio" name="sfyzysj"  value="N">
    无
      <input type="radio" name="sfyzysj"  value="Y">
      有 
	  &nbsp;&nbsp;&nbsp;&nbsp;设备保管人确认电脑设备的系统硬盘中<span class="STYLE3">【<strong>是否存在重要数据】</strong></span>，
	  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  并请<span class="STYLE2">【提前备份】</span>，以防重装电脑系统时，<span class="STYLE2">【重要数据丢失】</span>！</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><span class="STYLE1"><span class="STYLE3">*</span></span>故障详细说明</td> 
  <td colspan="3"> 
    <textarea name="gzxxsm" cols="73" rows="4"></textarea>  </td>
  </tr>


    <tr align="center"> 
      <td colspan="4"> 
	<input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[报修部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[报修分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[报修申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbflmc)=="") {
		alert("请选择[电脑及设备分类]！");
		FormName.dnsbflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dnsbgzmc)=="") {
		alert("请选择[电脑及设备故障分类]！");
		FormName.dnsbgzmc.focus();
		return false;
	}
	if(	javaTrim(FormName.bxrq)=="") {
		alert("请输入[报修日期]！");
		FormName.bxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.bxrq, "报修日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlqrq)=="") {
		alert("请输入[希望完成日期]！");
		FormName.jhlqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "希望完成日期"))) {
		return false;
	}
	if(	javaTrim(FormName.bgr)=="") {
		alert("请输入[设备保管人]！");
		FormName.bgr.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyzysj)) {
		alert("请选择[设备中是否有重要数据]！");
		FormName.sfyzysj[0].focus();
		return false;
	}
	if(	javaTrim(FormName.gzxxsm)=="") {
		alert("请输入[故障详细说明]！");
		FormName.gzxxsm.focus();
		return false;
	}
	if(	javaTrim(FormName.gsbh)=="") {
		alert("请输入[固定资产编号]！");
		FormName.gsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gdzcmc)=="") {
		alert("请输入[固定资产名称]！");
		FormName.gdzcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}

	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
