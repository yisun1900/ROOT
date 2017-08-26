<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ddbh=request.getParameter("ddbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入柜体明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_ddgtmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">总价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zj" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">家具类别</div>
              </td>
              <td width="35%"> 
                <select name="jjlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjlbbm,jjlbmc from jdm_jjlbbm order by jjlbbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">柜体名称</div>
              </td>
              <td width="35%"> 
                <select name="jjgtmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjgtmcbm,jjgtmc from jdm_jjgtmcbm order by jjgtmcbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">柜体长度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtcd" value="" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">柜体宽度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtkd" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">柜体高度</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gtgd" value="" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">板材颜色</div>
              </td>
              <td width="35%"> 
                <select name="gtbcysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gtbcysbm,gtbcysmc from jdm_gtbcysbm order by gtbcysbm","");
%> 
                </select>
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjlbbm)=="") {
		alert("请选择[家具类别]！");
		FormName.jjlbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jjgtmcbm)=="") {
		alert("请选择[柜体名称]！");
		FormName.jjgtmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gtcd, "柜体长度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtkd, "柜体宽度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtgd, "柜体高度"))) {
		return false;
	}
	if(!(isNumber(FormName.gtbcysbm, "板材颜色"))) {
		return false;
	}
	if(!(isNumber(FormName.zj, "总价"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
