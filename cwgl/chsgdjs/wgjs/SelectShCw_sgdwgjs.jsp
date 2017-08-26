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
<form method="post" action="Cw_chsgdjsShList.jsp" name="selectform">
<div align="center">施工队完工结算－审核</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsjlh" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>
  </td>
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">现场负责人</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sgbz" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">合同工程基础报价</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_htjcbj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增减项工程基础报价</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_zjxjcbj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">垃圾清运费</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_ljqyf" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">灯具安装费</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_djazf" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">结算基数</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsjs" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算比例</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsbl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">调整结算比例</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_tzjsbl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">水电路金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sdlje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">水电路结算比例</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sdljsbl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算总额</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">材料费</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clf" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料运费</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clyf" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">工地用品</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_gdyp" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">已付工程款</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_yfgck" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">应扣质保金比例</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_kzbjjbl" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">扣质保金</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_kzbj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">材料罚款</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clfk" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">奖罚金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jfje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">应付金额</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_yfje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算日期</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">处理状态</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+未审批&2+审批","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
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
	if(!(isFloat(FormName.cw_chsgdjs_htjcbj, "合同工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_zjxjcbj, "增减项工程基础报价"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_ljqyf, "垃圾清运费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_djazf, "灯具安装费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsjs, "结算基数"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsbl, "结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_tzjsbl, "调整结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_sdlje, "水电路金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_sdljsbl, "水电路结算比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsje, "结算总额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clf, "材料费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clyf, "材料运费"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_gdyp, "工地用品"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_yfgck, "已付工程款"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_kzbjjbl, "应扣质保金比例"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_kzbj, "扣质保金"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clfk, "材料罚款"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jfje, "奖罚金额"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_yfje, "应付金额"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_chsgdjs_jsrq, "结算日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_chsgdjs_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
