<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="InsertCw_jckmdm1.jsp" name="insertform" >
<div align="center"><strong>¼�뼯�ɿ�Ŀ����</strong></div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="30%" height="22" align="right"><span class="STYLE1">*</span>�տ�����</td>
      <td height="22"> 
        <input type="radio" name="fklxbm" value="21" >
        ľ�ſ� 
        <input type="radio" name="fklxbm" value="22" >
        ����� 
        <input type="radio" name="fklxbm" value="23" >
        ���Ŀ� 
        <input type="radio" name="fklxbm" value="24" >
        �Ҿ߿�
        <input type="radio" name="fklxbm" value="81" >
        ���� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="30%"><span class="STYLE1">*</span>�ֹ�˾����</td>
      <td width="70%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
}
else{
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') ans dwbh='"+ssfgs+"' order by dwbh","");
}

%>
        </select></td>
    </tr>
    
    <tr align="center"> 
      <td colspan="2"> 
        <input type="button"  value="����" onClick="f_do(insertform)"></td>
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
	if(	!radioChecked(FormName.fklxbm)) {
		alert("��ѡ��[�տ�����]��");
		FormName.fklxbm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾����]��");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
