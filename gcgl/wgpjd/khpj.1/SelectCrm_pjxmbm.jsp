<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_pjxmbmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">评价项目编码(6位)</td> 
      <td width="32%"> 
        <input type="text" name="pjxmbm" size="20" maxlength="6" >
  </td>
      <td align="right" width="18%">评价项目</td> 
      <td width="32%"> 
        <input type="text" name="pjxm" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">受评价人员</td> 
      <td width="32%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm","");
%>
    </select>
  </td>
      <td align="right" width="18%">项目分类</td> 
      <td width="32%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">显示方式</td> 
      <td width="32%"> <%
	cf.radioToken(out, "xsfs","1+项目分类多选&2+项目分类单选","");
%> </td>
      <td align="right" width="18%">序号</td> 
      <td width="32%"> 
        <input type="text" name="xh" size="20" maxlength="8" >
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
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
