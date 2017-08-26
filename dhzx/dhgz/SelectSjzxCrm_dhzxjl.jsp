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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_dhzxjlSjzxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_khxm" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">性别</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "crm_dhzxjl_xb","1+男&2+女","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">联系电话</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_lxdh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">户型面积</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_hxmj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">咨询类型</div>
              </td>
              <td width="33%"> 
                <select name="crm_dhzxjl_zxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxlxbm,zxlxmc from dm_zxlxbm order by zxlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">交房日期 从</td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_jfrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">到</td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_jfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">电话咨询时间 从</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_zxsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_zxsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">处理方式</div>
              </td>
              <td width="30%"> 
                <select name="crm_dhzxjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">反馈设计中心</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right">电话受理人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_slr" size="20" maxlength="16" >
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
	if(!(isNumber(FormName.crm_dhzxjl_hxmj, "户型面积"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_jfrq, "交房日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_jfrq2, "交房日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_zxsj, "电话咨询时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_zxsj2, "电话咨询时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
