<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050271")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}

%>
<%
	String ssfgs=request.getParameter("ssfgs");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:16">
  <tr>
    <td width="100%"> 
      <div align="center">
        <p>��Ʒ��Ϣ�ϲ���<font color="#FF0000"><b><font color="#0000FF">�������ͻ�����Ʒ��Ϣ���ϲ���һ�𣬼�װ��Ϣ����</font></b></font>��</p>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="ViewHbCpKhxx.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="42%" height="36" align="right"> 
              �ֹ�˾</td>
              <td width="58%" height="36"> <%
	out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	out.println("        </select>");
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="42%" align="right" height="49"><font color="#FF0000"><b>�ͻ���ţ��ϲ���Ʒ��Ϣ��</b></font></td>
              <td width="58%" height="49"> 
                <input type="text" name="khbh" size="20" maxlength="7" >              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="42%" height="55" align="right"><font color="#0000FF">�ͻ���ţ���Ʒ��Ϣ��ɾ����</font></td>
              <td width="58%" height="55"> 
                <input type="text" name="khbh2" size="20" maxlength="7" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2"> 
                <input type="button"  value="����" onClick="f_do(selectform)">              </td>
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ϲ���Ʒ��Ϣ�ͻ�]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh2)=="") {
		alert("������[ɾ����Ʒ��Ϣ�ͻ�]��");
		FormName.khbh2.focus();
		return false;
	}

	if (FormName.khbh.value==FormName.khbh2.value)
	{
		alert("[�ϲ���Ʒ��Ϣ�ͻ�]��[ɾ����Ʒ��Ϣ�ͻ�]������ͬ��");
		FormName.khbh2.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
