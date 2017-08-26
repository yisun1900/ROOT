<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
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

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>升级是否有促销</td>
              <td colspan="3" bgcolor="#FFFFFF"><input type="radio" name="sjsfycx" value="1">
                无促销
                <input type="radio" name="sjsfycx" value="2">
                无数量限制促销
                <input type="radio" name="sjsfycx" value="3">
              有数量限制促销 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">促销开始时间</td>
              <td width="30%" bgcolor="#FFFFFF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td width="20%" align="right" bgcolor="#FFFFFF">促销结束时间</td>
              <td width="30%" bgcolor="#FFFFFF"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">促销升级差价</td>
              <td bgcolor="#FFFFFF"><input type="text" name="cxsjcj" value="" size="20" maxlength="9" ></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4" align="center" >
				<input type="hidden" name="chooseitem"  value="<%=chooseitem%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">              </td>
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
	if(	!radioChecked(FormName.sjsfycx)) {
		alert("请选择[升级是否有促销]！");
		FormName.sjsfycx[0].focus();
		return false;
	}

	if (FormName.sjsfycx[1].checked || FormName.sjsfycx[2].checked)
	{
		if(	javaTrim(FormName.cxsjcj)=="") {
			alert("请输入[促销升级差价]！");
			FormName.cxsjcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxsjcj, "促销升级差价"))) {
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
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjssj.select();
			return false;
		}
	}
	else{
		FormName.cxsjcj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
	}

	
	FormName.action="SavePlxgcx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
