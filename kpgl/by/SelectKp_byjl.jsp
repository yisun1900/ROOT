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

<form method="post" action="Kp_byjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�����¼��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_byjlh" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_khbh" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_khxm" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_lxfs" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">���ʦ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ʩ����</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','7','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ʼ�Ա</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_zjy" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_jgrq" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_hth" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_slsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kp_byjl_slr" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_bydxlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+ʩ����&2+���ʦ&3+�ʼ�Ա","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="kp_byjl_bylxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"01+ý��&02+�ż�&03+���","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="kp_byjl_bynr" size="73" value="">
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
	if(!(isDatetime(FormName.kp_byjl_jgrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_byjl_slsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
