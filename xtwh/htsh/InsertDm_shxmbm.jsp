<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String str=cf.getItemData("select shxmxlbm,shxmxlmc,shxmdlbm from dm_shxmxlbm order by shxmdlbm,shxmxlbm");
%>

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

<form method="post" action="SaveInsertDm_shxmbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�����Ŀ����</div>
              </td>
              <td width="33%"> 
                <select name="shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(shxmdlbm,shxmxlbm,<%=str%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_shxmdlbm order by shxmdlbm","");
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right">�����ĿС��</div>
              </td>
              <td width="31%"> 
                <select name="shxmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select shxmxlbm,shxmxlmc from dm_shxmxlbm order by shxmdlbm,shxmxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">�����Ŀ����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="shxmbm" value="" size="20" maxlength="4" >
              </td>
              <td width="19%"> 
                <div align="right">�۷�</div>
              </td>
              <td width="31%"> 
                <input type="text" name="kf" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">�����Ŀ����</td>
              <td colspan="3"> 
                <input type="text" name="shxmmc" value="" size="75" maxlength="100" >
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
	if(	javaTrim(FormName.shxmbm)=="") {
		alert("������[�����Ŀ����]��");
		FormName.shxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmmc)=="") {
		alert("������[�����Ŀ����]��");
		FormName.shxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("��ѡ��[�����Ŀ����]��");
		FormName.shxmdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmxlbm)=="") {
		alert("��ѡ��[�����ĿС��]��");
		FormName.shxmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("������[�۷�]��");
		FormName.kf.focus();
		return false;
	}
	if(!(isNumber(FormName.kf, "�۷�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
