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
<form method="post" action="Rs_xxaqcsCxList.jsp" name="selectform">
<div align="center">信息安全测试查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">问题编号</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_wtbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">问题</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_wt" size="20" maxlength="400" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">答案编号</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_dabh" size="20" maxlength="1" >  </td>
  <td align="right" width="18%">答案</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_da" size="20" maxlength="400" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">员工序号</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_ygbh" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">员工名称</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_yhmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="rs_xxaqcs_lrsj" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="rs_xxaqcs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="rs_xxaqcs_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" >显示风格</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;每页显示数量
    <input type="text" name="myxssl" size="7" maxlength="13" value="220">
  </td>
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
	if(!(isNumber(FormName.rs_xxaqcs_ygbh, "员工序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.rs_xxaqcs_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
