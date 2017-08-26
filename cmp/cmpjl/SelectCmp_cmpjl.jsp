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
<form method="post" action="Cmp_cmpjlList.jsp" name="selectform">
<div align="center">授权记录维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">触摸屏状态</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cmp_cmpjl_cmpzt","1+未填写&2+已填写","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">触摸屏编号</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_cmpbh" size="20" maxlength="5" >  </td>
  <td align="right" width="18%">类型</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cmp_cmpjl_lx","1+完工评价","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="cmp_cmpjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="cmp_cmpjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="cmp_cmpjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">实际填写时间 从</td> 
  <td width="32%"><input type="text" name="cmp_cmpjl_sjtxsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="cmp_cmpjl_sjtxsj2" size="20" maxlength="10" >  </td>
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
	if(!(isDatetime(FormName.cmp_cmpjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_sjtxsj, "实际填写时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cmp_cmpjl_sjtxsj2, "实际填写时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
