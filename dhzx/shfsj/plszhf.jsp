<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String[] khbh=request.getParameterValues("khbh");
%>

<html>
<head>
<title>设置回访时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

        <form method="post" action="SavePlszhf.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b><font color="#000066">批量设置回访时间</font></b></td>
            </tr>
            
            <tr bgcolor="#FFFFCC"> 
              <td width="17%" align="right">是否需回访</td>
              <td width="33%"> 
                <select name="sfxhf" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+需回访&N+不需回访","Y");

 %> 
                </select>              </td>
              <td width="15%" align="right">回访日期</td>
              <td width="35%"> 
                <input type="text" name="hfrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
<%
	for (int i=0;i<khbh.length ;i++ )
	{
		%>
		<input type="hidden" name="khbh"  value="<%=khbh[i]%>" >
		<%
	}
%>
				
				<input type="button"  value="保存" onClick="f_do(editform)">
				<input type="reset"  value="重输"></td>
            </tr>
          </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sfxhf)=="") {
		alert("请选择[是否需回访]！");
		FormName.sfxhf.focus();
		return false;
	}
	if (FormName.sfxhf.value=="Y")
	{
		if(	javaTrim(FormName.hfrq)=="") {
			alert("请选择[回访日期]！");
			FormName.hfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfrq, "回访日期"))) {
			return false;
		}
	}
	else{
		FormName.hfrq.value="";

	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
