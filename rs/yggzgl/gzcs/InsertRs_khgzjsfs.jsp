<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_khgzjsfs.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">序号</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
  </select></td>
  <td align="right">设计师级别</td>
  <td><select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">业绩下限</td> 
  <td width="32%"><input type="text" name="yjxx" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%">业绩上限</td> 
  <td width="32%"><input type="text" name="yjsx" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考核工资</td> 
  <td width="32%"><input type="text" name="khgz" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sjsjb)=="") {
		alert("请选择[设计师级别]！");
		FormName.sjsjb.focus();
		return false;
	}
	if(	javaTrim(FormName.yjxx)=="") {
		alert("请输入[业绩下限]！");
		FormName.yjxx.focus();
		return false;
	}
	if(!(isFloat(FormName.yjxx, "业绩下限"))) {
		return false;
	}
	if(	javaTrim(FormName.yjsx)=="") {
		alert("请输入[业绩上限]！");
		FormName.yjsx.focus();
		return false;
	}
	if(!(isFloat(FormName.yjsx, "业绩上限"))) {
		return false;
	}
	if(	javaTrim(FormName.khgz)=="") {
		alert("请输入[考核工资]！");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "考核工资"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
