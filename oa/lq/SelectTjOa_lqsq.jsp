<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">��ȡʱ�� ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjfw" size="20" maxlength="10" value="2004-06-01" onKeyUp="keyGo(sjfw2)">
              </td>
              <td width="12%"> 
                <div align="right">��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sjfw2" size="20" maxlength="10" value="2004-08-01"  onKeyUp="keyGo(sjfw2)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ʾ���</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                ��ҳ 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="�ƻ���ȡ��Ʒͳ��" onClick="f_do(selectform,'jhlqtj')" >
                  <input type="button"  value="����ȡ��Ʒͳ��" onClick="f_do(selectform,'ylqtj')">
                  <input type="button"  value="��ȡ��ϸ" onClick="f_do(selectform,'lqmx')" >
                </p>
                <p> 
                  <input type="button"  value="��������ȡͳ��" onClick="f_do(selectform,'grlqtj')">
                  <input type="button"  value="��������ȡͳ��" onClick="f_do(selectform,'bmlqtj')">
                  <input type="button"  value="��������ͳ��" onClick="f_do(selectform,'grsltj')">
                </p>
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
function f_do(FormName,lx)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[��ȡʱ�� ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ȡʱ��  "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��ȡʱ�� ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��ȡʱ��  "))) {
		return false;
	}

	if (lx=="jhlqtj")
	{
		FormName.action="jhlqtj.jsp";
	}
	else if (lx=="ylqtj")
	{
		FormName.action="ylqtj.jsp";
	}
	else if (lx=="lqmx")
	{
		FormName.action="Oa_lqsqLqMxList.jsp";
	}
	else if (lx=="grlqtj")
	{
		FormName.action="grlqtj.jsp";
	}
	else if (lx=="bmlqtj")
	{
		FormName.action="bmlqtj.jsp";
	}
	else if (lx=="grsltj")
	{
		FormName.action="grsltj.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
