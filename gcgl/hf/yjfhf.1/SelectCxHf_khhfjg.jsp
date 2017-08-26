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
<form method="post" action="Hf_khhfjgCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="hf_khhfjg_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">合同号</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">设计师</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">回访类型</td> 
  <td width="32%"> 
    <select name="hf_khhfjg_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from hdm_hflxbm order by hflxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">回访对象</td> 
  <td width="32%"> 
    <select name="hf_khhfjg_hfdxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hfdxbm,hfdxmc from hdm_hfdxbm order by hfdxbm","");
%>
    </select>  </td>
  <td align="right" width="18%">回访对象评价指标</td> 
  <td width="32%"> 
    <select name="hf_khhfjg_dxpjzbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dxpjzbbm,dxpjzb from hdm_dxpjzb order by dxpjzbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">评分编码</td> 
  <td width="32%"> 
    <input type="text" name="hf_khhfjg_pfbm" size="20" maxlength="1" >  </td>
  <td align="right" width="18%">评分名称</td> 
  <td width="32%"> 
    <input type="text" name="hf_khhfjg_pfmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">得分</td> 
  <td width="32%"> 
    <input type="text" name="hf_khhfjg_df" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="hf_khhfjg_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="hf_khhfjg_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="hf_khhfjg_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">序号</td> 
  <td width="32%"><input type="text" name="hf_khhfjg_xh" size="20" maxlength="8" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	if(!(isFloat(FormName.hf_khhfjg_df, "得分"))) {
		return false;
	}
	if(!(isDatetime(FormName.hf_khhfjg_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.hf_khhfjg_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.hf_khhfjg_xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
