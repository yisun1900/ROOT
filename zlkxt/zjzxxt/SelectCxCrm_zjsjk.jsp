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

<form method="post" action="Crm_zjsjkCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��¼��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_jlh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">ר�ҿ�����</div>
              </td>
              <td width="35%"> 
                <select name="crm_zjsjk_zjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjlxbm,zjlxmc from dm_zjlxbm order by zjlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_bt" size="20" maxlength="40" >
              </td>
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">¼������ ��</td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_lrrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_lrrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����</td>
              <td colspan="3"> 
                <textarea name="crm_zjsjk_nr" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(!(isNumber(FormName.crm_zjsjk_jlh, "��¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjsjk_lrrq, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjsjk_lrrq2, "¼������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
