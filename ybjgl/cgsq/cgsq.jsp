<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td colspan="2" height="72"> 
        <div align="center"><b><font face="����_GB2312" size="4">�����ι�����</font></b></div>
      </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="51"><b> �Ƿ�ǩԼ��</b></td>
      <td width="59%" height="51"> 
        <input type="radio" name="sfyqd" value="N">
        δǩ�� 
        <input type="radio" name="sfyqd" value="Y">
        ��ǩ�� </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="9"><b>�ֹ�˾��</b></td>
      <td width="59%" height="9"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="2"><b>�������棺</b></td>
      <td width="59%" height="2"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
      <td width="36%" align="right" height="46"><b>�ͻ�������</b></td>
      <td width="59%" height="46"> 
        <input type="text" name="khxm" size="20" maxlength="20">
      </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="46"><b>���ݵ�ַ��</b></td>
      <td width="59%" height="46"> 
        <input type="text" name="fwdz" size="20" maxlength="100">
      </td>
    </tr>
    <tr> 
      <td width="36%" align="right" height="46"><b>��ͬ�ţ�</b></td>
      <td width="59%" height="46"> 
        <input type="text" name="hth" size="20" maxlength="20">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2" height="41"> 
        <input type="button" name="Button" value="����" onClick="f_do(insertform)">
        <input type="reset" name="Submit2" value="����">
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
	if(	!radioChecked(FormName.sfyqd)) {
		alert("��ѡ��[�Ƿ���ǩ��]��");
		FormName.sfyqd[0].focus();
		return false;
	}
	if (FormName.sfyqd[0].checked)
	{
		if(	javaTrim(FormName.khxm)=="" && javaTrim(FormName.fwdz)=="" ) {
			alert("��ѡ��[�ͻ����������ݵ�ַ]��");
			FormName.khxm.focus();
			return false;
		}

		FormName.action="Crm_zxkhxxCxList.jsp";
	}
	else{
		if(	javaTrim(FormName.khxm)=="" && javaTrim(FormName.fwdz)=="" && javaTrim(FormName.hth)=="") {
			alert("��ѡ��[�ͻ����������ݵ�ַ����ͬ��]��");
			FormName.khxm.focus();
			return false;
		}
		FormName.action="Crm_khxxCxList.jsp";

	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
