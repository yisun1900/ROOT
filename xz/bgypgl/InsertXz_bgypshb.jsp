<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dwbh='"+dwbh+"'
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
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

<form method="post" action="SaveInsertXz_bgypshb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���벿��</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">

<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sqrq" value=<%=cf.today()%> size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sqr" value="<%=lrr%>" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�칫��Ʒ</div>
  </td>
  <td width="35%"> 
    <select name="bgypbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bgypbh,bgypmc from xz_bgypbm where ssfgs='"+ssfgs+"' order by bgypbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sqsl" value="" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">���½������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="syjcsl" value="" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ע</div>
  </td>
  <td width="85%" colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>
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
		alert("��ѡ��[���벿��]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bgypbh)=="") {
		alert("��ѡ��[�칫��Ʒ���]��");
		FormName.bgypbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsl)=="") {
		alert("������[��������]��");
		FormName.sqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.sqsl, "��������"))) {
		return false;
	}
	if(!(isNumber(FormName.syjcsl, "���½������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
