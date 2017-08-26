<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbxgzjlCxList.jsp" name="selectform">
<div align="center">查询跟踪信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">跟踪记录号</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_gzjlh" size="20" maxlength="12" >  </td>
  <td align="right" width="18%">类型</td> 
  <td width="32%"><%
	cf.radioToken(out, "crm_tsbxgzjl_lx","1+客诉专员&2+客服","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">投诉报修记录号</td> 
  <td width="32%"><input type="text" name="crm_tsbxgzjl_tsjlh" size="20" maxlength="10" ></td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"><input type="text" name="crm_tsbxgzjl_khbh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_tsbxgzjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_tsbxgzjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <input type="text" name="crm_tsbxgzjl_lrbm" size="20" maxlength="5" >  </td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.crm_tsbxgzjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tsbxgzjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
