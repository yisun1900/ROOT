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
      <div align="center">���������۷�ʽ</div>
    </td>
  </tr>
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="SavePltzxsfs.jsp" name="selectform">
          <table width="100%" >
            <tr> 
              <td width="29%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="71%" bgcolor="#FFFFFF"> 
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
              <td width="29%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
              <td width="71%" bgcolor="#FFFFFF">
				<input type="radio" name="xsfs" value="1">����Ʒ���޿�桿<BR>
				<input type="radio" name="xsfs" value="4">����Ʒ���������⡿<BR>
				</td>
            </tr>
            <tr> 
              <td height="73" colspan="2" align="center" bgcolor="#FFFFFF"> 
                <input type="button"  value="��������" onClick="submit_onclick(selectform)"></td>
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

function submit_onclick(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[���۷�ʽ]��");
		FormName.xsfs[0].focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
