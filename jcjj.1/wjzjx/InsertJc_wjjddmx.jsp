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
String yddbh=request.getParameter("yddbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 五金件订单--增项</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_wjjddmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">预订单编号</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">五金件</div>
              </td>
              <td width="39%"> 
                <select name="xh" style="FONT-SIZE:12PX;WIDTH:260PX" onChange="changelx(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,wjjmc||'('||xinghao||')'||'￥:'||dj from jc_wjjbj,jdm_wjjbm where jc_wjjbj.wjjbm=jdm_wjjbm.wjjbm order by xh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">单价</font></div>
              </td>
              <td width="31%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">订购数量</div>
              </td>
              <td width="39%"> 
                <input type="text" name="sl" value="" size="35" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="78" rows="3"></textarea>
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
function changelx(FormName)//参数FormName:Form的名称
{
	FormName.dj.value=FormName.xh.options[FormName.xh.selectedIndex].text.substring(FormName.xh.options[FormName.xh.selectedIndex].text.indexOf(":")+1);
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请选择[五金件]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "五金件"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "订购数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
