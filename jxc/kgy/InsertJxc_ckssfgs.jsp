<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ckssfgs.jsp" name="insertform" target="_blank">
<div align="center">��¼�룭�ֿ������ֹ�˾</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֿ���</td> 
  <td width="32%"> 
<select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ckbh,ckmc from jxc_ckmc order by dqbm,ckmc","");
%>
  </select>
  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�����ֹ�˾</td> 
  <td width="32%"> 
   <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:130PX" onChange="changeFgs(selectform);">
		<%
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
		%> 
</select>  
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ckbh)=="") {
		alert("������[�ֿ���]��");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
