<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ľ�ź�ͬ��ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
	String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
	String khbh=cf.executeQuery("select khbh from jc_mmydd where yddbh='"+yddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">ľ���������ӡ(Ԥ������ţ�<%=yddbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="button" name="Submit2" value="��ӡ����" onClick="f_do(selectform,'dymx')">
          <input type="button" name="Button3" value="��ӡͼƬ" onClick="f_do(selectform,'dytp')">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{

	if (lx=="dymx")
	{
		FormName.action="dymmhtfjzjx.jsp";
	}
	else if (lx=="dytp")
	{
		FormName.action="dymmzjxtp.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

