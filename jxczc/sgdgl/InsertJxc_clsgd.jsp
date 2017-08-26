<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssbm=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_clsgd.jsp" name="insertform" target="">
<div align="center">申购单－录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>申购分公司</td>
  <td>
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
  </select></td>
  <td align="right"><span class="STYLE1">*</span>申购类别</td>
  <td><select name="sglb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="0">主材</option>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>申购人</td>
  <td><input type="text" name="sgr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right"><span class="STYLE1">*</span>申购日期</td>
  <td><input type="text" name="sgrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>配送方式</td>
              <td width="32%"> 
                <input type="radio" name="psfs" value="1">
                配送 
                <input type="radio" name="psfs" value="2">
                自提 
                <input type="radio" name="psfs" value="9">
      其它 </td>
              <td width="18%" align="right">计划送货时间</td>
              <td width="32%"> 
      <input type="text" name="jhshsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
    </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
  <td><select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3" ></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[申购分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!radioChecked(FormName.psfs)) {
		alert("请选择[配送方式]！");
		FormName.psfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sgr)=="") {
		alert("请输入[申购人]！");
		FormName.sgr.focus();
		return false;
	}
	if(	javaTrim(FormName.sgrq)=="") {
		alert("请输入[申购日期]！");
		FormName.sgrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sgrq, "申购日期"))) {
		return false;
	}

	if (FormName.psfs[0].checked)
	{
		if(	javaTrim(FormName.jhshsj)=="") {
			alert("请输入[计划送货时间]！");
			FormName.jhshsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.jhshsj, "计划送货时间"))) {
			return false;
		}
	}
	else{
		FormName.jhshsj.value="";
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
	if(	javaTrim(FormName.ssbm)=="") {
		alert("请输入[录入部门]！");
		FormName.ssbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
