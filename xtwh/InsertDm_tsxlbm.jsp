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

<form method="post" action="SaveInsertDm_tsxlbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">Ͷ�߱��޴���</div>
              </td>
              <td width="32%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="tsxlbm.value=tslxbm.value">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="px" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">Ͷ�߱���С�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tsxlbm" value="" size="20" maxlength="4" >
              </td>
              <td width="19%"> 
                <div align="right">Ͷ�߱���С������</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsxlmc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("��ѡ��[Ͷ�߱��޴���]��");
		FormName.tslxbm.focus();
		return false;
	}
	if(!(isNumber(FormName.px, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("������[Ͷ�߱���С�����]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(FormName.tsxlbm.value.length!=4) {
		alert("[Ͷ�߱���С�����]Ӧ��Ϊ4λ��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlmc)=="") {
		alert("������[Ͷ�߱���С������]��");
		FormName.tsxlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
