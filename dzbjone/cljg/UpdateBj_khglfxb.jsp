<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <p>�ؽ����ͻ����Ϸ�����bj_khglfxb��</p>
  <p>���ݡ���װ���Ϸ�����bj_jzglfxb���͡����ӱ��ۡ����ؽ�:�ͻ����Ϸ�����bj_khglfxb��<BR>
  </p>
  <HR>
<form method="post" action="CheckBj_khglfxb.jsp" name="loadform">
    <table width="100%" border="0">
      <tr align="center">
        <td height="122" align="right" width="48%">&nbsp;</td>
        <td height="122" align="left" width="52%"> 
          <p>
            <input type="radio" name="cjfw" value="0">
δǩ���ͻ�</p>
          <p>
  <input type="radio" name="cjfw" value="1">
            δ�����ͻ���ǩ���ͻ���</p>
          <p> 
            <input type="radio" name="cjfw" value="2">
            δ�깤�ͻ���ǩ���ͻ���</p>
          <p>
            <input type="radio" name="cjfw" value="3">
            δ����ͻ���ǩ���ͻ���</p>
          <p> 
            <input type="radio" name="cjfw" value="4">
            ����ͻ�&nbsp;&nbsp;�ͻ����
            <input type="text" name="khbh" maxlength="7" size="15">
          </p>
        </td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="48%">������</td>
        <td height="34" align="left" width="52%"> 
          <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
          </select>
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(loadform)">
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	!radioChecked(FormName.cjfw)) {
		alert("��ѡ��[�ؽ���Χ]��");
		FormName.cjfw[0].focus();
		return false;
	}
	if(FormName.cjfw[3].checked)
	{
		if(	javaTrim(FormName.khbh)=="") 
		{
			alert("��ѡ��[�ͻ����]��");
			FormName.khbh.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>