<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gyslxr.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��</td> 
  <td colspan="3">
  <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
  <option value=""></option>
	<%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx  order by gysmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ϵ������</td> 
  <td width="32%"><input type="text" name="lxrxm" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%">�Ƿ���ְ</td> 
  <td width="32%"><select name="sflz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="Y">��ְ</option>
    <option value="N">��ְ</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ְ��</td>
  <td colspan="3"><input type="text" name="zw" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֻ�</td>
  <td colspan="3"><input type="text" name="sj" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�칫�绰</td>
  <td colspan="3"><input type="text" name="bgdh" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td colspan="3"><input type="text" name="cz" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
     <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("������[��ϵ������]��");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.sflz)=="") {
		alert("������[�Ƿ���ְ]��");
		FormName.sflz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
