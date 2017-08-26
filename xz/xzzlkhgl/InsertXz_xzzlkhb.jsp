<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertXz_xzzlkhb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核部门</div>
  </td>
  <td width="35%"> 
    <select name="khbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">被考核部门</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dqbm='"+dqbm+"' and dwlx='F2' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khsj" value=<%=cf.today()%> size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">考核人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khr" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">财务15分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cw" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">合同10分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ht" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">店面管理10分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dmgl" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">文件5分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wj" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">物品设备10</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wpsb" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">办公用品5分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgyp" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">宣传用品5分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xcyp" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">各项报表15分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gxbb" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">监控5分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jk" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">考勤7分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kq" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">工作安排8分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gzap" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">其它部门及人员投诉5分</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ts" value="" size="20" maxlength="1" >
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[被考核部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khsj)=="") {
		alert("请输入[考核时间]！");
		FormName.khsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khsj, "考核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.khr)=="") {
		alert("请输入[考核人]！");
		FormName.khr.focus();
		return false;
	}
	if(	javaTrim(FormName.cw)=="") {
		alert("请输入[财务15分]！");
		FormName.cw.focus();
		return false;
	}
	if(!(isFloat(FormName.cw, "财务15分"))) {
		return false;
	}
	if(	javaTrim(FormName.ht)=="") {
		alert("请输入[合同10分]！");
		FormName.ht.focus();
		return false;
	}
	if(!(isFloat(FormName.ht, "合同10分"))) {
		return false;
	}
	if(	javaTrim(FormName.dmgl)=="") {
		alert("请输入[店面管理10分]！");
		FormName.dmgl.focus();
		return false;
	}
	if(!(isFloat(FormName.dmgl, "店面管理10分"))) {
		return false;
	}
	if(	javaTrim(FormName.wj)=="") {
		alert("请输入[文件5分]！");
		FormName.wj.focus();
		return false;
	}
	if(!(isFloat(FormName.wj, "文件5分"))) {
		return false;
	}
	if(	javaTrim(FormName.wpsb)=="") {
		alert("请输入[物品设备10]！");
		FormName.wpsb.focus();
		return false;
	}
	if(!(isFloat(FormName.wpsb, "物品设备10"))) {
		return false;
	}
	if(	javaTrim(FormName.bgyp)=="") {
		alert("请输入[办公用品5分]！");
		FormName.bgyp.focus();
		return false;
	}
	if(!(isFloat(FormName.bgyp, "办公用品5分"))) {
		return false;
	}
	if(	javaTrim(FormName.xcyp)=="") {
		alert("请输入[宣传用品5分]！");
		FormName.xcyp.focus();
		return false;
	}
	if(!(isFloat(FormName.xcyp, "宣传用品5分"))) {
		return false;
	}
	if(	javaTrim(FormName.gxbb)=="") {
		alert("请输入[各项报表15分]！");
		FormName.gxbb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxbb, "各项报表15分"))) {
		return false;
	}
	if(	javaTrim(FormName.jk)=="") {
		alert("请输入[监控5分]！");
		FormName.jk.focus();
		return false;
	}
	if(!(isFloat(FormName.jk, "监控5分"))) {
		return false;
	}
	if(	javaTrim(FormName.kq)=="") {
		alert("请输入[考勤7分]！");
		FormName.kq.focus();
		return false;
	}
	if(!(isFloat(FormName.kq, "考勤7分"))) {
		return false;
	}
	if(	javaTrim(FormName.gzap)=="") {
		alert("请输入[工作安排8分]！");
		FormName.gzap.focus();
		return false;
	}
	if(!(isFloat(FormName.gzap, "工作安排8分"))) {
		return false;
	}
	if(	javaTrim(FormName.ts)=="") {
		alert("请输入[其它部门及人员投诉5分]！");
		FormName.ts.focus();
		return false;
	}
	if(!(isFloat(FormName.ts, "其它部门及人员投诉5分"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
