<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护－提成记入比例</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>正常品提成记入比例</td>
              <td><input type="text" name="tcjrbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="45%" align="right"><font color="#FF0000">*</font>特价品提成记入比例</td>
              <td width="55%"><input type="text" name="tjptcjrbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center">
				<%
				for (int i=0;i<ddbh.length ;i++ )
				{
					%>
                  <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
					<%
				}
				%>
                  <input type="button" value="保存" onClick="f_do(editform)">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.tcjrbl)=="") {
		alert("请输入[正常品提成记入比例]！");
		FormName.tcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjrbl, "正常品提成记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tcjrbl.value)<0 || parseFloat(FormName.tcjrbl.value)>100) {
		alert("错误！[正常品提成记入比例]应在0与100之间");
		FormName.tcjrbl.select();
		return false;
	}
	if(	javaTrim(FormName.tjptcjrbl)=="") {
		alert("请输入[特价品提成记入比例]！");
		FormName.tjptcjrbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjptcjrbl, "特价品提成记入比例"))) {
		return false;
	}
	if(	parseFloat(FormName.tjptcjrbl.value)<0 || parseFloat(FormName.tjptcjrbl.value)>100) {
		alert("错误！[特价品提成记入比例]应在0与100之间");
		FormName.tjptcjrbl.select();
		return false;
	}


	FormName.action="SavePlEditWhTcblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
