<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertDm_hfwtbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">�ط��������</div>  </td>
              <td width="32%"> 
                <input type="text" name="hfwtbm" value="" size="20" maxlength="4" >  </td>
              <td width="17%"> 
                <div align="right">�ط���������</div>  </td>
              <td width="33%"> 
                <input type="text" name="hfwtmc" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">�ط����ͱ���</div>  </td>
              <td width="32%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
    </select>  </td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
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
	if(	javaTrim(FormName.hfwtbm)=="") {
		alert("������[�ط��������]��");
		FormName.hfwtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfwtmc)=="") {
		alert("������[�ط���������]��");
		FormName.hfwtmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[�ط����ͱ���]��");
		FormName.hflxbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
