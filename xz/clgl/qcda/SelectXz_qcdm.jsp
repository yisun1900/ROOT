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
<form method="post" action="Xz_qcdmList.jsp" name="selectform">
  <div align="center">��������ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�����ƺ�</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_qcph" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�����ֹ�˾</td>
      <td width="31%">
        <select name="xz_qcdm_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">˾������</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_sjxm" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">�����ͺ�</td>
      <td width="31%">
        <input type="text" name="xz_qcdm_qcxh" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_gcsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_gcsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">������� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_njrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_njrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">����ʹ������ ��</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_yxsgls" size="20" maxlength="17" >
      </td>
      <td align="right" width="19%">��</td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_yxsgls2" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼����</td>
      <td width="32%">
        <input type="text" name="xz_qcdm_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="xz_qcdm_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="19%">�� </td>
      <td width="31%"> 
        <input type="text" name="xz_qcdm_lrsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.xz_qcdm_gcsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_gcsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_njrq, "�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_njrq2, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_qcdm_yxsgls, "����ʹ������"))) {
		return false;
	}
	if(!(isFloat(FormName.xz_qcdm_yxsgls2, "����ʹ������"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_qcdm_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
