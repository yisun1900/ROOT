<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Xz_pcsqTjList.jsp" name="selectform">
  <div align="center">出车情况统计</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">申请序号</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqxh" size="20" maxlength="8" >
      </td>
      <td align="right" width="15%">派车状态</td>
      <td width="35%"> 
        <select name="xz_pcsq_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">申请派车</option>
          <option value="2" selected>已派车</option>
          <option value="3">不同意</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">用车时间 从</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">返回时间 从</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_fhsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_fhsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">用车事由</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_ycsy" size="20" maxlength="200" >
      </td>
      <td align="right" width="15%">目的地</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_mdd" size="20" maxlength="30" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">申请人</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">申请部门</td>
      <td width="35%"> 
        <select name="xz_pcsq_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">申请日期 从</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sqrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">被派车号</td>
      <td width="35%"> 
        <select name="xz_pcsq_qcph" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select qcph c1,qcph||'：'||qcxh c2 from xz_qcdm order by qcph","");
%> 
        </select>
      </td>
      <td align="right" width="15%">派车人</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">汽车型号</td>
      <td width="35%"> 
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
      <td align="right" width="15%">司机姓名</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_sjxm" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">派车时间 从</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_pzsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">录入人</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">录入时间</td>
      <td width="35%"> 
        <input type="text" name="xz_pcsq_lrsj" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">出车情况统计</td>
      <td colspan="3"> 第一列 
        <input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">申请部门</option>
          <option value="qcph">汽车牌号</option>
          <option value="lrsj">录入时间</option>
          <option value="sqrq">申请日期</option>
          <option value="DECODE(xz_pcsq.clzt,'1','申请派车','2','已派车','3','不同意')">派车状态</option>
          <option value="ycsj">用车时间</option>
          <option value="fhsj">返回时间</option>
          <option value="sjxm">司机姓名</option>
        </select>
        第二列 
        <input type="hidden" name="tj2name" value="">
        <select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">申请部门</option>
          <option value="qcph">汽车牌号</option>
          <option value="lrsj">录入时间</option>
          <option value="sqrq">申请日期</option>
          <option value="DECODE(xz_pcsq.clzt,'1','申请派车','2','已派车','3','不同意')">派车状态</option>
          <option value="ycsj">用车时间</option>
          <option value="fhsj">返回时间</option>
          <option value="sjxm">司机姓名</option>
        </select>
        第三列 
        <input type="hidden" name="tj3name" value="">
        <select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
          <option value=""></option>
          <option value="dwmc">申请部门</option>
          <option value="qcph">汽车牌号</option>
          <option value="lrsj">录入时间</option>
          <option value="sqrq">申请日期</option>
          <option value="DECODE(xz_pcsq.clzt,'1','申请派车','2','已派车','3','不同意')">派车状态</option>
          <option value="ycsj">用车时间</option>
          <option value="fhsj">返回时间</option>
          <option value="sjxm">司机姓名</option>
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="18%">显示风格</td>
      <td colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
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
	if(!(isNumber(FormName.xz_pcsq_sqxh, "申请序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj, "用车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_ycsj2, "用车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj, "返回时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_fhsj2, "返回时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj, "派车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_pzsj2, "派车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_lrsj, "录入时间"))) {
		return false;
	}
	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("请选择[统计列]！");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
