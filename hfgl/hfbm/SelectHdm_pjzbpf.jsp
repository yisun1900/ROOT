<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hdm_pjzbpfList.jsp" name="selectform">
<div align="center">����ָ�����֣���ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�طö�������ָ��</td>
  <td colspan="3"><select name="dxpjzbbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb||'---��'||hfdxmc||'��' from hdm_dxpjzb,hdm_hfdxbm where hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm order by hdm_dxpjzb.hfdxbm,hdm_dxpjzb.dxpjzbbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ֱ���</td> 
  <td width="32%"><input type="text" name="pfbm" size="20" maxlength="1" ></td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"><input type="text" name="pfmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�÷�</td> 
  <td width="32%"><input type="text" name="df" size="20" maxlength="17" ></td>
  <td align="right" width="15%">���</td> 
  <td width="35%"><input type="text" name="xh" size="20" maxlength="8" ></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isFloat(FormName.df, "�÷�"))) {
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
