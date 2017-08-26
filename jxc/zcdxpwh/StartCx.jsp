<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] clbm = request.getParameterValues("clbm");
	String dqbm=request.getParameter("dqbm");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 促销信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">是否有促销</td>
              <td width="30%"> 
                <INPUT type="radio" name="sfycx" value="Y" checked>
                有促销 </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">促销价修改公式：</td>
              <td colspan="3"> 
                <select name="fh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">乘</option>
                  <option value="/">除</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="cbj">结算价</option>
                  <option value="lsj">市场标价</option>
                  <option value="xsj">销售价</option>
                  <option value="cxj">促销价</option>
                </select>
                <input type="text" name="xs" size="14">
                <input type="button"  value="增加" onClick="gs.value+=fh.value+xs.value" name="button">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">促销价= </td>
              <td colspan="3"> 
                <input type="text" name="gs" size="30" readonly="true">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right">促销结算价</td>
              <td width="30%"> 
                <input type="text" name="cxcbj" value="" size="20" maxlength="9" >
              </td>
              <td width="20%" align="right">促销期计入活动比例</td>
              <td width="30%"> 
                <input type="text" name="lscxhdbl" value="" size="12" maxlength="9" >
                % <font color="#0000CC">（百分比）</font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">促销开始时间</td>
              <td width="30%"> 
                <input type="text" name="cxkssj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="20%" align="right">促销结束时间</td>
              <td width="30%"> 
                <input type="text" name="cxjzsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> <%
	for (int i=0;i<clbm.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"clbm\"  value=\""+clbm[i]+"\">");
	}
%> 
				<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.gs)=="") {
		alert("请输入[促销价修改公式]！");
		FormName.gs.focus();
		return false;
	}

	if(	javaTrim(FormName.cxcbj)=="") {
		alert("请输入[促销结算价]！");
		FormName.cxcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cxcbj, "促销结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.lscxhdbl)=="") {
		alert("请输入[促销期计入活动比例]！");
		FormName.lscxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.lscxhdbl, "促销期计入活动比例"))) {
		return false;
	}
	if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
	{
		alert("错误！[促销期计入活动比例]应在0到100之间");
		FormName.lscxhdbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cxkssj)=="") {
		alert("请输入[促销开始时间]！");
		FormName.cxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjzsj)=="") {
		alert("请输入[促销结束时间]！");
		FormName.cxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) {
		return false;
	}
	if (FormName.cxkssj.value>FormName.cxjzsj.value)
	{
		alert("[促销开始时间]不能大于[促销结束时间]！");
		FormName.cxjzsj.select();
		return false;
	}

	
	FormName.action="SaveStartCx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
