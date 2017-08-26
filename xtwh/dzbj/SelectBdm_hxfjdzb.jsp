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
<form method="post" action="Bdm_hxfjdzbList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">户型</td> 
  <td width="32%"> 
    <select name="bdm_hxfjdzb_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
    </select>  </td>
  <td align="right" width="18%">房间名称</td> 
  <td width="32%"> 
    <input type="text" name="bdm_hxfjdzb_jgwzmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房间类型</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "bdm_hxfjdzb_fjlx","1+厨房&2+卫生间&3+卧室&4+客厅&5+餐厅&6+阳台","");
%>    </td>
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
