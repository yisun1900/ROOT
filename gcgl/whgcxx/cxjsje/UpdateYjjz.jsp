<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�ҵ����ֵ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String[] khbh=request.getParameterValues("khbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">�޸�ҵ����ֵ</div>



<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
      <td width="49%" align="right"><span class="STYLE1">*</span>ҵ����ֵ����</td>
      <td width="51%"><input type="text" name="yjjzcs" value="" size="20" maxlength="20"  ></td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
<%
for (int i=0;i<khbh.length ;i++ )
{
	%>
	  <input type="hidden" name="khbh" value="<%=khbh[i]%>" > 
	<%
}

%>
          <input name="wc" type="button" onClick="f_wcdz(insertform)"  value="�޸�" >
      <input type="reset"  value="����" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_wcdz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yjjzcs)=="") {
		alert("������[ҵ����ֵ����]��");
		FormName.yjjzcs.select();
		return false;
	}
	if(!(isFloat(FormName.yjjzcs, "ҵ����ֵ����"))) {
		return false;
	}


	FormName.action="SaveUpdateYjjz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
