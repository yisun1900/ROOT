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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jdm_qhjgqjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ľ�Ŷ�������</td>
              <td width="35%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
%> 
                </select>
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ǽ��۸��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqjbm" size="20" maxlength="2" >
              </td>
              <td width="15%"> 
                <div align="right">ǽ��۸�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qhjgqj" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ʼ��ȣ�>��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="qshd" size="20" maxlength="8" >
                mm </td>
              <td width="15%"> 
                <div align="right">��ֹ��ȣ�<=��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zzhd" size="20" maxlength="8" >
                mm </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="��ѯ" onClick="f_do(selectform)">
                <input type="reset"  value="����">
              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.qshd, "��ʼ���"))) {
		return false;
	}
	if(!(isNumber(FormName.zzhd, "��ֹ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
