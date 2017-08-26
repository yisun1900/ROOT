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

<form method="post" action="Kp_gczljcbCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">考评序号</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kp_gczljcb_kpxh" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_gczljcb_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">实开工日期 从</td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_sjkgrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%">
                <input type="text" name="crm_khxx_sjkgrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="32%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">施工队</div>
              </td>
              <td width="35%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">考评类型</div>
              </td>
              <td width="32%"> 
                <select name="kp_gczljcb_kplx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+质检员&2+巡检员&3+公司抽查","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">考评人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_gczljcb_kpr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">考评时间 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kp_gczljcb_kpsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">到</div>
              </td>
              <td width="35%">
                <input type="text" name="kp_gczljcb_kpsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_khxx_sjkgrq, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_sjkgrq2, "实际开工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_gczljcb_kpsj, "考评时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_gczljcb_kpsj2, "考评时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
