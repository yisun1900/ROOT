<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCw_kmdmb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">��Ŀ����</div>
  </td>
              <td width="26%"> 
                <input type="text" name="kmdm" value="" size="20" maxlength="40" >
  </td>
              <td width="24%"> 
                <div align="right">��һ��������Ŀ�����������
</div>
  </td>
              <td width="25%"> 
                <input type="text" name="xmmc1" value="" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">�ڶ���������Ŀ�����������
</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc2" value="" size="20" maxlength="80" >
  </td>
              <td width="24%"> 
                <div align="right">������������Ŀ�����������
</div>
  </td>
              <td width="25%"> 
                <input type="text" name="xmmc3" value="" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">���ĸ�������Ŀ�����������
</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc4" value="" size="20" maxlength="80" >
  </td>
              <td width="24%"> 
                <div align="right">ʹ�õ�λ</div>
  </td>
              <td width="25%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<!--     <option value=""></option>
 --><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%>
    </select>
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.kmdm)=="") {
		alert("������[��Ŀ����]��");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc1)=="") {
		alert("������[��Ŀ����1]��");
		FormName.xmmc1.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[ʹ�õ�λ]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

