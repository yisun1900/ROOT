<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="44%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" >
          <div align="center">�û��� </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" > 
          <div align="center">
            <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:230PX" onChange="f_do(selectform)">
              <option value=""></option>
              <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz order by yhzmc","");
	%> 
            </select>
          </div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" >&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <div align="center">ѡ��--�������</div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="01" onclick="f_do(selectform)">
          ��Ƹ </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="02" onclick="f_do(selectform)">
          ��ѵ </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="03" onclick="f_do(selectform)">
          �䶯 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="04" onclick="f_do(selectform)">
          �������� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="06" onclick="f_do(selectform)">
          ������ְ </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="07" onclick="f_do(selectform)">
          �������� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="08" onclick="f_do(selectform)">
          �Ӱ����� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="09" onclick="f_do(selectform)">
          ���ڿ������� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="10" onclick="f_do(selectform)">
          ��ٵ� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="11" onclick="f_do(selectform)">
          �������� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="12" onclick="f_do(selectform)">
          �����λ���� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="13" onclick="f_do(selectform)">
          ��ְ���� </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="ztlx" value="14" onclick="f_do(selectform)">
          �˻���Ա���� </td>
      </tr>
    </table>
</form>
</div>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhzbh)=="") {
		alert("��ѡ��[�û���]��");
		FormName.yhzbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ztlx)) {
//		alert("��ѡ��[�������]��");
		FormName.ztlx[0].focus();
		return false;
	}

	FormName.action="InsertRs_shsq1.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

