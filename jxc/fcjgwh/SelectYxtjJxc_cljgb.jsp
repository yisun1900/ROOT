<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<div align="center">Ԥ�ȵ����۸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="45%" height="41" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
  <td width="55%"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
  </select></td>
  </tr>
<tr align="center"> 
  <td height="71" colspan="2"> 
    <p>
      <input type="button" onClick="f_dc(insertform)"  value="�����۸�">
      <input type="button" onClick="f_dr(insertform)"  value="����۸�">
      <BR>
      <BR> 
      <A HREF="Ԥ�ȵ����۸�.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A> </p>    </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpCljg.jsp"
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.action="LoadYxtjData.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
