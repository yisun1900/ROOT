<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String slbm=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
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

<form method="post" action="Crm_nbtsjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������¼��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tsjlh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="35%"> 
                <select name="crm_nbtsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">δ����</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_btsr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tsr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����ʱ�� ��</td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tssj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">��</td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_slr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_slsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼�벿��</div>
              </td>
              <td width="35%"> 
                <select name="crm_nbtsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by ssfgs,dwbh",slbm);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm);
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_clr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ʼʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_clkssj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">�������ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_cljssj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.crm_nbtsjl_tsjlh, "Ͷ�߼�¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj, "Ͷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj2, "Ͷ��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_slsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_clkssj, "����ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_cljssj, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
