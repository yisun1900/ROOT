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
<form method="post" action="Xz_qcdmList.jsp" name="selectform">
  <div align="center">汽车档案维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">汽车牌号</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcph" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">所属分公司</td>
      <td width="31%">
        <select name="xz_qcdm_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">司机姓名</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_sjxm" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">汽车型号</td>
      <td width="31%">
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">购车时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_gcsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_gcsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">年检日期 从</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_njrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_njrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">已行使公里数 从</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_yxsgls" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">到</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_yxsgls2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入人</td>
      <td width="32%">
        <input type="text" name="xz_qcdm_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">录入时间 从</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">到 </td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_lrsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.xz_qcdm_gcsj, "购车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_gcsj2, "购车时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_njrq, "年检日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_njrq2, "年检日期"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_qcdm_yxsgls, "已行使公里数"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_qcdm_yxsgls2, "已行使公里数"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
