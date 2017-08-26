<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_tqzsxx.jsp" name="insertform" target="_blank">
<div align="center">特权赠送信息－录入</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>所属分公司</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
    </select>	</td>
  <td align="right" width="18%"><span class="STYLE1">*</span>是否停止</td> 
  <td width="32%"><input type="radio" name="sftz"  value="Y">
    是
      <input type="radio" name="sftz"  value="N">
      否 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>赠送项目</td>
  <td colspan="3"><input type="text" name="zsxm" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计量单位</td> 
  <td width="32%"> 
    <input type="text" name="jldw" value="" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>成本单价</td> 
  <td width="32%"><input type="text" name="cbdj" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>市场单价</td> 
  <td width="32%"><input type="text" name="scdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>赠送数量下限</td> 
  <td width="32%"><input type="text" name="zsslxx" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>赠送数量上限</td> 
  <td width="32%"><input type="text" name="zsslsx" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zsxm)=="") {
		alert("请输入[赠送项目]！");
		FormName.zsxm.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请输入[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.cbdj)=="") {
		alert("请输入[成本单价]！");
		FormName.cbdj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbdj, "成本单价"))) {
		return false;
	}
	if(	javaTrim(FormName.scdj)=="") {
		alert("请输入[市场单价]！");
		FormName.scdj.focus();
		return false;
	}
	if(!(isFloat(FormName.scdj, "市场单价"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslsx)=="") {
		alert("请输入[赠送数量上限]！");
		FormName.zsslsx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslsx, "赠送数量上限"))) {
		return false;
	}
	if(	javaTrim(FormName.zsslxx)=="") {
		alert("请输入[赠送数量下限]！");
		FormName.zsslxx.focus();
		return false;
	}
	if(!(isFloat(FormName.zsslxx, "赠送数量下限"))) {
		return false;
	}
	if(	!radioChecked(FormName.sftz)) {
		alert("请选择[是否停止]！");
		FormName.sftz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
