<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">橱柜订单查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgddCxListTj.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="21%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">合同号</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
              </td>
              <td width="21%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="21%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="29%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">驻店家居顾问</td>
              <td width="29%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>
              </td>
              <td width="21%" align="right">展厅家居顾问</td>
              <td width="29%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc  from sq_yhxx where zwbm='08'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">项目专员</div>
              </td>
              <td width="29%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc c1,yhmc c2 from sq_yhxx where zwbm='10' order by yhmc","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">家居设计师&nbsp;</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_cgsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">计划初测时间 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">实初测时间 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">计划复测时间 从</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right">实复测时间 从</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">签合同时间 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">计划安装日期 从</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%"> 
                <div align="right">安装完成时间 从</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="21%"> 
                <div align="right">到</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">录入时间 从</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrsj" size="20" value="" maxlength="10" >
              </td>
              <td width="21%" align="right">到</td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrsj2" size="20" value="" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">录入人</div>
              </td>
              <td width="29%"> 
                <input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="21%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="29%"> 
                <select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="29%"> 
                <select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clzt,clztmc from jdm_cgddzt order by clzt","");
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">退单原因</div>
              </td>
              <td width="29%"> 
                <select name="jctdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="29%"> 
                <input type="radio" name="jc_cgdd_khlx" value="2">
                家装客户 
                <input type="radio" name="jc_cgdd_khlx" value="4">
                非家装客户 </td>
              <td width="21%"> 
                <div align="right"></div>
              </td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="21%" height="37">显示风格</td>
              <td colspan="3" height="37"> 
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.jc_cgdd_jhccsj, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhccsj2, "计划初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sccsj2, "实初测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhfcsj2, "计划复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sfcsj2, "实复测时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_qhtsj2, "签合同时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_jhazrq2, "计划安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "安装完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "安装完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

