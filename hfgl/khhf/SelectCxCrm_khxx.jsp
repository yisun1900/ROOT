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

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">�ͻ����</div>
  </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
  </td>
              <td width="16%"> 
                <div align="right">�ͻ�����</div>
  </td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">���ݵ�ַ</div>
  </td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
  </td>
              <td width="16%"> 
                <div align="right">��ϵ��ʽ</div>
  </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">���ʦ</div>
  </td>
              <td width="33%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
  </td>
              <td width="16%"> 
                <div align="right">ʩ����</div>
  </td>
              <td width="34%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">�ʼ�����</div>
  </td>
              <td width="33%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" >
  </td>
              <td width="16%"> 
                <div align="right">�ط�����</div>
  </td>
              <td width="34%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">�ط����� ��</div>
  </td>
              <td width="33%"> 
                <input type="text" name="hfrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">��</div>
  </td>
              <td width="34%"> 
                <input type="text" name="hfrq2" size="20" maxlength="10" value="<%=cf.today()%>">
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
	if(!(isDatetime(FormName.hfrq, "�ط�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq2, "�ط�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
