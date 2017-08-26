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

<form method="post" action="SaveInsertCrm_khhfjh.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="35%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">未回访</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">性别</div>
              </td>
              <td width="35%"> 
                <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="M">男</option>
                  <option value="W">女</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fwdz" value="" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">回访类型</td>
              <td width="35%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">回访日期</td>
              <td width="35%"> 
                <input type="text" name="xchfrq" value="" size="20" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xchfrq)=="") {
		alert("请输入[下次回访日期]！");
		FormName.xchfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xchfrq, "下次回访日期"))) {
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[回访类型]！");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("请选择[性别]！");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.clzt)=="") {
		alert("请选择[处理状态]！");
		FormName.clzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
