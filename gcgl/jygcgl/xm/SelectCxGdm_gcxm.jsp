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
<form method="post" action="Gdm_gcxmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目编码</td> 
  <td width="35%"> 
    <input type="text" name="gdm_gcxm_xmbm" size="20" maxlength="5" >
  </td>
  <td align="right" width="15%">项目名称</td> 
  <td width="35%"> 
    <input type="text" name="gdm_gcxm_xmmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目大类</td> 
  <td width="35%"> 
    <select name="gdm_gcxm_xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmdlbm,xmdlmc from gdm_xmdlbm order by xmdlbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">项目小类</td> 
  <td width="35%"> 
    <select name="gdm_gcxm_xmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmxlbm,xmxlmc from gdm_xmxlbm order by xmdlbm,xmxlbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">违规级别</td> 
  <td width="35%"> 
    <select name="gdm_gcxmcfbz_wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">处罚人员职务</td> 
  <td width="35%"> 
    <select name="gdm_gcxmcfbz_xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">整改要求</td> 
  <td width="35%"> 
    <select name="gdm_gcxmcfbz_zgyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zgyq c1,zgyq c2 from gdm_zgyq order by zgyq","");
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
