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
	String dwstr=cf.getItemData("select tsxlbm,tsxlmc,tslxbm from dm_tsxlbm order by tslxbm,tsxlbm");
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

<form method="post" action="SaveInsertDm_tsyybm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴���</div>
              </td>
              <td width="31%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(tslxbm,tsxlbm,<%=dwstr%>)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">Ͷ�߱���С��</div>
              </td>
              <td width="30%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="tsyybm.value=tsxlbm.value">
                  <option value=""></option>
                  <%
//	cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm order by tsxlbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">Ͷ�߱���ԭ�����</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tsyybm" value="" size="20" maxlength="6" >
              </td>
              <td width="20%"> 
                <div align="right">Ͷ�߱���ԭ������</div>
              </td>
              <td width="30%"> 
                <input type="text" name="tsyymc" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">�ʼ�۷�</div>
              </td>
              <td width="31%">
                <input type="text" name="zjkf" value="0" size="20" maxlength="8" >
              </td>
              <td width="20%"> 
                <div align="right">��ʾ˳��</div>
              </td>
              <td width="30%">
                <input type="text" name="px" value="" size="20" maxlength="8" >
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
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("��ѡ��[Ͷ�߱���С��]��");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("������[Ͷ�߱���ԭ�����]��");
		FormName.tsyybm.focus();
		return false;
	}
	if(FormName.tsyybm.value.length!=6) {
		alert("[Ͷ�߱���ԭ�����]Ӧ��Ϊ6λ��");
		FormName.tsyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyymc)=="") {
		alert("������[Ͷ�߱���ԭ������]��");
		FormName.tsyymc.focus();
		return false;
	}
	if(	javaTrim(FormName.zjkf)=="") {
		alert("������[�ʼ�۷�]��");
		FormName.zjkf.focus();
		return false;
	}
	if(!(isNumber(FormName.zjkf, "�ʼ�۷�"))) {
		return false;
	}
	if(!(isNumber(FormName.px, "��ʾ˳��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
