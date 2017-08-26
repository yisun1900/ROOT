<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] clbm =request.getParameterValues("clbm");
String dqbm =request.getParameter("dqbm");
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
      <div align="center">批量调[是否常用]</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="SavePltzsfcy.jsp" name="selectform">
          <table width="100%" >
            <tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="57%" bgcolor="#FFFFFF"> 
	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
<%
for (int i=0;i<clbm.length ;i++ )
{
	%>
	<input type="hidden" name="clbm" value="<%=clbm[i]%>" >
	<%
}

%>              </td>
            </tr>
			<tr> 
              <td width="43%" bgcolor="#FFFFFF" align="right"><span class="STYLE1">*</span>是否常用</td>
              <td width="57%" bgcolor="#FFFFFF">
			  <input type="radio" name="sfcy" value="Y">
				常用
				<input type="radio" name="sfcy" value="N">
				非常用</td>
            </tr>
            <tr> 
              <td width="43%" height="73" bgcolor="#FFFFFF">&nbsp;</td>
              <td width="57%" height="73" bgcolor="#FFFFFF"> 
                <input type="button"  value="批量调整" onClick="submit_onclick(selectform)"></td>
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
	if(	!radioChecked(FormName.sfcy)) {
		alert("请选择[是否常用]！");
		FormName.sfcy[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
