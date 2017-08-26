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
<form method="post" action="Dm_gcysxmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收项目编码</td> 
  <td width="32%"> 
    <input type="text" name="dm_gcysxm_gcysxmbm" size="20" maxlength="4" >  </td>
  <td align="right" width="18%">验收项目名称</td> 
  <td width="32%"> 
    <input type="text" name="dm_gcysxm_gcysxmmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">验收项目分类</td> 
  <td width="32%"> 
    <select name="dm_gcysxm_ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">是否回访</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+是&N+否","");
%></td>
  <td align="right">对应工程进度</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
