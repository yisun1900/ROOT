<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ý���������ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">ý����ͳ��</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">���ʱ�� ��</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10"  value="">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">��</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.firstDayDate()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">��ص�λ</td>
      <td width="58%" height="37"> 
            <select name="jkdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct sq_dwxx.dwbh,sq_dwxx.dwmc from qh_mtjk,sq_dwxx where qh_mtjk.dwbh=sq_dwxx.dwbh order by sq_dwxx.dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">��ʾ���</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="115" colspan="2"> 
        <input type="button"  value=" �� ѯ " onClick="f_do(selectform,'sjs')">
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
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}
	//if(	javaTrim(FormName.hflxbm)=="") {
	//	alert("��ѡ��[�ط����� ]��");
	//	FormName.hflxbm.focus();
	//	return false;
	//}
	
	if (lx=='sjs')
	{
		FormName.action="Qh_mtjkTjList.jsp";
	}
	
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
