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
<form method="post" action="Bj_bjmbList.jsp" name="selectform">
  <div align="center">��װģ��--ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">�����ֹ�˾</td>
      <td width="34%"> 
        <select name="sq_yhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
%> 
        </select>
      </td>
      <td align="right" width="16%">��������</td>
      <td width="34%"> 
        <select name="sq_yhxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">�û���½��</td>
      <td width="34%"> 
        <input type="text" name="bj_bjmb_yhdlm" size="20" maxlength="16" >
      </td>
      <td align="right" width="16%">Ա������</td>
      <td width="34%"> 
        <input type="text" name="sq_yhxx_yhmc" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">Ա��״̬</td>
      <td width="34%"> <%
	cf.radioToken(out, "sq_yhxx_sfzszg","M+ʵϰ��&Y+ת��&N+������&D+����&S+��ְ&T+����","");
%> </td>
      <td align="right" width="16%">ģ������</td>
      <td width="34%"> 
        <input type="text" name="bj_bjmb_mbmc" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">ģ������</td>
      <td width="34%"> <%
	cf.radioToken(out, "bj_bjmb_mblx","1+����ģ��&2+˽��ģ��","");
%> </td>
      <td align="right" width="16%">&nbsp; </td>
      <td width="34%">&nbsp; </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
