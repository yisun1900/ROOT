<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] sgd =request.getParameterValues("sgd");

%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%"> 
      <div align="center">批量调[人工费百分比]</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="SavePlsz.jsp" name="selectform">
          <table width="100%" >
            <tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="57%" bgcolor="#FFFFFF"> 

<%
for (int i=0;i<sgd.length ;i++ )
{
	%>
	<input type="hidden" name="sgd" value="<%=sgd[i]%>" >
	<%
}

%>              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right"><span class="STYLE1">*</span>人工费百分比</td>
              <td width="57%" bgcolor="#FFFFFF">

                <input name="rgfbfb" type="text" size="10" maxlength="8">
                ％
              </td>
            </tr>
            <tr> 
              <td width="43%" height="73" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="57%" height="73" bgcolor="#FFFFFF"> 
                <input type="button"  value="批量设置" onClick="submit_onclick(selectform)"></td>
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

function submit_onclick(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("请选择[人工费百分比]！");
		FormName.rgfbfb.focus();
		return false;
	}

	if(!(isFloat(FormName.rgfbfb, "人工费百分比"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
