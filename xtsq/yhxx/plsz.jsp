<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010205")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String[] ygbh = request.getParameterValues("ygbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" >
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}

%>
		 ���ۣ���Ȩ 
          <table width="50%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF">
              <td width="42%" align="right"><span class="STYLE1">*</span>���ƴ��۷�ʽ</td>
              <td width="58%"><%
	cf.radioToken(out, "kzdzfs","1+����ë����&2+�����ۿ�","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ǩ�����ë����</td>
              <td><input name="zdmll" type="text" size="10" maxlength="10" >
              ��>0��<=100��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">ǩ������ۿ�</td>
              <td><input name="zkl" type="text" size="10" maxlength="10"  >
              ��>0��<=10��</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>ÿ�����������ۿ۴���</td>
              <td><input name="sqtszkcs" type="text" size="10" maxlength="10"  ></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td colspan="2" align="center"><input type="button"  value="����" onClick="f_do(selectform)" >              </td>
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
	if(	!radioChecked(FormName.kzdzfs)) {
		alert("��ѡ��[���ƴ��۷�ʽ]��");
		FormName.kzdzfs[0].focus();
		return false;
	}

	if (FormName.kzdzfs[0].checked)
	{
		if(	javaTrim(FormName.zdmll)=="") {
			alert("������[ǩ�����ë����]��");
			FormName.zdmll.focus();
			return false;
		}
		if(!(isFloat(FormName.zdmll, "ǩ�����ë����"))) {
			return false;
		}
		if (parseFloat(FormName.zdmll.value) <=0 || parseFloat(FormName.zdmll.value) >100)
		{
			alert("����[ǩ�����ë����]Ӧ����0��100֮�䣡");
			FormName.zdmll.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.zkl)=="") {
			alert("������[ǩ������ۿ�]��");
			FormName.zkl.focus();
			return false;
		}
		if(!(isFloat(FormName.zkl, "ǩ������ۿ�"))) {
			return false;
		}
		if (parseFloat(FormName.zkl.value) <=0 || parseFloat(FormName.zkl.value) >10)
		{
			alert("����[ǩ������ۿ�]Ӧ����0��10֮�䣡");
			FormName.zkl.select();
			return false;
		}
	}

	if(	javaTrim(FormName.sqtszkcs)=="") {
		alert("������[ÿ�����������ۿ۴���]��");
		FormName.sqtszkcs.focus();
		return false;
	}
	if(!(isInt(FormName.sqtszkcs, "ÿ�����������ۿ۴���"))) {
		return false;
	}


	FormName.action="SavePlsz.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
