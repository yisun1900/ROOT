<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_sjsectcbl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="xh" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ǩ������</td>
  <td colspan="3"><input type="radio" name="qdlx"  value="1">
���г�����װ
  <input type="radio" name="qdlx"  value="2">
�г�����װ
<input type="radio" name="qdlx"  value="3">
��װ </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֹ�˾���</td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') and cxbz='N' order by dwbh","");
%>
  </select>  </td>
  <td align="right">���ʦ����</td>
  <td><select name="sjsjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sjsjb,sjsjbmc from rs_sjsjb order by sjsjb","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֶ�����</td>
  <td colspan="3"><input type="text" name="fdmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���</td> 
  <td width="32%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">�յ�</td> 
  <td width="32%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ɰٷֱ�</td> 
  <td width="32%"> 
    <input type="text" name="tcbfb" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.fdmc)=="") {
		alert("������[�ֶ�����]��");
		FormName.fdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("������[���]��");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("������[�յ�]��");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "�յ�"))) {
		return false;
	}
	if(	javaTrim(FormName.tcbfb)=="") {
		alert("������[��ɰٷֱ�]��");
		FormName.tcbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tcbfb, "��ɰٷֱ�"))) {
		return false;
	}
	if(	!radioChecked(FormName.qdlx)) {
		alert("��ѡ��[ǩ������]��");
		FormName.qdlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾���]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sjsjb)=="") {
		alert("��ѡ��[���ʦ����]��");
		FormName.sjsjb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
