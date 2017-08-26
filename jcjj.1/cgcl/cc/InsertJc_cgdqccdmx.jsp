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
String ddbh = request.getParameter("ddbh");
%>


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入电器初测单明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_cgdqccdmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="ddbh" value="<%=ddbh%>" size="30" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">电器名称</div>
              </td>
              <td width="35%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:222PX" onChange="getJg(dqbm,dj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc||'('||xh||')'||'￥:'||lsj from jc_cgdqbj order by dqbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">单价</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dj" value="" size="20" maxlength="9" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">数量</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sl" value="" size="30" maxlength="8" onchange="f_jsjg(insertform)">
              </td>
              <td width="15%"> 
                <div align="right">金额</div>
              </td>
              <td width="35%"> 
                <input type="text" name="je" value="" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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
function f_jsjg(FormName)//参数FormName:Form的名称
{
	FormName.je.value=FormName.dj.value*FormName.sl.value;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[电器名称]！");
		FormName.dqbm.focus();
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
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}

	f_jsjg(FormName);
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
