<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ǩ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" >
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2" height="49"> 
        <div align="center"><font size="5" face="����_GB2312"><b><font face="����_GB2312">δǩ���ͻ�����</font></b></font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="47">¼��ʱ�䳬�� 
        <input type="text" name="lrsj" size="3" maxlength="3" value="30">
        ��</td>
      <td width="50%" height="47"> 
        <input type="button"  value="�鿴��ϸ" onClick="f_do(selectform,'lrsj')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="41">������泬�� 
        <input type="text" name="fpdm" size="3" maxlength="3" value="25">
        ��</td>
      <td width="50%" height="41">
        <input type="button"  value="�鿴��ϸ" onClick="f_do(selectform,'fpdm')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="50%" bgcolor="#FFFFFF" align="right" height="42">�������ʦ���� 
        <input type="text" name="fpsjs" size="3" maxlength="3" value="20">
        ��</td>
      <td width="50%" height="42">
        <input type="button"  value="�鿴��ϸ" onClick="f_do(selectform,'fpsjs')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td bgcolor="#FFFFFF" align="right" height="45">���������𳬹�
        <input type="text" name="jlfdj" size="3" maxlength="3" value="5">
        ��</td>
      <td height="45"><input type="button"  value="�鿴��ϸ" onClick="f_do(selectform,'jlfdj')">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="45">����Ʒѳ��� 
        <input type="text" name="jsjf" size="3" maxlength="3" value="5">
        ��</td>
      <td width="50%" height="45">
        <input type="button"  value="�鿴��ϸ" onClick="f_do(selectform,'jsjf')">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if (lx=="lrsj")
	{
		if(	javaTrim(FormName.lrsj)=="") {
			alert("������[¼��ʱ��]��");
			FormName.lrsj.focus();
			return false;
		}
		if(!(isNumber(FormName.lrsj, "¼��ʱ��"))) {
			return false;
		}

		FormName.action="LrsjCxList.jsp";
	}
	else if (lx=="fpdm")
	{
		if(	javaTrim(FormName.fpdm)=="") {
			alert("������[�������]��");
			FormName.fpdm.focus();
			return false;
		}
		if(!(isNumber(FormName.fpdm, "�������"))) {
			return false;
		}

		FormName.action="FpdmCxList.jsp";
	}
	else if (lx=="fpsjs")
	{
		if(	javaTrim(FormName.fpsjs)=="") {
			alert("������[�������ʦ]��");
			FormName.fpsjs.focus();
			return false;
		}
		if(!(isNumber(FormName.fpsjs, "�������ʦ"))) {
			return false;
		}

		FormName.action="FpsjsCxList.jsp";
	}
	else if (lx=="jlfdj")
	{
		if(	javaTrim(FormName.jlfdj)=="") {
			alert("������[����������]��");
			FormName.jlfdj.focus();
			return false;
		}
		if(!(isNumber(FormName.jlfdj, "����������"))) {
			return false;
		}

		FormName.action="JlfdjCxList.jsp";
	}
	else if (lx=="jsjf")
	{
		if(	javaTrim(FormName.jsjf)=="") {
			alert("������[����Ʒ�]��");
			FormName.jsjf.focus();
			return false;
		}
		if(!(isNumber(FormName.jsjf, "����Ʒ�"))) {
			return false;
		}

		FormName.action="JsjfCxList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
