<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_pjxmbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">������Ŀ����(6λ)</td> 
      <td width="32%"> 
        <input type="text" name="pjxmbm" size="20" maxlength="6" >
  </td>
      <td align="right" width="18%">������Ŀ</td> 
      <td width="32%"> 
        <input type="text" name="pjxm" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��������Ա</td> 
      <td width="32%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm","");
%>
    </select>
  </td>
      <td align="right" width="18%">��Ŀ����</td> 
      <td width="32%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��ʾ��ʽ</td> 
      <td width="32%"> <%
	cf.radioToken(out, "xsfs","1+��Ŀ�����ѡ&2+��Ŀ���൥ѡ","");
%> </td>
      <td align="right" width="18%">���</td> 
      <td width="32%"> 
        <input type="text" name="xh" size="20" maxlength="8" >
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
