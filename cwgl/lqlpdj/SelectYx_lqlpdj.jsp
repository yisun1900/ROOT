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
String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yx_lqlpdjList.jsp" name="selectform">
  <div align="center">��ȡ��Ʒ--�޸�</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�ͻ����</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">�ͻ�����</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ݵ�ַ</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">��ϵ��ʽ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_lxfs" size="20" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ʦ</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��Ʒ����</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lpmc" size="20" maxlength="50" >
      </td>
      <td align="right" width="17%">��Ʒ����</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lpsl" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ȡʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">¼����</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">¼�벿��</td>
      <td width="33%">
        <select name="yx_lqlpdj_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">¼��ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_lrsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_lrsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�Ƿ��˻�</td>
      <td width="32%">
        <input type="radio" name="yx_lqlpdj_shth" value="1" checked>
        ��ȡ </td>
      <td align="right" width="17%">�˻صǼ���</td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_thdjr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">�˻صǼ�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="yx_lqlpdj_thdjsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">�� </td>
      <td width="33%"> 
        <input type="text" name="yx_lqlpdj_thdjsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.yx_lqlpdj_lpsl, "��Ʒ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lqsj2, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj, "�˻صǼ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yx_lqlpdj_thdjsj2, "�˻صǼ�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
