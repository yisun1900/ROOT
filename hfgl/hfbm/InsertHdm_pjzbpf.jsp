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
<form method="post" action="SaveInsertHdm_pjzbpf.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访对象评价指标</td> 
  <td colspan="3"> 
    <select name="dxpjzbbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb||'---『'||hfdxmc||'』' from hdm_dxpjzb,hdm_hfdxbm where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm","");
%>
    </select>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">评分编码</td>
  <td><input type="text" name="pfbm" value="" size="20" maxlength="1" ></td>
  <td align="right">评分名称</td>
  <td><input type="text" name="pfmc" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">得分</td> 
  <td width="32%"><input type="text" name="df" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%">序号</td> 
  <td width="32%"><input type="text" name="xh" value="" size="20" maxlength="8" ></td>
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
	if(	javaTrim(FormName.dxpjzbbm)=="") {
		alert("请选择[回访对象评价指标编码]！");
		FormName.dxpjzbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfbm)=="") {
		alert("请输入[评分编码]！");
		FormName.pfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfmc)=="") {
		alert("请输入[评分名称]！");
		FormName.pfmc.focus();
		return false;
	}
	if(	javaTrim(FormName.df)=="") {
		alert("请输入[得分]！");
		FormName.df.focus();
		return false;
	}
	if(!(isFloat(FormName.df, "得分"))) {
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
