<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�����޸�ʩ���ӵ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String[] cpbm = request.getParameterValues("cpbm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><strong> �����޸�ʩ���ӵ���</strong></div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td width="81%" colspan="3"> 
                <input type="radio" name="jgqz" value="Y">
                ���ȡ�� 
                <input type="radio" name="jgqz" value="N">
                �����ȡ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%">&nbsp;</td>
              <td colspan="3"> 
                <p>ʩ���ӵ��ۣ�ԭʩ���ӵ��ۡ�ϵ��
                  <input name="xs" type="text" size="10" maxlength="10">
                </p>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
			  <%
			  for (int i=0;i<cpbm.length ;i++ )
			  {
				  %>
					<input type="hidden" name="cpbm" value="<%=cpbm[i]%>"  >              
				  <%
			  }
			  %>
                <input type="button" name="Button" value="��ʼ�޸�" onClick="plxg(selectform)" >              
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
function plxg(FormName,lx)//����FormName:Form������
{
	if(	!radioChecked(FormName.jgqz)) {
		alert("��ѡ��[���ȡ��]��");
		FormName.jgqz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.xs)=="") {
		alert("������[ϵ��]��");
		FormName.xs.focus();
		return false;
	}
	if(!(isFloat(FormName.xs, "ϵ��"))) {
		return false;
	}


	if (!confirm("ȷʵҪ�޸���?") )	
	{
		return;
	}

	FormName.action="SavePlxgsggdj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
