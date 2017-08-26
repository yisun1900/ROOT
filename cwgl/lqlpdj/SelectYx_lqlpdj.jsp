<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yx_lqlpdjList.jsp" name="selectform">
  <div align="center">领取礼品--修改</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">客户编号</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">客户姓名</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">房屋地址</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">联系方式</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">设计师</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">礼品名称</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lpmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="17%">礼品数量</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lpsl" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">领取时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">录入人</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">录入部门</td>
      <td width="33%">
        <select name="yx_lqlpdj_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">是否退回</td>
      <td width="32%">
        <input type="radio" name="yx_lqlpdj_shth" value="1" checked>
        领取 </td>
      <td align="right" width="17%">退回登记人</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_thdjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">退回登记时间 从</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_thdjsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">到 </td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_thdjsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.yx_lqlpdj_lpsl, "礼品数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj2, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj, "退回登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj2, "退回登记时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
