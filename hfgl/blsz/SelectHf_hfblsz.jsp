<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hf_hfblszList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="hf_hfblsz_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回访类型</td>
  <td colspan="3"><%
	cf.radioToken(out, "hf_hfblsz_hflx","1+飞单回访&2+在施工回访&3+完工回访","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户数开始点</td> 
  <td width="32%"> 
    <input type="text" name="hf_hfblsz_khsksd" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">客户数截至点</td> 
  <td width="32%"> 
    <input type="text" name="hf_hfblsz_khsjzd" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访比例</td> 
  <td width="32%"> 
    <input type="text" name="hf_hfblsz_hfbl" size="20" maxlength="9" >  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
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
	if(!(isInt(FormName.hf_hfblsz_khsksd, "客户数开始点"))) {
		return false;
	}
	if(!(isInt(FormName.hf_hfblsz_khsjzd, "客户数截至点"))) {
		return false;
	}
	if(!(isFloat(FormName.hf_hfblsz_hfbl, "回访比例"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
