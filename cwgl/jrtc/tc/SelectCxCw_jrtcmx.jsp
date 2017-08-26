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
<form method="post" action="Cw_jrtcmxCxList.jsp" name="selectform">
<div align="center">明细查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考核周期</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khzq" size="20" maxlength="6" >  </td>
  <td align="right" width="18%">客户编号</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户姓名</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">房屋地址</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">合同号</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">回单标志</td> 
  <td width="32%"> 
    <select name="cw_jrtcmx_hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐客户</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrtcmx_tckh","1+个性&2+套餐","");
%>  </td>
  <td align="right" width="18%">店长</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_dianz" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">文员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_weny" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">店面业务</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_khjl" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">设计师</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">材料员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_cly" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户经理</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_zjxm" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">小区主管</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzg" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">小区组长</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">小区专员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_xqzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">网络营销主管</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wlyxzg" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">营销专员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_yxzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">网站策划</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wzch" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">网页设计</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wysj" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">网站程序员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wzcxy" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">电话专员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_dhzy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">网站推广员</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_wztgy" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">司机</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_siji" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">类型</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "cw_jrtcmx_lx","1+签单提成&2+结算提成","");
%>  </td>
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="cw_jrtcmx_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入时间 从</td> 
  <td width="32%"><input type="text" name="cw_jrtcmx_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="18%">到 </td>
  <td width="32%"><input type="text" name="cw_jrtcmx_lrsj2" size="20" maxlength="10" >  </td>
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
	if(!(isDatetime(FormName.cw_jrtcmx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrtcmx_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
