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
<form method="post" action="Crm_cpazjlList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">安装记录号</td> 
  <td width="32%"> 
    <input type="text" name="crm_cpazjl_azjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="crm_cpazjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">产品分类</td> 
  <td width="32%"> 
    <select name="crm_cpazjl_cpflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
    </select>  </td>
  <td align="right" width="18%">安装结果</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "crm_cpazjl_azjg","1+未完成&2+安装成功&3+安装失败","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">上门时间 从</td> 
  <td width="32%"><input type="text" name="crm_cpazjl_smsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="crm_cpazjl_smsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="crm_cpazjl_lrr" size="20" maxlength="20" ></td>
  <td align="right">上门人</td>
  <td><input type="text" name="crm_cpazjl_smr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="crm_cpazjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="crm_cpazjl_lrsj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入部门</td> 
  <td width="32%"> 
    <select name="crm_cpazjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
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
	if(!(isDatetime(FormName.crm_cpazjl_smsj, "上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpazjl_smsj2, "上门时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpazjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_cpazjl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
