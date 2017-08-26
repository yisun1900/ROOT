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
<form method="post" action="Dm_heysxmList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">验收版本号</td> 
  <td width="30%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>
  </td>
  <td align="right" width="20%">验收项目编码</td> 
  <td width="30%"> 
    <input type="text" name="gcysxmbm" size="20" maxlength="4" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">验收项目名称</td> 
  <td width="30%"> 
    <input type="text" name="gcysxmmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="20%">验收项目分类</td> 
  <td width="30%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">对应工程进度</td> 
  <td width="30%"> 
    <select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">是否关联施工进度表</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "sfsgjdb","Y+是&N+否","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">施工进度进度节点</td> 
  <td width="30%"> 
    <select name="jdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm  order by rwbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">是否回访</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "sfhf","Y+设置&N+否","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">回访类型</td> 
  <td width="30%"> 
    <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">累计家装收款百分比</td> 
  <td width="30%"> 
    <input type="text" name="ljskbfb" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">验收子项数量</td> 
  <td width="30%"> 
    <input type="text" name="yszxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="20%">必验项数量</td> 
  <td width="30%"> 
    <input type="text" name="byxsl" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">非必验项最小数量</td> 
  <td width="30%"> 
    <input type="text" name="fbyxzxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="20%">&nbsp;  </td>
  <td width="30%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="button" onClick="window.open('EnterCopyXm.jsp')"  value="复制验收项目">
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
	if(!(isFloat(FormName.ljskbfb, "累计家装收款百分比"))) {
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "验收子项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.byxsl, "必验项数量"))) {
		return false;
	}
	if(!(isNumber(FormName.fbyxzxsl, "非必验项最小数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
