<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String[] khbh = request.getParameterValues("khbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr> 
    <td width="93%" height="2"> 
      <div align="center"> 
        <form method="post" action="" name="selectform" >
<%
	for (int i=0;i<khbh.length ;i++ )
	{
		%>
		<input type="hidden" name="khbh"  value="<%=khbh[i]%>" >
		<%
	}

%>
          �������ۼ��� 
          <table width="57%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF" align="center"> 
              <td width="68%" height="108"> �±��ۼ��� 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td width="68%" height="99"> 
                <input type="button"  value="�������ۼ���" onClick="f_jg(selectform)" name="button3">
              </td>
            </tr>
          </table>
          <BR>
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

function f_jg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[�±��ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}

	if ( !confirm("ȷʵҪ������?") )	
	{
		return;
	}

	FormName.action="SaveUpdateBjjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
