<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

<form method="post" action="SaveInsertXz_xzzlkhb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���˲���</div>
  </td>
  <td width="35%"> 
    <select name="khbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�����˲���</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dqbm='"+dqbm+"' and dwlx='F2' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khsj" value=<%=cf.today()%> size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="khr" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����15��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cw" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">��ͬ10��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ht" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������10��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dmgl" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">�ļ�5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wj" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ʒ�豸10</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wpsb" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">�칫��Ʒ5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgyp" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������Ʒ5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xcyp" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">�����15��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gxbb" value="" size="20" maxlength="2" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jk" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">����7��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kq" value="" size="20" maxlength="1" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������8��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="gzap" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">�������ż���ԱͶ��5��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ts" value="" size="20" maxlength="1" >
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�����˲���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khsj)=="") {
		alert("������[����ʱ��]��");
		FormName.khsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.khr)=="") {
		alert("������[������]��");
		FormName.khr.focus();
		return false;
	}
	if(	javaTrim(FormName.cw)=="") {
		alert("������[����15��]��");
		FormName.cw.focus();
		return false;
	}
	if(!(isFloat(FormName.cw, "����15��"))) {
		return false;
	}
	if(	javaTrim(FormName.ht)=="") {
		alert("������[��ͬ10��]��");
		FormName.ht.focus();
		return false;
	}
	if(!(isFloat(FormName.ht, "��ͬ10��"))) {
		return false;
	}
	if(	javaTrim(FormName.dmgl)=="") {
		alert("������[�������10��]��");
		FormName.dmgl.focus();
		return false;
	}
	if(!(isFloat(FormName.dmgl, "�������10��"))) {
		return false;
	}
	if(	javaTrim(FormName.wj)=="") {
		alert("������[�ļ�5��]��");
		FormName.wj.focus();
		return false;
	}
	if(!(isFloat(FormName.wj, "�ļ�5��"))) {
		return false;
	}
	if(	javaTrim(FormName.wpsb)=="") {
		alert("������[��Ʒ�豸10]��");
		FormName.wpsb.focus();
		return false;
	}
	if(!(isFloat(FormName.wpsb, "��Ʒ�豸10"))) {
		return false;
	}
	if(	javaTrim(FormName.bgyp)=="") {
		alert("������[�칫��Ʒ5��]��");
		FormName.bgyp.focus();
		return false;
	}
	if(!(isFloat(FormName.bgyp, "�칫��Ʒ5��"))) {
		return false;
	}
	if(	javaTrim(FormName.xcyp)=="") {
		alert("������[������Ʒ5��]��");
		FormName.xcyp.focus();
		return false;
	}
	if(!(isFloat(FormName.xcyp, "������Ʒ5��"))) {
		return false;
	}
	if(	javaTrim(FormName.gxbb)=="") {
		alert("������[�����15��]��");
		FormName.gxbb.focus();
		return false;
	}
	if(!(isFloat(FormName.gxbb, "�����15��"))) {
		return false;
	}
	if(	javaTrim(FormName.jk)=="") {
		alert("������[���5��]��");
		FormName.jk.focus();
		return false;
	}
	if(!(isFloat(FormName.jk, "���5��"))) {
		return false;
	}
	if(	javaTrim(FormName.kq)=="") {
		alert("������[����7��]��");
		FormName.kq.focus();
		return false;
	}
	if(!(isFloat(FormName.kq, "����7��"))) {
		return false;
	}
	if(	javaTrim(FormName.gzap)=="") {
		alert("������[��������8��]��");
		FormName.gzap.focus();
		return false;
	}
	if(!(isFloat(FormName.gzap, "��������8��"))) {
		return false;
	}
	if(	javaTrim(FormName.ts)=="") {
		alert("������[�������ż���ԱͶ��5��]��");
		FormName.ts.focus();
		return false;
	}
	if(!(isFloat(FormName.ts, "�������ż���ԱͶ��5��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
