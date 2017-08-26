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
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgddCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_ddbh" size="20" maxlength="9" >
              </td>
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_hth" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_fwdz" size="20" maxlength="100" >
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">驻店家居顾问</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_clgw" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">家居设计师&nbsp;</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_cgsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">计划初测时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhccsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">实初测时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sccsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sccsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">计划复测时间 从</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhfcsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">实复测时间 从</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sfcsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sfcsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">可复测标志</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_kfcbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+可复测&N+不可复测","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">客户类型</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_khlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+装修客户&2+橱柜客户","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签合同时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_qhtsj" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_qhtsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">退单标志</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_tdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+预订用户&2+签单用户&3+退单用户","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">退单原因</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_cgtdyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jctdyybm,jctdyymc from jdm_jctdyybm order by jctdyybm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">计划安装日期 从</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhazrq" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_jhazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">实安装日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sazrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"00+预订单未完成&01+预订单已完成&11+设计部已审核&12+综合经营部已审核&21+已确定初测时间&22+已初测&23+初测已审核&24+已确定复测时间&25+已复测&26+报价方案已审核&31+签订合同&41+工厂已下单&42+原料采购&43+车间生产&44+入库&51+已确定安装时间&52+安装完成","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">结算进度</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_jsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"0+未结算&1+首期款已结算&2+中期款已结算&3+尾款已结算","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">是否需回访</td>
              <td width="32%"> 
                <select name="jc_cgdd_sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="Y">需回访</option>
                </select>
              </td>
              <td width="18%" align="right">回访类型</td>
              <td width="32%"> 
                <select name="jc_cgdd_hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='4' order by hflxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%"> 
                <div align="right">应回访日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_hfrq" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">到</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_hfrq2" size="20" maxlength="10" value="<%=cf.today()%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">录入时间 从</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_lrsj" size="20" maxlength="10" >
              </td>
              <td width="18%" align="right">到</td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jc_cgdd_lrr" size="20" maxlength="20" >
              </td>
              <td width="18%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="32%"> 
                <select name="jc_cgdd_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%> 
                </select>
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
	if(!(isDatetime(FormName.jc_cgdd_sazrq, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_sazrq2, "实安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_hfrq, "应回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jc_cgdd_hfrq2, "应回访日期"))) {
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
