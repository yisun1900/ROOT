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

<form method="post" action="Crm_dgqkList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_khbh" size="20" maxlength="20" >
              </td>
              <td width="12%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="12%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">�ʼ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��Ʒ</div>
              </td>
              <td width="33%"> 
                <select name="crm_dgqk_cpbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cpbm,cpmc from dm_cpbm order by cpbm","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">פ��Ҿӹ���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_clgw" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">��Ӧ��</div>
              </td>
              <td width="33%"> 
                <select name="crm_dgqk_gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">Ʒ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_pp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <div align="right">ʵ�ʰ�װ���� ��</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_sazrq" size="20" maxlength="10" >
              </td>
              <td width="12%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">Ӧ��װ���� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_yazrq" size="20" maxlength="10" >
              </td>
              <td width="12%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_yazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">¼��ʱ�� ��</td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_lrsj" size="20" maxlength="10" >
              </td>
              <td width="12%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">¼����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_lrr" size="20" maxlength="20" >
              </td>
              <td width="12%"> 
                <div align="right">��װ��־</div>
              </td>
              <td width="35%">
                <select name="crm_dgqk_azbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+δ��װ&Y+�Ѱ�װ","");
%> 
                </select>
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
	if(!(isDatetime(FormName.crm_dgqk_yazrq, "Ӧ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_yazrq2, "Ӧ��װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_sazrq, "ʵ�ʰ�װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_sazrq2, "ʵ�ʰ�װ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
