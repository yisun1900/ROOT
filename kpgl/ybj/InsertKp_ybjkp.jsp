<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ����俼��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������ʼʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qssj" value="2004-05-01" size="20" maxlength="10" >
              </td>
              <td width="18%"> 
                <div align="right">������ֹʱ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jzsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">������</font></div>
              </td>
              <td width="32%">
                <input type="text" name="kpr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.qssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[������ֹʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "������ֹʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kpr)=="") {
		alert("������[������]��");
		FormName.kpr.focus();
		return false;
	}

	FormName.action="SaveInsertKp_ybjkp.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
