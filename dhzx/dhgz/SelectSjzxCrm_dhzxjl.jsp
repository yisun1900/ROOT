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

<form method="post" action="Crm_dhzxjlSjzxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_khxm" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="33%"> <%
	cf.radioToken(out, "crm_dhzxjl_xb","1+��&2+Ů","");
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��ϵ�绰</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_lxdh" size="20" maxlength="20" >
              </td>
              <td width="17%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_hxmj" size="20" maxlength="8" >
              </td>
              <td width="17%"> 
                <div align="right">��ѯ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_dhzxjl_zxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxlxbm,zxlxmc from dm_zxlxbm order by zxlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�������� ��</td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_jfrq" size="20" maxlength="10" >
              </td>
              <td width="17%" align="right">��</td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_jfrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�绰��ѯʱ�� ��</div>
              </td>
              <td width="30%"> 
                <input type="text" name="crm_dhzxjl_zxsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_zxsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">����ʽ</div>
              </td>
              <td width="30%"> 
                <select name="crm_dhzxjl_clfs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">�����������</option>
                </select>
              </td>
              <td width="17%"> 
                <div align="right">�绰������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dhzxjl_slr" size="20" maxlength="16" >
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
	if(!(isNumber(FormName.crm_dhzxjl_hxmj, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_jfrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_jfrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_zxsj, "�绰��ѯʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dhzxjl_zxsj2, "�绰��ѯʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
