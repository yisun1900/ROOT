<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xcmbm=null;
String xcmlxbm=null;
String bklxxh=null;
String mbcl=null;
String xbpz=null;
String zsxt=null;
String jjfs=null;
String pmdj=null;
String ymdj=null;
String zpmc=null;
String lrr=null;
String lrsj=null;
String bz=null;
String wherexcmbm=cf.GB2Uni(request.getParameter("xcmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xcmbm,xcmlxbm,bklxxh,mbcl,xbpz,zsxt,jjfs,pmdj,ymdj,zpmc,lrr,lrsj,bz ";
	ls_sql+=" from  jc_bgmbj";
	ls_sql+=" where  (xcmbm='"+wherexcmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcmbm=cf.fillNull(rs.getString("xcmbm"));
		xcmlxbm=cf.fillNull(rs.getString("xcmlxbm"));
		bklxxh=cf.fillNull(rs.getString("bklxxh"));
		mbcl=cf.fillNull(rs.getString("mbcl"));
		xbpz=cf.fillNull(rs.getString("xbpz"));
		zsxt=cf.fillNull(rs.getString("zsxt"));
		jjfs=cf.fillNull(rs.getString("jjfs"));
		pmdj=cf.fillNull(rs.getString("pmdj"));
		ymdj=cf.fillNull(rs.getString("ymdj"));
		zpmc=cf.fillNull(rs.getString("zpmc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform">
<div align="center">修改型材门报价</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span>型材门编码（6位）</td> 
  <td width="34%"> 
    <input type="text" name="xcmbm" size="20" maxlength="6"  value="<%=xcmbm%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>型材门类型</td> 
  <td width="35%"> 
    <select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm",xcmlxbm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><strong>推拉门</strong>：边框型号<BR>
	  <strong>吸塑</strong>：刀型<BR>
	  <strong>包覆</strong>：刀型<BR>
	  <strong>板材铝门</strong>：门型</td> 
  <td colspan="3"> 
    <input type="text" name="bklxxh" size="69" maxlength="50"  value="<%=bklxxh%>" >
    <span class="STYLE1">*</span> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>推拉门</strong>：材料<br>
    <strong>吸塑</strong>：花色<br>
    <strong>包覆</strong>：花色<br>
    <strong>板材铝门</strong>：材料</td>
  <td colspan="3"><input type="text" name="mbcl" size="69" maxlength="50"  value="<%=mbcl%>" >
    <span class="STYLE1">*</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">芯板配置</td> 
  <td colspan="3"> 
    <input type="text" name="xbpz" size="69" maxlength="50"  value="<%=xbpz%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">装饰线条</td>
  <td colspan="3"><input type="text" name="zsxt" size="69" maxlength="50"  value="<%=zsxt%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span>计价方式</td> 
  <td width="34%"> 
<%
	cf.radioToken(out, "jjfs","1+平米单价&2+平米单价＋封边延米单价",jjfs);
%>  </td>
  <td align="right" width="15%">照片名称</td> 
  <td width="35%"><input type="text" name="zpmc" size="20" maxlength="50"  value="<%=zpmc%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>平米单价</td>
  <td><input type="text" name="pmdj" size="20" maxlength="17"  value="<%=pmdj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>延米单价</td>
  <td><input type="text" name="ymdj" size="20" maxlength="17"  value="<%=ymdj%>" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="34%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="wherexcmbm"  value="<%=wherexcmbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	  <input type="button"  value="上传照片" onClick="f_do1(editform)" name="button">
      <input type="button"  value="查看照片" onClick="f_do2(editform)" name="button">
	</div>      </td>
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
	if(	javaTrim(FormName.xcmbm)=="") {
		alert("请输入[型材门编码]！");
		FormName.xcmbm.focus();
		return false;
	}
	if (FormName.xcmbm.value.length!=6)
	{
		alert("[型材门编码]应该6位长！");
		FormName.xcmbm.focus();
		return false;
	}
	if(!(isNumber(FormName.xcmbm, "型材门编码"))) {
		return false;
	}

	if(	javaTrim(FormName.xcmlxbm)=="") {
		alert("请选择[型材门类型]！");
		FormName.xcmlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		alert("请输入[边框型号、刀型、门型]！");
		FormName.bklxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.mbcl)=="") {
		alert("请输入[材料、花色]！");
		FormName.mbcl.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("请选择[计价方式]！");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.pmdj)=="") {
		alert("请输入[平米单价]！");
		FormName.pmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmdj, "平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.ymdj)=="") {
		alert("请输入[延米单价]！");
		FormName.ymdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ymdj, "延米单价"))) {
		return false;
	}

	if (FormName.jjfs[0].checked)
	{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[平米单价]不能为0！");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)!=0)
		{
			alert("[延米单价]应该为0！");
			FormName.ymdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[平米单价]不能为0！");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)==0)
		{
			alert("[延米单价]不能为0！");
			FormName.ymdj.select();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.target="";
	FormName.action="SaveEditJc_bgmbj.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xcmbm)=="") {
		alert("请输入[型材门编码]！");
		FormName.xcmbm.focus();
		return false;
	}


	FormName.target="_blank";
	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xcmbm)=="") {
		alert("请输入[型材门编码]！");
		FormName.xcmbm.focus();
		return false;
	}

	FormName.target="_blank";
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
