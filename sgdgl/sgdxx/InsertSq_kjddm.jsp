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
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String ssfgs=cf.executeQuery("select ssfgs from sq_sgd where sgd='"+sgd+"'");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��ʩ���ӿɽӵ�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertSq_kjddm.jsp" name="insertform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
	  <td colspan="2"> 
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">              </td>
	</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʩ����</td>
  <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="47%" align="right">�ɽӵ�����</td>
  <td width="53%"><select name="dwbh" size="25" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.mutilSelectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","select dwbh from sq_kjddm where sgd='"+sgd+"'");
%>
  </select></td>
  </tr>
            <tr align="center"> 
              <td colspan="2"> 
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	!selectChecked(FormName.dwbh)) {
		alert("������[����]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
