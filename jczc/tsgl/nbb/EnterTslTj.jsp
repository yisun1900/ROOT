<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�±���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">Ͷ�߱����ʷ���</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">�ֹ�˾</td>
      <td width="58%" height="39"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">ǩԼ����</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">ͳ��ʱ�� ��</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">��</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">��ʾ���</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="134" colspan="2"> 
        <p> 
          <input type="button"  value="ͳ��ȫ��" onClick="f_do(selectform)">
          <input type="reset"  value="����">
        </p>
        <p> 
          <input type="button"  value="����Ͷ����ͳ��" onClick="f_gctjltj(selectform)" name="button32">
          <input type="button"  value="���̱�����ͳ��" onClick="f_gcbxltj(selectform)" name="button33">
        </p>
        <p> 
          <input type="button"  value="����Ͷ����ͳ��" onClick="f_jctjltj(selectform)" name="button32">
          <input type="button"  value="���ɱ�����ͳ��" onClick="f_jcbxltj(selectform)" name="button33">
        </p>
        <p>&nbsp;</p>
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
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="TslAllTjb.jsp";
	FormName.submit();
	return true;
}
function f_gctjltj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="GcTslTjb.jsp";
	FormName.submit();
	return true;
}
function f_gcbxltj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="GcBxlTjb.jsp";
	FormName.submit();
	return true;
}

function f_jctjltj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="JcTslTjb.jsp";
	FormName.submit();
	return true;
}
function f_jcbxltj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="JcBxlTjb.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>
