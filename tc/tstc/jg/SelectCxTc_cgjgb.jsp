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
<form method="post" action="Tc_cgjgbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="tc_cgjgb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="tc_cgjgb_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">产品大类</td>
  <td><select name="tc_cgjgb_tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlmc='橱柜'","");
%>
  </select></td>
  <td align="right">产品小类</td>
  <td><select name="tc_cgjgb_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where cldlmc='橱柜' order by clxlmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">是否要求相同品牌</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "tc_cgjgb_sfyqxtpp","Y+是&N+否","");
%>  </td>
  <td align="right" width="18%">计量单位</td> 
  <td width="32%"> 
    <select name="tc_cgjgb_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">标准数量</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_bzsl" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">标准面积</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_bzmj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">超出部分加价</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_ccbfjj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">是否可减免</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "tc_cgjgb_sfkjm","1+不可减免&2+可减免","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">减免单价</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_jmdj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">升级折价</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_sjzj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">录入时间</td> 
  <td width="32%"> 
    <input type="text" name="tc_cgjgb_lrsj" size="20" maxlength="10" >  </td>
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
	if(!(isNumber(FormName.tc_cgjgb_tccplbbm, "产品小类"))) {
		return false;
	}
	if(!(isNumber(FormName.tc_cgjgb_tccpdlbm, "产品大类"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_cgjgb_bzsl, "标准数量"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_cgjgb_bzmj, "标准面积"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_cgjgb_ccbfjj, "超出部分加价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_cgjgb_jmdj, "减免单价"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_cgjgb_sjzj, "升级折价"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_cgjgb_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
