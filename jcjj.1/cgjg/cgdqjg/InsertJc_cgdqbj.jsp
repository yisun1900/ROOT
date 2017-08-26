<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_cgdqbj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">电器编码</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dqbm" value="" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">生产厂家</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">电器名称</td>
              <td width="35%"> 
                <input type="text" name="dqmc" value="" size="20" maxlength="50" >
              </td>
              <td width="15%" align="right">电器类别</td>
              <td width="35%"> 
                <select name="dqlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqlbbm,dqlbmc from jdm_dqlbbm order by dqlbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">型号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">规格</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">计量单位</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jldw" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">产地</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cd" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">产品特征</td>
              <td colspan="3"> 
                <textarea name="cptz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">零售价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lsj" value="" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">优惠价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhj" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">照片</td>
              <td colspan="3"> 
                <input type="text" name="zp" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[电器编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqmc)=="") {
		alert("请输入[电器名称]！");
		FormName.dqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dqlbbm)=="") {
		alert("请选择[电器类别]！");
		FormName.dqlbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[零售价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "零售价"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("请输入[优惠价]！");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "优惠价"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[生产厂家]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
