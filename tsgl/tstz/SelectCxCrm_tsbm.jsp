<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>Ͷ��֪ͨ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbmCxList.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:14">
    <tr> 
      <td colspan="3" height="51"> 
        <div align="center"><b><font color="#0000CC">Ͷ�߱��޹����ͷ�֪ͨ������</font></b></div>
      </td>
    </tr>
    <tr> 
      <td width="11%" align="right" height="38">&nbsp;</td>
      <td height="38" colspan="2"> 
        <p>����˵����<img src="/images/169.gif" ></p>
        <p><b>1������ǿͷ��Ǽ���Ϣ</b>:</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;Ͷ�߱�����Ϣ�����κβ���¼��ϵͳ�������뾭�ͷ���������������β��Ų��ܴ���</p>
        <p><b>2��֪ͨ���β���</b>��</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;��Щ�ش�Ͷ�߱��޻�Ƚϼ�����������˹�֪ͨ���β��ţ��ڴ�����������</p>
      </td>
    </tr>
    <tr>
      <td width="11%" align="right" height="49">&nbsp;</td>
      <td width="33%" height="49" align="right">&nbsp;</td>
      <td width="56%" height="49">&nbsp;</td>
    </tr>
    <tr> 
      <td width="11%" align="right" height="38">&nbsp;</td>
      <td width="33%" height="38" align="right">�ֹ�˾ </td>
      <td width="56%" height="38"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
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
      <td width="11%" align="right" height="46">&nbsp;</td>
      <td width="33%" height="46" align="right"> ����</td>
      <td width="56%" height="46"> 
        <input type="radio" name="lx" value="1">
        Ͷ�� 
        <input type="radio" name="lx" value="2">
        ����</td>
    </tr>
    <tr align="center"> 
      <td colspan="3" height="61"> 
        <input type="button" value="����" onClick="f_do(selectform)">
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
