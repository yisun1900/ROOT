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
<form method="post" action="Call_initList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">本机号码</td> 
  <td width="32%"> 
    <input type="text" name="call_init_bjhm" size="20" maxlength="30" >
  </td>
  <td align="right" width="18%">Mac地址</td> 
  <td width="32%"> 
    <input type="text" name="call_init_mac" size="20" maxlength="30" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">用户编码</td> 
  <td width="32%"> 
    <input type="text" name="call_init_yhbm" size="20" maxlength="30" >
  </td>
  <td align="right" width="18%">所属分公司</td> 
  <td width="32%"> 
    <select name="call_init_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
    </select> 
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录音文件目录</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lywjml" size="20" maxlength="100" >
  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="call_init_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="call_init_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
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
	if(!(isDatetime(FormName.call_init_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
