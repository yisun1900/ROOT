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

<form method="post" action="Kp_zjkpjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������¼��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpjlh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">�����ֹ�˾</div>
              </td>
              <td width="35%"> 
                <select name="kpfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">������ʼʱ��</td>
              <td width="35%"> 
                <input type="text" name="qssj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">������ֹʱ��</td>
              <td width="35%"> 
                <input type="text" name="jzsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">¼��ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
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
	if(!(isNumber(FormName.kpjlh, "������¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.qssj, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "������ֹʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
