<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >
  <table width="100%" border="0" style="FONT-SIZE:12">
    <tr align="center"> 
      <td colspan="2"><b><font color="#000099">ѡ���ѯ��������һ����</font></b></td>
    </tr>
    <tr> 
      <td width="50%"> 
        <input type="button" value="�ͺŲ�ѯ" onClick="f_cx1(editform)">
      </td>
      <td width="50%"> 
        <input type="button" value="�ͺŷֶ�" onClick="f_cx2(editform)">
      </td>
    </tr>
    <tr> 
      <td width="50%"> 
        <input type="button" value="���ϵ��" onClick="f_cx3(editform)">
      </td>
      <td width="50%"> 
        <input type="button" value="��������" onClick="f_cx4(editform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_cx1(FormName)//����FormName:Form������
{
	FormName.target="xhmain";
	FormName.action="xhmainList.jsp?ddbh=<%=ddbh%>";
	FormName.submit();

	FormName.target="cpmain";
	FormName.action="note31.jsp";
	FormName.submit();
	return true;
}
function f_cx2(FormName)//����FormName:Form������
{
	FormName.target="xhmain";
	FormName.action="xhfdmainList.jsp?ddbh=<%=ddbh%>";
	FormName.submit();

	FormName.target="cpmain";
	FormName.action="note31.jsp";
	FormName.submit();
	return true;
}
function f_cx3(FormName)//����FormName:Form������
{
	FormName.target="xhmain";
	FormName.action="lbmainList.jsp?ddbh=<%=ddbh%>&curPage=1";
	FormName.submit();

	FormName.target="cpmain";
	FormName.action="note31.jsp";
	FormName.submit();
	return true;
}
function f_cx4(FormName)//����FormName:Form������
{
	FormName.target="xhmain";
	FormName.action="zcmcmainList.jsp?ddbh=<%=ddbh%>&curPage=1";
	FormName.submit();

	FormName.target="cpmain";
	FormName.action="note31.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
