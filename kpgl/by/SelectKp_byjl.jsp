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

<form method="post" action="Kp_byjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表扬记录号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_byjlh" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_khxm" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_lxfs" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">施工队</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','7','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">质检员</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_zjy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">交工日期</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_jgrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">合同号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">受理时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_slsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">受理人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_slr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表扬对象</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_bydxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+施工队&2+设计师&3+质检员","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">表扬类型</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_bylxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"01+媒体&02+信件&03+造假","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">表扬内容</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="kp_byjl_bynr" size="73" value="">
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
	if(!(isDatetime(FormName.kp_byjl_jgrq, "交工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_byjl_slsj, "受理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
